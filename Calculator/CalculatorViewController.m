//
//  CalculatorViewController.m
//  Calculator
//
//  Created by user 1 on 6/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic) BOOL userHasPressedDecimal;
@property (nonatomic, strong) CalculatorBrain *brain;
@end


@implementation CalculatorViewController
@synthesize display = _display;
@synthesize tickerDisplay = _tickerDisplay;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize userHasPressedDecimal = _userHasPressedDecimal;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if(_brain == nil){
        _brain = [[CalculatorBrain alloc] init];
    }
    return _brain;
}

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

- (IBAction)enterPressed 
{

    [self.brain pushOperand:[self.display.text doubleValue]];
    self.tickerDisplay.text = [[self.tickerDisplay.text stringByAppendingString:self.display.text] stringByAppendingString:@" "];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.userHasPressedDecimal = NO;
 }

- (IBAction)operationPressed:(UIButton *)sender
{
    if(self.userIsInTheMiddleOfEnteringANumber){
        [self enterPressed];
    }
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
    
    self.tickerDisplay.text = [[self.tickerDisplay.text stringByAppendingString: sender.currentTitle] stringByAppendingString:@" "];
}
- (IBAction)decimalPressed 
{
    if(self.userHasPressedDecimal == NO){
        self.display.text = [self.display.text stringByAppendingString:@"."];
        self.userHasPressedDecimal = YES;
    }
}

- (IBAction)clearPressed 
{
    self.display.text = @"0";
    self.tickerDisplay.text = @"";
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.userHasPressedDecimal = NO;
    
    
}
- (void)viewDidUnload {
    [self setTickerDisplay:nil];
    [super viewDidUnload];
}
@end
