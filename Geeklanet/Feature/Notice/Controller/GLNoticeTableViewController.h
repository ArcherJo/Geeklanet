//
//  GLNoticeTableViewController.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Post/Controller/GLPostDetailViewController.h"
#import "../../User/Controller/GLUserHomePageViewController.h"
#import "../Manager/GLNoticeManager.h"
#import "../View/GLNoticeTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLNoticeTableViewController : UITableViewController
- (instancetype)initWithNotices:(NSMutableArray<GLNotice*>*)notices;
@end

NS_ASSUME_NONNULL_END
