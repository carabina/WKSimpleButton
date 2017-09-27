//
//  WKSimpleButton.m
//  WKSimpleButtonDemo
//
//  Created by admin on 2017/8/17.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "WKSimpleButton.h"
#import "Masonry.h"
#import "ReactiveObjC.h"

@interface WKSimpleButton ()

/**
 可见的视图(用于约束)
 */
@property (nonnull,nonatomic,strong) UIStackView *visiableView;

/**
 文本标签
 */
@property (nonnull,nonatomic,strong) UILabel *label_msg;

/**
 图标
 */
@property (nonnull,nonatomic,strong) UIImageView *imageView_icon;

/**
 背景图片
 */
@property (nonnull,nonatomic,strong) UIImageView *imageView_back;

/**
 按钮样式
 */
@property (nonatomic,assign) WKSimpleButtonType buttonType;

#pragma mark-stateModel

/**
 普通状态
 */
@property (nonnull,nonatomic,strong) WKSimpleButtonStateModel *stateModel_normal;

/**
 选择状态
 */
@property (nonnull,nonatomic,strong) WKSimpleButtonStateModel *stateModel_selected;

/**
 高亮状态
 */
@property (nonnull,nonatomic,strong) WKSimpleButtonStateModel *stateModel_highlighted;

/**
 禁止状态
 */
@property (nonnull,nonatomic,strong) WKSimpleButtonStateModel *stateModel_disable;

@end
@implementation WKSimpleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commInit];
    }
    return self;
}

- (void)commInit
{
    self.textAlignment = NSTextAlignmentCenter;
    self.alignment = UIStackViewAlignmentCenter;
    self.contentMode = UIViewContentModeScaleToFill;
    
    [self theSubViewAdd];
    [self theLayoutSet];
    [self theInteractionEvents];
}

- (void)theSubViewAdd
{
    [self theBackGroundImageViewAdd];
    [self theVisiableViewAdd];
    [self theLabelMessageAdd];
    [self theImageViewIconAdd];
}

- (void)theLayoutSet
{
    [self.imageView_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.visiableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)theInteractionEvents
{
    RAC(self.visiableView,alignment)    = RACObserve(self, alignment);
    RAC(self.visiableView,spacing)      = RACObserve(self,spacing);
    
    RAC(self.label_msg,textAlignment)   = RACObserve(self, textAlignment);
    RAC(self.imageView_back,contentMode)= RACObserve(self, contentMode);
    
    @weakify(self);
    [[RACSignal combineLatest:@[RACObserve(self, selected),RACObserve(self, highlighted)]]subscribeNext:^(RACTuple * _Nullable x) {
        @strongify(self);
        [self currentControlStateChanged];
    }];
}

#pragma mark-subView
- (void)theBackGroundImageViewAdd
{
    _imageView_back = [UIImageView new];
    [self addSubview:_imageView_back];
}

- (void)theVisiableViewAdd
{
    _visiableView = [UIStackView new];
    _visiableView.userInteractionEnabled = NO;
    [self addSubview:_visiableView];
}

- (void)theLabelMessageAdd
{
    _label_msg = [UILabel new];
    [self.visiableView addArrangedSubview:_label_msg];
}

- (void)theImageViewIconAdd
{
    _imageView_icon = [UIImageView new];
    [self.visiableView addArrangedSubview:_imageView_icon];
    //    _imageView_icon.userInteractionEnabled = YES;
    
}


#pragma mark-interfaceEvent
- (void)currentControlStateChanged
{
    WKSimpleButtonStateModel *stateModel = [self stateModelForState:self.state];
    if (stateModel != self.stateModel_normal) {
        [stateModel dealNullWithBaseStateModel:self.stateModel_normal];
    }
    
    if (stateModel.attributedTitle) {
        self.label_msg.attributedText = stateModel.attributedTitle;
    }else if (stateModel.text){
        self.label_msg.text = stateModel.text;
    }
    self.label_msg.textColor = stateModel.textColor;
    self.label_msg.font = stateModel.font;
    
    self.imageView_icon.image = stateModel.image;
    self.imageView_back.image = stateModel.backGroundImage;
    self.buttonType = stateModel.buttonType;
}

#pragma mark-setter
- (void)setButtonType:(WKSimpleButtonType)buttonType
{
    if (_buttonType == buttonType) {
        return;
    }
    _buttonType = buttonType;
    if (buttonType == WKSimpleButtonTypeTextNone) {
        return;
    }
    
    BOOL Vertical = (self.buttonType == WKSimpleButtonTypeTextAboveImage||self.buttonType == WKSimpleButtonTypeTextBelowImage);
    BOOL Horizontal = (self.buttonType == WKSimpleButtonTypeTextBeforeImage||self.buttonType == WKSimpleButtonTypeTextBehindImage);
    
    BOOL textLeading = (self.buttonType == WKSimpleButtonTypeTextAboveImage||self.buttonType == WKSimpleButtonTypeTextBeforeImage);
    BOOL textTrailing = (self.buttonType == WKSimpleButtonTypeTextBelowImage||self.buttonType == WKSimpleButtonTypeTextBehindImage);
    
    if (Vertical) {
        self.visiableView.axis = UILayoutConstraintAxisVertical;
    }else
        if (Horizontal){
        self.visiableView.axis = UILayoutConstraintAxisHorizontal;
    }else{
        return ;
    }
    
    if (textLeading) {
        [self.visiableView insertArrangedSubview:self.label_msg atIndex:0];
    }else if (textTrailing){
        [self.visiableView insertArrangedSubview:self.imageView_icon atIndex:0];
    }
}

#pragma mark-stateModel data
- (void)setStateModel:(WKSimpleButtonStateModel *)stateModel forState:(UIControlState)state
{
    switch (state) {
        case UIControlStateSelected:
            _stateModel_selected = stateModel;
            break;
        case UIControlStateHighlighted:
            _stateModel_highlighted = stateModel;
            break;
        case UIControlStateDisabled:
            _stateModel_disable = stateModel;
            break;
        default:
            _stateModel_normal = stateModel;
            break;
    }
    
    [self currentControlStateChanged];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    WKSimpleButtonStateModel *model = [self stateModelForState:state];
    model.text = title;
    if (state == self.state) {
        self.label_msg.text = title;
    }
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    WKSimpleButtonStateModel *model = [self stateModelForState:state];
    model.textColor = color;
    if (state == self.state) {
        self.label_msg.textColor = color;
    }
}

- (void)setAttributedTitle:(NSAttributedString *)attributedTitle forState:(UIControlState)state
{
    WKSimpleButtonStateModel *model = [self stateModelForState:state];
    model.attributedTitle = attributedTitle;
    if (state == self.state) {
        self.label_msg.attributedText = attributedTitle;
    }
}

- (void)setTitleFont:(UIFont *)font forState:(UIControlState)state
{
    WKSimpleButtonStateModel *model = [self stateModelForState:state];
    model.font = font;
    if (state == self.state) {
        self.label_msg.font = font;
    }
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    WKSimpleButtonStateModel *model = [self stateModelForState:state];
    model.image = image;
    if (state == self.state) {
        self.imageView_icon.image = image;
    }
}

- (void)setBackgroundImage:(UIImage *)backgroundimage forState:(UIControlState)state
{
    WKSimpleButtonStateModel *model = [self stateModelForState:state];
    model.backGroundImage = backgroundimage;
    if (state == self.state) {
        self.imageView_back.image = backgroundimage;
    }
}

- (void)setButtonType:(WKSimpleButtonType)buttonType forState:(UIControlState)state
{
    WKSimpleButtonStateModel *model = [self stateModelForState:state];
    model.buttonType = buttonType;
    if (state == self.state) {
        self.buttonType = buttonType;
    }
}

- (WKSimpleButtonStateModel*)stateModelForState:(UIControlState)state
{
    WKSimpleButtonStateModel *stateModel = nil;

    switch (state) {
        case UIControlStateSelected:
            stateModel = self.stateModel_selected;
            break;
        case UIControlStateHighlighted:
            stateModel = self.stateModel_highlighted;
            break;
        case UIControlStateDisabled:
            stateModel = self.stateModel_disable;
            break;
        default:
            stateModel = self.stateModel_normal;
            break;
    }
    
    return stateModel;
}

#pragma mark-lazyload
- (WKSimpleButtonStateModel *)stateModel_normal
{
    if (_stateModel_normal == nil) {
        _stateModel_normal = [WKSimpleButtonStateModel new];
    }
    return _stateModel_normal;
}

- (WKSimpleButtonStateModel *)stateModel_selected
{
    if (_stateModel_selected == nil) {
        _stateModel_selected = [WKSimpleButtonStateModel new];
    }
    return _stateModel_selected;
}

- (WKSimpleButtonStateModel *)stateModel_highlighted
{
    if (_stateModel_highlighted == nil) {
        _stateModel_highlighted = [WKSimpleButtonStateModel new];
    }
    return _stateModel_highlighted;
}

- (WKSimpleButtonStateModel *)stateModel_disable
{
    if (_stateModel_disable == nil) {
        _stateModel_disable = [WKSimpleButtonStateModel new];
    }
    return _stateModel_disable;
}


@end
