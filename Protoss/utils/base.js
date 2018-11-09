import { Config } from 'config.js';
import {Token} from 'token.js';
var token = new Token();
class Base {
  constructor() {
    this.baseRestUrl = Config.restUrl;
    //console.log(Config.restUrl);
  }
  request(params,noRefetch) {
    var that = this;
    var url = this.baseRestUrl + params.url;
    //console.log(url);
    if (!params.type) {
      params.type = 'GET';
    }
    //console.log(params.data);
    wx.request({
      url: url,
      data: params.data,
      method: params.type,
      header: {
        'content-type': 'application/json',
        'token': wx.getStorageSync('token')
        
      },
      success: function (res) {

        //console.log(res.data);
        var code = res.statusCode.toString();
        var startChar = code.charAt(0);
        if(startChar == '2'){
          params.sCallback && params.sCallback(res.data);
        }
        else{
          if(code == '401'){
            if(!noRefetch){
              that._refetch(params);
            }
          }
          if(noRefetch){
            params.eCallback && params.eCallback(res.data);
          }
        }
        

      },
      fail: function (err) {
        console.log(err);
      }
    })
  }
  _refetch(params){
    token.getTokenFromServer((token)=>{
      this.request(params,true);
    });
  }
  /*获得元素上的绑定的值*/
  getDataSet(event,key){
    return event.currentTarget.dataset[key];
  }
}
export { Base };