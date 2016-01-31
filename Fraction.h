//
//  Fraction.h
//  singleTest
//
//  Created by Sanjayf on 1/31/16.
//  Copyright © 2016 Sanjayf. All rights reserved.
//

#import <UIkit/UIKit.h>

@interface  Fraction : NSObject

@property int numerator,denominator;

-(void)  print;
-(void) setTo: (int) n  over:(int)d;
-(Fraction *) add: (Fraction * ) f;
-(Fraction * ) subtract: (Fraction *) f;
-(Fraction *) multiPly: (Fraction *) f;
-(Fraction *) divide: (Fraction * ) f;
-(void) reduce;
-(double) convertToNum;
-(NSString *) convertToString;



@end


