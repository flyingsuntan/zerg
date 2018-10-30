<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/18
 * Time: 17:19
 */

namespace app\api\Controller\v1;


use app\api\validate\CountValidate;
use app\api\validate\IDMustBePostiveint;
use app\lib\exception\ProductException;
use think\Controller;
use app\api\model\Product as ProductModel;

class Product extends Controller
{
    public function getRecent($count=15){
        (new CountValidate())->goCheck();
        $products = ProductModel::getMostRecent($count);
        if($products->isEmpty()){
            throw new ProductException();
        }
        $products->hidden(['summary']);
        return json($products);
    }
    //获取所有分类
    public function getAllInCategory($id)
    {
        (new IDMustBePostiveint())->goCheck();
        $products = ProductModel::getProductsByCategoryID($id);
        if($products->isEmpty()){
            throw new ProductException();
        }
        $products->hidden(['summary','category_id']);
        return json($products);
    }
    //获取指定分类信息
    public function getOne($id){
        (new IDMustBePostiveint())->goCheck();
        $product = ProductModel::getProductDetail($id);
        if(!$product){
            throw new ProductException();
        }
        return $product;
    }
    public function deleteOne($id){

    }
}