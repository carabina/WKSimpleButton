# WKSimpleButton
创建一个简单的自定义按钮

使用`Pod`导入

`pod 'WKSimpleButton' , :git=> 'https://github.com/OComme/WKSimpleButton'`

# 一 按钮相关设置

## 基本设置
```
#pragma mark-base set 基本设置
/**
 文本对齐方式
 */
@property (nonatomic,assign) NSTextAlignment textAlignment;

/**
 视图对齐方式
 */
@property (nonatomic,assign) UIStackViewAlignment alignment;

/**
 内容模式
 */
@property (nonatomic,assign) UIViewContentMode contentMode;

/**
 间隔
 */
@property (nonatomic,assign) CGFloat spacing;
```

## 状态设置

```
#pragma mark-stateModel set状态模型设置

/**
 设置状态模型

 @param stateModel 状态模型
 @param state 状态
 */
- (void)setStateModel:(nullable WKSimpleButtonStateModel *)stateModel forState:(UIControlState)state;

/**
 设置标题

 @param title 标题
 @param state 状态
 */
- (void)setTitle:(nullable NSString *)title forState:(UIControlState)state;

/**
 设置富文本内容

 @param attributedTitle 富文本
 @param state 状态
 */
- (void)setAttributedTitle:(nullable NSAttributedString *)attributedTitle forState:(UIControlState)state;

/**
 设置文本字体大小

 @param font 字体大小
 @param state 状态
 */
- (void)setTitleFont:(nullable UIFont *)font forState:(UIControlState)state;


/**
 设置标题颜色

 @param color 颜色
 @param state 状态
 */
- (void)setTitleColor:(nullable UIColor *)color forState:(UIControlState)state;

/**
 设置图标

 @param image 图标
 @param state 状态
 */
- (void)setImage:(nullable UIImage *)image forState:(UIControlState)state;

/**
 设置背景图

 @param backgroundimage 背景图
 @param state 状态
 */
- (void)setBackgroundImage:(nullable UIImage *)backgroundimage forState:(UIControlState)state;

/**
 设置按钮样式

 @param buttonType 按钮样式
 @param state 状态
 */
- (void)setButtonType:(WKSimpleButtonType)buttonType forState:(UIControlState)state;
```


# 二 数据模型设置

```
typedef NS_ENUM(NSInteger,WKSimpleButtonType){
    //初始状态
    WKSimpleButtonTypeTextNone         = 0,
    //文字在图片上
    WKSimpleButtonTypeTextAboveImage   = 1,
    //文字在图片下
    WKSimpleButtonTypeTextBelowImage   = 1 << 1,
    //文字在图片前
    WKSimpleButtonTypeTextBeforeImage  = 1 << 2,
    //文字在图片后
    WKSimpleButtonTypeTextBehindImage  = 1 << 3,
};

/**
 按钮样式
 */
@property (nonatomic,assign) WKSimpleButtonType buttonType;

/**
 字体大小
 */
@property (nonnull,nonatomic,strong) UIFont *font;

/**
 文本颜色
 */
@property (nonnull,nonatomic,strong) UIColor *textColor;

/**
 文本内容
 */
@property (nonnull,nonatomic,copy) NSString *text;

/**
 富文本内容
 */
@property (nonnull,nonatomic,strong) NSAttributedString *attributedTitle;

/**
 图片
 */
@property (nonnull,nonatomic,strong) UIImage *image;

/**
 背景图片
 */
@property (nonnull,nonatomic,strong) UIImage *backGroundImage;

/**
 基于某一模型对现有模型进行优化

 @param baseModel 参考模型
 */
- (void)dealNullWithBaseStateModel:(WKSimpleButtonStateModel*_Nonnull)baseModel;

```
