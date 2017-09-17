@extends('master')
@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">About US</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('home')}}">Home</a> / <span>About US</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div id="content">
			


			<h2 class="text-center wow fadeInDownwow fadeInDown">Our Amaizing Team</h2>
			<div class="space20">&nbsp;</div>
			<h5 class="text-center other-title wow fadeInLeft">Founders</h5>
			<p class="text-center wow fadeInRight">Nemo enims voluptatem quia volupas sit aspe aut odit aut fugit, sed quia <br />consequuntur magni dolores.</p>
			<div class="space20">&nbsp;</div>
			<div class="row">
				<div class="col-sm-6 wow fadeInLeft">
					<div class="beta-person media">
					
						<img class="pull-left" src="source/image/teammember/1.jpg" alt="">
					
						<div class="media-body beta-person-body">
							<h5>Bao Nguyen</h5>
							<p class="font-large">Developer-Front end</p>
							<p>Creates interaction and user experience with scripts embedded in a site’s HTML. Everything a visitor to your site sees, clicks, or uses to input or retrieve information is the work of the front-end developer who creates client-side software that brings the site’s design to life. Scripts are downloaded by the browser, processed, and then run apart from the server.</p>
							<!-- <a href="single_type_gallery.html">View projects <i class="fa fa-chevron-right"></i></a> -->
						</div>
					</div>
				</div>
				<div class="col-sm-6 wow fadeInRight">
					<div class="beta-person media ">
					
						<img class="pull-left" src="source/image/teammember/2.jpg" alt="">
					
						<div class="media-body beta-person-body">
							<h5>Ton Le</h5>
							<p class="font-large">Tester</p>
							<p>The role of a software tester in an Agile environment goes beyond “just testing” and logging bugs. It is more working as part of a development team and working closely with the product owner. The tester works with everyone in the team in order to improve and build quality into the product as early as possible.</p>
							<a href="single_type_gallery.html">View projects <i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="space60">&nbsp;</div>
			<div class="row">
				<div class="col-sm-3">
					<div class="beta-person beta-person-full">
				<div class="bets-img-hover">
						<img src="source/assets/dest/images/person1.jpg" alt="">
				</div>
						<div class="beta-person-body">
							<h5>Junfeng Ma</h5>
							<p class="font-large">Web developer</p>
							<p>Nemo enims voluptatem quia volupas sit aspe aut odit aut fugit, sed quia consequuntur magni dolores.</p>
							<a href="single_type_gallery.html">View projects <i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="beta-person beta-person-full">
					<div class="bets-img-hover">
						<img src="source/assets/dest/images/person2.jpg" alt="">
					</div>
						<div class="beta-person-body">
							<h5>MengHan Huang</h5>
							<p class="font-large">Web developer</p>
							<p>Nemo enims voluptatem quia volupas sit aspe aut odit aut fugit, sed quia consequuntur magni dolores.</p>
							<a href="single_type_gallery.html">View projects <i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="beta-person beta-person-full">
					<div class="bets-img-hover">
						<img src="source/assets/dest/images/person3.jpg" alt="">
					</div>
						<div class="beta-person-body">
							<h5>Yujin</h5>
							<p class="font-large">Web developer</p>
							<p>Nemo enims voluptatem quia volupas sit aspe aut odit aut fugit, sed quia consequuntur magni dolores.</p>
							<a href="single_type_gallery.html">View projects <i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
				</div>
				
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection
