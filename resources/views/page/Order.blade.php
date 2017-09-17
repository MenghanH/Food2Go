@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Order</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb">
					<a href="{{route('home')}}">Home</a> / <span>Order</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
</div>

<div class="container">
	<div id="content">
		
		<form action="{{route('dathang')}}" method="post" class="beta-form-checkout">
			<input type="hidden" name="_token" value="{{csrf_token()}}">
			<div class="row">@if(Session::has('message')){{Session::get('message')}}@endif</div>
			<div class="row">
				<div class="col-sm-6">
					<h4>Order</h4>
					<div class="space20">&nbsp;</div>

					<div class="form-block">
						<label for="name">Full Name*</label>
						<input type="text" name="name" placeholder="Full name" required>
					</div>
					<div class="form-block">
						<label>Gender</label>
						<input id="gender" type="radio" class="input-radio" name="gender" value="Male" checked="checked" style="width: 10%"><span style="margin-right: 10%">Male</span>
						<input id="gender" type="radio" class="input-radio" name="gender" value="Female" style="width: 10%"><span>Female</span>
									
					</div>

					<div class="form-block">
						<label for="email">Email*</label>
						<input type="email" id="email" name="email" required placeholder="expample@gmail.com">
					</div>

					<div class="form-block">
						<label for="adress">Address*</label>
						<input type="text" id="address" name="address" placeholder="Street Address" required>
					</div>
					

					<div class="form-block">
						<label for="phone">Phone number*</label>
						<input type="text" id="phone" name="phone" required>
					</div>
					
					<div class="form-block">
						<label for="notes">Note</label>
						<textarea id="notes" name="notes"></textarea>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="your-order">
						<div class="your-order-head"><h5>Your order detail</h5></div>
						<div class="your-order-body" style="padding: 0px 10px">
							<div class="your-order-item">
								<div>
								@if(Session::has('cart'))
								@foreach($product_cart as $cart)
								<!--  one item	 -->
									<div class="media">
										<img width="25%" src="source/image/product/{{$cart['item']['image']}}" alt="" class="pull-left">
										<div class="media-body">
											<p class="font-large">{{$cart['item']['name']}}</p>
											<span class="color-gray your-order-info">Bill:$ {{number_format($cart['price'])}} nzl</span>
											<span class="color-gray your-order-info">Quantity: {{$cart['qty']}}</span>
										</div>
									</div>
								<!-- end one item -->
								@endforeach
								@endif
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="your-order-item">
								<div class="pull-left"><p class="your-order-f18">Total:</p></div>
								<div class="pull-right"><h5 class="color-black">$ @if(Session::has('cart')){{number_format($totalPrice)}}@else 0 @endif nzl</h5></div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="your-order-head"><h5>Type of payment</h5></div>
						
						<div class="your-order-body">
							<ul class="payment_methods methods">
								<li class="payment_method_bacs">
									<input id="payment_method_bacs" type="radio" class="input-radio" name="payment_method" value="COD" checked="checked" data-order_button_text="">
									<label for="payment_method_bacs">Cash</label>
									<div class="payment_box payment_method_bacs" style="display: block;">
										You will pay after you recieced your order for our delivery directly.
									</div>						
								</li>

								<li class="payment_method_cheque">
									<input id="payment_method_cheque" type="radio" class="input-radio" name="payment_method" value="ATM" data-order_button_text="">
									<label for="payment_method_cheque">Card </label>
									<div class="payment_box payment_method_cheque" style="display: none;">
										Pay through bank account:
										<br>- Bank account: 123 456 789
										<br>- Name of card holder: Nguyễn A
										<br>- ANZ bank, branch Queens
									</div>						
								</li>
								
							</ul>
						</div>

						<div class="text-center"><button type="submit" class="beta-btn primary" href='#'>Order<i class="fa fa-chevron-right"></i></button></div>
					</div> <!-- .your-order -->
				</div>
			</div>
		</form>
	</div> <!-- #content -->
</div> <!-- .container -->
@endsection
