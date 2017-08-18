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
#import "WKSimpleButtonStateModel.h"

@interface WKSimpleButton : UIControl

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


@end
