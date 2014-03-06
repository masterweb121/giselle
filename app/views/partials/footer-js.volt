    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="docs-assets/js/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
    <script src="js/typeahead.bundle.min.js"></script>
    <script src="docs-assets/js/application.js"></script>
    <script src="assets/owl-carousel/owl.carousel.js"></script>

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
      var t={types:["geocode"],componentRestrictions:{country:"de"}};
      var autocomplete=new google.maps.places.Autocomplete(elem,t)

      // get geo data for chosen place
      google.maps.event.addListener(autocomplete, 'place_changed', function() {

          // wipe out stored geo data
          jelem.removeData('lat')
          jelem.removeData('lng')
   
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            return;
          }
          // store geo data
          jelem.data('lat', place.geometry.location.lat())
          jelem.data('lng', place.geometry.location.lng())
        });


      });

      // typeahead
      var businesses = new Bloodhound({
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

      var TypeAhead = $('#navbar-form-search .typeahead').typeahead(null, {
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
      });

      TypeAhead.on('typeahead:autocompleted', function(evt, data){
        var jelem = $('#wo');
        var lat = jelem.data('lat')
        var lng = jelem.data('lng')
        // console.log(jelem.data('lat'))
        // console.log(data)
      })
    </script>