//
//  CalculatorViewController.h
//  Calculator
//
//  Created by ramin on 5/5/12.
//  Copyright (c) 2012 raminrakhamimov.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UILabel *stackLabel;
@property (weak, nonatomic) IBOutlet UILabel *memoryLabel;

- (IBAction) operandPressed: (UIButton *) sender;
- (IBAction) operatorPressed: (UIButton *) sender;
- (IBAction) enterPressed;


@end
