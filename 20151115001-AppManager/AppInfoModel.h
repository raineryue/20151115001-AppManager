//
//  AppInfoModel.h
//  20151115001-AppManager
//
//  Created by Rainer on 15/11/16.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfoModel : NSObject

/** 应用名称 */
@property (nonatomic, copy) NSString *name;

/** 应用图片 */
@property (nonatomic, copy) NSString *icon;

/**
 *  通过字典初始化本类对象（对象方法）
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 *  通过字典初始化本类对象（类方法）
 */
+ (instancetype)appInfoWithDictionary:(NSDictionary *)dictionay;

/**
 *  获取全部数据信息
 */
+ (NSArray *)appInfoList;

@end
