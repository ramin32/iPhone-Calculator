//
//  CalculatorBrain.h
//  Calculator
//
//  Created by ramin on 5/5/12.
//  Copyright (c) 2012 raminrakhamimov.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OperandStack.h"

@interface CalculatorBrain : NSObject

@property (nonatomic, strong) OperandStack *operandStack;
@property (nonatomic, strong) OperandStack *memory;

- (void) pushOperand:(double) number;
- (double) performOperation:(NSString *) operator;

@end
