<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/17
 * Time: 16:44
 */

namespace app\api\model;


use think\Model;

class BannerItem extends BaseModel
{
    protected $visible = ['img','key_word'];
    public function img(){
        return $this->belongsTo('Image','img_id','id');
    }
}