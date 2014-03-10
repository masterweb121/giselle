  <div class="row content">
  <?php echo $this->getContent(); ?>
    <div class="wrap lists">
      <h1 class="wrap">Öffnungszeiten für alle Filialen</h1>
      <?php foreach ($stats as $cityname => $datum) { ?>
      <div>
        <h4 class="heading">Öffnungszeiten <?php echo $cityname; ?></h4>
        <ul class="lst">
      <?php foreach ($datum as $stat) { ?>
          <li><a href="#"><?php echo $stat->category_name; ?> in <?php echo $cityname; ?> <span class="label label-default"><?php echo $stat->counted_businesses; ?></span></a></li>
      <?php } ?>
         </ul>
      </div>
      <?php } ?>
    </div> <!-- /.row .lists -->

  </div> <!-- .row -->