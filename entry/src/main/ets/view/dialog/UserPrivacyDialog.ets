
import ColorConstants from '../../common/constant/ColorConstants';
import { CommonConstants } from '../../common/constant/CommonConstants';
/**
 * 用户授权弹窗
 */
@CustomDialog
export default struct UserPrivacyDialog{
  controller: CustomDialogController = new CustomDialogController({builder:''})
  //取消方法
  cancel: Function = ()=>{};
  //确认方法
  confirm: Function = ()=>{};
  build(){
    Column(){
      Text('请在"健康生活"权限管理中开启"XX"权限')
        .descText()
      Text('该功能支持XX...(功能介绍)')
        .descText()
        .opacity(0.6)
      Row(){
        Button("取消")
          .backgroundColor(Color.White)
          .fontColor(ColorConstants.blueColor)
          .onClick(()=>{
            this.controller.close()
            this.cancel()
          })
        Divider()
          .vertical(true)
          .height(22)
          .opacity(0.4)
        Button("确认")
          .backgroundColor(Color.White)
          .fontColor(ColorConstants.blueColor)
          .onClick(()=>{
            this.controller.close()
            this.confirm()
          })
      }
      .width(CommonConstants.FULL_WIDTH)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({top:22})
    }
    .padding(16)
  }
}


@Extend(Text) function descText(){
  .fontSize(14)
  .fontWeight(CommonConstants.FONT_WEIGHT_400)
  .width(CommonConstants.FULL_WIDTH)
  .lineHeight(20)
  .fontColor('#999')
  .margin({top:8})
}
