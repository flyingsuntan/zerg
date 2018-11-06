import { Config } from 'config.js';

class Base {
  constructor() {
    this.baseRestUrl = Config.restUrl;
    //console.log(Config.restUrl);
  }
  request(params) {
    var url = this.baseRestUrl + params.url;
    //console.log(url);
    if (!params.method) {
      params.type = 'GET';
    }
    wx.request({
      url: url,
      data: params.data,
      method: params.type,
      header: {
        'content-type': 'application/json',
        'token': wx.getStorageInfoSync('token')
      },
      success: function (res) {

        //console.log(res.data);
        params.sCallback && params.sCallback(res.data);

      },
      fail: function (err) {
        console.log(err);
      }
    })
  }
  /*获得元素上的绑定的值*/
  getDataSet(event,key){
    return event.currentTarget.dataset[key];
  }
}
export { Base };