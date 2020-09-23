@extends('master')
@section('content')
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Introduce</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Home</a> / <span>Introduce</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div id="content">
			<div style="text-align: center;">
				<img src="source/assets/dest/images/logo-shop.png" width="40%" alt="">
			</div>
			<div class="space30">&nbsp;</div>
			<div style="text-align: center;">
				<p style="font-size: 20px"><span style="color: blue; text-transform: uppercase;">Imirai Bookstore</span> is a distributor, providing wholesale products of publishers across the country.</p>
			</div>
			<div class="space25">&nbsp;</div>
			<div style="text-align: center;">
				<p style="font-size: 20px"><span style="color: blue; text-transform: uppercase;">Imirai Bookstore</span> has main products are Comics, Light Novel, Children's Stories, Books, Newspapers, Magazines and related gifts.</p>
			</div>
			<div class="space25">&nbsp;</div>
			<div style="text-align: center;">
				<p style="font-size: 20px"><span style="color: blue; text-transform: uppercase;">Imirai Bookstore</span> commits to sell only products that are clear, transparent and consistent with Vietnamese laws.</p>
			</div>

		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection