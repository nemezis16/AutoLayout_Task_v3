//
//  ORViewController.m
//  AutoLayout_Task_v3
//
//  Created by MacBook on 25.10.15.
//  Copyright (c) 2015 Osadchuk. All rights reserved.
//

#import "ORViewController.h"

@interface ORViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonClear;
@property (weak, nonatomic) IBOutlet UIButton *buttonLoad;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ORViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textLabel.numberOfLines=0;
    [self.view removeConstraints:self.view.constraints];
    
    //add constraints to label
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-(30)-[_textLabel]-(>=100)-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_textLabel)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-(25)-[_textLabel]-(25)-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_textLabel)]];
    
    
    //add constraints to clear button
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-10-[_buttonClear(90)]->=0-[_buttonLoad(90)]-10-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_buttonClear,_buttonLoad)]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-(10)-[_buttonClear]-|"
                               options:0
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(_buttonClear)]];
    
    
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|->=0-[_buttonClear(50)]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_buttonClear)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|->=0-[_buttonLoad(50)]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_buttonLoad)]];
}

- (IBAction)loadText:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSMacOSRomanStringEncoding error:nil];
    
    self.textLabel.numberOfLines=0;
    
    
    //set justified alignment
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentJustified;
    
    NSDictionary *attributes = @{ NSParagraphStyleAttributeName : paragraph,
                                  NSFontAttributeName : self.textLabel.font,
                                  NSUnderlineStyleAttributeName : [NSNumber numberWithFloat:0] };
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:content
                                                              attributes:attributes];
    
    self.textLabel.attributedText = str;
    
}

- (IBAction)clearText:(id)sender {
    
    self.textLabel.text=@"";
}

@end
