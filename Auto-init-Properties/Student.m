//
//  Student.m
//  Auto-init-Properties
//
//  Created by Lemonade on 2017/2/22.
//  Copyright © 2017年 Lemonade. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>

@implementation Student
- (instancetype)initPropertiesWithString{
    if (self = [super init]) {
        unsigned int count = 0;
        //获取类的属性列表
        Ivar *ivars = class_copyIvarList([self class], &count);
        //给属性赋值
        for (int i = 0; i<count; i++)
        {
            Ivar ivar = ivars[i];
            //获取变量名称
            const char *propertyName = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:propertyName];
            //获取变量值
            id propertyValue = [self valueForKey:key];
            if (propertyValue == nil) {
                //生成setter方法
                //跳过下划线
                NSString *usefullStr = [key substringFromIndex:1];
                //截取第一个字符
                NSString *firstPart = [usefullStr substringToIndex:1];
                NSString *lastPart = [usefullStr substringFromIndex:1];
                //小写转大写(若已经是大写,则不变)
                firstPart = [firstPart uppercaseString];
                key = [firstPart stringByAppendingString:lastPart];
                //拼接set方法字符串
                key = [NSString stringWithFormat:@"set%@:", key];
                SEL setSel = NSSelectorFromString(key);
                //调用setter方法
                if ([self respondsToSelector:setSel])
                {
                    //给对象类型属性赋初值,默认为"",可自定义
                    id value = @"";
                    [self performSelectorOnMainThread:setSel withObject:value waitUntilDone:[NSThread isMainThread]];
                }
            }
        }
        free(ivars);
    }
    return self;
}
- (void)showProperties{
    NSLog(@"name:%@, age:%ld, ID:%@, grade:%ld, weight:%f, height:%f", self.name, self.age, self.ID, self.grade, self.weight, self.height);
}

@end
