@extends('master')
@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Book {{$sanpham->name}}</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Home</a> / <span>Book details</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="container">
		<div id="content">
			<div class="row">
				<div class="col-sm-9">

					<div class="row">
						<div class="col-sm-4">
							<img src="source/image/product/{{$sanpham->image}}" alt="">
						</div>
						<div class="col-sm-8">
							<div class="single-item-body">
								<p class="single-item-title"><h2>{{$sanpham->name}}</h2></p>
								<p class="single-item-price">
									@if($sanpham->promotion_price==0)
										<span class="flash-sale">{{number_format($sanpham->unit_price)}} VNĐ</span>
									@else
										<span class="flash-del">{{number_format($sanpham->unit_price)}} VNĐ</span>
										<span class="flash-sale">{{number_format($sanpham->promotion_price)}} VNĐ</span>
									@endif
								</p>
							</div>

							<div class="clearfix"></div>
							<div class="space20">&nbsp;</div>

							<div class="single-item-desc">
								<p>Author: {{$sanpham->author}}</p>
							</div>
							<div class="space20">&nbsp;</div>

							<p>Amount: {{$sanpham->amount}}</p>
							<div class="single-item-options">			
								<a class="add-to-cart" href="{{route('themgiohang',$sanpham->id)}}"><i class="fa fa-shopping-cart"></i></a>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					<div class="space40">&nbsp;</div>
					<div class="woocommerce-tabs">
						<ul class="tabs">
							<li><a href="#tab-description">Description</a></li>
						</ul>

						<div class="panel" id="tab-description">
							<p>{{$sanpham->description}}</p>
						</div>
					</div>
					<div class="space50">&nbsp;</div>
					<div class="beta-products-list">
						<h4>Relation book</h4>

						<div class="row">
						@foreach($sp_tuongtu as $sptt)
							<div class="col-sm-4">
								<div class="single-item">
									@if($sptt->promotion_price!=0)
										<div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
									@endif
									<div class="single-item-header">
										<a href="{{route('chitietsanpham',$sptt->id)}}"><img src="source/image/product/{{$sptt->image}}" alt="" height="150px"></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title">{{$sptt->name}}</p>
										<p class="single-item-price" style="font-size: 18px">
											@if($sptt->promotion_price==0)
												<span class="flash-sale">{{number_format($sptt->unit_price)}} VNĐ</span>
											@else
												<span class="flash-del">{{number_format($sptt->unit_price)}} VNĐ</span>
												<span class="flash-sale">{{number_format($sptt->promotion_price)}} VNĐ</span>
											@endif
										</p>
									</div>
									<div class="single-item-caption">
										<a class="add-to-cart pull-left" href="{{route('themgiohang',$sptt->id)}}"><i class="fa fa-shopping-cart"></i></a>
										<a class="beta-btn primary" href="{{route('chitietsanpham',$sptt->id)}}">Details <i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						@endforeach
						</div>
						<div class="row">{{$sp_tuongtu->links()}}</div>
					</div> <!-- .beta-products-list -->
				</div>
				<div class="col-sm-3 aside">
					<div class="widget">
						<h3 class="widget-title">Promotion book</h3>
						<div class="widget-body">
							<div class="beta-sales beta-lists">
								@foreach($sanpham_khuyenmai as $spkm)
								<div class="media beta-sales-item">
									<a class="pull-left" href="{{route('chitietsanpham',$spkm->id)}}"><img src="source/image/product/{{$spkm->image}}" alt=""></a>
									<div class="media-body">
										{{$spkm->name}}
										<span class="beta-sales-price">
											<span class="flash-del">{{number_format($spkm->unit_price)}} VNĐ</span>
											<span class="flash-sale">{{number_format($spkm->promotion_price)}} VNĐ</span>											
										</span>
									</div>
								</div>
								@endforeach
							</div>
						</div>
					</div> <!-- best sellers widget -->
					<div class="widget">
						<h3 class="widget-title">New Book</h3>
						<div class="widget-body">

							<div class="beta-sales beta-lists">
								@foreach($new_product as $new)
								<div class="media beta-sales-item">
									<a class="pull-left" href="{{route('chitietsanpham',$new->id)}}"><img src="source/image/product/{{$new->image}}" alt=""></a>
									<div class="media-body">
										{{$new->name}}
										<span class="beta-sales-price">
											@if($new->promotion_price==0)
												<span class="flash-sale">{{number_format($new->unit_price)}} VNĐ</span>
											@else
												<span class="flash-del">{{number_format($new->unit_price)}} VNĐ</span>
												<span class="flash-sale">{{number_format($new->promotion_price)}} VNĐ</span>
											@endif
										</span>
									</div>
								</div>
								@endforeach
							</div>					
						</div>

					</div> <!-- best sellers widget -->
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection