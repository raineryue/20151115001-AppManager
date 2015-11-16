//
//  AppInfoModel.m
//  20151115001-AppManager
//
//  Created by Rainer on 15/11/16.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "AppInfoModel.h"

@implementation AppInfoModel

/**
 *  通过字典初始化本类对象（对象方法）
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if ([super init]) {
        // 通过KVC使用字典填充实体类
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

/**
 *  通过字典初始化本类对象（类方法）
 */
+ (instancetype)appInfoWithDictionary:(NSDictionary *)dictionay {
    return [[self alloc] initWithDictionary:dictionay];
}

/**
 *  获取全部数据信息
 */
+ (NSArray *)appInfoList {
    // 1.获取plist文件的路径
    NSString *appDataPath = [[NSBundle mainBundle] pathForResource:@"app" ofType:@"plist"];

    // 2.读取plist文件中的数据
    NSArray *appArray = [NSArray arrayWithContentsOfFile:appDataPath];

    // 3.将字典数组转为对象数组
    NSMutableArray *appInfoArray = [NSMutableArray array];
    
    for (NSDictionary *dictionary in appArray) {
        [appInfoArray addObject:[AppInfoModel appInfoWithDictionary:dictionary]];
    }
    
    return appInfoArray;
}

@end
