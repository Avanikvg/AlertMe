//
//  AlertMeViewController.h
//  AlertMe
//
//  Created by AVANI SAMBARAJU on 4/2/15.
//  Copyright (c) 2015 AVANI SAMBARAJU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertMeViewController : UIViewController
{

    IBOutlet UILabel *currentDateLabel;
    IBOutlet UILabel *currentTimeLabel;
    NSTimer *timer;
}
-(void) refreshTimerEverySecond;

@end
