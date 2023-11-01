
import router from '@ohos.router'
/**
 * 主页面
 */
@Entry
@Component
struct MainPage {
  @State message: string = '主页面'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button("退后 广告页")
          .onClick(()=>router.replaceUrl({url:"pages/AdvertisingPage"}))
      }
      .width('100%')
    }
    .height('100%')
  }
}