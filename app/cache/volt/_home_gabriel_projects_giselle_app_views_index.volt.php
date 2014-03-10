<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6"> <![endif]-->
<!--[if IE 7 ]> <html lang="en" class="ie7"> <![endif]-->
<!--[if IE 8 ]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="en" class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en"> <!--<![endif]-->
	<head>
    <meta charset="utf-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="images/favicon.png">
    <base href="<?php echo $this->url->get(''); ?>" />

    <title><?php echo $title; ?></title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Werhatoffen.de Theme -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="css/typeahead.css" rel="stylesheet">
    <!-- Important Owl stylesheet -->
    <link rel="stylesheet" href="assets/owl-carousel/owl.carousel.css">

    <!-- Open Sans embeded from Google Fonts (just in case) -->
    <!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600,700,800' rel='stylesheet' type='text/css'> -->

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>

	<body>
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
          <!-- <a title="Deinen Standort per GPS bestimmen" href="javascript:findLocation();"><img src="images/gps.png" border="0"></a> -->
          <div class="btn-group city-select">
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Choose a city <span class="caret"></span></button>
            <?php echo $this->navbar->main_cities_select(); ?>
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
            <input type="hidden" id="_wer" name="_wer">
            <input type="hidden" id="_wo" name="_wo">
          </form>
        </div><!--/.nav-collapse -->
      </div>
    </div>
	<div class="wrap page">

	<?php echo $this->getContent(); ?>
	    
	<div class="row lists footer">
  
  <div>
    <h4 class="heading">Sitemap</h4>
    <ul class="lst">
      <li><a data-toggle="modal" data-target="#step1" href="#">Über uns.</a></li>
      <li><a data-toggle="modal" data-target="#step2" href="#">Häufigste Fragen,</a></li>
      <li><a data-toggle="modal" data-target="#step3" href="#">Neue Öffnungszeiten Eintragen</a></li>
    </ul>
  </div>
  
  <div>
    <h4 class="heading">Öffnungszeiten</h4>
    <ul class="lst">
      <li><a data-toggle="modal" data-target="#step4" href="#">Alle Bundesländer</a></li>
      <li><a data-toggle="modal" data-target="#step5" href="#">Alle Filialen</a></li>
      <li><a data-toggle="modal" data-target="#step6" href="#">Alle Kategorien</a></li>
    </ul>
  </div>
  
  <div>
    <h4 class="heading">Weiteres</h4>
    <ul class="lst">
      <li><a href="#">Presse</a></li>
      <li><a href="#">Blog</a></li>
    </ul>
  </div>

  <div>
    <h4 class="heading">Weiteres2</h4>
    <ul class="lst">
      <li><a href="#">Datenschutz</a></li>
      <li><a href="#">Advertise</a></li>
      <li><a href="#">Impressum</a></li>
    </ul>
  </div>

  <div class="note clearfix">
    <p class="disclaimer">Copyright &copy; 2013  Werhathoffen.  Disclaimer Text... </p>
    <ul class="social-small list-inline">
      <li><a class="fb" href="#"><img src="images/facebook_ico.png" alt="facebook"></a></li>
      <li><a class="tw" href="#"><img src="images/twitter_ico.png" alt="twitter"></a></li>
      <li><a class="gplus" href="#"><img src="images/gplus_ico.png" alt="twitter"></a></li>
      <li><a class="mail" href="#"><img src="images/mail_ico.png" alt="mail"></a></li>
    </ul>
  </div> <!-- .row.note -->

</div><!-- /.row .footer -->
	    
	</div> <!-- /wrap -->

	
	<!-- Step 1 -->
<div class="modal fade" id="step1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-step1" aria-hidden="true">
  
  <div class="modal-dialog addentry">
    
    <div class="modal-content">
      
      <div class="modal-header center">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel-step1">Enter New Opening Times</h4>
      </div>

      <div class="steps-nav">
        <a class="btn btn-step active" href="#">Adresse</a><a class="btn btn-step" href="#">Kategorie</a><a class="btn btn-step" href="#">Öffnungszeiten</a><a class="btn btn-step" href="#">Zusammenfassung</a><a class="btn btn-step last" href="#">Fertig <span class="glyphicon glyphicon-ok"></span></a>
      </div>
      
      <div class="modal-body">
        
        <!-- Le form -->
        <form class="form-horizontal" role="form">

          <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9"><a class="btn-line inline-btn" href="#">Use location: Breite Straße 25 14199 Berlin Kreuzberg <span class="glyphicon glyphicon-map-marker"></span></a></div>
          </div>
          
          <div class="form-group">
            <label for="inputName" class="col-sm-3 control-label">Name</label>
            <div class="col-sm-9"><input type="email" class="form-control" id="inputName" placeholder="Enter your Name"></div>
          </div>
          
          <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9"><div class="checkbox"><label> <input type="checkbox"> Ich bin Besitzer / Betreiber </label></div></div>
          </div>

          <div class="form-group">
            <label for="inputStreet" class="col-sm-3 control-label">Straße<i>*</i></label>
            <div class="col-sm-9"><input type="email" class="form-control" id="inputStreet"></div>
          </div>

          <div class="form-group">
            <label for="inputPLZ" class="col-sm-3 control-label">PLZ<i>*</i></label>
            <div class="col-sm-4"><input type="email" class="form-control" id="inputPLZ"></div>
            <label for="inputORT" class="col-sm-1 control-label">ORT<i>*</i></label>
            <div class="col-sm-4"><input type="email" class="form-control" id="inputORT"></div>
          </div>

          <div class="form-group">
            <label for="inputWeb" class="col-sm-3 control-label">Webseite</label>
            <div class="col-sm-9"><input type="email" class="form-control" id="inputWeb"></div>
          </div>

          <div class="form-group">
            <label for="inputPhone" class="col-sm-3 control-label">Phone No</label>
            <div class="col-sm-4"><input type="email" class="form-control" id="inputPhone"></div>
            <label for="inputFax" class="col-sm-1 control-label">Fax</label>
            <div class="col-sm-4"><input type="email" class="form-control" id="inputFax"></div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9"><a class="btn btn-link" href="#"><span class="glyphicon glyphicon-plus"></span> Add images </a></div>
          </div>
        </form>
        <!-- Le Form -->

      </div> <!-- /.modal-body -->

      <div class="modal-footer">
        <em class="notice"><i>*</i> Pflichtfeld</em>
        <button type="button" class="btn btn-link" data-dismiss="modal">&laquo; Back</button>
        <button type="submit" class="btn btn-lg btn-primary">Next <span class="glyphicon glyphicon-chevron-right"></span></button>
      </div>

    </div><!-- /.modal-content -->

  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Step 2 -->
<div class="modal fade" id="step2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-step2" aria-hidden="true">
  <div class="modal-dialog addentry">
    <div class="modal-content">
      
      <div class="modal-header center">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel-step2">Enter New Opening Times</h4>
      </div>

      <div class="steps-nav">
        <a class="btn btn-step" href="#">Adresse</a><a class="btn btn-step active" href="#">Kategorie</a><a class="btn btn-step" href="#">Öffnungszeiten</a><a class="btn btn-step" href="#">Zusammenfassung</a><a class="btn btn-step last" href="#">Fertig <span class="glyphicon glyphicon-ok"></span></a>
      </div>
      
      <div class="modal-body">
        <!-- Le form -->
        <form class="form-horizontal" role="form">
          
          <ul class="pick-ctg">
            <li class="active"><a href="#"><div><img src="images/ico_bank.png" alt="Bank"></div><em>Bank</em></a></li>
            <li><a href="#"><div><img src="images/ico_post.png" alt="Post"></div><em>Post</em></a></li>
            <li><a href="#"><div><img src="images/ico_supermarkt.png" alt="Supermarkt"></div><em>Supermarkt</em></a></li>
            <li><a href="#"><div><img src="images/ico_drogerie.png" alt="Drogerie"></div><em>Drogerie</em></a></li>
            <li><a href="#"><div><img src="images/ico_einkaufen.png" alt="Einkaufen"></div><em>Einkaufen</em></a></li>
            <li><a href="#"><div><img src="images/ico_gas.png" alt="Gas"></div><em>Tankstelle</em></a></li>
            <li><a href="#"><div><img src="images/ico_apotheke.png" alt="apotheke"></div><em>Apotheke</em></a></li>
            <li><a href="#"><div><img src="images/ico_arzt.png" alt="Arzt"></div><em>Arzt</em></a></li>
            <li><a href="#"><div><img src="images/ico_restaurant.png" alt="Restaurant"></div><em>Restaurant</em></a></li>
            <li><a href="#"><div><img src="images/ico_pizza.png" alt="Pizza"></div><em>Pizza</em></a></li>
            <li><a href="#"><div><img src="images/ico_cafe.png" alt="Cafe"></div><em>Cafe</em></a></li>
            <li><a href="#"><div><img src="images/ico_bar.png" alt="Bar"></div><em>Bar</em></a></li>
            <li><a class="btn btn-link" href="#">Other</a></li>
          </ul>

          <div class="form-group">
            <label for="selectCateg" class="col-sm-3 control-label">Category</label>
            <div class="col-sm-9">
              <select class="form-control" id="selectCateg">
                <option>bank</option>
                <option>posts</option>
                <option>supermarkt</option>
                <option>drogerie</option>
                <option>einkaufen</option>
                <option>elektronik</option>
                <option>apotheke</option>
                <option>arzt</option>
                <option>restaurant</option>
                <option>pizza</option>
                <option>cafe</option>
                <option>bar</option>
              </select>
              <!-- <input type="email" class="form-control" id="inputCateg"> -->
            </div>
          </div>
          
          <div class="form-group">
            <label for="selectSubcateg" class="col-sm-3 control-label">Subcategory</label>
            <div class="col-sm-9">
              <select class="form-control" id="selectSubcateg">
                <option>Subcateg 1</option>
                <option>Opt 2</option>
                <option>Opt 3</option>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label for="inputTags" class="col-sm-3 control-label">Tags</label>
            <div class="col-sm-9"><input type="email" class="form-control" id="inputTags"></div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9"><a class="btn btn-link" href="#"><span class="glyphicon glyphicon-plus"></span> Add Description </a></div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9"><div class="checkbox"><label> <input type="checkbox"> Kostenloses Parken für Kunden </label></div></div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9"><div class="checkbox"><label> <input type="checkbox"> WLAN-Zugang </label></div></div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9"><div class="checkbox"><label> <input type="checkbox"> Behindertenfreundlich </label></div></div>
          </div>
        </form>
        <!-- Le Form -->
      </div> <!-- /.modal-body -->

      <div class="modal-footer">
        <button type="button" class="btn btn-link" data-dismiss="modal">&laquo; Back</button>
        <button type="submit" class="btn btn-lg btn-primary">Next <span class="glyphicon glyphicon-chevron-right"></span></button>
      </div>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<!-- Step 3 -->
<div class="modal fade" id="step3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-step3" aria-hidden="true">
  <div class="modal-dialog addentry">
    <div class="modal-content">
      <div class="modal-header center">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
        <h4 class="modal-title" id="myModalLabel-step3">Enter New Opening Times</h4>
      </div>

      <div class="steps-nav">
        <a class="btn btn-step" href="#">Adresse</a><a class="btn btn-step" href="#">Kategorie</a><a class="btn btn-step active" href="#">Öffnungszeiten</a><a class="btn btn-step" href="#">Zusammenfassung</a><a class="btn btn-step last" href="#">Fertig <span class="glyphicon glyphicon-ok"></span></a>
      </div>
      
      <div class="modal-body">
        
        <!-- Le form -->

        <form class="form-horizontal" role="form">
          
          <div class="form-group schedule-form">
            
            <label class="col-sm-2 control-label"><span>Montag</span></label>

            <div class="col-sm-10 day-timetable">

              <div class="set-times">
                
                <div class="block">
                  <div class="c1">
                    <select class="form-control">
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                    </select>
                  </div>
                  <b class="dash"> - </b>
                  <div class="c1">
                    <select class="form-control">
                      <option>14:30</option>
                      <option>20:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                    </select>
                  </div>
                  <strong class="btns">
                    <a class="ico plus tooltip-test" data-toggle="tooltip" title="Mittagspause entfernen" href="#"></a>
                    <!-- <a class="ico minus" href="#"></a> -->
                  </strong>
                </div> <!-- /.block -->
                
                <div class="block">
                  <div class="c1">
                    <select class="form-control">
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                    </select>
                  </div>
                  <b class="dash"> - </b>
                  <div class="c1">
                    <select class="form-control">
                      <option>14:30</option>
                      <option>20:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                    </select>
                  </div>
                  <strong class="btns">
                    <!-- <a class="ico plus" href="#"></a> -->
                    <a class="ico minus" href="#"></a>
                  </strong>
                </div>  <!-- /.block -->
              
              </div> <!-- .set-times -->

              <div class="set-status">
                
                <div>
                  <select class="form-control">
                    <option>geöffnet</option>
                  </select>
                </div> <!-- /.cx -->

                <strong class="btns">
                  <a href="#" class="ico sel1 tooltip-test" data-toggle="tooltip" title="auf alle tage anwenden"></a>
                  <a href="#" class="ico sel2 tooltip-test" data-toggle="tooltip" title="tage anwenden"></a>
                </strong>
              </div>
            </div>
          </div>

          <div class="form-group schedule-form">
            
            <label class="col-sm-2 control-label"> <span>Dienstag</span></label>

            <div class="col-sm-10 day-timetable">

              <div class="set-times">
                
                <div class="block">
                  <div class="c1">
                    <select class="form-control">
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                    </select>
                  </div>
                  <b class="dash"> - </b>
                  <div class="c1">
                    <select class="form-control">
                      <option>14:30</option>
                      <option>20:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                    </select>
                  </div>
                  <strong class="btns">
                    <a class="ico plus" href="#"></a>
                    <!-- <a class="ico minus" href="#"></a> -->
                  </strong>
                </div> <!-- /.block -->
              </div> <!-- .set-times -->

              <div class="set-status">
                <div>
                  <select class="form-control">
                    <option>geöffnet</option>
                  </select>
                </div> <!-- /.cx -->
              </div>
            </div>
          </div>

          <div class="form-group schedule-form">
            
            <label class="col-sm-2 control-label"> <span>Mittwoch</span></label>

            <div class="col-sm-10 day-timetable">

              <div class="set-times">
                
                <div class="block">
                  <div class="is-geoffnet"></div>
                </div> <!-- /.block -->
              
              </div> <!-- .set-times -->

              <div class="set-status">
                <div>
                  <select class="form-control">
                    <option>geöffnet</option>
                  </select>
                </div> <!-- /.cx -->
              </div>
            </div>
          </div>

          <div class="form-group schedule-form">
            
            <label class="col-sm-2 control-label"><span style="margin-left: -17px;">Donnerstag</span></label>

            <div class="col-sm-10 day-timetable">

              <div class="set-times">
                
                <div class="block">
                  <div class="c1">
                    <select class="form-control">
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                    </select>
                  </div>
                  <b class="dash"> - </b>
                  <div class="c1">
                    <select class="form-control">
                      <option>14:30</option>
                      <option>20:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                    </select>
                  </div>
                  <strong class="btns">
                    <a class="ico plus" href="#"></a>
                    <!-- <a class="ico minus" href="#"></a> -->
                  </strong>
                </div> <!-- /.block -->
              
              </div> <!-- .set-times -->

              <div class="set-status">
                <div>
                  <select class="form-control">
                    <option>geöffnet</option>
                  </select>
                </div> <!-- /.cx -->
              </div>
            </div>
          </div>

          <div class="form-group schedule-form">
            
            <label class="col-sm-2 control-label"><span>Freitag</span></label>

            <div class="col-sm-10 day-timetable">

              <div class="set-times">
                
                <div class="block">
                  <div class="is-geoffnet"></div>
                </div> <!-- /.block -->
              
              </div> <!-- .set-times -->

              <div class="set-status">
                <div>
                  <select class="form-control">
                    <option>geöffnet</option>
                  </select>
                </div> <!-- /.cx -->
              </div>
            </div>
          </div>

          <div class="form-group schedule-form">
            
            <label class="col-sm-2 control-label"><span>Samstag</span></label>

            <div class="col-sm-10 day-timetable">

              <div class="set-times">
                
                <div class="block">
                  <div class="c1">
                    <select class="form-control">
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                    </select>
                  </div>
                  <b class="dash"> - </b>
                  <div class="c1">
                    <select class="form-control">
                      <option>14:30</option>
                      <option>20:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                      <option>08:30</option>
                      <option>13:30</option>
                    </select>
                  </div>
                  <strong class="btns">
                    <a class="ico plus" href="#"></a>
                    <!-- <a class="ico minus" href="#"></a> -->
                  </strong>
                </div> <!-- /.block -->
              
              </div> <!-- .set-times -->

              <div class="set-status">
                <div>
                  <select class="form-control">
                    <option>geöffnet</option>
                  </select>
                </div> <!-- /.cx -->
              </div>
            </div>
          </div>

          <div class="form-group schedule-form">
            
            <label class="col-sm-2 control-label"><span>Sonntag</span></label>

            <div class="col-sm-10 day-timetable">

              <div class="set-times">
                
                <div class="block">
                  <div class="is-geoffnet"></div>
                </div> <!-- /.block -->
              
              </div> <!-- .set-times -->

              <div class="set-status">
                <div>
                  <select class="form-control">
                    <option>geöffnet</option>
                  </select>
                </div> <!-- /.cx -->
              </div>
            </div>
          </div>

        </form>
        <!-- Le Form -->

      </div> <!-- /.modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-link" data-dismiss="modal">&laquo; Back</button>
        <button type="submit" class="btn btn-lg btn-primary">Next <span class="glyphicon glyphicon-chevron-right"></span></button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<!-- Step 4 -->
<div class="modal fade" id="step4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-step4" aria-hidden="true">
  <div class="modal-dialog addentry">
    
    <div class="modal-content">
      
      <div class="modal-header center">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel-step4">Enter New Opening Times</h4>
      </div>

      <div class="steps-nav">
        <a class="btn btn-step" href="#">Adresse</a><a class="btn btn-step" href="#">Kategorie</a><a class="btn btn-step" href="#">Öffnungszeiten</a><a class="btn btn-step active" href="#">Zusammenfassung</a><a class="btn btn-step last" href="#">Fertig <span class="glyphicon glyphicon-ok"></span></a>
      </div>
      
      <div class="modal-body">
        
        <!-- Le form -->
        <form class="form-horizontal review-info" role="form">
          <div class="head-ctg pick-ctg"><i class="ico bank ctg-label"></i> <strong>Bank/ Atm cashmashine</strong></div>
          <div class="form-group">
            <label class="col-sm-3 control-label">Addresse</label> <!-- Add for="inputAddresse" -->
            <div class="col-sm-9">
              <p><span class="glyphicon glyphicon-map-marker"></span> Breite Straße 25 14199 Berlin Kreuzberg</p>
              <!-- <input type="email" class="form-control" value="Breite Straße 25 14199 Berlin Kreuzberg" id="inputAddresse"> -->
            </div>
            
            <a class="edit" href="#">edit</a>
          </div>
          
          <div class="form-group">
            <label class="col-sm-3 control-label">Kontact</label> <!-- for="inputKontact" -->
            <div class="col-sm-9">
              <p><span class="glyphicon glyphicon-earphone"></span> 0308977280, &nbsp; <span class="glyphicon glyphicon-globe"></span> <a href="#">www.website.com</a></p>
              <!-- <div class="col-sm-9"><input type="email" class="form-control" value="0308977280" id="inputKontact"></div> -->
              <!-- <div class="col-sm-9"><input type="email" class="form-control" value="www.website.com" id="inputKontact"></div> -->
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label">Description</label> <!-- Add for="inputDesc" -->
            <div class="col-sm-9">
              
              <div class="desc">
                <p>Description of the lopation goes here In condi Sed eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris. <a class="tog-p" href="#">show more &nbsp;</a></p>
                <!-- <textarea class="form-control" rows="3">Description of the lopation goes here In condi Sed eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris.</textarea> -->
              </div>

              <ul>
                <li><label><!-- <input type="checkbox"> --> <span class="glyphicon glyphicon-ok"></span> Kostenloses Parken für Kunden</label></li>
                <li><label><!-- <input type="checkbox"> --> <span class="glyphicon glyphicon-ok"></span> WLAN-Zugang</label></li>
                <li><label><!-- <input type="checkbox"> --> <span class="glyphicon glyphicon-ok"></span> Behindertenfreundlich</label></li>
              </ul>
            </div>

            <a class="edit" href="#">edit</a> 
          </div> <!-- .form-group -->

          <div class="form-group">
            <label class="col-sm-3 control-label">Images</label>
            <div class="col-sm-9">
              <ul class="list-tumbs" style="padding-top:9px">
                <li><img alt="img" src="images/img_x.gif"> <!-- <a class="remove" href="#"><span class="glyphicon glyphicon-remove"></span></a>--></li>
                <li><img alt="img" src="images/img_x.gif"> <!-- <a class="remove" href="#"><span class="glyphicon glyphicon-remove"></span></a>--></li>
                <li><img alt="img" src="images/img_x.gif"> <!-- <a class="remove" href="#"><span class="glyphicon glyphicon-remove"></span></a>--></li>
                <li><img alt="img" src="images/img_x.gif"> <!-- <a class="remove" href="#"><span class="glyphicon glyphicon-remove"></span></a>--></li>
                <!-- <li><a href="#"><img src="images/img_x.gif" alt=""></a></li> -->
              </ul>
            </div>
            
            <a class="edit" href="#">edit</a>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label">Öffnungszeiten</label>
            <div class="col-sm-9">
              <ul class="schedule">
                <li><strong>Montag</strong> 08:30  - 13:30  /  14:30 - 20:30</li>
                <li><strong>Dienstag</strong> 08:30  - 20:30     Telefonisch erreichbar</li>
                <li><strong>Mittwoch</strong> 08:30  - 13:30  /  14:30 - 20:30</li>
                <li><strong>Donnerstag</strong> 08:30  - 13:30  /  14:30 - 20:30</li>
                <li><strong>Freitag</strong> 08:30  - 13:30  /  14:30 - 20:30</li>
                <li><strong>Samstag</strong> geschlossen</li>
                <li><strong>Sonntag</strong> geschlossen</li>
              </ul>
            </div>
            
            <a class="edit" href="#">edit</a>

          </div> <!-- /.form-group -->

        </form>
        <!-- Le Form -->

      </div> <!-- /.modal-body -->
      <div class="modal-footer">
        <button type="button" class="btn btn-link" data-dismiss="modal">&laquo; Back</button>
        <button type="submit" class="btn btn-lg btn-primary">Next</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<!-- Step 5 -->
<div class="modal fade" id="step5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-step5" aria-hidden="true">
  <div class="modal-dialog addentry">
    <div class="modal-content">
      
      <div class="modal-header center">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel-step5">Enter New Opening Times</h4>
      </div>
      
      <div class="modal-body center">        
        <h3 style="margin-top:0;">Your entry has been successuflly added
        to our directory.</h3>
        <p>Currently pending approval. We will review your submitted location typically within 24hours."</p>
        <div class="form-group">
          <div class="checkbox"><label> <input style="float:none;" type="checkbox"> Notify me when it will be posted </label></div>
        </div>
      </div> <!-- /.modal-body -->

      <div class="modal-footer center">
        <button type="submit" class="btn btn-lg btn-success">Fertig <span class="glyphicon glyphicon-ok"></span></button>
      </div>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<!-- Step 6 -->
<div class="modal fade" id="step6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-six" aria-hidden="true">
  <div class="modal-dialog addentry">
    <div class="modal-content">
      <div class="modal-header center">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel-six">Fehler melden</h4>
      </div>
      
      <div class="modal-body">
        
        <!-- Le form -->

        <form class="form-horizontal" role="form">
          
          <div class="form-group">
            <label for="inputEmail" class="col-sm-3 control-label">Email<i>*</i></label>
            <div class="col-sm-9"><input type="email" class="form-control" id="inputEmail" placeholder="Enter your Name"></div>
          </div>
          
          <div class="form-group">
            <label for="inputFehlermeldung" class="col-sm-3 control-label">Fehlermeldung<i>*</i></label>
            <div class="col-sm-9"><textarea class="form-control" id="inputFehlermeldung" rows="3"></textarea></div>
          </div>

        </form>

        <!-- Le Form -->

      </div> <!-- /.modal-body -->
      <div class="modal-footer">
        <em class="notice"><i>*</i> Pflichtfeld</em>
        <button type="submit" class="btn btn-lg btn-primary">Senden</button>
      </div> <!-- /.modal-footer -->

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
	    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="docs-assets/js/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script src="js/typeahead.bundle.min.js"></script>
    <script src="assets/owl-carousel/owl.carousel.js"></script>
    <?php echo $this->assets->outputJs(); ?>

    <script>
    $(document).ready(function() {


      var $window = $(window)

      // if ( $window.width() > 480) {
      
      var owl = $("#categ");

      owl.owlCarousel({

      items : 12, //10 items above 1000px browser width
      itemsDesktop : [1000, 12], //5 items between 1000px and 901px
      itemsDesktopSmall : [976, 8], // 3 items betweem 900px and 601px
      itemsTablet: [600,6], //2 items between 600 and 0;
      itemsMobile : [480,4] //2 items between 600 and 0;
      
      });
      
      var leextras = $("#extras");
      leextras.owlCarousel({

      // items : 13, //10 items above 1000px browser width
      // itemsDesktop : [1000, 4], //5 items between 1000px and 901px
      // itemsDesktopSmall : [976, 6], // 3 items betweem 900px and 601px
      // itemsTablet: [600,4], //2 items between 600 and 0;
      // itemsMobile : [480,4] //2 items between 600 and 0;
      
      });

      // Custom Navigation Events
      $(".next").click(function(){
        owl.trigger('owl.next');
      })
      $(".prev").click(function(){
        owl.trigger('owl.prev');
      })

      // $(".play").click(function(){
      //   owl.trigger('owl.play',1000);
      // })
      // $(".stop").click(function(){
      //   owl.trigger('owl.stop');
      // })

     // }

      // autocomplete Google
      var jelem = $('#wo');



      // init autocomplete
      var elem=jelem.get(0);
      // geocode or street
      var t={types:["geocode"],noClear: true, componentRestrictions:{country:"de"}};
      // var autocomplete = null;
      var autocomplete=new google.maps.places.Autocomplete(elem,t)
      // get geo data for chosen place
      google.maps.event.addListener(autocomplete, 'place_changed', function() {

          // wipe out stored geo data
          $('#_wo').val('');
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            return;
          }
          // store geo data
          $('#_wo').val(JSON.stringify(
            {'lat': place.geometry.location.lat(), 'lng': place.geometry.location.lng()}))

          console.log(place.geometry.location)

        });

      jelem.on('keydown', function(e){
        // on enter just leave and trigger autocomplete
        if (e.which == 13) { $(this).blur();/* e.preventDefault() */}
      })



      // typeahead
      var categories = new Bloodhound({
        datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.name); },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        limit: 10,
        remote: {
          url: 'categories.json?q=%QUERY',
        },
        prefetch: {
          url: 'categories.json?main',
          filter: function(list) {
            return $.map(list, function(category) { return { id: category.id, name: category.name }; });
          }
        }
      });
      categories.initialize();

      var TypeAhead = $('#wer').typeahead(null, {
      name: 'categories',
      displayKey: 'name',
      highlight: true,
      source: categories.ttAdapter()
      });

      TypeAhead.on('typeahead:opened', document, function(){
        $('#_wer').val('')
      })
      TypeAhead.on('typeahead:autocompleted typeahead:selected', document, function(e, datum){
        // $(this).data('id', datum.id)
        $('#_wer').val(datum.id)
      })

      // typeahead
/*      var businesses = new Bloodhound({
        datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.name); },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        limit: 10,
        remote: {
          url: 'businesses.json?q=%QUERY',
          // aditional data
          replace: function(url, query) {
            var jelem = $('#wo');
            var lat = jelem.data('lat')
            var lng = jelem.data('lng')
            url = url.replace(this.wildcard, query);
            if (!lat || !lng) return url
            return url + '&lat=' + encodeURIComponent(lat) + '&lng=' + encodeURIComponent(lng)
          }
        },
      });
      businesses.initialize();

      var TypeAhead = $('#wer').typeahead(null, {
      name: 'businesses',
      displayKey: 'name',
      highlight: true,
      source: businesses.ttAdapter(),
      templates: {
          suggestion: function(ctx){  
            var _out = '<p>:name::distance_from:</p>'.replace(':name:', ctx.name)
            if (ctx.hasOwnProperty('distance_from')){
                var out = _out.replace(':distance_from:', ' <small>' + Math.abs(ctx.distance_from) + ' km</small>')
              }else{
                var out = _out.replace(':distance_from:', '')
            }
            return out;
          }
        }
      });*/

      // connect categories bar with top navbar
      $('.trigger-quickfind').on('click', document, function(event){ event.preventDefault(); 
        var elem = $(this), name = elem.data('name').toLowerCase(), id = elem.data('id')
        // trigger selected event for Typeahead
        name = name.trim()
        $('#_wer').val('')
        $('#wer').val(name).trigger('typeahead:autocompleted', {id: id, name: name});
      })

        // handle search submit
       $('#navbar-form-search')
       .find('button').on('click', document, function(){
          // search for categories or by business names?
          var action = 'categories/search'
          if (! $('#_wer').val() && $('#wer').val()){
            action = 'businesses/search'
            $('#_wer').val($('#wer').val())
          }
          $('#navbar-form-search').attr('action', action).attr('method', 'post')
          .submit()
       })


        // set user location by html5
        function findLocation() {
            navigator.geolocation.getCurrentPosition(callback);
        }

        function callback(position) {
            if (position)
                window.location.href = "/users/setLocation/" + position.coords.latitude + "/" + position.coords.longitude + "?r=" + encodeURIComponent(window.location.href);
            else
                alert('Fehler bei der Positionsermittlung');
            
        }

        // extend map
        var jDomMap = $('div[class~=extenssible]');
var sel = jDomMap.get(0)
sel.style.display='none';
sel.offsetHeight; // no need to store this anywhere, the reference is enough
sel.style.display='block';
        $('div[class=le-map] a[class=map-extend]').data('small', true).click(function(e){
            e.preventDefault()

            var small = !!$(this).data('small')
            small ? jDomMap.addClass('extend') :  jDomMap.removeClass('extend')
            $(this).data('small', ! small) 
        })

      });
    </script>

	</body>
</html>
