//
//  SnoozeAlarmAttributesTableViewController.m
//  AlertMe
//
//  Created by AVANI SAMBARAJU on 4/6/15.
//  Copyright (c) 2015 AVANI SAMBARAJU. All rights reserved.
//

#import "SnoozeAlarmAttributesTableViewController.h"
#import <UIKit/UIKit.h>

#define SUNDAY "Sunday"
#define MONDAY "Monday"
#define TUESDAY "Tuesday"
#define WEDNESDAY "Wednesday"
#define THURSDAY "Thursday"
#define FRIDAY "Friday"
#define SATURDAY "Saturday"

#define ONE "1"
#define THREE "3"
#define FIVE "5"
#define TEN "10"

@interface SnoozeAlarmAttributesTableViewController ()

@property(assign,nonatomic) NSUInteger selectedSnooze;
@property(readonly, copy) NSIndexSet *selectedRowIndexes;

@end


@implementation SnoozeAlarmAttributesTableViewController

NSArray *snoozeArray,*repeatArray;


BOOL multipleSelection = @"NO";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor redColor];
    
    snoozeArray = [[NSArray alloc]initWithObjects:@ONE,@THREE,@FIVE,@TEN,nil] ;
    
    repeatArray = [[NSArray alloc]initWithObjects:@SUNDAY,@MONDAY,@TUESDAY,@WEDNESDAY,@THURSDAY,@FRIDAY,@SATURDAY,nil];
    
        //[self.tableView registerNib:[UINib nibWithNibName:@"SnoozeAlarmAttributesTableViewController" bundle:nil] forCellReuseIdentifier:@"SnoozeAlarmIdentifier"];
    
   // [[SnoozeAlarmAttributesTableViewController alloc] initWithNibName:@"SnoozeAlarmAttributesTableViewController" bundle:nil];

    
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
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 0;
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if([_selectionString isEqualToString:@"Snooze"]){
        return [snoozeArray count];
    }
    else
        if([_selectionString isEqualToString:@"Repeat"]){
            return [repeatArray count];
        }
    else
    // Return the number of rows in the section.
    return 1;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

static NSString *cellReuseIdentifier =@"reuseIdentifier";

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSLog(@" inside cell row for index path");

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    if(!cell) {
        
        [self.tableView registerNib:[UINib nibWithNibName:@"SnoozeAlarmAttributesTableViewController" bundle:nil] forCellReuseIdentifier:@"reuseIdentifier"];

        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
    }
    if([_selectionString isEqualToString:@"Snooze"])
    {
        cell.textLabel.text =[snoozeArray objectAtIndex:indexPath.row];
    }
    
    else
    if([_selectionString isEqualToString:@"Repeat"])
        cell.textLabel.text =[repeatArray objectAtIndex:indexPath.row];

    else
        if([_selectionString isEqualToString:@"Label"])
            cell.textLabel.text =@"Enter the label";
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath

{
    return 3;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    for ( NSIndexPath* selectedIndexPath in tableView.indexPathsForSelectedRows ) {
        if ( selectedIndexPath.section == indexPath.section )
            [tableView deselectRowAtIndexPath:selectedIndexPath animated:NO] ;
    }
    return indexPath ;
}

- (void)tableView:(UITableView *)theTableView
didSelectRowAtIndexPath:(NSIndexPath *)newIndexPath {
    
    if([_selectionString isEqualToString:@"Snooze"])
    {

        // only single selection allowed
        
         if(newIndexPath.row != self.selectedSnooze)
         {
             if(self.selectedSnooze!=NSNotFound)
             {
                 NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:self.selectedSnooze inSection:0];
                 UITableViewCell *oldCell = [self.tableView cellForRowAtIndexPath:oldIndexPath];
                 oldCell.accessoryType = UITableViewCellAccessoryNone;
             }
             UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:newIndexPath];
             cell.accessoryType = UITableViewCellAccessoryCheckmark;
             self.selectedSnooze = newIndexPath.row;
         }
        [self.tableView deselectRowAtIndexPath:newIndexPath animated:YES];
    }
    
    else
    {
        
        [theTableView deselectRowAtIndexPath:[theTableView indexPathForSelectedRow] animated:NO];
        
        //Multiple selection is allowed
        
        UITableViewCell *cell = [theTableView cellForRowAtIndexPath:newIndexPath];
        
        if (cell.accessoryType == UITableViewCellAccessoryNone)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
        }
        else if
            (cell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            cell.accessoryType = UITableViewCellAccessoryNone;

        }
    
    }
}

- (IBAction)saveAlarmAttributes:(UIBarButtonItem *)sender {
    
    NSLog(@" inside save method : %lu",self.selectedRowIndexes.count );
}

@end
