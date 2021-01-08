//
//  GLUserListTableViewController.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/4.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../../Config/GLUserConfigurator.h"
#import "../Manager/GLUserManager.h"
#import "../View/GLUserListTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLUserListTableViewController : UITableViewController

- (instancetype)initFollowsBaseInfoFrom:(NSString*)userID;
- (instancetype)initFansBaseInfoFrom:(NSString*)userID;

@end

NS_ASSUME_NONNULL_END
