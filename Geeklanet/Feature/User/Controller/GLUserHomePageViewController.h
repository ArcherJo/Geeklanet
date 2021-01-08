//
//  GLUserHomePageViewController.h
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Manager/GLUserManager.h"
#import "../../../Config/GLUserConfigurator.h"
#import "../../Post/Controller/GLPostBasicTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLUserHomePageViewController : UIViewController

- (instancetype)initWithUserID:(NSString*)userID;

@end

NS_ASSUME_NONNULL_END
