//
//  GLPostBasicTableViewController.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/29.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Manager/GLPostBasicManager.h"
#import "../View/GLPostBasicTableViewCell.h"
#import "GLPostDetailViewController.h"

NS_ASSUME_NONNULL_BEGIN


@protocol GLPostBasicDelegate <NSObject>
@required
-(void)didScroll:(UIScrollView *)scrollView;
@end

@interface GLPostBasicTableViewController : UITableViewController

@property (nonatomic, weak) id<GLPostBasicDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
