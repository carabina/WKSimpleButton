//
//  WKSimpleButtonStateModel.m
//  WKSimpleButtonDemo
//
//  Created by admin on 2017/8/18.
//  Copyright © 2017年 juyuanGroup. All rights reserved.
//

#import "WKSimpleButtonStateModel.h"
#import <objc/runtime.h>

@implementation WKSimpleButtonStateModel

- (void)dealNullWithBaseStateModel:(WKSimpleButtonStateModel *)baseModel
{
    NSAssert(baseModel, @"状态模型不能为空");
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList(self.class, &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *cName = property_getName(property);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        if ([self valueForKey:name] == nil && [baseModel valueForKey:name]) {
            [self setValue:[baseModel valueForKey:name] forKey:name];
        }
    }
}

@end
