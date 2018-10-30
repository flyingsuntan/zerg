<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/17
 * Time: 9:59
 */

namespace app\api\validate;


use app\lib\exception\BaseException;
use app\lib\exception\ParaneterException;
use think\Exception;
use think\Request;
use think\Validate;

class BaseValidate extends Validate
{
    public function goCheck(){
        //获取http传入的参数
        $request = Request::instance();
        $parans = $request->param();
        $result = $this->batch()->check($parans);
        if(!$result){
            $e = new ParaneterException([
                'msg'=> $this->error,

            ]);
            throw $e;
        }else{
            return true;
        }
        //对这些参数做校验
    }
    protected function isPositiveInteger($value,$rule='',$data='',$field=''){
        if(is_numeric($value) && is_int($value + 0) && ($value + 0) > 0){
            return true;
        }else{
            return false;
        }
    }

    protected function isNotEmpty($value,$rule='',$data='',$field=''){
        if(empty($value)){
            return false;
        }else{
            return true;
        }
    }
    public function isMobile($value,$rule='',$data='',$field=''){
        if(preg_match("/^1[345678]{1}\d{9}$/",$value)){
            return true;
        }else{
            return false;
        }
    }
    public function getDataByRule($arrays){
        if(array_key_exists('user_id',$arrays) | array_key_exists('uid',$arrays)){
            //不允许包含user_id或者uid，防止恶意覆盖user_id外键
            throw new ParaneterException([
                'msg' => '参数中包含非法的参数名user_id或者uid'
            ]);
        }
        $newArray = [];
        foreach ($this->rule as $key => $value){
            $newArray[$key] = $arrays[$key];
        }
        return $newArray;
    }
}
