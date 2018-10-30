<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/29
 * Time: 11:06
 */

namespace app\api\Controller\v1;


use app\api\validate\IDMustBePostiveint;

class Pay extends BaseController
{
    protected $beforeActionList = [
        'checkexclusivescope' =>  ['only'=>'placeorder'],
    ];
    public function getPreOrder($id=''){
        (new IDMustBePostiveint())->goCheck();
        $pay = new \app\api\service\Pay($id);
        return $pay->pay();
    }
    public function receiveNotify(){
        //通知频率为15/15/30/180/1800/1800/1800/1800/3600, 单位：秒

    }
}