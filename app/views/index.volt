<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6"> <![endif]-->
<!--[if IE 7 ]> <html lang="en" class="ie7"> <![endif]-->
<!--[if IE 8 ]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="en" class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en"> <!--<![endif]-->
	{% include "partials/head.volt" %}
	<body>
	{% include "partials/navbar.volt" %}
	<div class="wrap page">

	{{ content() }}
	    
	{% include "partials/footer.volt" %}
	    
	</div> <!-- /wrap -->

	{% block modals %}
	{% include "partials/modals.volt" %}
	{% endblock %}
	{% include "partials/footer-js.volt" %}

	</body>
</html>
