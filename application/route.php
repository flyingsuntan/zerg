<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------


use think\Route;
Route::get('api/:version/banner/:id','api/:version.Banner/getBanner');

Route::get('api/:version/theme/','api/:version.theme/getSimpleList');

//Route::get('api/:version/banner/:id','api/:version.Banner/getComplexOne');
/*
Route::get('api/:version/product/by_category','api/:version.product/getAllInCategory');
Route::get('api/:version/product/:id','api/:version.Product/getOne',[],['id'=>'\d+']);
Route::get('api/:version/product/recent','api/:version.product/getRecent');
*/
Route::group('api/:version/product',function (){
   Route::get('/by_category','api/:version.product/getAllInCategory');
   Route::get('/:id','api/:version.Product/getOne',[],['id'=>'\d+']);
   Route::get('/recent','api/:version.product/getRecent');
});

Route::get('api/:version/category/all','api/:version.category/getAllCategories');


Route::post('api/:version/address','api/:version.address/createOrUpdateAddress');



Route::post('api/:version/token/user','api/:version.Token/getToken');
Route::get('api/:version/address/a','api/:version.address/second');

Route::post('api/:version/order','api/:version.Order/placeOrder');

Route::post('api/:version/pay/pre_order','api/:version.Pay/getPreOrder');
Route::post('api/:version/pay/notify','api/:version.Pay/receiveNotify');





return [
    '__pattern__' => [
        'name' => '\w+',
    ],
    '[hello]'     => [
        ':id'   => ['index/hello', ['method' => 'get'], ['id' => '\d+']],
        ':name' => ['index/hello', ['method' => 'post']],
    ],
];
