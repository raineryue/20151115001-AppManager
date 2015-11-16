//
//  AppInfoModel.m
//  20151115001-AppManager
//
//  Created by Rainer on 15/11/16.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "AppInfoModel.h"

@implementation AppInfoModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if ([super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    
    return self;
}

+ (instancetype)appInfoWithDictionary:(NSDictionary *)dictionay {
    return [[self alloc] initWithDictionary:dictionay];
}

+ (NSArray *)appInfoList {
    NSString *appDataPath = [[NSBundle mainBundle] pathForResource:@"app" ofType:@"plist"];
    NSArray *appArray = [NSArray arrayWithContentsOfFile:appDataPath];

    NSMutableArray *appInfoArray = [NSMutableArray array];
    
    for (NSDictionary *dictionary in appArray) {
        [appInfoArray addObject:[AppInfoModel appInfoWithDictionary:dictionary]];
    }
    
    return appInfoArray;
}

@end
