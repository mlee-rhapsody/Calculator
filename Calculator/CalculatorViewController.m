//
//  CalculatorViewController.m
//  Calculator
//
//  Created by user 1 on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;

@end

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController
@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;


- (IBAction)digitPressed:(UIButton *)sender 
{
    NSString *digit = sender.currentTitle;
    if(self.userIsInTheMiddleOfEnteringANumber){
        self.display.text = [self.display.text stringByAppendingString:digit];
    }else{
        self.userIsInTheMiddleOfEnteringANumber = true;
        self.display.text = digit;
    }
    
}

- (IBAction)enterPressed:(UIButton *)sender {
}

- (IBAction)operationPressed:(UIButton *)sender {
}
@end
