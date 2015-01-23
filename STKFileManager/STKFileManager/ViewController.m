//
//  ViewController.m
//  STKFileManager
//
//  Created by kei on 2015/01/24.
//  Copyright (c) 2015年 kei. All rights reserved.
//

#import "ViewController.h"
#import "STKFileManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSInteger fileSize =[[STKFileManager sharedManager]directorySize:[[STKFileManager sharedManager] homeDirectory]];
    
    NSLog(@"%ld",fileSize);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
