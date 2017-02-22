//
//  main.m
//  Auto-init-Properties
//
//  Created by Lemonade on 2017/2/22.
//  Copyright © 2017年 Lemonade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /** 普通初始化 */
        Student *stu1 = [[Student alloc] init];
        /** 属性自动赋初值的初始化 */
        Student *stu2 = [[Student alloc] initPropertiesWithString];
        
        [stu1 showProperties];
        [stu2 showProperties];
    }
    return 0;
}
