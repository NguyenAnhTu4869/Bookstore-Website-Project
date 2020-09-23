@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Order</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb">
					<a href="{{route('trang-chu')}}">Home</a> / <span>Order</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
</div>

<div class="container">
	<div id="content">
		
		<form action="{{route('dathang')}}" method="post" class="beta-form-checkout">
			<input type="hidden" name="_token" value="{{csrf_token()}}">
			<div class="row">@if(Session::has('thongbao')){{Session::get('thongbao')}}@endif</div>
			<div class="row">
				<div class="col-sm-6">
					<h4>Order</h4>
					<div class="space20">&nbsp;</div>
					@if(Auth::check())
					<div class="form-block">
						<label for="name">Fullname*</label>
						<input type="text" name="name"  required value= "{{Auth::user()->full_name}}">
					</div>
					<div class="form-block">
						<label>Gender </label>
						<input id="gender" type="radio" class="input-radio" name="gender" value="nam" checked="checked" style="width: 10%"><span style="margin-right: 10%">Male</span>
						<input id="gender" type="radio" class="input-radio" name="gender" value="nữ" style="width: 10%"><span>Female</span>
									
					</div>

					<div class="form-block">
						<label for="email">Email*</label>
						<input type="email" id="email" name="email" required value="{{Auth::user()->email}}">
					</div>

					<div class="form-block">
						<label for="adress">Address*</label>
						<input type="text" id="address" name="address" value="{{Auth::user()->address}}" required>
					</div>
					

					<div class="form-block">
						<label for="phone">Phone*</label>
						<input type="text" id="phone" name="phone" required value="{{Auth::user()->phone}}">
					</div>
					
					<div class="form-block">
						<label for="notes">Note</label>
						<textarea id="notes" name="notes"></textarea>
					</div>
					@else
					<div class="form-block">
						<label for="name">Fullname*</label>
						<input type="text" name="name" placeholder="Fullname" required>
					</div>
					<div class="form-block">
						<label>Gender </label>
						<input id="gender" type="radio" class="input-radio" name="gender" value="nam" checked="checked" style="width: 10%"><span style="margin-right: 10%">Male</span>
						<input id="gender" type="radio" class="input-radio" name="gender" value="nữ" style="width: 10%"><span>Female</span>
									
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
						<label for="phone">Phone*</label>
						<input type="text" id="phone" name="phone" required>
					</div>
					
					<div class="form-block">
						<label for="notes">Note</label>
						<textarea id="notes" name="notes"></textarea>
					</div>
					@endif					
				</div>

				<div class="col-sm-6">
					<div class="your-order">
						<div class="your-order-head"><h5>Your order</h5></div>
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
											<span class="color-gray your-order-info">Unit price: {{number_format($cart['price'])}} VNĐ</span>
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
								<div class="pull-left"><p class="your-order-f18">Toatl:</p></div>
								<div class="pull-right"><h5 class="color-black">@if(Session::has('cart')){{number_format($totalPrice)}}@else 0 @endif VNĐ</h5></div>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="your-order-head"><h5>Payments</h5></div>
						
						<div class="your-order-body">
							<ul class="payment_methods methods">
								<li class="payment_method_bacs">
									<input id="payment_method_bacs" type="radio" class="input-radio" name="payment_method" value="COD" checked="checked" data-order_button_text="">
									<label for="payment_method_bacs">COD </label>
									<div class="payment_box payment_method_bacs" style="display: block;">
										The store will send the books to your address, you see the books and then pay the shipper
									</div>						
								</li>

								<li class="payment_method_cheque">
									<input id="payment_method_cheque" type="radio" class="input-radio" name="payment_method" value="ATM" data-order_button_text="">
									<label for="payment_method_cheque">ATM </label>
									<div class="payment_box payment_method_cheque" style="display: none;">
										Transfer funds to the following account:
										<br>- Account number: 4665 8428 0018 2647
										<br>- Account holder: NGUYEN ANH TU
										<br>- TPBank, Ho Chi Minh City branch
									</div>						
								</li>
								
							</ul>
						</div>

						<div class="text-center"><button type="submit" class="beta-btn primary" href="#">Order <i class="fa fa-chevron-right"></i></button></div>
					</div> <!-- .your-order -->
				</div>
			</div>
		</form>
	</div> <!-- #content -->
</div> <!-- .container -->
@endsection