
import router from '@ohos.router'
import ColorConstants from '../common/constant/ColorConstants';
import { CommonConstants } from '../common/constant/CommonConstants';
import { NavList, TabId } from '../model/NavItemModel';
import Achievement from '../view/AchievementView';
import Home from '../view/HomeView';
import Mine from '../view/MineView';
/**
 * 主页面
 */
@Entry
@Component
struct MainPage {
  //当前页 默认首页
  @State currentPage: number = 0;
  private tabController : TabsController = new TabsController();



  @Builder TableBuilder(index:number){
    Column(){
      Image(index == this.currentPage ? NavList[index].iconSelected : NavList[index].icon)
        .width(24)
        .height(24)
        .objectFit(ImageFit.Contain)
      Text(NavList[index].text)
        .fontColor(index == this.currentPage ? ColorConstants.blueColor : ColorConstants.tabTitleColor)
        .fontSize(10)
        .fontWeight(500)
        .margin({top:4})
    }
    .justifyContent(FlexAlign.Center)
    .allSize()
  }


  build() {
    Tabs({barPosition:BarPosition.End,controller:this.tabController}){
      TabContent(){
        Home()
          //底线 设置
          .borderWidth({bottom:1})
          .borderColor(ColorConstants.primaryBgColor)
      }
      .tabBar(this.TableBuilder(TabId.HOME))
      // .align(Alignment.Start)

      TabContent(){
        Achievement()
      }
      .tabBar(this.TableBuilder(TabId.ACHIEVEMENT))

      TabContent(){
        Mine()
          .borderWidth({bottom:1})
          .borderColor(ColorConstants.primaryBgColor)
      }
      .tabBar(this.TableBuilder(TabId.MINE))
    }
    //设置为true时可以通过滑动页面进行页面切换，为false时不可滑动切换页面。
    .scrollable(false)
    .allSize()
    .barWidth("94%")
    //平均分布宽度
    .barMode(BarMode.Fixed)
    .vertical(false)
    .onChange((index)=>{
      this.currentPage = index;
    })
  }
}

@Styles function allSize(){
  .width(CommonConstants.FULL_WIDTH)
  .height(CommonConstants.FULL_WIDTH)
}