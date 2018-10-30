<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/24
 * Time: 11:27
 */

namespace app\api\Controller\v1;
use app\api\service\Token as TokenService;

use think\Controller;

class BaseController extends Controller
{
    //需要用户和CMS调用的接口
    protected function checkPrimaryScope(){
        TokenService::needPrimaryScope();
    }
    //只能用户调用接口验证
    protected function checkExclusiveScope(){
        TokenService::needExclusiveScope();
    }
}