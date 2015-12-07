//
//  RYAppView.m
//  20151115001-AppManager
//
//  Created by Rainer on 15/11/17.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "RYAppView.h"

@interface RYAppView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *iconNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *iconDownloadButton;

@end

@implementation RYAppView

/**
 *  根据应用信息初始化应用试图（对象方法）
 */
- (instancetype)initWithAppInfo:(AppInfoModel *)appInfo {
    return [RYAppView appViewWithAppInfo:appInfo];
}

/**
 *  根据应用信息初始化应用试图（类方法）
 */
+ (instancetype)appViewWithAppInfo:(AppInfoModel *)appInfo {
    // 加载xib文件
    RYAppView *appView = [[[NSBundle mainBundle] loadNibNamed:@"RYAppView" owner:nil options:nil] lastObject];
    
    appView.appInfo = appInfo;
    
    return appView;
}

/**
 *  下载按钮点击事件处理方法
 */
- (IBAction)iconDownloadButtonClickAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(appView:downloadButtonDidClickAction:)]) {
        [self.delegate appView:self downloadButtonDidClickAction:sender];
    }
}

/**
 *  复写appInfo的setter方法给视图控件赋值
 */
- (void)setAppInfo:(AppInfoModel *)appInfo {
    _appInfo = appInfo;
    
    self.iconImageView.image = appInfo.iconImage;
    self.iconNameLabel.text = appInfo.name;
}

@end
