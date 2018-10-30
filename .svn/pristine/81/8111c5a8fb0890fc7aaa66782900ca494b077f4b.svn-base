<?php

namespace app\api\Controller\v1;

use app\api\validate\IDCollection;
use app\api\validate\IDMustBePostiveint;
use app\lib\exception\ThemeException;
use think\Controller;
use app\api\model\Theme as ThemeModel;
use think\response\Json;

class Theme extends Controller
{
    /**
     * @url /theme?ids=id1,id2,id3
     * @return 一组theme模型
     **/
    public function getSimpleList($ids=''){
        (new IDCollection())->goCheck();
        $ids = explode(',',$ids);
        $result = ThemeModel::with('topicImg,headImg')->select($ids);
        if(!$result){
            throw new ThemeException();
        }
        return Json($result);
    }
    /**
     * @url /theme/:id
     **/
    public function getComplexOne($id){
        (new IDMustBePostiveint())->goCheck();
        $result = ThemeModel::getThemeWithProducts($id);
        if(!$result){
            throw new ThemeException();
        }
        return json($result);

    }
}
