//
//  CalculatorBrain.m
//  Calculator
//
//  Created by ramin on 5/5/12.
//  Copyright (c) 2012 raminrakhamimov.com. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain()

@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

- (NSMutableArray *) operandStack
{
    if (_operandStack == nil) 
    {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}
- (void) pushOperand:(double) number
{
    [self.operandStack addObject:[NSNumber numberWithDouble:number]];
}

- (double) popOperand
{
    NSNumber *lastObject = [self.operandStack lastObject];
    if (lastObject) {
        [self.operandStack removeLastObject];
    }
    return [lastObject doubleValue];
    
}
- (double) performOperation:(NSString *) operator
{
    double result = 0;
    if ([operator isEqualToString: @"*"]) 
    {
        result = [self popOperand] * [self popOperand];
    }
    else if ([operator isEqualToString: @"/"]) 
    {
        result = [self popOperand] / [self popOperand];
    }
    else if ([operator isEqualToString: @"+"]) 
    {
        result = [self popOperand] + [self popOperand];
    }
    else if ([operator isEqualToString: @"-"]) 
    {
        result = [self popOperand] - [self popOperand];
    }
    
    [self pushOperand: result];
    return result;
}
@end
