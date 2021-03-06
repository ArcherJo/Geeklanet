//
//  GLUserFanTableViewController.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLUserListTableViewController.h"

@interface GLUserListTableViewController ()

@property (nonatomic) NSMutableArray* dataList;

@end

@implementation GLUserListTableViewController

#pragma mark - init
//- (instancetype)initWithUserID:(NSString*)userID{
//    if(self = [super init]){
//        self.dataList=[[NSMutableArray alloc] init];
//        self.manager=[[GLAttendManager alloc] initWithUserID:userID];
//    }
//    return self;
//}

- (instancetype)initFollowsBaseInfoFrom:(NSString*)userID{
    if(self = [super init]){
        self.dataList= [[NSMutableArray alloc] init];
        
        for(GLUserBaseInfo* baseInfo in [GLUserManager getFollowsBaseInfoBy:userID]){
            GLUserListTableViewCell* cell=[[GLUserListTableViewCell alloc] initWithUserBaseInfo:baseInfo];
            [self.dataList addObject:cell];
        }
    }
    return self;
}

- (instancetype)initFansBaseInfoFrom:(NSString*)userID{
    if(self = [super init]){
        self.dataList= [[NSMutableArray alloc] init];
        
        for(GLUserBaseInfo* baseInfo in [GLUserManager getFansBaseInfoBy:userID]){
            GLUserListTableViewCell* cell=[[GLUserListTableViewCell alloc] initWithUserBaseInfo:baseInfo];
            [self.dataList addObject:cell];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int row=(int)indexPath.row;
    return self.dataList[row];
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
