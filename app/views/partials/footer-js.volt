    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="docs-assets/js/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script src="js/typeahead.bundle.min.js"></script>
    <script src="assets/owl-carousel/owl.carousel.js"></script>
    {{ this.assets.outputJs() }}

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