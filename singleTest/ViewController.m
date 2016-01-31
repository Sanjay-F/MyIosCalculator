//
//  ViewController.m
//  singleTest
//
//  Created by Sanjayf on 1/31/16.
//  Copyright © 2016 Sanjayf. All rights reserved.
//

#import "ViewController.h"
#include "Fraction.h"
#include "Calculator.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize  display,currentNumber,isNumerator,firstOperand,displayString,op,myCalculator;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    firstOperand=true;
    
    isNumerator=YES;
    displayString=[NSMutableString stringWithCapacity:40];
    myCalculator=[[Calculator alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(void) processDigit:(int) digit{
    
    currentNumber=currentNumber*10+digit;
    [displayString appendString:[NSString stringWithFormat:@"%i",digit]];
    display.text=displayString;
    
}


-(void) processOp: (char) theOp{
    
    NSString * opStri;
    
    op=theOp;
    
    switch (theOp) {
        case '+':
            opStri=@"+";
            break;
            
        case '-':
            opStri=@"-";
            break;
        case '*':
            opStri=@"x";
            break;
        case '/':
            opStri=@"／";
            break;
        default:
            break;
    }
    
    [self storeFracPart];
    firstOperand=NO;
    isNumerator=YES;
    
    [displayString appendString:opStri];
    display.text=displayString;
}


-(void) storeFracPart{
    
    if(firstOperand){
        if(isNumerator){
            myCalculator.operand1.numerator=currentNumber;
            myCalculator.operand1.denominator=1;
        }else{
            myCalculator.operand1.denominator=1;
            myCalculator.operand2.numerator=currentNumber;
        }
    }else if (isNumerator){
        myCalculator.operand2.numerator=currentNumber;
        myCalculator.operand2.denominator=1;
    }else {
        myCalculator.operand2.denominator=currentNumber;
        firstOperand=YES;
    }
    
    currentNumber=0;
}

//用来处理点击各个数字按钮的
-(IBAction) clickDigit: (UIButton *) sender{
    
    int digit=(int)sender.tag;
    [self processDigit:digit];
    
}


//用来处理四个基本运算符加减乘除的
-(IBAction)clickPlus {
    [self processOp:'+'];
}


-(IBAction)clickMinus {
    [self processOp:'-'];
}

-(IBAction)clickMultiPly {

    [self processOp:'*'];

}

-(IBAction)clickDivide {
    
    [self processOp:'/'];
}


//协助处理运输的
 -(IBAction) onClickOver {
    

    [self storeFracPart];
    isNumerator=NO;
    [displayString appendString:@"/"];
    display.text=displayString;
}

-(IBAction) onClickEquals{
    
    
    if(firstOperand ==NO){
        
        [self storeFracPart];
        [myCalculator performOperation: op];
        [displayString appendString:@"="];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        
        display.text=displayString;
        currentNumber=0;
        isNumerator=YES;
        firstOperand=YES;
        [displayString setString:@""];
    }
}

-(IBAction) onClickClear{
    
    isNumerator=YES;
    firstOperand=YES;
    currentNumber=0;
    [myCalculator class];
    [displayString setString:@""];
    display.text=displayString;
    
}



@end







































