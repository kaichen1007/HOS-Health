
import common from '@ohos.app.ability.common';
import data_preferences from '@ohos.data.preferences';
import router from '@ohos.router';
import { SplashPage } from './SplashPage';
/**
 * 广告页
 */
@Entry
@Component
struct AdvertisingPage {
  @State message: string = '广告页'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("退回")
          .onClick(()=>{
            setTimeout(()=>{
              router.replaceUrl({url:"pages/SplashPage"})
            },1000)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}