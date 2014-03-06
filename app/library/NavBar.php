<?php namespace Giselle;

use Phalcon\Mvc\User\Component;

class NavBar extends Component
{
		public function MainCitiesSelect() {

			return '            <ul class="dropdown-menu blue" role="menu">
              <li><a href="#">Berlin</a></li>
              <li><a href="#">Hamburg</a></li>
              <li><a href="#">München</a></li>
              <li><a href="#">Köln</a></li>
            </ul>';
		}
}