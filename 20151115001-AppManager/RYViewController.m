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

@interface RYViewController ()

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
        
        [self.view addSubview:appView];
    }
}

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
