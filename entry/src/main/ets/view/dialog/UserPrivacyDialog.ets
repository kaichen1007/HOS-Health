
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
    Row(){
      Text("弹窗")
      Button("取消")
        .onClick(()=>{
          this.cancel();
        })
      Button("确认")
        .onClick(()=>{
          this.confirm();
        })
    }
  }
}