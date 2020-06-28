//
//  ViewController.m
//  CurrencyConvertor
//
//  Created by Nikolay Zhurba on 28.06.2020.
//  Copyright © 2020 mzhurba. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (strong, nonatomic) IBOutlet UITextField *inputField;
@property (strong, nonatomic) IBOutlet UIButton *convertButton;
@property (strong, nonatomic) IBOutlet UILabel *euroLabel;
@property (strong, nonatomic) IBOutlet UILabel *yenLabel;
@property (strong, nonatomic) IBOutlet UILabel *poundLabel;

@end

@implementation ViewController

- (IBAction)convertButtonTapped:(id)sender {
    self.convertButton.enabled = NO;

    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
}

- (void)currencyRequest:(CRCurrencyRequest *)req retrievedCurrencies:(CRCurrencyResults *)currencies {

    double usd = [self.inputField.text doubleValue];

    double euro = usd * currencies.EUR;
    NSString *euroStr = [NSString stringWithFormat: @"%.2f", euro];
    self.euroLabel.text = euroStr;

    double yen = usd * currencies.JPY;
    NSString *yenStr = [NSString stringWithFormat: @"%.2f", yen];
    self.yenLabel.text = yenStr;

    double pound = usd * currencies.GBP;
    NSString *poundStr = [NSString stringWithFormat: @"%.2f", pound];
    self.poundLabel.text = poundStr;

    self.convertButton.enabled = YES;
}

@end
