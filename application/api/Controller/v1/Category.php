<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 11:13
 */

namespace app\api\Controller\v1;


use app\lib\exception\CategoryException;
use think\Controller;
use app\api\model\Category as categoryModel;

class Category extends Controller
{
    public function getAllCategories(){
        $categories = categoryModel::all([],'img');
        if($categories->isEmpty()){
            throw new CategoryException();
        }
        return $categories;
    }

}