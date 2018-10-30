<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/24
 * Time: 11:44
 */

namespace app\api\validate;


use app\lib\exception\ParaneterException;
use think\Route;

class OrderPlace extends BaseValidate
{
    protected $rule = [
        'products' =>'checkProducts',
    ];
    protected $singleRule = [
        'product_id' =>'require|isPositiveInteger',
        'count' =>'require|isPositiveInteger'
    ];

    protected function checkProducts($values){
        if(!is_array($values)){
            throw new ParaneterException(['msg'=>'商品参数不正确']);
        }
        if(empty($values)){
            throw new ParaneterException(['msg'=>'商品列表不能为空']);
        }
        foreach ($values as $k => $v){
            $this->checkProduct($v);
        }
        return true;
    }
    protected function checkProduct($value){
        $validate = new BaseValidate($this->singleRule);
        $result = $validate->check($value);
        if(!$result){
            throw new ParaneterException([
                'msg'=>'商品列表参数错误'
            ]);
        }
    }
}