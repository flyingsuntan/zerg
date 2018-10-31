<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/31
 * Time: 9:29
 */

namespace app\api\service;

use app\api\model\Product;
use app\lib\enum\OrderStatusEnum;
use think\Db;
use think\Exception;
use think\Loader;
use think\Log;
use app\api\model\Order as OrderModel;
use app\api\service\Order as OrderService;
Loader::import('WxPay.WxPay',EXTEND_PATH,'.Api.php');
class WxNotify extends \WxPayNotify
{
    //回调函数处理
    public function NotifyProcess($objData, $config, &$msg)
    {
        if($objData['result_code'] == 'SUCCESS'){
            $orderNo = $objData['out_trade_no'];
            Db::startTrans();
            try{
                $order = OrderModel::where('order_no','=',$orderNo)->find();
                if($order->status == 1){
                    $service = new OrderService();
                    $stockStatus = $service->checkOrderStock($order->id);
                    if($stockStatus['pass']){
                        $this->updateOrderStatus($order->id,true);
                        $this->reduceStock($stockStatus);
                    }else{
                        $this->updateOrderStatus($order->id,false);
                    }
                }
                Db::commit();
                return true;
            }catch (Exception $ex){
                Db::rollback();
                Log::error($ex);
                return false;
            }
        }else{
            return true;
        }

    }
    //减库存
    private function reduceStock($stockStatus){
        foreach ($stockStatus['pStatusArray'] as $singlePstatus){
            Product::where('id','=',$singlePstatus['id'])->setDec('stock',$singlePstatus['count']);
        }
    }
    //更新订单数据库
    private function updateOrderStatus($orderID,$success){
        $status = $success ? OrderStatusEnum::PAID : OrderStatusEnum::PAID_BUT_OUT_OF;
        OrderModel::where('id','=',$orderID)->update(['status'=>$status]);
    }
}