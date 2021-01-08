//
//  GLSettingTableViewController.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/31.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLSettingTableViewController.h"

@interface GLSettingTableViewController ()

@end

@implementation GLSettingTableViewController

- (instancetype)init{
    if(self = [super init]){
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.tableFooterView=[[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0) return 3;
    else if(section==1) return 1;
    else if(section==2) return 2;
    else if(section==3) return 1;
    else return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0) return 0;
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* view=[[UIView alloc] init];
    view.backgroundColor=UIColorFromHex(0xF2F3F7);
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int section=(int)indexPath.section,row=(int)indexPath.row;
    UITableViewCell* cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableviewCell"];
    UILabel* textLabel=[[UILabel alloc] init];
    [cell.contentView addSubview:textLabel];
    textLabel.frame=CGRectMake(20, 5, 100, 40);
    if(section == 0){
        if(row == 0){
            textLabel.text=@"猩球ID";
            UILabel* contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(300, 10, 100, 30)];
            contentLabel.text=@"1543827185";
            [cell.contentView addSubview:contentLabel];
        }else if(row == 1){
            textLabel.text=@"昵称";
            UILabel* contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(330, 10, 50, 30)];
            contentLabel.text=@"smilyt";
            [cell.contentView addSubview:contentLabel];
            UIImageView* arrow=[[UIImageView alloc] initWithFrame:CGRectMake(380, 15, 20, 20)];
            arrow.image=[UIImage imageNamed:@"arrow"];
            [cell.contentView addSubview:arrow];
        }else if(row == 2){
            textLabel.text=@"性别";
            UILabel* contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(360, 10, 50, 30)];
            contentLabel.text=@"女";
            [cell.contentView addSubview:contentLabel];
            UIImageView* arrow=[[UIImageView alloc] initWithFrame:CGRectMake(380, 15, 20, 20)];
            arrow.image=[UIImage imageNamed:@"arrow"];
            [cell.contentView addSubview:arrow];
        }
    }else if(section == 1){
        if(row == 0){
            textLabel.text=@"夜间模式";
            UISwitch* swi=[[UISwitch alloc] initWithFrame:CGRectMake(350, 10, 60, 30)];
            [cell.contentView addSubview:swi];
        }
    }else if(section == 2){
        if(row == 0){
            textLabel.text=@"版本";
            UILabel* contentLabel=[[UILabel alloc] initWithFrame:CGRectMake(370, 10, 50, 30)];
            contentLabel.text=@"v1.0";
            [cell.contentView addSubview:contentLabel];
        }else if(row == 1){
            textLabel.text=@"关于猩球";
            UIImageView* arrow=[[UIImageView alloc] initWithFrame:CGRectMake(380, 15, 20, 20)];
            arrow.image=[UIImage imageNamed:@"arrow"];
            [cell.contentView addSubview:arrow];
        }
    }else if(section == 3){
        if(row == 0){
            textLabel.text=@"退出登录";
            textLabel.textColor = [UIColor redColor];
            textLabel.textAlignment = NSTextAlignmentCenter;
            textLabel.frame=CGRectMake(160, 5, 100, 40);
            [cell.contentView addSubview:textLabel];
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 3){
        GLAccountViewController* accountVC=[[GLAccountViewController alloc] init];
        [self.navigationController pushViewController:accountVC animated:YES];
    }
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
*/

/*
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

@end
