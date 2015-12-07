//
//  RYViewController.m
//  20151115001-AppManager
//
//  Created by Rainer on 15/11/17.
//  Copyright © 2015年 Rainer. All rights reserved.
//  这个类使用xib实现

#import "RYViewController.h"
#import "AppInfoModel.h"
#import "RYAppView.h"

// 每行显示列数
#define kColumnCount 3
#define kAppViewW 80
#define kAppViewH 90
#define kAppViewStartY 20

@interface RYViewController () <RYAppViewDelegate>

/** 提示标签 */
@property (nonatomic, weak) UILabel *messageLabel;

/** 应用程序数据信息 */
@property (nonatomic, strong) NSArray *appArray;

@end

@implementation RYViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置子控件
    [self setupSubviews];
}

/**
 *  设置子控件
 */
- (void)setupSubviews {
    CGFloat appViewMargin = (self.view.bounds.size.width - kAppViewW * kColumnCount) / (kColumnCount + 1);
    
    for (int i = 0; i < self.appArray.count; i++) {
        // 1.当前行
        int currenRow = i / kColumnCount;
        
        // 2.当前列
        int currenCol = i % kColumnCount;
        
        // 3.创建应用管理视图并且设置位置大小
        CGFloat appViewW = kAppViewW;
        CGFloat appViewH = kAppViewH;
        CGFloat appViewX = appViewMargin + (appViewMargin + appViewW) * currenCol;
        CGFloat appViewY = kAppViewStartY + appViewMargin + (appViewMargin + appViewH) * currenRow;
        
        RYAppView *appView = [RYAppView appViewWithAppInfo:self.appArray[i]];
        appView.frame = CGRectMake(appViewX, appViewY, appViewW, appViewH);
        appView.delegate = self;
        
        [self.view addSubview:appView];
    }
}

#pragma mark - RYAppView代理方法
/**
 *  下载按钮点击代理方法
 */
- (void)appView:(RYAppView *)appView downloadButtonDidClickAction:(UIButton *)downloadButton {
    self.messageLabel.text = [NSString stringWithFormat:@"%@下载完成", appView.appInfo.name];

    [UIView animateWithDuration:2.0 animations:^{
        self.messageLabel.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
            self.messageLabel.alpha = 0.0;
        }];
    }];
}

#pragma mark - 控件懒加载
/**
 *  提示标签懒加载
 */
- (UILabel *)messageLabel {
    if (nil == _messageLabel) {
        CGFloat messageLabelW = 150;
        CGFloat messageLabelH = 40;
        CGFloat messageLabelX = (self.view.bounds.size.width - messageLabelW) * 0.5;
        CGFloat messageLabelY = self.view.bounds.size.height - 40 - 30;
        
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(messageLabelX, messageLabelY, messageLabelW, messageLabelH)];
        
        messageLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
        messageLabel.font = [UIFont systemFontOfSize:13];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.alpha = 0.0;
        
        _messageLabel = messageLabel;
        
        [self.view addSubview:_messageLabel];
    }
    
    return _messageLabel;
}

#pragma mark - 属性懒加载
/**
 *  获取应用程序数据信息
 */
- (NSArray *)appArray {
    if (nil == _appArray) {
        _appArray = [AppInfoModel appInfoList];
    }
    
    return _appArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
