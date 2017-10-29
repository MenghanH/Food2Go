//JunFengMa
<div id="header">
		<div class="header-top">
			<div class="container">
				<div class="pull-left auto-width-left">
					<ul class="top-menu menu-beta l-inline">
						<li><a href="{{route('contact')}}"><i class="fa fa-home"></i> 17 WakeField, Auckland</a></li>
						<li><a href="{{route('contact')}}"><i class="fa fa-phone"></i> 0204 103 8599</a></li>
					</ul>
				</div>
				<div class="pull-right auto-width-right">
					<ul class="top-details menu-beta l-inline">
					@if(Auth::check())
						<li><a href="">Hi {{Auth::user()->full_name}}</a></li>
						<li><a href="{{route('logout')}}">Log out</a></li>
					@else
						<li><a href="{{route('signin')}}">Register</a></li>
						<li><a href="{{route('login')}}">Log in</a></li>
					@endif

					</ul>
				</div>
				<div class="clearfix"></div>
			</div> <!-- .container -->
		</div> <!-- .header-top -->
		<div class="header-body">
			<div class="container beta-relative">
				<div class="pull-left">
					<a href="{{route('home')}}" id="logo"><img src="source/assets/dest/images/logo-cake.png" width="200px" alt=""></a>
				</div>
				<div class="pull-right beta-components space-left ov">
					<div class="space10">&nbsp;</div>
					<div class="beta-comp">
						<form role="search" method="post" id="searchform" action="search">
						<input type="hidden" name="_token" value="{{csrf_token()}}";>
					        <input type="text" value="" name="search" id="s" placeholder="Search..." />
					        <button class="fa fa-search" type="submit" id="searchsubmit"></button>
						</form>
					</div>

					<div class="beta-comp">
					
						<div class="cart">
							<div class="beta-select"><i class="fa fa-shopping-cart"></i> Shopping cart (@if(Session::has('cart')){{Session('cart')->totalQty}}@else Empty @endif) <i class="fa fa-chevron-down"></i></div>
							<div class="beta-dropdown cart-body">
							
							@if(Session::has('cart'))
							@foreach($product_cart as $product)
								<div class="cart-item">
									<a class="cart-item-delete" href="{{route('xoagiohang',$product['item']['id'])}}"><i class="fa fa-times"></i></a>
									<div class="media">
										<a class="pull-left"><img src="source/image/product/{{$product['item']['image']}}" alt=""></a>
										<div class="media-body">
											<span class="cart-item-title">{{$product['item']['name']}}</span>
											<span class="cart-item-amount">
											{{$product['qty']}}*<span>
											@if($product['item']['promotion_price']==0)
												{{number_format($product['item']['unit_price'])}}
											 @else 
											 	{{number_format($product['item']['promotion_price'])}}@endif
											</span></span>
										</div>
									</div>
								</div>
							@endforeach
								<div class="cart-caption">
									<div class="cart-total text-right">Total: <span class="cart-total-value">@if(Session::has('cart')) $ {{number_format($totalPrice)}} @else 0 @endif nzl</span></div>
									<div class="clearfix"></div>

									<div class="center">
										<div class="space10">&nbsp;</div>
										<a href="{{route('dathang')}}" class="beta-btn primary text-center">Order <i class="fa fa-chevron-right"></i></a>
									</div>
								</div>

							@endif
							</div>
						</div> <!-- .cart
					</div> -->
				</div>
				<div class="clearfix"></div>
			</div> <!-- .container -->
		</div> <!-- .header-body -->
		<div class="header-bottom" style="background-color: #0277b8;">
			<div class="container">
				<a class="visible-xs beta-menu-toggle pull-right" href="#"><span class='beta-menu-toggle-text'>Menu</span> <i class="fa fa-bars"></i></a>
				<div class="visible-xs clearfix"></div>
				<nav class="main-menu">
					<ul class="l-inline ov">
						<li><a href="{{route('home')}}">Home page</a></li>
						<li><a >Product</a>
							<ul class="sub-menu">
								@foreach($loai_sp as $type)
								<li><a href="{{route('TYPE',$type->id)}}">{{$type->name}}</a></li>
								@endforeach
							</ul>
						</li>
						<li><a href="{{route('about-us')}}">About</a></li>
						<li><a href="{{route('contact')}}">Contact Us</a></li>
						@if(Auth::check())
						 	@if(Auth::user()->id<=10)
							<li><a href="{{route('add')}}">Add product</a></li>
							@endif
						@endif
					</ul>
					<div class="clearfix"></div>
				</nav>
			</div> <!-- .container -->
		</div> <!-- .header-bottom -->
	</div> <!-- #header -->
