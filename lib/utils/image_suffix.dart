class ImageSuffix {
  // 大图：图片宽度为 1080
  // 通栏图片、banner图片、详情页图片
  // 焦点图
  static String focus = '?x-oss-process=image/resize,m_fixed,w_1080,h_460';
  // 商品详情焦点图
  static String productFocus =
      '?x-oss-process=image/resize,m_fixed,w_1080,h_1080';
  // 商品详情图片
  static String productInfo = '?x-oss-process=image/resize,m_lfit,w_1080';

  // 大正方形，两列图片
  static String squareM = '?x-oss-process=image/resize,m_fixed,w_450,h_450';
  // 中等正方形，三列图片
  static String squareS = '?x-oss-process=image/resize,m_fixed,w_300,h_300';
  // 小正方形：品牌logo、分类图标
  static String squareXS = '?x-oss-process=image/resize,m_fixed,w_200,h_200';
  // 更小的正方形：5列图片
  static String squareXXS = '?x-oss-process=image/resize,m_fixed,w_120,h_120';

  // 长方形
  // 长方形：品牌详情banner图片
  static String rectangleL = '?x-oss-process=image/resize,m_fixed,w_480,h_360';

  // 广告条
  static String adBar = '?x-oss-process=image/resize,m_fixed,w_750,h_132';
}
