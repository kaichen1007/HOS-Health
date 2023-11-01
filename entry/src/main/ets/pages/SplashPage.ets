
import common from '@ohos.app.ability.common'
import data_preferences from '@ohos.data.preferences';
import data from '@ohos.telephony.data';
import router from '@ohos.router';
import Logger from '../common/Logger';
import { CommonConstants } from '../common/constant/CommonConstants';
import UserPrivacyDialog from '../view/dialog/UserPrivacyDialog';
import thermal from '@ohos.thermal';
import ColorConstants from '../common/constant/ColorConstants';

//Preferences实例的名称。
const H_STORE: string = 'healthAppStore';
//用户首选项   用户隐私 存储key
const IS_PRIVACY: string = 'isPrivacy';

/**
 * 启动页 需要弹窗让用户确认是否 需要记录数据
 * 做持久化操作
 */
@Entry
@Component
export struct SplashPage{
  context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  //创建 授权弹窗
  dialogController: CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog(
      {
        //传递 关闭与提交方法
        cancel: ()=>{ this.exitApp()},
        confirm: ()=>{this.onConfirm()}
      }
    ),
    cancel:()=>{this.exitApp()},
    autoCancel:false,
    //底部
    alignment:DialogAlignment.Bottom,
    offset:{dx:0,dy:-24}
  })

  /**
   * 停止 app
   */
  exitApp(){
    this.context.terminateSelf();
  }

  /**
   * 页面初始化操作
   * 查看当前用户是否 允许数据存储
   */
  aboutToAppear(){
    //获取实例
    let preferences = data_preferences.getPreferences(this.context,H_STORE);
    preferences.then((res)=>{
      //获取数据  默认为false
      res.get(IS_PRIVACY,false).then((isPrivate)=>{
        Logger.info('获取用户首选项','隐私相关'+isPrivate)
        if (isPrivate == true) {
          //已授权 直接跳转
          this.jumpAdvertisingPage()
        }else {
          //未获取 打开弹窗
          this.dialogController.open()
        }
      })
    })
  }

  aboutToDisappear(){
    clearTimeout()
  }

  /**
   * 确认 事件
   * 确认后 跳转至广告页面
   */
  onConfirm(){
    //用户首选项为应用提供Key-Value键值型的数据处理能力，支持应用持久化轻量级数据，并对其修改和查询。
    let preferences = data_preferences.getPreferences(this.context,H_STORE);
    //回调
    preferences.then((res)=>{
      //向用户首选项存储 确认
      res.put(IS_PRIVACY,true).then(()=>{
        //刷新
        res.flush();
        Logger.info('启动页','用户同意数据权限');
      }).catch((err: Error)=>{
        Logger.error('启动页','用户同意数据权限异常:' + err)
      });
    })
    this.jumpAdvertisingPage();
  }

  /**
   * 跳转至 广告页
   */
  jumpAdvertisingPage(){
    setTimeout(()=>{
      router.replaceUrl({url:'pages/AdvertisingPage'})
    },CommonConstants.LAUNCHER_DELAY_TIME)//延迟两秒

  }

  build(){
    Column(){
      Button("清除首选项")
        .onClick(()=>{
          let preferences = data_preferences.getPreferences(this.context,H_STORE);
          //回调
          preferences.then((res)=>{
            res.delete(IS_PRIVACY)
            res.flush()
          })
        })
      Button("开启弹窗")
        .onClick(()=>{
          this.dialogController.open();
        })
      Column(){
        Image($r('app.media.logo'))
          .width(120)
          .margin({top:120})
        Text("健康生活")
          .fontFamily("HarmonyHeiTi-Bold")
          .fontSize(22)
          .fontWeight(600)
          .fontColor(ColorConstants.titleColor)
          .margin({top:20,bottom:8})
          //字符间距
          .letterSpacing(0.1)
        Text("运动总有新玩法")
          .fontSize(16)
          .fontFamily("HarmonyHeiTi")
          .fontColor(ColorConstants.titleColor)
          .letterSpacing(3.4)
          .fontWeight(CommonConstants.FONT_WEIGHT_400)
          .opacity(0.6)
      }
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundImage($r('app.media.ic_splash_bg'))
    .backgroundImagePosition({x:0,y:0})
    .backgroundImageSize({width:"100%",height:"100%"})
  }
}