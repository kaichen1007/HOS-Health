
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
  context: common.UIAbilityContext = getContext(SplashPage) as common.UIAbilityContext;
  @State message: string = '广告页'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("清除")
          .onClick(()=>{
            let preferences = data_preferences.getPreferences(this.context,"healthAppStore");
            preferences.then((res)=>{
              res.delete("isPrivacy").then(()=>{
                setTimeout(()=>{
                  router.replaceUrl({url:"pages/SplashPage"})
                },1000)
              })
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}