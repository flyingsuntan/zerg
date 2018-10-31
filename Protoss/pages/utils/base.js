import {Config} from 'config.js';

class Base {
  constructor(){
    this.baseRestUrl = Config.restUrl;
    //console.log(Config.restUrl);
  }
  request(params){
    var url = this.baseRestUrl + params.url;
    //console.log(url);
    if(!params.method){
      params.type = 'GET';
    }
    wx.request({
      url: url,
      data:params.data,
      method:params.type,
      header:{
        'content-type':'application/json',
        'token':wx.getStorageInfoSync('token')
      },
      success:function(res){
        // if(params.sCallBack){
        //   params.sCallBack(res);
        // }
        //console.log(params.sCallBack);
        params.sCallBack && params.sCallBack(res.data);
        
      },
      fail:function(err){
        console.log(err);
      }
    })
  }
}
export{Base};