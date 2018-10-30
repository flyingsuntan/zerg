<?php

namespace app\api\model;

class Image extends BaseModel
{
    protected $visible = ['id','url'];
    //
    public function getUrlAttr($value,$data){
        return $this->prefixImgUrl($value,$data);
    }
}
