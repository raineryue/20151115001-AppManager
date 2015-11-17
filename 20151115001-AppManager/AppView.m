//
//  AppVIew.m
//  20151115001-AppManager
//
//  Created by Rainer on 15/11/16.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "AppView.h"

@interface AppView ()

@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UILabel *appNameLabel;
@property (nonatomic, weak) UIButton *downloadButton;

@end

@implementation AppView

/**
 *  初始化视图
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        // 1.图像视图
        UIImageView *iconImageView = [[UIImageView alloc] init];
        iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.iconImageView = iconImageView;
        
        [self addSubview:self.iconImageView];
        
        // 2.名称标签
        UILabel *appNameLabel = [[UILabel alloc] init];
        appNameLabel.font = [UIFont systemFontOfSize:12];
        appNameLabel.textAlignment = NSTextAlignmentCenter;
        self.appNameLabel = appNameLabel;
        
        [self addSubview:self.appNameLabel];
        
        // 3.下载按钮
        UIButton *downloadButton = [[UIButton alloc] init];
        downloadButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [downloadButton setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [downloadButton setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        [downloadButton addTarget:self action:@selector(downloadButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
        self.downloadButton = downloadButton;
        
        [self addSubview:self.downloadButton];
    }
    
    return self;
}

/**
 *  下载按钮点击事件处理
 */
- (void)downloadButtonClickAction:(UIButton *)button {
    // 1.创建下载提示控件
    UILabel *messageLabel = [[UILabel alloc] init];
    
    CGFloat messageLabelW = 150;
    CGFloat messageLabelH = 35;
    CGFloat messageLabelX = ([UIScreen mainScreen].bounds.size.width - messageLabelW) * 0.5;
    CGFloat messageLabelY = [UIScreen mainScreen].bounds.size.height - 30 - messageLabelH;
    
    messageLabel.frame = CGRectMake(messageLabelX, messageLabelY, messageLabelW, messageLabelH);
    messageLabel.text = [NSString stringWithFormat:@"%@下载完成",self.appInfo.name];
    messageLabel.font = [UIFont systemFontOfSize:13];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.backgroundColor = [UIColor lightGrayColor];
    messageLabel.alpha = 1.0f;
    
    [self.superview addSubview:messageLabel];

    // 2.动画显示和隐藏提示控件
    [UIView animateWithDuration:2.0 animations:^{
        messageLabel.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [messageLabel removeFromSuperview];
    }];
}

/**
 *  布局子视图控件
 */
- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat appViewW = self.bounds.size.width;
    
    // 1.图像视图
    CGFloat iconImageViewW = 45;
    CGFloat iconImageViewH = 45;
    CGFloat iconImageViewX = (appViewW - iconImageViewW) * 0.5;
    CGFloat iconImageViewY = 0;
    
    self.iconImageView.frame = CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH);
    
    // 2.名称标签
    CGFloat appNameLabelX = 0;
    CGFloat appNameLabelY = CGRectGetMaxY(self.iconImageView.frame);
    CGFloat appNameLabelW = appViewW;
    CGFloat appNameLabelH = 20;
    
    self.appNameLabel.frame = CGRectMake(appNameLabelX, appNameLabelY, appNameLabelW, appNameLabelH);
    
    // 3.下载按钮
    CGFloat downloadButtonW = 55;
    CGFloat downloadButtonH = 20;
    CGFloat downloadButtonX = (appViewW - downloadButtonW) * 0.5;
    CGFloat downloadButtonY = CGRectGetMaxY(self.appNameLabel.frame);
    
    self.downloadButton.frame = CGRectMake(downloadButtonX, downloadButtonY, downloadButtonW, downloadButtonH);
}

/**
 *  复写appInfo的setter方法填充子试图值
 */
- (void)setAppInfo:(AppInfoModel *)appInfo {
    _appInfo = appInfo;
    
    self.iconImageView.image = appInfo.iconImage;
    self.appNameLabel.text = appInfo.name;
    [self.downloadButton setTitle:@"下载" forState:UIControlStateNormal];
}

@end
