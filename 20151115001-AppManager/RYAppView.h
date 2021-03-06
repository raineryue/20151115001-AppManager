//
//  RYAppView.h
//  20151115001-AppManager
//
//  Created by Rainer on 15/11/17.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AppInfoModel.h"

@class RYAppView;

@protocol RYAppViewDelegate <NSObject>

@optional
- (void)appView:(RYAppView *)appView downloadButtonDidClickAction:(UIButton *)downloadButton;

@end

@interface RYAppView : UIView

@property (nonatomic, strong) AppInfoModel *appInfo;
@property (nonatomic, weak) id<RYAppViewDelegate> delegate;

/**
 *  根据应用信息初始化应用试图（对象方法）
 */
- (instancetype)initWithAppInfo:(AppInfoModel *)appInfo;

/**
 *  根据应用信息初始化应用试图（类方法）
 */
+ (instancetype)appViewWithAppInfo:(AppInfoModel *)appInfo;

@end
