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
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">München <span class="caret"></span></button>
            <ul class="dropdown-menu blue" role="menu">
              <li><a href="#">Berlin</a></li>
              <li><a href="#">Hamburg</a></li>
              <li><a href="#">München</a></li>
              <li><a href="#">Köln</a></li>
            </ul>
          </div>
        </div>

        <div class="navbar-collapse collapse">
          <!-- Single button -->
          <form class="form-inline findbar" role="form">
            <div class="form-group wer">
              <label class="sr-only" for="exampleInputEmail2">Wer</label>
              <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Wer">
            </div>
            <div class="form-group wo">
              <label class="sr-only" for="exampleInputPassword2">Wo</label>
              <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Wo">
            </div>
            <button type="submit" class="btn btn-darkblue pull-right"> <span class="glyphicon glyphicon-search"></span> </button>
          </form>
        </div><!--/.nav-collapse -->
      </div>
    </div>