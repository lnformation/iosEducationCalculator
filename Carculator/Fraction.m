//
//  Fraction.m
//  Objc2
//
//  Created by MF839-012 on 2016. 6. 13..
//  Copyright © 2016년 MF839-012. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

-(void)print{
    NSLog(@"%i/%i", _numberator, _denominator);
}
-(void)setTo:(int)n over:(int)d{
    _denominator = d;
    _numberator = n;
}
-(double)convertToNum //added
{
    if( _denominator !=0){
        return (double) _numberator / _denominator;
    }else{
        return NAN;
    }
}
-(void)reduce{
    int u = _numberator;
    int v =_denominator;
    int temp;
    
    while ( v != 0){
        temp = u % v;
        u = v;
        v = temp;
    }
    
    _numberator /= u;
    _denominator /= u;
}

-(NSString *)convertToString{
    if(_numberator == _denominator){
        if(_numberator == 0){
            return @"0";
        }else{
            return @"1";
        }
    }else if (_denominator == 1){
        return [NSString stringWithFormat:@"%i", _numberator];
    }else{
        return [NSString stringWithFormat:@"%i/%i", _numberator, _denominator];
    }
}
-(Fraction*) add:(Fraction *)f{
    
    Fraction * result = [[Fraction alloc]init];
    
    
    result.numberator = self.numberator * f.denominator + self.denominator * f.numberator;
    result.denominator = self.denominator * f.denominator;
    
    [result reduce];
    
    return result;
}
-(Fraction*) mul:(Fraction *)f{
    Fraction * result = [[Fraction alloc]init];
    
    
    result.numberator = self.numberator * f.numberator;
    result.denominator = self.denominator * f.denominator;
    
    [result reduce];
    return result;
}
-(Fraction*) sub:(Fraction *)f{
    Fraction * result = [[Fraction alloc]init];
    
    
    result.numberator = self.numberator * f.numberator - self.denominator * f.numberator;
    result.denominator = self.denominator * f.denominator;
    
    [result reduce];
    return result;
}
-(Fraction*) div:(Fraction *)f{
    Fraction * result = [[Fraction alloc]init];
    result.numberator = self.numberator * f.denominator;
    result.denominator = self.denominator * f.numberator;
    [result reduce];
    return result;
}
@end
