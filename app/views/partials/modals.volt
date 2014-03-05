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