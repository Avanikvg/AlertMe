//
//  AlertMeViewController.m
//  AlertMe
//
//  Created by AVANI SAMBARAJU on 4/2/15.
//  Copyright (c) 2015 AVANI SAMBARAJU. All rights reserved.
//

#import "AlertMeViewController.h"

@interface AlertMeViewController ()

@end

@implementation AlertMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    currentTimeLabel.text=nil;
    currentDateLabel.text=nil;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(refreshTimerEverySecond) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void) refreshTimerEverySecond
{
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc]init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [timeFormatter setTimeStyle:NSDateFormatterLongStyle];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    
    currentTimeLabel.text= [timeFormatter stringFromDate:[NSDate date]];
    currentDateLabel.text=[dateFormatter stringFromDate:[NSDate date]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
