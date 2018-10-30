<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 14:39
 */

namespace app\api\model;


use think\Db;

class User extends BaseModel
{
    //public $openid ;
    public static function getByOpenID($openid){
        $user = self::where('openid','=',$openid)->find();
        return $user;
    }
    public function address(){
        return $this->hasOne('UserAddress','user_id','id');

    }
}