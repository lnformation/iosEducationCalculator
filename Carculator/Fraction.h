//
//  Fraction.h
//  Objc2
//
//  Created by MF839-012 on 2016. 6. 13..
//  Copyright © 2016년 MF839-012. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
@property int denominator;
@property int numberator;
-(void)print;
-(void)setTo:(int)n over:(int)d;
-(double)convertToNum; // added
-(NSString *)convertToString; // added

-(Fraction*) add:(Fraction *)f;
-(Fraction*) mul:(Fraction *)f;
-(Fraction*) sub:(Fraction *)f;
-(Fraction*) div:(Fraction *)f;


@end
