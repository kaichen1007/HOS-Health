
export default class ItemBean{
  img:Resource
  name:string
  num:number

  constructor(img: Resource, name: string, num: number) {
    this.img = img;
    this.name = name;
    this.num = num;
  }
}