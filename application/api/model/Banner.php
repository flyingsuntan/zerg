<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/17
 * Time: 10:50
 */

namespace app\api\model;


class Banner extends BaseModel
{
    protected $visible = ['id','name','description','items'];
    public function items(){
        return $this->hasMany('BannerItem','banner_id','id');
    }
   public static function getBannerByID($id){
       //TODO:根据Banner ID号 获取Banner信息
       $banner = self::with(['items','items.img'])->find($id);
       return $banner;
   }
}