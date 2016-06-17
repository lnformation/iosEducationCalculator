//
//  PinkViewController.m
//  Carculator
//
//  Created by MF839-012 on 2016. 6. 17..
//  Copyright © 2016년 MF839-012. All rights reserved.
//

#import "PinkViewController.h"

@interface PinkViewController ()

@end

@implementation PinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)newFunction:(id)sender {
    NSLog(@"dfs");
    changeMainBackColor([UIColor blueColor]);
}

- (IBAction)close:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:nil];
}
- (void)changeColorFunc:(void(^)(UIColor*))myFunc{
    changeMainBackColor = myFunc;
}
@end
