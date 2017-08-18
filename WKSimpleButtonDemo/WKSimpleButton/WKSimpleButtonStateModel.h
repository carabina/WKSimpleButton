//
//  WKSimpleButtonStateModel.h
//  WKSimpleButtonDemo
//
//  Created by admin on 2017/8/18.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//
/*
 创建人：admin
 功能描述：简易按钮状态模型
 创建版本：V 1.0.0
 --修改人：
 修改版本：
 修改描述：
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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
@interface WKSimpleButtonStateModel : NSObject

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

@end
