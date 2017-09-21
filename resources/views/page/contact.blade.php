//Junfeng
@extends('master')
@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Contacts</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('home')}}">Home</a> / <span>Contacts</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="map">
			<iframe width="600" height="450" frameborder="0" 
			src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=17 WakeField,Auckland&amp;aq=0&amp;oq=un&amp;sll=174.76437239999996,-36.8535618&amp;output=embed"> </iframe> 		
	</div>

	<div class="container">
		<div id="content" class="space-top-none">
			
			<div class="space50">&nbsp;</div>
			<div class="row"><h1 style="color: green">@if(Session::has('message')){{Session::get('message')}}@endif</h1></div>
			<div class="row">
				<div class="col-sm-8">
					<h2>Contact Form</h2>
					<div class="space20">&nbsp;</div>
					<p style="color: red">Any question or help. Please contact us.</p>
					<div class="space20">&nbsp;</div>
					<form action="{{url('contact')}}" method="post" class="contact-form">
						{{csrf_field()}}
						<div class="form-block">
							<input name="name" type="text" placeholder="Your Name (required)">
						</div>
						<div class="form-block">
							<input name="email" type="email" placeholder="Your Email (required)">
						</div>
						<div class="form-block">
							<input name="subject" type="text" placeholder="Subject">
						</div>
						
						<div class="form-block">
							<textarea name="message" placeholder="Your Message"></textarea>
						</div>
						<div class="form-block">
							<button type="submit" class="beta-btn primary">Send Message <i class="fa fa-chevron-right"></i></button>
						</div>
					</form>
				</div>
				
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection
