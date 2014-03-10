  <div class="row content">
  {{content()}}
    <div class="wrap lists">
      <h1 class="wrap">Öffnungszeiten für alle Filialen</h1>
      {% for cityname, datum in stats %}
      <div>
        <h4 class="heading">Öffnungszeiten {{cityname}}</h4>
        <ul class="lst">
      {% for stat in datum %}
          <li><a href="#">{{stat.category_name}} in {{cityname}} <span class="label label-default">{{stat.counted_businesses}}</span></a></li>
      {% endfor %}
         </ul>
      </div>
      {% endfor %}
    </div> <!-- /.row .lists -->

  </div> <!-- .row -->