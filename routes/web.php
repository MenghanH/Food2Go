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
	'as'=>'home',
	'uses'=>'PageController@getIndex'
]);

Route::get('product_tYpe/{type}',[
	'as'=>'TYPE',
	'uses'=>'PageController@getType'
]);

Route::get('chi-tiet-san-pham/{id}',[
	'as'=>'detail',
	'uses'=>'PageController@getChitiet'
]);

Route::get('contact',[
	'as'=>'contact',
	'uses'=>'PageController@getContact'
]);
Route::post('contact',[
	'as'=>'contact',
	'uses'=>'PageController@postContact'
]);
Route::get('about-us',[
	'as'=>'about-us',
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
Route::post('search',[
	'as'=>'search',
	'uses'=>'PageController@Search'
]);
Route::get('add-product',[
	'as'=>'add',
	'uses'=>'PageController@getAdd'
]);
Route::post('add-product',[
	'as'=>'add',
	'uses'=>'PageController@postAdd'
]);
Route::get('delete/{id}',[
		'as'=>'delete',
		'uses'=>'PageController@postDelete'
]);
