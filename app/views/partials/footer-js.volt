    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="docs-assets/js/jquery-1.10.2.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
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


    });
    </script>