//
//  OperandStack.h
//  Calculator
//
//  Created by ramin on 5/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OperandStack : NSObject

- (void) push:(double) number;
- (double) pop;
- (double) peek;
- (void) clear;

@end
