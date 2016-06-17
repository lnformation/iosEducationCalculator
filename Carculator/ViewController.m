//
//  ViewController.m
//  Carculator
//
//  Created by MF839-012 on 2016. 6. 15..
//  Copyright © 2016년 MF839-012. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "InfoViewController.h"
#import "PinkViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumberator, equalsBtnEnabledYn;
    Calculator * myCalculator;
    NSMutableString * displayString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _display.text = @"";
    
    equalsBtnEnabledYn = YES;
    firstOperand = YES;
    isNumberator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openInfoView:(id)sender {
    
    InfoViewController * infoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"infoView"];
    
    infoViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:infoViewController
                       animated:YES
                     completion:nil];
}

- (IBAction)openNewView:(id)sender {
    
    [self performSegueWithIdentifier:@"pinkView" sender:self];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [segue.identifier isEqualToString:@"pinkView"]){
        PinkViewController * pinkView = [segue destinationViewController];
        [pinkView changeColorFunc:^(UIColor * newColor){
            [self.view setBackgroundColor:newColor];
        }];
    }
}

- (IBAction)clickPlus:(id)sender {
    if (equalsBtnEnabledYn == NO){
        self.equalBtn.enabled = NO;
    }
    [self processOp:'+'];
}

- (IBAction)clickMinus:(id)sender {
    if (equalsBtnEnabledYn == NO){
        self.equalBtn.enabled = NO;
    }
    [self processOp:'-'];
}

- (IBAction)clickMultiply:(id)sender {
    if (equalsBtnEnabledYn == NO){
        self.equalBtn.enabled = NO;
    }
    [self processOp:'*'];
}

- (IBAction)clickDivide:(id)sender {
    if (equalsBtnEnabledYn == NO){
        self.equalBtn.enabled = NO;
    }
    [self processOp:'/'];
}

- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumberator = NO;
    [displayString appendString:@"/"];
    _display.text = displayString;
}

- (IBAction)clickEquals:(id)sender {
    if(firstOperand == NO){
        [self storeFracPart]; // X/1 분수 만들기
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        _display.text = displayString;
        
        currentNumber = 0;
        isNumberator = YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
    
}

- (IBAction)clickClear:(id)sender {
    equalsBtnEnabledYn = YES;
    self.equalBtn.enabled = YES;
    isNumberator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    _display.text = displayString;
    
}

- (IBAction)clickDigit:(id)sender {
    
    UIButton * btn = (UIButton*)sender;
    int digit = (int)btn.tag;
    [self processDigit:digit];
    
    if(firstOperand == NO){
        equalsBtnEnabledYn = NO;
    }
}

-(void)processDigit:(int)digit{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
    
    _display.text = displayString;
}
-(void)processOp:(int)theOp{
    op = theOp;
    NSString* opStr;
    switch (theOp){
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
    }
    [self storeFracPart];
    firstOperand = NO;
    isNumberator = YES;
    
    [displayString appendString:opStr];
    _display.text = displayString;
}
-(void)storeFracPart{
    
    if(firstOperand){
        if(isNumberator){
            myCalculator.operand1.numberator = currentNumber;
            myCalculator.operand1.denominator = 1; // 분모에 1을 임의로 넣어줌
        }else{
            myCalculator.operand1.denominator = currentNumber; // over 클릭했을때
        }
    }
    
    
    else if(isNumberator){
        myCalculator.operand2.numberator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }else{
        myCalculator.operand2.numberator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
    
}
@end
