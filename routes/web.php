<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('index',[
	'as'=>'trang-chu',
	'uses'=>'PageController@getIndex'
]);

Route::get('loai-san-pham/{type}',[
	'as'=>'loaisanpham',
	'uses'=>'PageController@getLoaiSp'
]);

Route::get('chi-tiet-san-pham/{id}',[
	'as'=>'chitietsanpham',
	'uses'=>'PageController@getChitiet'
]);

Route::get('lien-he',[
	'as'=>'lienhe',
	'uses'=>'PageController@getLienHe'
]);

Route::get('gioi-thieu',[
	'as'=>'gioithieu',
	'uses'=>'PageController@getGioiThieu'
]);

Route::get('add-to-cart/{id}',[
	'as'=>'themgiohang',
	'uses'=>'PageController@getAddtoCart'
]);

Route::get('del-cart/{id}',[
	'as'=>'xoagiohang',
	'uses'=>'PageController@getDelItemCart'
]);

Route::get('dat-hang',[
	'as'=>'dathang',
	'uses'=>'PageController@getCheckout'
]);

Route::post('dat-hang',[
	'as'=>'dathang',
	'uses'=>'PageController@postCheckout'
]);

Route::get('dang-nhap',[
	'as'=>'login',
	'uses'=>'PageController@getLogin'
]);

Route::post('dang-nhap',[
	'as'=>'login',
	'uses'=>'PageController@postLogin'
]);

Route::get('dang-ki',[
	'as'=>'signin',
	'uses'=>'PageController@getSignin'
]);

Route::post('dang-ki',[
	'as'=>'signin',
	'uses'=>'PageController@postSignin'
]);

Route::get('dang-xuat',[
	'as'=>'logout',
	'uses'=>'PageController@postLogout'
]);

Route::get('search',[
	'as'=>'search',
	'uses'=>'PageController@getSearch'
]);

Route::get('admin/adminpage/adminlogin','AdminController@getAdminLogin');
Route::post('admin/adminpage/adminlogin','AdminController@postAdminLogin');
Route::get('admin/adminpage/adminlogout','AdminController@postAdminLogout');

Route::group(['prefix'=>'admin', 'middleware'=>'adminLogin'],function(){
	Route::group(['prefix'=>'adminpage'],function(){
		Route::group(['prefix'=>'book'],function(){

			Route::get('listbook','AdminController@getListBook');

			Route::get('addbook','AdminController@getAddBook');
			Route::post('addbook','AdminController@postAddBook');

			Route::get('editbook/{id}','AdminController@getEditBook');
			Route::post('editbook/{id}','AdminController@postEditBook');

			Route::get('delbook/{id}','AdminController@getDelBook');
		});

		Route::group(['prefix'=>'booktype'],function(){

			Route::get('listtype','AdminController@getListType');

			Route::get('addtype','AdminController@getAddType');
			Route::post('addtype','AdminController@postAddType');

			Route::get('edittype/{id}','AdminController@getEditType');
			Route::post('edittype/{id}','AdminController@postEditType');

			Route::get('deltype/{id}','AdminController@getDelType');
		});

		Route::group(['prefix'=>'user'],function(){
			
			Route::get('listuser','AdminController@getListUser');

			Route::get('adduser','AdminController@getAddUser');
			Route::post('adduser','AdminController@postAddUser');

			Route::get('edituser/{id}','AdminController@getEditUser');
			Route::post('edituser/{id}','AdminController@postEditUser');

			Route::get('deluser/{id}','AdminController@getDelUser');
		});

		Route::group(['prefix'=>'bill'],function(){
			
			Route::get('listbill','AdminController@getListBill');

		});
		
		Route::get('listcustomer','AdminController@getListCustomer');
	});
});
