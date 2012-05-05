//
//  OperandStack.m
//  Calculator
//
//  Created by ramin on 5/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OperandStack.h"
@interface OperandStack()
@property (nonatomic, strong) NSMutableArray *stack;
@end

@implementation OperandStack
@synthesize stack = _stack;

- (NSMutableArray *) stack
{
    if (_stack == nil) _stack = [[NSMutableArray alloc] init];
    return _stack;
}

- (void) push:(double) number
{
    [self.stack addObject:[NSNumber numberWithDouble:number]];
}


- (double) pop
{
    NSNumber *lastObject = [self.stack lastObject];
    if (lastObject != nil) {
        [self.stack removeLastObject];
    }
    return [lastObject doubleValue];
}

- (double) peek
{
    return [[self.stack lastObject] doubleValue];
}

- (void) clear
{
    [self.stack removeAllObjects];
}

- (NSString *) description
{
    return self.stack.description;
}
@end
