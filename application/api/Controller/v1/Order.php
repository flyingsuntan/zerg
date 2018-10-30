<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/24
 * Time: 10:23
 */

namespace app\api\Controller\v1;


use app\api\validate\OrderPlace;
use app\api\service\Token as TokenService;
use app\api\service\Order as OrderService;



class Order extends BaseController
{
    //用户在选择商品后，向API提交包含它所选择商品的相关信息
    //API在接收到信息后，需要检查订单相关商品的库存量
    //有库存，把订单数据存入数据库中等同于下单成功了，返回客户端消息，告诉客户端可以支付了
    //调用支付接口,进行支付
    //还需要再次进行库存检测
    //服务器这边就可以调用微信的支付接口进行支付
    //小程序根据服务器返回的结果拉起微信支付
    //微信会返回给我们一个支付结果（异步）
    //成功：也需要进行库存量的检测
    //成功：进行库存量的扣除。
    protected $beforeActionList = [
        'checkexclusivescope' =>  ['only'=>'placeorder'],
    ];
    //下订单接口
    public function placeOrder(){
        (new OrderPlace())->goCheck();
        $products = input('post.products/a');
        $uid = TokenService::getCurrentTokenVar('uid');
        $order = new \app\api\service\Order();
        $status = $order->place($uid,$products);
        return json($status);
    }
}