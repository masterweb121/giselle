<?php namespace Phalcon\Paginator\Adapter;

use Phalcon;

class FixedQueryBuilder implements  Phalcon\Paginator\AdapterInterface {

	protected $_counterBuilder, $_offset, $_total_items;

	public function __construct ($config) {

		$this->_config = $config;

		list($this->_builder, $this->_counterBuilder) = $this->_config['builder'];
		$this->_limitRows = $this->_config['limit'];
		$this->_page = $this->_config['page'] ? $this->_config['page'] : 1;
		// a builder
		if ($this->_counterBuilder instanceof Phalcon\Mvc\Model\Query\Builder) {
			$recordset = $this->_counterBuilder
				->columns(array('COUNT(*) as rowcount'))
				->getQuery()->execute();
			$this->_total_items = $recordset->getFirst()->rowcount;
		// a resultset
		} else if ($this->_counterBuilder instanceof Phalcon\Db\Result\Pdo) {
			$recordset = $this->_counterBuilder;
			$this->_total_items = $recordset->fetch()['rowcount'];
		}

		$this->_total_pages = ceil($this->_total_items / $this->_limitRows);
	}

	public function setCurrentPage ($page) {

		$this->_page = $page ? $page : 1;
	}

	public function getPaginate () {

		$this->_offset = ($this->_page - 1) * $this->_limitRows;

		if ($this->_builder instanceof Phalcon\Mvc\Model\Query\Builder) { 
			$items = $this->_builder
			->limit($this->_limitRows)->offset($this->_offset)
			->getQuery()->execute();
		}
		else if ( is_string($this->_builder)) {
			$sql = $this->_builder;
			$sql = sprintf(' %s limit %s offset %s', $sql, $this->_limitRows, $this->_offset);

			$di = \Phalcon\Di::getDefault();
			$db = $di->getDb();

			$items_ = $db->query($sql);
			$items_->setFetchMode(Phalcon\Db::FETCH_OBJ);
			$items = array();
			while($item = $items_->fetch()) {
				$items[] = $item;
			}
		}

		$next = ($this->_offset + $this->_limitRows >= $this->_total_items) 
		? $this->_page
		: $this->_page + 1;

		$before = ($this->_offset - $this->_limitRows <= 0) 
		? 1
		: $this->_page - 1;

		// slice taking into consideration query params
		$request = Phalcon\DI::getDefault()->getRequest();
		$query = $request->getQuery();
		unset($query['_url']);
		if (isset($query['page'])) unset($query['page']);
		$extraQuery = '';
		if (count($query)) $extraQuery .= '&' . http_build_query($query);

		$paginator = array(
			'before' => $before . $extraQuery,
			'first' => $extraQuery,
			'next' => $next . $extraQuery,
			'last' => $this->_total_pages . $extraQuery,
			'items' => $items,
			'current' => ++$this->_page,
			'total_items' => $this->_total_items,
			'total_pages' => $this->_total_pages,
		);

		return (object)$paginator;
	}

}