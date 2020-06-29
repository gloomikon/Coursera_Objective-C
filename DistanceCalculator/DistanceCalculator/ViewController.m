//
//  ViewController.m
//  DistanceCalculator
//
//  Created by Nikolay Zhurba on 29.06.2020.
//  Copyright © 2020 mzhurba. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"

@interface ViewController ()

@property (nonatomic) DGDistanceRequest *req;

@property (strong, nonatomic) IBOutlet UITextField *startingLocationTextField;
@property (strong, nonatomic) IBOutlet UITextField *firstDestinationTextField;
@property (strong, nonatomic) IBOutlet UITextField *secondDestinationTextField;
@property (strong, nonatomic) IBOutlet UITextField *thirdDestinationTextField;
@property (strong, nonatomic) IBOutlet UIButton *calculateButton;
@property (strong, nonatomic) IBOutlet UILabel *secondDestinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *firstDestinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *thirdDestinationLabel;

@end

@implementation ViewController

- (IBAction)calculateButtonTapped:(id)sender {
    self.calculateButton.enabled = NO;

    self.req = [DGDistanceRequest alloc];

    NSString *startLocation = self.startingLocationTextField.text;
    NSString *firstDestination = self.firstDestinationTextField.text;
    NSString *secondDestination = self.secondDestinationTextField.text;
    NSString *thirdDestination = self.thirdDestinationTextField.text;

    self.req = [self.req initWithLocationDescriptions:@[firstDestination, secondDestination, thirdDestination]
                         sourceDescription:startLocation];

    __weak id weakSelf = self;

    self.req.callback = ^(NSArray *distances) {
        ViewController *strongSelf = weakSelf;

        if (!strongSelf) return;

        if (distances[0] != [NSNull null]) {
            NSString *firstDistance = [NSString stringWithFormat: @"%.2f km", ([distances[0] doubleValue] / 1000.0)];
            strongSelf.firstDestinationLabel.text = firstDistance;
        }
        else {
            strongSelf.firstDestinationLabel.text = @"An error occured!";
        }

        if (distances[1] != [NSNull null]) {
            NSString *secondDistance = [NSString stringWithFormat: @"%.2f km", ([distances[1] doubleValue] / 1000.0)];
            strongSelf.secondDestinationLabel.text = secondDistance;
        }
        else {
            strongSelf.secondDestinationLabel.text = @"An error occured!";
        }

        if (distances[2] != [NSNull null]) {
            NSString *thirdDistance = [NSString stringWithFormat: @"%.2f km", ([distances[2] doubleValue] / 1000.0)];
            strongSelf.thirdDestinationLabel.text = thirdDistance;
        }
        else {
            strongSelf.thirdDestinationLabel.text = @"An error occured!";
        }

        strongSelf.req = nil;
        strongSelf.calculateButton.enabled = YES;
    };

    [self.req start];
}

@end
