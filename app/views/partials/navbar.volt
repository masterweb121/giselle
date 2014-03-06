    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="wrap">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand logo" href="#"><img src="images/logo.png" alt="werhatoffen"></a>
          <div class="btn-group city-select">
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Choose a city <span class="caret"></span></button>
            {{ this.navbar.main_cities_select() }}
          </div>
        </div>

        <div class="navbar-collapse collapse">
          <!-- Single button -->
          <form class="form-inline findbar" role="form" id="navbar-form-search">
            <div class="form-group wer">
              <label class="sr-only" for="wer">Wer</label>
              <input type="text" class="form-control typeahead" id="wer" placeholder="Wer" autocomplete="off">
            </div>
            <div class="form-group wo">
              <label class="sr-only" for="wo">Wo</label>
              <input type="text" class="form-control typeahead" id="wo" placeholder="Wo" autocomplete="off">
            </div>
            <button type="submit" class="btn btn-darkblue pull-right"> <span class="glyphicon glyphicon-search"></span> </button>
          </form>
        </div><!--/.nav-collapse -->
      </div>
    </div>