//
//  AddAlarmEntryTableViewController.m
//  AlertMe
//
//  Created by AVANI SAMBARAJU on 4/3/15.
//  Copyright (c) 2015 AVANI SAMBARAJU. All rights reserved.
//

#import "AddAlarmEntryTableViewController.h"
#import "SnoozeAlarmAttributesTableViewController.h"

#define FIRST_ATTRIBUTE "Snooze"
#define SECOND_ATTRIBUTE "Repeat"
#define THIRD_ATTRIBUTE "Label"



@interface AddAlarmEntryTableViewController ()

@end

NSInteger *selectedINdex;

NSArray *alarmAttributesArray;


@implementation AddAlarmEntryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    alarmAttributesArray=[[NSArray alloc]initWithObjects:@FIRST_ATTRIBUTE,@SECOND_ATTRIBUTE, @THIRD_ATTRIBUTE,nil];
   
    _alarmStartDateTime.minimumDate = _alarmStartDateTime.date;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    
    if([segue.identifier isEqualToString:@"RepeatSegueId"])
    {
        
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];

        
        SnoozeAlarmAttributesTableViewController *destinationTVC=(SnoozeAlarmAttributesTableViewController*)[navController topViewController];
        
        
        destinationTVC.selectionString=@"Repeat";
        destinationTVC.title =destinationTVC.selectionString;

    }
    
    if([segue.identifier isEqualToString:@"SnoozeSegueId"])
    {
        //  NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        
        
        SnoozeAlarmAttributesTableViewController *destinationTVC=(SnoozeAlarmAttributesTableViewController*)[navController topViewController];
        
        destinationTVC.selectionString=@"Snooze";
        destinationTVC.title =destinationTVC.selectionString;

      //  NSLog(@"selected number of rows : %lu",destinationTVC.);
    }
    

}


@end
