<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/16
 * Time: 17:44
 */

namespace app\api\Controller\v1;


use app\api\validate\IDMustBePostiveint;
use app\lib\exception\BannerMissException;
use think\Controller;
use app\api\model\Banner as BannerModel;
use think\Exception;


class Banner extends Controller
{
    /**
     * 获取指定id的banner信息
     * @url  /banner/:id
     * @http GET
     * @id banner的id号
     */
    public function getBanner($id){
        (new IDMustBePostiveint())->goCheck();
        $banner = BannerModel::getBannerByID($id);
        if(!$banner){
            throw new BannerMissException();
        }
        return json($banner);

    }
}