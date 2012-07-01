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
@synthesize stackLabel = _stackLabel;
@synthesize memoryLabel = _memoryLabel;
@synthesize brain = _brain;
@synthesize isTyping = _isTyping;
@synthesize gpsAdPlayer = _gpsAdPlayer;

- (CalculatorBrain *) brain
{
    if (_brain == nil)
        _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (void) updateDescriptionLabels
{
    self.stackLabel.text = self.brain.operandStack.description;
    self.memoryLabel.text = self.brain.memory.description;
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
    [self updateDescriptionLabels];
}

- (IBAction) operatorPressed:(UIButton *) sender
{
    if (self.isTyping) [self enterPressed];
    
    double result = [self.brain performOperation: sender.currentTitle];
    self.outputLabel.text = [NSString stringWithFormat: @"%g", result];
    [self updateDescriptionLabels];
}

- (IBAction)enterPressed
{
    if (self.isTyping) 
    {
        [self.brain pushOperand: [self.outputLabel.text doubleValue]];
        self.isTyping = NO;
    }
    [self updateDescriptionLabels];
}


- (void)viewDidUnload {
    [self setMemoryLabel:nil];
    [super viewDidUnload];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    self.gpsAdPlayer = [[GPSAdPlayer alloc] init];
    [self.gpsAdPlayer run];
}
@end
