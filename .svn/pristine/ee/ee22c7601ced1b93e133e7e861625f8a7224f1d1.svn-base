<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/18
 * Time: 11:48
 */

namespace app\api\model;
use app\api\model\Product as ProductModel;
use app\api\validate\IDMustBePostiveint;

class Product extends BaseModel
{

    protected $hidden = ['delete_time','from','create_time','update_time','pivot'];
    public function getMainImgUrlAttr($value,$data){
        return $this->prefixImgUrl($value,$data);
    }
    public function imgs(){
        return $this->hasMany('ProductImage','product_id','id');
    }
    public function properties(){
        return $this->hasMany('productProperty','product_id','id');
    }
    public static function getMostRecent($count){
        $products = self::limit($count)->order('create_time desc')->select();
        return $products;
    }

    public static function getProductsByCategoryID($categoryID){
        $products = self::where('category_id',$categoryID)->select();
        return $products;
    }
    public static function getProductDetail($id){

        $products = self::with([
            'imgs'=>function($query){
                $query->with(['imgUrl'])
                ->order('order','asc');
            }
        ])->with(['properties'])->find($id);

        return $products;
    }

}