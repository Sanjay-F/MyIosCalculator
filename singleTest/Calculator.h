//
//  Calculator.h
//  singleTest
//
//  Created by Sanjayf on 1/31/16.
//  Copyright © 2016 Sanjayf. All rights reserved.
//

#ifndef Calculator_h
#define Calculator_h

#import <UIKit/UIKit.h>
#import "Fraction.h"

@interface Calculator : NSObject

@property (strong,nonatomic) Fraction * operand1;
@property (strong,nonatomic) Fraction * operand2;
@property (strong,nonatomic) Fraction * accumulator;


-(Fraction *) performOperation: (char) op;
-(void) clear;


@end


#endif /* Calculator_h */
