//
//  ViewController.h
//  Carculator
//
//  Created by MF839-012 on 2016. 6. 15..
//  Copyright © 2016년 MF839-012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UIButton *equalBtn;
//@property (strong, nonatomic) IBOutletCollection UIButton * buttonGroup;
- (IBAction)openInfoView:(id)sender;
- (IBAction)openNewView:(id)sender;

- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickMultiply:(id)sender;
- (IBAction)clickDivide:(id)sender;

- (IBAction)clickOver:(id)sender;
- (IBAction)clickEquals:(id)sender;
- (IBAction)clickClear:(id)sender;

- (IBAction)clickDigit:(id)sender;

-(void)processDigit:(int)digit;
-(void)processOp:(int)theOp;
-(void)storeFracPart;
@end

