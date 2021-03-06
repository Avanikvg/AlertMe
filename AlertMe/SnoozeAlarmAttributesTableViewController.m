//
//  SnoozeAlarmAttributesTableViewController.m
//  AlertMe
//
//  Created by AVANI SAMBARAJU on 4/6/15.
//  Copyright (c) 2015 AVANI SAMBARAJU. All rights reserved.
//

#import "SnoozeAlarmAttributesTableViewController.h"
#import <UIKit/UIKit.h>





@interface SnoozeAlarmAttributesTableViewController ()

@property(strong,nonatomic) NSNumber* selectedSnooze;
@property(readonly, copy) NSIndexSet *selectedRowIndexes;

@end


@implementation SnoozeAlarmAttributesTableViewController

@synthesize delegate,snoozeLabel;
//@synthesize passedMessage;
@synthesize labelTextField,selectionRepeatsArray,snoozeInterval;


@synthesize snoozeArray,repeatArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setTableFooterView:[UIView new] ];
    
    selectionRepeatsArray = [[NSMutableArray alloc]init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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
        {
            labelTextField = [[UITextField alloc]initWithFrame: CGRectMake(self.tableView.bounds.size.width/3, self.tableView.bounds.size.height/3, 40, 20)];
            
            labelTextField.placeholder=@"enter the label";
            labelTextField.borderStyle=UITextBorderStyleRoundedRect;
            
            [self.tableView addSubview:labelTextField];
            self.tableView.rowHeight = self.tableView.bounds.size.height;
            
        }
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

/*
- (NSIndexPath*)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    for ( NSIndexPath* selectedIndexPath in tableView.indexPathsForSelectedRows ) {
        if ( selectedIndexPath.section == indexPath.section )
            [tableView deselectRowAtIndexPath:selectedIndexPath animated:NO] ;
    }
    return indexPath ;
}

*/
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
             self.selectedSnooze = [NSNumber numberWithInteger:newIndexPath.row];
         }
        [self.tableView deselectRowAtIndexPath:newIndexPath animated:YES];
        
        snoozeInterval = self.selectedSnooze;
    }
    
    else if ([_selectionString isEqualToString:@"Repeat"])
    {
        
        [theTableView deselectRowAtIndexPath:[theTableView indexPathForSelectedRow] animated:NO];
        
        UITableViewCell *cell = [theTableView cellForRowAtIndexPath:newIndexPath];
        
        [selectionRepeatsArray addObject:newIndexPath];
        
        
        NSLog(@" count in selected day =  %@ ",cell.textLabel.text);
        
        if (cell.accessoryType == UITableViewCellAccessoryNone)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
        }
        else
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    
    }
}


- (IBAction)saveSettings:(UIBarButtonItem *)sender {
    
   // [self dismissViewControllerAnimated:YES completion:nil];

    if ([_selectionString isEqualToString:@"Label"])
    {
        snoozeLabel = labelTextField.text;
        [[self delegate ] setSnoozeLabel:snoozeLabel];
    }
    else if ([_selectionString isEqualToString:@"Snooze"])
    {
        NSLog(@"inside the snooze interval %@",snoozeInterval);
        [[self delegate] setSelectionSnoozeInterval:snoozeInterval];
    }
    else if ([_selectionString isEqualToString:@"Repeat"])
    {
        NSLog(@"inside the save settings snooze delegate");
        [[self delegate] setSelectionRepeats: selectionRepeatsArray];
    }

    NSLog(@" inside save method : %lu",[selectionRepeatsArray count] );
    //[self.navigationController popViewControllerAnimated:YES];
}


@end
