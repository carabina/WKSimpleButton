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
    self.text = @"";
    
    [self theSubViewAdd];
    [self theLayoutSet];
    [self theInteractionEvents];
}

- (void)theSubViewAdd
{
    [self theVisiableViewAdd];
    [self theLabelMessageAdd];
    [self theImageViewIconAdd];
}

- (void)theLayoutSet
{
    [self.visiableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
}

- (void)theInteractionEvents
{
    RAC(self.visiableView,alignment)    = RACObserve(self, alignment);
    RAC(self.visiableView,spacing)      = RACObserve(self,textAlignment);
    
    RAC(self.label_msg,textAlignment)   = RACObserve(self, textAlignment);
    RAC(self.label_msg,textColor)       = RACObserve(self, textColor);
    RAC(self.label_msg,font)            = RACObserve(self, font);
    RAC(self.label_msg,text)            = RACObserve(self, text);
    
    RAC(self.imageView_icon,image) = RACObserve(self, image);
}

#pragma mark-subView
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

#pragma mark-setter
- (void)setButtonType:(PublickSimpleButtonType)buttonType
{
    if (_buttonType == buttonType) {
        return;
    }
    _buttonType = buttonType;
    
    NSInteger Vertical = (self.buttonType == PublickSimpleButtonTypeTextAboveImage||self.buttonType == PublickSimpleButtonTypeTextBelowImage);
    NSInteger Horizontal = (self.buttonType == PublickSimpleButtonTypeTextBeforeImage||self.buttonType == PublickSimpleButtonTypeTextBehindImage);
    
    NSInteger textLeading = (self.buttonType == PublickSimpleButtonTypeTextAboveImage||self.buttonType == PublickSimpleButtonTypeTextBeforeImage);
    NSInteger textTrailing = (self.buttonType == PublickSimpleButtonTypeTextBelowImage||self.buttonType == PublickSimpleButtonTypeTextBehindImage);
    
    if (Vertical) {
        self.visiableView.axis = UILayoutConstraintAxisVertical;
    }if (Horizontal){
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


@end
