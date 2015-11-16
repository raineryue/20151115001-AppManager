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
        downloadButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [downloadButton setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [downloadButton setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        self.downloadButton = downloadButton;
        
        [self addSubview:self.downloadButton];
    }
    
    return self;
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

- (void)setAppInfo:(AppInfoModel *)appInfo {
    _appInfo = appInfo;
    
    self.iconImageView.image = [UIImage imageNamed:appInfo.icon];
    self.appNameLabel.text = appInfo.name;
    [self.downloadButton setTitle:@"下载" forState:UIControlStateNormal];
}

@end
