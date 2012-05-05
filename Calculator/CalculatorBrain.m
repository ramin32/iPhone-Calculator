//
//  CalculatorBrain.m
//  Calculator
//
//  Created by ramin on 5/5/12.
//  Copyright (c) 2012 raminrakhamimov.com. All rights reserved.
//

#import "CalculatorBrain.h"
#import "OperandStack.h"

@implementation CalculatorBrain
@synthesize operandStack = _operandStack;
@synthesize memory = _memory;

- (id) init
{
    self = [super init];
    if (self) 
    {
        _operandStack = [[OperandStack alloc] init];
        _memory = [[OperandStack alloc] init];
    }
    return self;
}
- (void) pushOperand:(double) number
{
    [self.operandStack push:number];
}

- (double) popOperand
{
    return [self.operandStack pop];
}

- (double) performOperation:(NSString *) operator
{
    double result = 0;
    if ([operator isEqualToString: @"*"]) 
    {
        result = [self popOperand] * [self popOperand];
        [self pushOperand: result];
    }
    else if ([operator isEqualToString: @"/"]) 
    {
        double operand1 = [self popOperand];
        double operand2 = [self popOperand];
        if (operand2) {
            result = operand1 / operand2;
        }
        [self pushOperand: result];
    }
    else if ([operator isEqualToString: @"+"]) 
    {
        result = [self popOperand] + [self popOperand];
        [self pushOperand: result];
    }
    else if ([operator isEqualToString: @"-"]) 
    {
        result = [self popOperand] - [self popOperand];
        [self pushOperand: result];
    }
    else if ([operator isEqualToString: @"sin"]) 
    {
        result = sin([self popOperand]);
        [self pushOperand: result];
    }
    else if ([operator isEqualToString: @"cos"]) 
    {
        result = cos([self popOperand]);
        [self pushOperand: result];
    }
    else if ([operator isEqualToString: @"C"]) 
    {
        [self.operandStack clear];
        [self.memory clear];
    }
    else if ([operator isEqualToString: @"1/x"]) 
    {
        double operand = [self popOperand];
        if(operand != 0)
        {
            operand = 1/operand;
        }
        [self pushOperand: operand];
        result = operand;
    }
    else if ([operator isEqualToString: @"+/-"]) 
    {
        result = -1 * [self popOperand];
        [self pushOperand: result];
    }
    else if ([operator isEqualToString: @"Store"]) 
    {
        result = [self.operandStack pop];
        [self.memory push: result];
    }
    else if ([operator isEqualToString: @"Recall"]) 
    {
        result = [self.memory pop];
        [self.operandStack push:result];
    }
    else if ([operator isEqualToString: @"M +"]) 
    {
        result = [self.operandStack peek];
        [self.memory push:[self.memory pop] + result];
    }

    return result;
}

@end
