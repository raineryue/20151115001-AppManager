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

@property (nonatomic, strong) AppInfoModel *appInfo;

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
    CGFloat messageLabelW = 150;
    CGFloat messageLabelH = 40;
    CGFloat messageLabelX = (self.superview.bounds.size.width - messageLabelW) * 0.5;
    CGFloat messageLabelY = self.superview.bounds.size.height - 40 - 30;
    
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(messageLabelX, messageLabelY, messageLabelW, messageLabelH)];
    messageLabel.text = [NSString stringWithFormat:@"%@下载完成", self.appInfo.name];
    messageLabel.backgroundColor = [UIColor lightGrayColor];
    messageLabel.font = [UIFont systemFontOfSize:13];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.alpha = 1.0;
    
    [self.superview addSubview:messageLabel];
    
    [UIView animateWithDuration:2.0 animations:^{
        messageLabel.alpha = 0.0;
    } completion:^(BOOL finished) {
        [messageLabel removeFromSuperview];
    }];
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
