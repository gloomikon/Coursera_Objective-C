//
//  ViewController.m
//  HelloWorld
//
//  Created by Nikolay Zhurba on 27.06.2020.
//  Copyright © 2020 mzhurba. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)testButtonTapped:(id)sender {
    self.testLabel.text = @"It worked!";
}

@end
