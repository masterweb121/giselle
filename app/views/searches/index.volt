 <div class="row content">

    <div class="wrap breadcrumbs">
      <ul class="col-sm-9 list-inline">
        <li><a href="#">Home</a> &raquo; </li>
        <li><a href="#">Kreuzberg</a> &raquo; </li>
        <li><a href="#">Bank</a> &raquo; </li>
        <li><strong class="h5">Berliner Volksbank - SB-Standort</strong></li>
      </ul>
      <!-- <div class="col-xs-3 hidden-xs"> -->
        <!-- <div class="pull-right"><img src="images/social.png" alt="social"></div> -->
      <!-- </div> -->
    </div> <!-- /.breadcrumbs -->

    <!-- <div class="adv center xs-b300x50 sm-b320x50 md-hide lg-hide" style="margin-bottom: 23px;"><img src="images/adv_img.png" alt="advertism"></div>  -->

    <div class="wrap location-heading"><h2 class="h3 col-xs-12">Berliner Volksbank - SB-Standort</h2></div> <!-- .head-title -->

    <div class="flexblock clearfix">

      <div class="results-map">
        
        <button class="btn btn-line ext-colap"> Show Map <strong><span class="glyphicon glyphicon-remove"></span> <span class="glyphicon glyphicon-chevron-down"></span></strong></button>

        <div class="map-module extenssible">
          <div class="le-map">
            <a href="#" class="map-extend"><div>extend</div></a>
            <div id="map-canvas" class="gmap stretch"></div>
          </div>
        </div> <!-- map-module -->
      </div> <!-- /.fold -->
      
<script type="text/javascript">

      window.Mapy = window.Mapy || {};
      // keep data for markers
      Mapy.markers = [];
      // center point for map
      Mapy.gpoint = {{js_location | json_encode}};
      // store data markers
{% for business in page.items %}
      Mapy.markers[{{business.id}}] = {{business | json_encode }};
{% endfor %}

</script>

      <div class="main">
        
        <div class="results clearfix">
          <div class="box">
            {% for business in page.items %}
              {% include "partials/entry.volt" %}
            {% else %}
              No results
            {% endfor %}
            <ul class="pager">
              <li>{{link_to( this.config.application.publicUrl ~ router.getRewriteUri() ~ "?page=" ~ page.before, '&laquo; zurück') }}</li>>
              <li class="pg"><strong> {{ page.current }}/{{ page.total_pages }} </strong></li>
              <li>{{link_to( this.config.application.publicUrl ~ router.getRewriteUri() ~ "?page=" ~ page.next, 'vorwärts &raquo;')}}</li>
            </ul>

          </div><!-- .box -->
        </div> <!-- /.results -->
           
      </div> <!-- .main -->
    </div> <!-- .flex-block -->



      <div class="sidebar has-map">
        
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