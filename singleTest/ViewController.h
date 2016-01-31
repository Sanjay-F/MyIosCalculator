//
//  ViewController.h
//  singleTest
//
//  Created by Sanjayf on 1/31/16.
//  Copyright © 2016 Sanjayf. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Calculator.h"


@interface ViewController : UIViewController

@property (strong ,nonatomic) IBOutlet UILabel * display;

    
@property    char op;
@property    int  currentNumber;
@property    BOOL firstOperand,isNumerator;
@property    Calculator  *myCalculator;
@property    NSMutableString * displayString;



-(void) processDigit:(int) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

//用来处理点击各个数字按钮的
-(IBAction) clickDigit: (UIButton *) sender;


//用来处理四个基本运算符加减乘除的
-(IBAction)clickPlus ;
-(IBAction)clickMinus ;
-(IBAction)clickMultiPly ;
-(IBAction)clickDivide ;


//协助处理运输的
-(IBAction) onClickOver;
-(IBAction) onClickEquals;
-(IBAction) onClickClear;


@end

