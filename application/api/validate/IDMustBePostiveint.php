<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/17
 * Time: 9:39
 */

namespace app\api\validate;


use think\Validate;

class IDMustBePostiveint extends BaseValidate
{
    protected $rule = [
        'id' => 'require|isPositiveInteger',
    ];
    protected $message = [
        'id' => 'id必须是正整数'
    ];

}