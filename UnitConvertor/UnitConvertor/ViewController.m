//
//  ViewController.m
//  UnitConvertor
//
//  Created by Nikolay Zhurba on 28.06.2020.
//  Copyright © 2020 mzhurba. All rights reserved.
//

#import "ViewController.h"

double metersToFeets(double value) {
    return value * 3.281;
}

double metersToInches(double value) {
    return value * 39.37;
}

double metersToYards(double value) {
    return value * 1.094;
}

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *inputField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (strong, nonatomic) IBOutlet UILabel *outputField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)updateButtonTapped:(id)sender {
    NSMutableString *buffer = [NSMutableString new];

    double meters = [self.inputField.text doubleValue];
    double convertedValue = 0;
    switch (self.segmentController.selectedSegmentIndex) {
        case 0:
            convertedValue = metersToFeets(meters);
            break;
        case 1:
            convertedValue = metersToInches(meters);
            break;
        case 2:
            convertedValue = metersToYards(meters);
            break;
    }

    [buffer appendString: [@(convertedValue) stringValue]];

    self.outputField.text = buffer;
}


@end
