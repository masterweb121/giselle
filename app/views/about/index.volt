  <div class="row pannel-find">
    <h3>Quicksearch <button type="button" class="close pull-right" data-dismiss="modal" aria-hidden="true">&times;</button> </h3>
    <form class="form-inline findbar" role="form">
      <div class="form-group wo">
        <label class="sr-only" for="wo">Wo</label>
        <input type="password" class="form-control show-suggestions" id="wo" placeholder="Wo">
      </div>
      <button type="submit" class="btn btn-darkblue pull-right"> <span class="glyphicon glyphicon-search"></span> </button>
    </form>
    
    <ul class="suggestions">
      <li><a href="#">Charlottenburg</a></li>
      <li><a href="#">Friedrichshain</a></li>
      <li><a href="#">Kreuzberg</a></li>
      <li><a href="#">Lichtenberg</a></li>
      <li><a href="#">Mitte</a></li>
      <li><a href="#">Moabit</a></li>
      <li><a href="#">Neukölln</a></li>
      <li><a href="#">Pankow</a></li>
      <li><a href="#">Prenzlauer</a></li>
      <li><a href="#">Reinickendorf</a></li>
    </ul>
  </div>

    <div class="row content">

      <div class="flexblock clearfix">
        
        <div class="main">
          
          <div class="lead clearfix">
            <h2 class="blue h3">Header Line for first block here</h2>
            <p>Lorem Praesent id metus massa, ut blandit odio. Proin quis tortor orci. Luctus urna sed urna ultricies actual Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit.</p>
          </div>
          
          <div class="entries clearfix">
            <div class="box left">
              <h2 class="bar"><strong>NEW</strong></h2>
              {% include "partials/entry.volt" %}
            </div>

            <div class="box right">
              <h2 class="bar"><strong>POPULAR</strong></h2>
              {% include "partials/entry.volt" %}
            </div>
          </div>
      
          <!-- what goes in main Blog Posts -->

          <div class="box blog">
            <h3 class="bar"><strong>NEWS</strong></h3>
            <div class="inner sy-grey">
              <div class="post">
                <a class="th pull-left" href="#"><img src="images/blog_img_1.jpg" alt="blog image"></a>
                <a class="post-head" href="#"><h3 class="post-title">Cosplay Läden in Deutschland?</h3> <small>02. November 2013</small></a>
                <p>Und wieder freuen wir uns, dass es eine weitere Erfolgsmeldung zu Nicht viel Zeit ist 
                  vergangen seit der letzten Erfolgsmeldung zu den ersten 1.000   <a href="#">mehr lesen&raquo;</a>
                </p>
              </div> <!-- .post -->
              
              <div class="post">
                <a class="th pull-left" href="#"><img src="images/blog_img_2.jpg" alt="blog image"></a>
                <a class="post-head" href="#"><h3 class="post-title">Cosplay Läden in Deutschland?</h3> <small>02. November 2013</small></a>
                <p>Und wieder freuen wir uns, dass es eine weitere Erfolgsmeldung zu Nicht viel Zeit ist 
                  vergangen seit der letzten Erfolgsmeldung zu den ersten 1.000   <a href="#">mehr lesen&raquo;</a>
                </p>
              </div> <!-- .post -->
              
              <div class="post" style="margin-bottom:0">
                <a class="th pull-left" href="#"><img src="images/blog_img_3.jpg" alt="blog image"></a>
                <a class="post-head" href="#"><h3 class="post-title">Cosplay Läden in Deutschland?</h3> <small>02. November 2013</small></a>
                <p>Und wieder freuen wir uns, dass es eine weitere Erfolgsmeldung zu Nicht viel Zeit ist 
                  vergangen seit der letzten Erfolgsmeldung zu den ersten 1.000   <a href="#">mehr lesen&raquo;</a>
                </p>
              </div> <!-- .post -->
            </div> <!-- .inner -->
          </div> <!-- /.box blog -->

        </div> <!-- .main -->

      </div> <!-- .flex-block -->

      <div class="sidebar">
        
        <div class="adv center xs-b300x50 sm-b300x75 md-b300x250 lg-b300x250"><img src="images/adv_img.png" alt="advertism"></div>

        <div class="box">
          <h3 class="heading" style="padding-left:0;">Dein Geschäft nicht dabei?</h3>
          <a class="button add-entry" href="#"><span> <span class="glyphicon glyphicon-plus"></span> </span>Öffnungszeiten eintragen</a>
        </div> <!-- ./pannel -->

        <div class="box sy-grey social-box">
          <h3 class="heading">Jetzt fan werden!</h3>
          <div class="inner">
            <a class="button facebook pull-left" href="#"><span><img alt="#" src="images/facebook_ico.png"/></span> Facebook</a>
            <a class="button gplus pull-left" href="#"><span><img alt="#" src="images/gplus_ico.png"/></span> Google+</a>
            <a class="button twitter pull-left" href="#"><span><img alt="#" src="images/twitter_ico.png"/></span> Twitter</a>
          </div>
        </div> <!-- ./pannel -->

        <div class="ad-duo">
          <div class="right"><div class="adv center xs-hide sm-b300x250 md-b160x600 lg-b160x600"><img src="images/adv_img.png" alt="advertism"></div> </div>
          <div class="left adv xs-hide sm-c450x120 md-b120x600 lg-b120x600">
            <div class="adv b120x120"><img src="images/adv_img.png" alt="advertism"></div>
            <div class="adv b120x120"><img src="images/adv_img.png" alt="advertism"></div>
            <div class="adv b120x120"><img src="images/adv_img.png" alt="advertism"></div>
            <div class="xs-hide sm-hide adv b120x120"><img src="images/adv_img.png" alt="advertism"></div>
          </div> 
        </div> <!-- /.ad-duo -->

      </div> <!-- /.sidebar -->

      <div class="ad-spot">
        <div class="adv center xs-b250x250 sm-b300x250 md-b720x90 lg-b720x90"><img src="images/adv_img.png" alt="advertism"></div>
      </div>

    </div> <!-- .row -->
  
    <div class="wrap home-extra">
      <div class="row">
        <div class="box more col-md-4 col-sm-4">
          <div class="icon-holder"><img src="images/ico_user.png" alt="ico"></div>
          <h3 class="heading"><em>First Lorem Header</em></h3>
          <p>Lorem Praesent id metus massa folor blandit odio. Proin quis to rtor orci. Luctusna ultricies actual Quisque eget odio ac lectus faucibus eget in metus.</p>
        </div>
        <div class="box more col-md-4 col-sm-4">
          <div class="icon-holder"><img src="images/ico_map.png" alt="ico"></div>
          <h3 class="heading"><em>Second Lorem Header</em></h3>
          <p>Lorem Praesent id metus massa folor blandit odio. Proin quis to rtor orci. Luctusna ultricies actual Quisque eget odio ac lectus faucibus eget in metus.</p>
        </div>
        <div class="box more col-md-4 col-sm-4">
          <div class="icon-holder"><img src="images/ico_find.png" alt="ico"></div>
          <h3 class="heading"><em>Third Lorem Header</em></h3>
          <p>Lorem Praesent id metus massa folor blandit odio. Proin quis to rtor orci. Luctusna ultricies actual Quisque eget odio ac lectus faucibus eget in metus.</p>
        </div>
      </div> <!-- /.row .txtblk -->

      <div class="row lists">
        <div>
          <h4 class="heading">Öffnungszeiten Berlin</h4>
          <ul class="lst">
            <li><a href="#">Apotheke in Berlin</a></li>
            <li><a href="#">Arzt in Berlin</a></li>
            <li><a href="#">Bank in Berlin</a></li>
            <li><a href="#">Baumarkt in Berlin</a></li>
            <li><a href="#">Drogerie in Berlin</a></li>
            <li><a href="#">Fast-Food in Berlin</a></li>
            <li><a href="#">Friseur in Berlin</a></li>
            <li><a href="#">Post in Berlin</a></li>
            <li><a href="#">Restaurant in Berlin</a></li>
            <li><a href="#">Supermarkt in Berlin</a></li>
          </ul>
        </div>
        <div>
          <h4 class="heading">Öffnungszeiten Hamburg</h4>
          <ul class="lst">
            <li><a href="#">Apotheke in Hamburg</a></li>
            <li><a href="#">Arzt in Hamburg</a></li>
            <li><a href="#">Bank in Hamburg</a></li>
            <li><a href="#">Baumarkt in Hamburg</a></li>
            <li><a href="#">Drogerie in Hamburg</a></li>
            <li><a href="#">Fast-Food in Hamburg</a></li>
            <li><a href="#">Friseur in Hamburg</a></li>
            <li><a href="#">Post in Hamburg</a></li>
            <li><a href="#">Restaurant in Hamburg</a></li>
            <li><a href="#">Supermarkt in Hamburg</a></li>
          </ul>
        </div>
        <div>
          <h4 class="heading">Öffnungszeiten München</h4>
          <ul class="lst">
            <li><a href="#">Apotheke in München</a></li>
            <li><a href="#">Arzt in München</a></li>
            <li><a href="#">Bank in München</a></li>
            <li><a href="#">Baumarkt in München</a></li>
            <li><a href="#">Drogerie in München</a></li>
            <li><a href="#">Fast-Food in München</a></li>
            <li><a href="#">Friseur in München</a></li>
            <li><a href="#">Post in München</a></li>
            <li><a href="#">Restaurant in München</a></li>
            <li><a href="#">Supermarkt in München</a></li>
          </ul>
        </div>
        <div>
          <h4 class="heading">Öffnungszeiten Köln</h4>
          <ul class="lst">
            <li><a href="#">Apotheke in Köln</a></li>
            <li><a href="#">Arzt in Köln</a></li>
            <li><a href="#">Bank in Köln</a></li>
            <li><a href="#">Baumarkt in Köln</a></li>
            <li><a href="#">Drogerie in Köln</a></li>
            <li><a href="#">Fast-Food in Köln</a></li>
            <li><a href="#">Friseur in Köln</a></li>
            <li><a href="#">Post in Köln</a></li>
            <li><a href="#">Restaurant in Köln</a></li>
            <li><a href="#">Supermarkt in Köln</a></li>
          </ul>
        </div>
      </div> <!-- /.row .lists -->