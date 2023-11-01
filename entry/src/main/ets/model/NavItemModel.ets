

/**
 * tab 导航
 */
export interface NavItem{
  /**
   * 图标
   */
  icon:Resource;
  /**
   * 选中图标
   */
  iconSelected:Resource;
  /**
   * 标题
   */
  text:string;
  /**
   * id
   */
  id:number;
}

export enum TabId{
  HOME,
  ACHIEVEMENT,
  MINE
}


export const NavList: NavItem[] = [
  {
    icon: $r('app.media.ic_tabs_home_normal'),
    iconSelected: $r('app.media.ic_tabs_home_sel'),
    text:"首页",
    id:TabId.HOME
  },
  {
    icon: $r('app.media.ic_tabs_achievement_normal'),
    iconSelected: $r('app.media.ic_tabs_achievement_sel'),
    text:"成就",
    id:TabId.ACHIEVEMENT
  },
  {
    icon: $r('app.media.ic_tabs_mine_normal'),
    iconSelected: $r('app.media.ic_tabs_mine_sel'),
    text:"我的",
    id:TabId.MINE
  }

]