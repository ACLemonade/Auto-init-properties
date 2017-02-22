//
//  Student.h
//  Auto-init-Properties
//
//  Created by Lemonade on 2017/2/22.
//  Copyright © 2017年 Lemonade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
/** 姓名 */
@property (nonatomic, strong) NSString *name;
/** 学生ID */
@property (nonatomic, strong) NSString *ID;
/** 年龄 */
@property (nonatomic, assign) NSInteger age;
/** 年级 */
@property (nonatomic, assign) NSInteger grade;
/** 体重 */
@property (nonatomic, assign) CGFloat weight;
/** 身高 */
@property (nonatomic, assign) CGFloat height;

/** 自动初始化属性(将对象类型初始值nil赋为" ") */
- (instancetype)initPropertiesWithString;
/** 展示属性 */
- (void)showProperties;

@end
