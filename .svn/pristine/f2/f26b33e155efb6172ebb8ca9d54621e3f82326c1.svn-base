<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 11:13
 */

namespace app\api\model;


class Category extends BaseModel
{
    protected $hidden = ['delete_time','create_time','update_time'];
    public function Img(){
        return $this->belongsTo('image','topic_img_id','id');
    }

}