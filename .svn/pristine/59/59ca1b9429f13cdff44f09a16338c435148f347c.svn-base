<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/23
 * Time: 14:56
 */

namespace app\api\Controller\v1;


use app\api\validate\AddressValidate;
use app\api\service\Token as TokenService;
use app\api\model\User as UserModel;
use app\lib\exception\SuccessMessge;
use app\lib\exception\UserException;
use app\api\model\UserAddress;


class Address extends BaseController
{
    //TP5前置方法
    protected $beforeActionList = [
        'checkprimaryscope' =>  ['only'=>'createorupdateaddress,getuseraddress'],
    ];

    /**
     * 获取用户地址信息
     * @return UserAddress
     * @throws UserException
     */
    public function getUserAddress(){
        $uid = TokenService::getCurrentUid();
        $userAddress = UserAddress::where('user_id', $uid)
            ->find();
        if(!$userAddress){
            throw new UserException([
                'msg' => '用户地址不存在',
                'errorCode' => 60001
            ]);
        }
        return $userAddress;
    }

    public function createOrUpdateAddress(){
        $validate = new AddressValidate();
        $validate->goCheck();
        //更具token来获取用户的uid
        //根据uid来查找用户数据，判断用户是否存在，如果不存在抛出异常
        //获取用户从客户端提交来的地址信息
        //根据用户地址信息是否存在!从而判断是添加地址还是更新地址
        $uid = TokenService::getCurrentUid();
        $user = UserModel::get($uid);
        //dump($user);
        if(!$user){
            throw new UserException();
        }
        $dataArray = $validate->getDataByRule(input('post.'));
        $userAddress = $user->address;
        //dump($userAddress);die;
        if(!$userAddress){
            $user->address()->save($dataArray);
        }else{
            $user->address->save($dataArray);
        }
        return json(new SuccessMessge(),201);
    }

}