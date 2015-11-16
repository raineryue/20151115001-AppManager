//
//  AppInfoModel.h
//  20151115001-AppManager
//
//  Created by Rainer on 15/11/16.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfoModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (instancetype)appInfoWithDictionary:(NSDictionary *)dictionay;

+ (NSArray *)appInfoList;

@end
