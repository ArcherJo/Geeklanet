//
//  GLPostBasicTableViewController.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/29.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLPostBasicTableViewController.h"

@interface GLPostBasicTableViewController ()

@property (nonatomic) GLPostBasicManager* manager;
@property (nonatomic) NSMutableArray* dataList;

@end

@implementation GLPostBasicTableViewController

#pragma mark - init

- (instancetype)init{
    if(self = [super init]){
        self.manager=[[GLPostBasicManager alloc] init];
        self.dataList=[[NSMutableArray alloc] init];
        int cnt=(int)self.manager.dataList.count;
        for(int i=0;i<cnt;i++){
            GLPostBasicTableViewCell* cell=[[GLPostBasicTableViewCell alloc] initWithGLPostBasic:self.manager.dataList[i]];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            [self.dataList addObject:cell];
        }
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section==0) return 0;
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int section=(int)indexPath.section;
    return [self.dataList[section] getCellHeight];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* view=[[UIView alloc] init];
    view.backgroundColor=UIColorFromHex(0xF2F3F7);
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int section=(int)indexPath.section;
    return self.dataList[section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GLPostDetailViewController* detailVC=[[GLPostDetailViewController alloc] init];
    UINavigationController *rootNav = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [rootNav pushViewController:detailVC animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.delegate){
        [self.delegate didScroll:scrollView];
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

-(void)viewDidLoad{
    [super viewDidLoad];
}

@end
