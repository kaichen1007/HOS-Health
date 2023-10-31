
import ItemBean from '../common/bean/ItemBean'


export function getData():Array<ItemBean>{
  let list:ItemBean[] = [
    new ItemBean($r("app.media.icon"),"第一个",50),
    new ItemBean($r("app.media.icon"),"第二个",50),
    new ItemBean($r("app.media.icon"),"第三个",50),
    new ItemBean($r("app.media.icon"),"第四个",50),
    new ItemBean($r("app.media.icon"),"第五个",50),
  ]
  return list;
}