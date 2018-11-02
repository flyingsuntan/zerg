import { Base } from '../utils/base.js';
class Home extends Base{
  constructor(){
    super();
  }
  //banner
  getBannerData(id,callback){
    var params = {
      url:'banner/'+id,
      sCallback:function(res){
        callback && callback(res.items);
      }
    }
    this.request(params);
    // wx.request({
    //   url: 'http://flyingsuntan.cn:82/api/v1/banner/'+id,
    //   method:'GET',
    //   success:function(res){
    //     //console.log(res);
    //     callBack(res);
    //   }
    // })
  }
  getThemeData(callback) {
    var params = {
      url: 'theme/?ids=1,2,3',
      sCallback: function (res) {
        callback && callback(res);
      }
    }
    this.request(params);
  }
}
export{Home};