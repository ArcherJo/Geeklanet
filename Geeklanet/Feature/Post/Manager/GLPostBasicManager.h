//
//  GLPostBasicManager.h
//  Geeklanet
//
//  Created by ITLab on 2021/1/1.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../../../Network/GLPostAPI.h"
#import "../Model/GLPostBasic.h"

NS_ASSUME_NONNULL_BEGIN




@interface GLPostBasicManager : NSObject

@property (nonatomic) NSMutableArray* dataList;

- (instancetype)initWithURL:(NSString*)urlStr;

@end

NS_ASSUME_NONNULL_END
