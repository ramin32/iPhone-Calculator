//
//  CalculatorViewController.m
//  Calculator
//
//  Created by ramin on 5/5/12.
//  Copyright (c) 2012 raminrakhamimov.com. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic, strong) CalculatorBrain *brain;
@property BOOL isTyping;
@end

@implementation CalculatorViewController

@synthesize outputLabel = _outputLabel;
@synthesize brain = _brain;
@synthesize isTyping = _isTyping;

- (CalculatorBrain *) brain
{
    if (_brain == nil)
        _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction) operandPressed:(UIButton *) sender
{        
    if (self.isTyping) 
    {
        BOOL canAddSecondDot = [sender.currentTitle isEqualToString:@"."] && ([self.outputLabel.text rangeOfString:@"."].location != NSNotFound);
        if (canAddSecondDot) return;
        
        self.outputLabel.text = [self.outputLabel.text stringByAppendingString: sender.currentTitle];
    }
    else
    {
        self.outputLabel.text = sender.currentTitle;
        self.isTyping = YES;
    }
}

- (IBAction) operatorPressed:(UIButton *) sender
{
    if (self.isTyping) [self enterPressed];
    
    double result = [self.brain performOperation: sender.currentTitle];
    self.outputLabel.text = [NSString stringWithFormat: @"%g", result];
}

- (IBAction)enterPressed
{
    if (self.isTyping) 
    {
        
        [self.brain pushOperand: [self.outputLabel.text doubleValue]];
        self.isTyping = NO;
    }
}

@end
