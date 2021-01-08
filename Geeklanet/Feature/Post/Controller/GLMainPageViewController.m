//
//  GLMainPageViewController.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/29.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLMainPageViewController.h"

@interface GLMainPageViewController ()<UIScrollViewDelegate>

@property (strong,nonatomic) UILabel* navigationBar;
@property (strong,nonatomic) UIButton* follow;
@property (strong,nonatomic) UIButton* recommend;
@property (strong,nonatomic) UIButton* popular;
@property (strong,nonatomic) UILabel* slider;

@property (strong,nonatomic) UIScrollView* mainScroll;
@property (strong,nonatomic) GLPostBasicTableViewController* followTable;
@property (strong,nonatomic) GLPostBasicTableViewController* recommendTable;
@property (strong,nonatomic) GLPostBasicTableViewController* popularTable;

@property (strong,nonatomic) UIButton* sendPost;


@end

@implementation GLMainPageViewController

-(instancetype)init{
    if (self = [super init]){
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.mainScroll addSubview:self.followTable.view];
    [self addChildViewController:self.followTable];
    [self.mainScroll addSubview:self.recommendTable.view];
    [self addChildViewController:self.recommendTable];
    [self.mainScroll addSubview:self.popularTable.view];
    [self addChildViewController:self.popularTable];
    [self.view addSubview:self.mainScroll];
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.follow];
    [self.view addSubview:self.recommend];
    [self.view addSubview:self.popular];
    [self.view addSubview:self.slider];
    [self.view addSubview:self.sendPost];
    
}


-(void)viewWillLayoutSubviews{
    CGFloat navHeight = [GLPostConfigurator getNavHeight];
    CGFloat tabbarHeight = 100;
    CGRect frameHelper1 = self.view.frame;
    frameHelper1.size.height-=navHeight+tabbarHeight;
    self.followTable.view.frame = frameHelper1;
    frameHelper1.origin.x += frameHelper1.size.width;
    self.recommendTable.view.frame = frameHelper1;
    frameHelper1.origin.x += frameHelper1.size.width;
    self.popularTable.view.frame =frameHelper1;
    
    self.mainScroll.frame = CGRectMake(0, navHeight, self.view.frame.size.width, self.view.frame.size.height-navHeight-tabbarHeight);
    self.mainScroll.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height-navHeight-tabbarHeight);
    [self.mainScroll setContentOffset:CGPointMake(0, 0) animated:NO];
    
    self.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, navHeight);
    
    CGFloat contentHeight = [GLPostConfigurator getNavContentHeight];
    CGSize buttonSize = [GLPostConfigurator getNavButtonSize];
    CGRect frameHelper2;
    frameHelper2.origin.x = buttonSize.width;
    frameHelper2.origin.y = navHeight-contentHeight;
    frameHelper2.size.width=(self.view.frame.size.width-2*buttonSize.width)/3;
    frameHelper2.size.height = contentHeight;
    self.follow.frame = frameHelper2;
    frameHelper2.origin.x += frameHelper2.size.width;
    self.recommend.frame = frameHelper2;
    frameHelper2.origin.x += frameHelper2.size.width;
    self.popular.frame = frameHelper2;
    
    CGFloat sliderHeight = [GLPostConfigurator getSliderHeight];
    
    self.slider.frame = CGRectMake(buttonSize.width, navHeight-sliderHeight, frameHelper2.size.width, sliderHeight);
    self.slider.layer.cornerRadius = sliderHeight/2;
    

    CGRect frameHelper3;
    frameHelper3.origin.x = 15;
    frameHelper3.origin.y = navHeight-contentHeight+5;
    frameHelper3.size = CGSizeMake(30, contentHeight-10);
    self.sendPost.frame=frameHelper3;
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGSize buttonSize = [GLPostConfigurator getNavButtonSize];
    CGFloat ration = 3*self.view.frame.size.width/(self.view.frame.size.width-2*buttonSize.width);
    
    
    CGRect frame = self.slider.frame;
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    
    frame.origin.x = buttonSize.width+contentOffsetX/ration;
    self.slider.frame = frame;
    
    UIButton *btn;
    if (contentOffsetX<=self.view.frame.size.width*0.5){
        btn=self.follow;
    }else if (contentOffsetX<=self.view.frame.size.width*1.5){
        btn=self.recommend;
    }else {
        btn=self.popular;
    }
    [self selectBtn:btn];
}


-(void)sliderButton:(UIButton*)sender{
    [self selectBtn:sender];
    [UIView animateWithDuration:0.3 animations:^{
        self.mainScroll.contentOffset = CGPointMake(self.view.frame.size.width*(sender.tag-1), 0);
    } completion:^(BOOL finished) {}];
}

-(void)selectBtn:(UIButton*)button{
    self.follow.selected=NO;
    self.follow.titleLabel.font=[UIFont boldSystemFontOfSize:[GLPostConfigurator getDefaultFontsize]];
    self.recommend.selected=NO;
    self.recommend.titleLabel.font=[UIFont boldSystemFontOfSize:[GLPostConfigurator getDefaultFontsize]];
    self.popular.selected=NO;
    self.popular.titleLabel.font=[UIFont boldSystemFontOfSize:[GLPostConfigurator getDefaultFontsize]];
    
    button.selected=YES;
    button.titleLabel.font=[UIFont boldSystemFontOfSize:[GLPostConfigurator getSelectedFontsize]];
    
}


-(UIScrollView*)mainScroll{
    if (_mainScroll==nil){
        _mainScroll = [[UIScrollView alloc] init];
        _mainScroll.pagingEnabled = YES;
        _mainScroll.delegate = self;
        _mainScroll.showsHorizontalScrollIndicator = NO;
        _mainScroll.showsVerticalScrollIndicator = NO;
        _mainScroll.bounces=NO;
    }
    
    return _mainScroll;
}


-(GLPostBasicTableViewController*)followTable{
    if (_followTable==nil){
        _followTable = [[GLPostBasicTableViewController alloc] init];
        _followTable.tableView.contentInset = UIEdgeInsetsMake(0, 0, 700, 0);
    }
    
    return _followTable;
}


-(GLPostBasicTableViewController*)recommendTable{
    if (_recommendTable==nil){
        _recommendTable = [[GLPostBasicTableViewController alloc] init];
        _recommendTable.tableView.contentInset = UIEdgeInsetsMake(0, 0, 700, 0);
        
    }
    
    return _recommendTable;
}


-(GLPostBasicTableViewController*)popularTable{
    if (_popularTable==nil){
        _popularTable = [[GLPostBasicTableViewController alloc] init];
        _popularTable.tableView.contentInset = UIEdgeInsetsMake(0, 0, 700, 0);
        
    }
    
    return _popularTable;
}

-(UILabel*) navigationBar{
    if(_navigationBar==nil){
        _navigationBar = [[UILabel alloc] init];
        _navigationBar.backgroundColor = [GLPostConfigurator getNavColor];
    }
    return _navigationBar;
}

-(UIButton*) follow{
    if (_follow==nil){
        _follow = [UIButton buttonWithType:UIButtonTypeCustom];
        [_follow setTitleColor:[GLPostConfigurator getSelectedColor] forState:UIControlStateSelected];
        [_follow setTitleColor:[GLPostConfigurator getDefaultColor] forState:UIControlStateNormal];
        _follow.titleLabel.font = [UIFont boldSystemFontOfSize:[GLPostConfigurator getSelectedFontsize]];
        [_follow setTitle:@"关注" forState:UIControlStateNormal];
        _follow.tag = 1;
        _follow.selected = YES;
        [_follow addTarget:self action:@selector(sliderButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _follow;
}

-(UIButton*) recommend{
    if (_recommend==nil){
        _recommend = [UIButton buttonWithType:UIButtonTypeCustom];
        [_recommend setTitleColor:[GLPostConfigurator getSelectedColor] forState:UIControlStateSelected];
        [_recommend setTitleColor:[GLPostConfigurator getDefaultColor] forState:UIControlStateNormal];
        _recommend.titleLabel.font = [UIFont boldSystemFontOfSize:[GLPostConfigurator getDefaultFontsize]];
        [_recommend setTitle:@"推荐" forState:UIControlStateNormal];
        _recommend.tag = 2;
        _recommend.selected = NO;
        [_recommend addTarget:self action:@selector(sliderButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _recommend;
    
}

-(UIButton*) popular{
    if (_popular==nil){
        _popular = [UIButton buttonWithType:UIButtonTypeCustom];
        [_popular setTitleColor:[GLPostConfigurator getSelectedColor] forState:UIControlStateSelected];
        [_popular setTitleColor:[GLPostConfigurator getDefaultColor] forState:UIControlStateNormal];
        _popular.titleLabel.font = [UIFont boldSystemFontOfSize:[GLPostConfigurator getDefaultFontsize]];
        [_popular setTitle:@"热门" forState:UIControlStateNormal];
        _popular.tag = 3;
        _popular.selected = NO;
        [_popular addTarget:self action:@selector(sliderButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _popular;
    
}

-(UILabel*) slider{
    if (_slider==nil){
        _slider = [[UILabel alloc] init];
        _slider.backgroundColor = [GLPostConfigurator getSliderColor];
        _slider.layer.masksToBounds = YES;
    }
    return _slider;
}


-(UIButton*) sendPost{
    if (_sendPost==nil){
        _sendPost = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendPost setImage:[UIImage imageNamed:@"new"] forState:UIControlStateNormal];
        [_sendPost addTarget:self action:@selector(submitPost:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendPost;
}

#pragma mark -response

-(void) submitPost:(UIButton*)sender{
    GLPostSubmitViewController* submitVC=[[GLPostSubmitViewController alloc] init];
    UINavigationController *rootNav = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    [rootNav pushViewController:submitVC animated:YES];
}

@end
