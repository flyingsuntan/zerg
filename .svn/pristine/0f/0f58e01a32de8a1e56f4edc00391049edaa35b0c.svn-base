<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/18
 * Time: 14:05
 */

namespace app\api\validate;
use app\api\validate\IDMustBePostiveint;


class IDCollection extends BaseValidate
{
    protected $rule = [
        'ids' => 'require|checkIDs'
    ];
    protected $message = [
        'ids' => 'ids参数必须是以逗号分隔的多个正整数'
    ];
    protected function checkIDs($value){
        $values = explode(',',$value);
        if(empty($values)){
            return false;
        }
        foreach ($values as $id){
            //echo $id;die;
            if(!$this->isPositiveInteger($id)){
                return false;
            }
        }
        return true;
    }
}