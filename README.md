# WKSimpleButton
创建一个简单的自定义按钮

如果你想要使用`Pod`将`<WKSimpleButton>`导入你的项目

`pod 'WKSimpleButton' , :git=> 'https://github.com/OComme/WKSimpleButton'`

```
    ├── <WKSimpleButton>             按钮的主要UI部分
    └── <WKSimpleButtonStateModel>   按钮的状态模型
```

`<WKSimpleButton>`是我在感觉历次项目中的图片加文字的UI很常见。然而UI的按钮在处理多数情况时，需要处理的内容比较多，而市面上见到的封装按钮多数为新人之作，找到比较出名的`<LGButton>`又是使用`Swift`来构建的。

基于此，便开始了`<WKSimpleButton>`。

对于`<WKSimpleButton>`，我们使用`alloc、init、new...`登最基本的方式创建即可

设置属性的方式也和`UIButton`如出一辙

```
- (void)setValue:(nullable NSValue *)value forState:(UIControlState)state;
```

其余的特殊的属性的设置

```
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

创建好按钮，内部已经被`Self Sizing`撑开

只需设置好按钮的位置即可
