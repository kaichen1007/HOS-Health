import common from '@ohos.app.ability.common';
import data_preferences from '@ohos.data.preferences';
import router from '@ohos.router';
import ColorConstants from '../common/constant/ColorConstants';
import { CommonConstants } from '../common/constant/CommonConstants';
import Logger from '../common/Logger';
import { SplashPage } from './SplashPage';
/**
 * 广告页
 */
@Entry
@Component
struct AdvertisingPage {
  //延迟五秒
  @State duration: number = 2;
  //定时器 id
  private intervalId: number = -1;

  /**
   * 跳转 主体页面
   */
  goToMainPage() {
    Logger.info('广告页', '跳转主页面')
    //清除定时器
    clearInterval(this.intervalId)
    router.replaceUrl({ url: "pages/MainPage" })
  }

  aboutToAppear() {
    //设置定时器 循环时间为1秒 每一秒则调用逻辑
    this.intervalId = setInterval(() => {
      if (this.duration > 0) {
        this.duration -= 1;
      } else {
        this.goToMainPage()
      }
    }, 1000)
  }

  build() {
    Column() {
      Row() {
        Text('跳过广告 ' + this.duration + 's')
          .fontColor(Color.White)
          .fontSize(18)
          .borderRadius(12)
          .letterSpacing(0.1)
          .height(36)
          .backgroundColor('rgba(0,0,0,0.20)')
          .border({ color: Color.White, width: 1 })
          .margin({ top: 32 })
          .padding(8)
          .onClick(()=>this.goToMainPage())
      }
      .width("90%")
      .justifyContent(FlexAlign.End)

      Row(){
        Image($r('app.media.logo'))
          .width(56)
          .height(56)
          .objectFit(ImageFit.Contain)
        Column({space:4}){
          Text("健康生活")
            .fontSize(26)
            .fontWeight(700)
            .fontColor(ColorConstants.titleColor)
            .letterSpacing(0.1)
          Text("运动总有新玩法")
            .letterSpacing(3.6)
            .fontSize(16)
            .fontColor(ColorConstants.titleColor)
            .fontWeight(400)
            .opacity(0.4)
        }
        .alignItems(HorizontalAlign.Start)
        .margin({left:12})
      }
      .width(CommonConstants.FULL_WIDTH)
      .height(100)
      .justifyContent(FlexAlign.Center)
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundImage($r('app.media.ic_ad_bg'))
    .backgroundImagePosition({ x: 0, y: 0 })
    .backgroundImageSize({ width: '100%', height: '100%' })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}