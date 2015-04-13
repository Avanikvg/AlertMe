//
//  AddAlarmEntryTableViewController.h
//  AlertMe
//
//  Created by AVANI SAMBARAJU on 4/3/15.
//  Copyright (c) 2015 AVANI SAMBARAJU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SnoozeAlarmAttributesTableViewController.h"

@interface AddAlarmEntryTableViewController : UITableViewController<UITableViewDelegate,SnoozeSettingsProtocol>

@property (strong, nonatomic) IBOutlet UIDatePicker *alarmStartDateTime;
@property (strong, nonatomic) NSString *alarmLabel;
@property (strong,nonatomic) NSMutableArray *selectionRepeats;
@property (strong,nonatomic) NSNumber *snoozeInterval;

@end
