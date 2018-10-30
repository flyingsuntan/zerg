<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/23
 * Time: 11:24
 */

namespace app\api\model;


class ProductImage extends BaseModel
{
    protected $hidden = ['img_id','delete_time','update_time','create_time','product_id'];
    public function imgUrl()
    {
        return $this->belongsTo('Image','img_id','id');
    }
}