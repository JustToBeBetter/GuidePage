//
//  ViewController.m
//  GuidePage
//
//  Created by DBOX on 2016/12/15.
//  Copyright © 2016年 DBOX. All rights reserved.
//

#import "ViewController.h"
#import "GuidePagesView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //GuidePagesView *showView =  [GuidePagesView init];
    [GuidePagesView showGuidPagesView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
