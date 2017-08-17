//
//  WKSimpleButton.h
//  WKSimpleButtonDemo
//
//  Created by admin on 2017/8/17.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 功能描述：简易按钮构造
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,PublickSimpleButtonType){
    //文字在图片上
    PublickSimpleButtonTypeTextAboveImage   = 1,
    //文字在图片下
    PublickSimpleButtonTypeTextBelowImage   = 1 << 1,
    //文字在图片前
    PublickSimpleButtonTypeTextBeforeImage  = 1 << 2,
    //文字在图片后
    PublickSimpleButtonTypeTextBehindImage  = 1 << 3,
};

@interface WKSimpleButton : UIControl

/**
 按钮样式
 */
@property (nonatomic,assign) PublickSimpleButtonType buttonType;

/**
 字体大小
 */
@property (nonnull,nonatomic,strong) UIFont *font;

/**
 文本颜色
 */
@property (nonnull,nonatomic,strong) UIColor *textColor;

/**
 文本对齐方式
 */
@property (nonatomic,assign) NSTextAlignment textAlignment;

/**
 视图对齐方式
 */
@property (nonatomic,assign) UIStackViewAlignment alignment;


/**
 间隔
 */
@property (nonatomic,assign) CGFloat spacing;

/**
 文本内容
 */
@property (nonnull,nonatomic,copy) NSString *text;

/**
 图片
 */
@property (nonnull,nonatomic,strong) UIImage *image;


@end
