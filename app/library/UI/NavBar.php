<?php namespace Giselle\UI;

use Phalcon\Mvc\User\Component,
	Giselle\Models\MainCities;

class NavBar extends Component
{

		public function main_cities_select() {

			$cities  = MainCities::find();
			$ul = '<ul class="dropdown-menu blue" role="menu">';
			foreach ($cities as $city) {
				$ul .= '<li><a href="cities/view/'.$city->id.'">'.$city->name.'</a></li>';
			}
			$ul .= '</ul>';

			return $ul;
		}
}