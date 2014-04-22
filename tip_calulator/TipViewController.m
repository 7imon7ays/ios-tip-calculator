//
//  TipViewController.m
//  tip_calulator
//
//  Created by Simon Chaffetz on 4/19/14.
//
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalForTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalForThreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalForFourLabel;
- (IBAction)onTap:(id)sender;
- (IBAction)tipValueChange:(id)sender;
- (IBAction)billChange:(id)sender;
- (IBAction)billFieldSelect:(id)sender;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tipLabel.text = @"$0.00";
    self.tipControl.selectedSegmentIndex = 0;
    [self.billField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:(YES)];
}

- (IBAction)tipValueChange:(id)sender {
    [self updateValues];
}

- (IBAction)billChange:(id)sender {
    [self updateValues];
}

- (IBAction)billFieldSelect:(id)sender {
    self.billField.text = @"";
}

- (void)updateValues {
    float bill = [self.billField.text floatValue];

    NSArray *tipPercentages = @[@(0.15), @(0.2), @(0.25)];
    float tipPercentage = [tipPercentages[self.tipControl.selectedSegmentIndex] floatValue];

    float tip = bill * tipPercentage;
    float total = bill + tip;

    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];

    self.totalForTwoLabel.text = [NSString stringWithFormat:@"$%.2f", total / 2];
    self.totalForThreeLabel.text = [NSString stringWithFormat:@"$%.2f", total / 3];
    self.totalForFourLabel.text = [NSString stringWithFormat:@"$%.2f", total / 4];

}

@end
