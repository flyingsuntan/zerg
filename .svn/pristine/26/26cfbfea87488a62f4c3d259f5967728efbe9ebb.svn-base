<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/29
 * Time: 11:06
 */

namespace app\api\Controller\v1;


use app\api\service\WxNotify;
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
        //1.检查库存量
        //2.更新这个订单的status状态
        //3.减库存
        //4.若果成功处理，我们返回微信成功处理的消息，否则，我们需要返回没有成功的处理

        //特点：POST   xml格式   不会携带参数？号后的查询参数
        $notify = new WxNotify();
        $notify->Handle();
    }
}