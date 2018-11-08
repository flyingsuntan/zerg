//home.js

import {Home} from 'home-model.js';
var home = new Home();

Page({

  /**
   * 页面的初始数据
   */
  data: {
    
  },

  onLoad:function(){
    this._loadData();
  },

  _loadData:function(){
    var id = 1;
    home.getBannerData(id,(res)=>{
      //数据绑定
      this.setData({
        'bannerArr':res,
      });
    }); 
    home.getThemeData((res)=>{
      //console.log(res);
      this.setData({
        'themeArr':res,
      });
    }); 
    home.getProductsData((data) => {
      this.setData({
        productsArr:data
      });
    });
  },
  
  onProductsItemTap:function(event){
    var id = home.getDataSet(event,'id');
    //console.log(id);
    wx.navigateTo({
      url: '../product/product?id='+id,
    })
  },
  onThemeItemTap: function (event) {
    var id = home.getDataSet(event, 'id');
    var name = home.getDataSet(event,'name')
    //console.log(id);
    wx.navigateTo({
      url: '../theme/theme?id=' + id +'&name='+name,
    })
  },
  
 
    
  
})