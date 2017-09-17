@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Products {{$productType->name}}</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('home')}}">Home</a> / <span>Products</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
</div>
<div class="container">
	<div id="content" class="space-top-none">
		<div class="main-content">
			<div class="space60">&nbsp;</div>
			<div class="row">
				<div class="col-sm-3">
					<ul class="aside-menu">
					@foreach($Type as $t)
						<li><a href="{{route('TYPE',$t->id)}}">{{$t->name}}</a></li>
					@endforeach
					</ul>
				</div>
				<div class="col-sm-9">
					<div class="beta-products-list">
						<h4>New Products</h4>
						<div class="beta-products-details">
							<p class="pull-left">styles found</p>
							<div class="clearfix"></div>
						</div>

						<div class="row">
						@foreach($sp_theoloai as $PRODUCT)
							<div class="col-sm-4">
								<div class="single-item">
									@if($PRODUCT->promotion_price!=0)
										<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
									@endif
									<div class="single-item-header">
										<a href="{{route('detail',$PRODUCT->id)}}"><img src="source/image/product/{{$PRODUCT->image}}" alt="" height="250px"></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title">{{$PRODUCT->name}}</p>
										<p class="single-item-price" style="font-size: 18px">
										@if($PRODUCT->promotion_price !=0)
											<span class="flash-del">$ {{number_format($PRODUCT->unit_price)}} nzl</span>
												<span class="flash-sale">$ {{number_format($PRODUCT->promotion_price)}} nzl</span>
										@else
										<span>$ {{number_format($PRODUCT->unit_price)}} nzl</span>
										@endif
										</p>
									</div>
									<div class="single-item-caption">
									@if(Auth::check())
										<a class="add-to-cart pull-left" href="{{route('themgiohang',$PRODUCT->id)}}"><i class="fa fa-shopping-cart"></i></a>
									@endif
										<a class="beta-btn primary" href="{{route('detail',$PRODUCT->id)}}">Details <i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						@endforeach
						</div>
					</div> <!-- .beta-products-list -->

					<div class="space50">&nbsp;</div>

					<div class="beta-products-list">
						<h4>Product relative</h4>
						<div class="beta-products-details">
							<p class="pull-left">Found {{count($other)}} Products</p>
							<div class="clearfix"></div>
						</div>
						<div class="row">
						@foreach($other as $ot)
							<div class="col-sm-4">
								<div class="single-item">
									@if($ot->promotion_price!=0)
										<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
									@endif
									<div class="single-item-header">
										<a href={{route('detail',$ot->id)}}><img src="source/image/product/{{$ot->image}}" alt="" height="250px"></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title">{{$ot->name}}</p>
										<p class="single-item-price" style="font-size: 18px">
										@if($ot->promotion_price !=0)
											<span class="flash-del">$ {{number_format($ot->unit_price)}} nzl</span>
												<span class="flash-sale">$ {{number_format($ot->promotion_price)}} nzl</span>
										@else
										<span>$ {{number_format($ot->unit_price)}} nzl</span>
										@endif
										</p>
									</div>
									<div class="single-item-caption">
										@if(Auth::check())
											<a class="add-to-cart pull-left" href="{{route('themgiohang',$ot->id)}}"><i class="fa fa-shopping-cart"></i></a>
										@endif
										<a class="beta-btn primary" href="{{route('detail',$ot->id)}}">Detail <i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						@endforeach
						</div>
						<div class="row">{{$other->links()}}</div>
						<div class="space40">&nbsp;</div>
						
					</div> <!-- .beta-products-list -->
				</div>
			</div> <!-- end section with sidebar and main content -->


		</div> <!-- .main-content -->
	</div> <!-- #content -->
</div> <!-- .container -->
@endsection