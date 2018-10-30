<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/29
 * Time: 11:22
 */

namespace app\api\service;


use app\lib\enum\OrderStatusEnum;
use app\lib\exception\OrderException;
use app\lib\exception\TokenException;
use \app\api\model\Order as OrderModel;
use think\Exception;
use think\Loader;
use think\Log;

//extend/WxPay/WxPay.Api.php
Loader::import('WxPay.WxPay',EXTEND_PATH,'.Api.php');

class Pay
{
    private $orderID;
    private $orderNO;

    function __construct($orderID)
    {
        if(!$orderID){
            throw new Exception('订单号不允许为NULL');
        }
        $this->orderID = $orderID;
    }
    //订单支付
    public function pay(){
         //订单号可能根本不存在
        //订单号确实是存在的，但是，订单号和当前用户是不匹配的
        //订单有可能已经被支付过
        //进行库存量检测
        $this->checkOrderValid();
        $orderService = new \app\api\service\Order();
        $staus = $orderService->checkOrderStock($this->orderID);
        if(!$staus['pass']){
            return $staus;
        }
        return $this->makeWxPreOrer($staus['orderPrice']);

    }
    //做微信的预订单
    private function makeWxPreOrer($totalPrice){
        //openid
        $openid = Token::getCurrentTokenVar('openid');
        if(!$openid){
            throw new TokenException();
        }
        $wxOrderDate = new \WxPayUnifiedOrder();
        $wxOrderDate->SetOut_trade_no($this->orderNO);
        $wxOrderDate->SetTrade_type('JSAPI');
        $wxOrderDate->SetTotal_fee($totalPrice * 100);
        $wxOrderDate->SetBody('零食商贩');
        $wxOrderDate->SetOpenid($openid);
        $wxOrderDate->SetNotify_url('http://qq.com');
        $wxOrderDate->SetMch_id('1900009851');
        return $this->getPaySignature($wxOrderDate);

    }
    private function getPaySignature($wxOrderDate){
        $wxOrder = \WxPayApi::unifiedOrder($wxOrderDate);
        if($wxOrder['return_code'] != 'SUCCESS' ||
            $wxOrder['result_code'] != 'SUCCESS'){
            Log::record($wxOrder,'error');
            Log::record('获取预支付订单失败','error');
        }
        //prepay_id
        $this->recordPreOrder($wxOrder);
        $signature = $this->sign($wxOrder);
        return $signature;
    }
    //生成支付签名
    private function sign($wxOrder){
        $jsApiPayData = new \WxPayJsApiPay();
        $jsApiPayData->SetAppid(config('wx.app_id'));
        $jsApiPayData->SetTimeStamp((string)time());

        $rand = md5(time().mt_rand(0,1000));
        $jsApiPayData->SetNonceStr($rand);

        $jsApiPayData->SetPackage('prepay_id='.$wxOrder['prepay_id']);
        $jsApiPayData->SetSignType('md5');

        $sign = $jsApiPayData->MakeSign();
        $rawValues = $jsApiPayData->GetValues();
        $rawValues['paySign'] = $sign;
        unset($rawValues['appId']);
        return $rawValues;
    }
    //保存prepay_id
    private function recordPreOrder($wxOrder){
         OrderModel::where('id','=',$this->orderID)
         ->update(['prepay_id'=>$wxOrder['prepay_id']]);
    }
    //对订单号业务上的验证
    private function checkOrderValid(){
         $order = \app\api\model\Order::where('id','=',$this->orderID)->find();
         if(!$order){
             throw new OrderException();
         }
         if(!Token::isValidOperate($order->user_id)){
             throw new TokenException([
                 'msg' => '订单与用户不匹配',
                 'errorCode' => 10003,
             ]);
         }
         if($order->status != OrderStatusEnum::UNPAID){
             throw new OrderException([
                 'msg' => '订单已支付！',
                 'errorCode' => 80003,
                 'code' => 400
             ]);
         }
         $this->orderNO = $order->order_no;
         return true;
    }
}