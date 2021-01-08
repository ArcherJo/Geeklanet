//
//  GLTabBarViewController.m
//  Geeklanet
//
//  Created by ITLab on 2021/1/8.
//  Copyright © 2021 A_Jo-Smilyt. All rights reserved.
//

#import "GLTabBarViewController.h"

@interface GLTabBarViewController ()

@property (nonatomic,assign) NSInteger  indexFlag;

@end

@implementation GLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index != self.indexFlag) {
        NSMutableArray *arry = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [arry addObject:btn];
            }
        }

        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
        animation.values = @[@0.0, @-4.15, @-7.26, @-9.34, @-10.37, @-9.34, @-7.26, @-4.15, @0.0, @2.0, @-2.9, @-4.94, @-6.11, @-6.42, @-5.86, @-4.44, @-2.16, @0.0];
        animation.duration = 0.8;
        animation.beginTime = CACurrentMediaTime() + 0.2;
        [[arry[index] layer] addAnimation:animation forKey:nil];
        self.indexFlag = index;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
