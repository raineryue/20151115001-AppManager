//
//  ViewController.m
//  20151115001-AppManager
//
//  Created by Rainer on 15/11/15.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"
#import "AppView.h"

#define kColumnCount 3
#define kAppViewW 80
#define kAppViewH 90
#define kStartAppViewY 10

@interface ViewController ()

@property (nonatomic, strong) NSArray *appArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    CGFloat appViewMargineX = (self.view.bounds.size.width - kAppViewW * kColumnCount) / (kColumnCount + 1);
    
    for (int i = 0; i < self.appArray.count; i++) {
        // 1.当前行
        int appRow = i / kColumnCount;

        // 2.当前列
        int appClo = i % kColumnCount;
        
        CGFloat appViewX = appViewMargineX + (appViewMargineX + kAppViewW) * appClo;
        CGFloat appViewY = kStartAppViewY + appViewMargineX + (kStartAppViewY + kAppViewH) * appRow;
        
        AppView *appView = [[AppView alloc] initWithFrame:CGRectMake(appViewX, appViewY, kAppViewW, kAppViewH)];
        appView.appInfo = self.appArray[i];
        
        [self.view addSubview:appView];
    }
}

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
