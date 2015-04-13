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

#define ONE "1"
#define THREE "3"
#define FIVE "5"
#define TEN "10"

#define SUNDAY "Sunday"
#define MONDAY "Monday"
#define TUESDAY "Tuesday"
#define WEDNESDAY "Wednesday"
#define THURSDAY "Thursday"
#define FRIDAY "Friday"
#define SATURDAY "Saturday"


@interface AddAlarmEntryTableViewController ()

@end


NSArray *alarmAttributesArray;

NSArray *snoozeArray,*repeatArray;

@implementation AddAlarmEntryTableViewController

@synthesize alarmLabel,selectionRepeats,snoozeInterval;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    alarmAttributesArray=[[NSArray alloc]initWithObjects:@FIRST_ATTRIBUTE,@SECOND_ATTRIBUTE, @THIRD_ATTRIBUTE,nil];
    repeatArray = [[NSArray alloc]initWithObjects:@SUNDAY,@MONDAY,@TUESDAY,@WEDNESDAY,@THURSDAY,@FRIDAY,@SATURDAY,nil];
   
    _alarmStartDateTime.minimumDate = _alarmStartDateTime.date;
    
    snoozeArray = [[NSArray alloc]initWithObjects:@ONE,@THREE,@FIVE,@TEN,nil] ;

}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@" alarm label : %@",    self.alarmLabel);
    NSLog(@" selection repeats array count  = %lu",[selectionRepeats count]);
    NSLog(@" snooze interval = %d",[self.snoozeInterval intValue]);

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
        destinationTVC.repeatArray = repeatArray;
        destinationTVC.title =destinationTVC.selectionString;
        [destinationTVC setDelegate:self];

    }
    else
    if([segue.identifier isEqualToString:@"SnoozeSegueId"])
    {
        //  NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        
        
        SnoozeAlarmAttributesTableViewController *destinationTVC=(SnoozeAlarmAttributesTableViewController*)[navController topViewController];
        
        destinationTVC.selectionString=@"Snooze";
        destinationTVC.snoozeArray = snoozeArray;
        destinationTVC.title =destinationTVC.selectionString;

      //  NSLog(@"selected number of rows : %lu",destinationTVC.);
        [destinationTVC setDelegate:self];
    }
    else
    if([segue.identifier isEqualToString:@"LabelSegueId"])
    {
        UINavigationController *navController = (UINavigationController*)[segue destinationViewController];
        SnoozeAlarmAttributesTableViewController *destinationTVC=(SnoozeAlarmAttributesTableViewController*)[navController topViewController];
        
        destinationTVC.selectionString=@"Label";
        destinationTVC.title =destinationTVC.selectionString;
        
        //  NSLog(@"selected number of rows : %lu",destinationTVC.);
        [destinationTVC setDelegate:self];
    }
    

}

#pragma mark - 
#pragma mark - Protocol Methods

-(void) setSnoozeLabel:(NSString *)snoozeLabel
{
   alarmLabel=snoozeLabel;    
}

-(void) setSelectionRepeats:(NSMutableArray *)selectionRepeatsArray
{
     selectionRepeats=selectionRepeatsArray;
}

-(void) setSelectionSnoozeInterval:(NSNumber *)snoozeIntervalPassed
{
    snoozeInterval=snoozeIntervalPassed;
    
}

@end
