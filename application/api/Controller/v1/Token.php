<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 14:24
 */

namespace app\api\Controller\v1;

use app\api\service\UserToken;
use app\api\validate\TokenGet;
use app\lib\exception\ParaneterException;
use app\api\service\Token as TokenService;

class Token
{
    public function getToken($code=''){
        (new TokenGet())->goCheck();
        $ut = new UserToken($code);
        $token = $ut->get();
        return json(['token'=>$token]);
    }
    public function verifyToken($token=''){
        echo $token;die;
        if($token){
            throw new ParaneterException([
                'token不允许为空'
            ]);
        }
        $valid = TokenService::verifyToken($token);
        return[
            'isValid' => $valid
        ];
    }
}