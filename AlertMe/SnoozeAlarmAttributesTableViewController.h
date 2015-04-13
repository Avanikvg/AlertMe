//
//  SnoozeAlarmAttributesTableViewController.h
//  AlertMe
//
//  Created by AVANI SAMBARAJU on 4/6/15.
//  Copyright (c) 2015 AVANI SAMBARAJU. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SnoozeSettingsProtocol <NSObject>

-(void) setSnoozeLabel:(NSString * )snoozeLabel;
-(void) setSelectionRepeats:(NSMutableArray*) selectionRepeatsArray;
-(void) setSelectionSnoozeInterval:(NSNumber *) snoozeInterval;
@end


@interface SnoozeAlarmAttributesTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>


@property (retain) id <SnoozeSettingsProtocol> delegate;

@property (nonatomic,strong) NSString *snoozeLabel; //to save the entered label into this field
@property (nonatomic,strong) UITextField *labelTextField;
@property (nonatomic,strong) NSMutableArray *selectionRepeatsArray; // to save the user selections in an array
@property (nonatomic,strong) NSNumber *snoozeInterval;


@property   (nonatomic,strong) NSString *selectionString;
//- (IBAction)Cancel:(UIBarButtonItem *)sender;
;

- (IBAction)saveSettings:(UIBarButtonItem *)sender;


@end
