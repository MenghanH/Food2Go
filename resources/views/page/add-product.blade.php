//The Ton Le
@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Add product</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb">
					<a href="{{route('home')}}">Home</a> / <span>Adding</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	
	<div class="container">
		<div id="content">
			
			<form action="{{route('add')}}" method="post" enctype="multipart/form-data" class="beta-form-checkout">
			<input type="hidden" name="_token" value="{{csrf_token()}}">
				<div class="row">
					<div class="col-sm-3"></div>
					@if(count($errors)>0)
						<div class="alert alert-danger">
							@foreach($errors->all() as $err)
							{{$err}}
							@endforeach
						</div>
					@endif
					@if(Session::has('flag'))
						<div class="alert alert-{{Session::get('flag')}}">{{Session::get('message')}}</div>
					@endif
					<div class="col-sm-6">
						<h4>Add product</h4>
						<div class="space20">&nbsp;</div>

						
						<div class="form-block">
							<label for="product">Product Name*</label>
							<input type="text" name="name" required>
						</div>

						<div class="form-block">
							<label for="your_last_name">Id Type*</label>
							<input type="text" name="id_type" required>
						</div>

						<div class="form-block">
							<label for="description">Description*</label>
							<input type="text" name="description" required>
						</div>

						<div class="form-block">
							<label for="unit-price">Unit price*</label>
							<input type="text" name="unit_price" required>
						</div>
						<div class="form-block">
							<label for="promotion-price">Promotion price*</label>
							<input type="text" name="promotion_price" >
						</div>
						<div class="form-block">
							<label for="image">Image*</label>
							<input type="file" name="image" required>

						</div>
						<div class="form-block">
							<label for="unit">Unit*</label>
							<input type="text" name="unit" required>
						</div>
						<div class="form-block">
							<label for="new">New*</label>
							<input type="text" name="new" required>
						</div>
						<div class="form-block">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</div>
					<div class="col-sm-3"></div>
				</div>
			</form>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection
