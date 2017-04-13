//
//  ViewController.m
//  DownLoadTask
//
//  Created by yucquan on 2017/4/13.
//  Copyright © 2017年 applemusic.cc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startBtnPressed:(id)sender {
    
    if (self.dtask) {
        [self.dtask resume];
    }else{
        self.dtask = [[DownLoadTask alloc] init];
        [self.dtask downLoadTaskWithUrl:[NSURL URLWithString:@"http://dl112.80s.im:920/1704/[胡彦斌]剃刀边缘/[胡彦斌]剃刀边缘_bd.mp4"]];
    }

    
}
- (IBAction)pauseBtnPressed:(id)sender {
    if (self.dtask) {
        [self.dtask pause];
    }
}

@end
