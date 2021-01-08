//
//  GLUserHomePageViewController.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLUserHomePageViewController.h"

@interface GLUserHomePageViewController ()<UISearchBarDelegate,GLPostBasicDelegate>

@property (nonatomic,strong)UILabel* navigationBar;
@property (strong,nonatomic) UILabel* topLabel;
@property (strong,nonatomic) UIButton* backBtn;
@property (strong,nonatomic) UIImageView* avatra;
@property (strong,nonatomic) UIImageView* gender;
@property (strong,nonatomic) UILabel* userName;
@property (strong,nonatomic) UILabel* userTitle;
@property (strong,nonatomic) UIButton* follow;
@property (strong,nonatomic) UISearchBar* search;

@property (strong,nonatomic) GLUserBaseInfo* baseInfo;
@property (strong,nonatomic) GLPostBasicTableViewController* userPosts;

@property (nonatomic) BOOL flag;
@property (nonatomic) int followStatus;

@end

@implementation GLUserHomePageViewController

#pragma mark - init


- (instancetype)initWithUserID:(NSString *)userID{
    if(self = [super init]){
        self.followStatus=0;
        _baseInfo = [GLUserManager getBaseInfoBy:userID];
    }
    return self;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self willLayoutSubviews];
    
    [self.view addSubview:self.userPosts.view];
    [self.view addSubview:self.topLabel];
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.avatra];
    [self.view addSubview:self.gender];
    [self.view addSubview:self.userName];
    [self.view addSubview:self.userTitle];
    [self.view addSubview:self.follow];
    [self.view addSubview:self.backBtn];
    [self addChildViewController:self.userPosts];
    [self.view addSubview:self.search];
}

- (void)willLayoutSubviews{
    
    CGFloat navHeight = [GLUserConfigurator getNavHeight];
    self.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, navHeight);
    self.backBtn.frame = CGRectMake(20, 50, 30, 30);
    self.topLabel.frame = CGRectMake(0, 0, self.view.frame.size.width, 360);
    self.backBtn.frame = CGRectMake(20, 50, 30, 30);
    
    self.avatra.frame = CGRectMake(self.view.center.x-50, 140, 100, 100);
    self.gender.frame = CGRectMake(self.view.center.x+15, 250, 20, 20);
    self.userName.frame = CGRectMake(self.view.center.x-55, 242, 80, 40);
    self.userTitle.frame = CGRectMake(self.view.center.x-60, 275, 120, 30);
    self.follow.frame = CGRectMake(self.view.center.x-40, 310, 80, 40);
    
    self.search.frame = CGRectMake(0, 360, self.view.frame.size.width, 50);
    
    self.userPosts.view.frame = self.view.frame;
    self.userPosts.tableView.contentInset = UIEdgeInsetsMake(404, 0, 0, 0);

    UIView *headerView = self.userPosts.tableView.tableHeaderView;
    CGRect frame =headerView.frame;
    frame.size.height = 0;
    headerView.frame = frame;// height 是快捷设置view高度的方法，一个UIView分类的中的方法。我不信你不懂~
    self.userPosts.tableView.tableHeaderView = headerView;
    
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.text=@"";
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return YES;
}

- (void)didScroll:(UIScrollView *)scrollView{
    CGFloat contentOffSetY = scrollView.contentOffset.y;
    
    if (contentOffSetY > -250){
        [self hideUserInfo];
        if (_flag){
            self.userPosts.tableView.contentInset=UIEdgeInsetsMake(140, 0, 0, 0);
            _flag=!_flag;
        }
    }
    else{
        [self showUserInfo];
        if (!_flag){
            self.userPosts.tableView.contentInset=UIEdgeInsetsMake(404, 0, 0, 0);
            _flag=!_flag;
        }
    }
}

-(void)hideUserInfo{
    [UIView animateWithDuration:0.2 animations:^{
        CGAffineTransform avatraTrans = CGAffineTransformMakeTranslation(-125, -125);
        avatraTrans = CGAffineTransformScale(avatraTrans, 0.3, 0.3);
        self.avatra.transform = avatraTrans;

        CGAffineTransform userNameTrans = CGAffineTransformMakeTranslation(-60, -197);
        self.userName.transform = userNameTrans;
        
        CGAffineTransform genderTrans = CGAffineTransformMakeTranslation(-60, -197);
        self.gender.transform = genderTrans;
        
        CGAffineTransform followTrans = CGAffineTransformMakeTranslation(140, -265);
        followTrans = CGAffineTransformScale(followTrans, 0.7, 0.7);
        self.follow.transform = followTrans;
        

        CGAffineTransform headerTrans = CGAffineTransformMakeTranslation(0, -360);
        self.topLabel.transform = headerTrans;
        
        self.userTitle.transform = headerTrans;
        self.userTitle.alpha = 0;
        
        self.search.transform = CGAffineTransformMakeTranslation(0, -270);
    }];
}

-(void)showUserInfo{
    [UIView animateWithDuration:0.2 animations:^{
        self.avatra.transform = CGAffineTransformIdentity;
        self.userName.transform = CGAffineTransformIdentity;
        self.gender.transform = CGAffineTransformIdentity;
        self.follow.transform = CGAffineTransformIdentity;
        self.userTitle.transform = CGAffineTransformIdentity;
        self.userTitle.alpha = 1;
        self.topLabel.transform = CGAffineTransformIdentity;
        self.search.transform = CGAffineTransformIdentity;
    }];
}

#pragma mark - response

- (void)postFollow:(UIButton*)sender{
    
}

- (void)back:(UIButton*)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)followUser:(UIButton*)sender{
    if(self.followStatus == 0){
        [self.follow setTitle:@"已关注" forState:UIControlStateNormal];
        self.followStatus=1;
        self.follow.backgroundColor=UIColorFromHex(0x707070);
    }else if(self.followStatus == 1){
        [self.follow setTitle:@"+关注" forState:UIControlStateNormal];
        self.followStatus=0;
        self.follow.backgroundColor=[GLPostConfigurator getFollowButtonColor];
    }
}

#pragma mark - getters and setters

- (UILabel*)topLabel{
    if (_topLabel == nil){
        _topLabel=[[UILabel alloc] init];
        _topLabel.text=@"";
        _topLabel.layer.borderWidth=0;
        _topLabel.backgroundColor=UIColorFromHex(0x964B67);
    }
    return _topLabel;
}



- (UIImageView*)avatra{
    if (_avatra == nil){
        _avatra=[[UIImageView alloc] init];
        _avatra.image=self.baseInfo.avatra;
        _avatra.layer.borderWidth=0;
        _avatra.layer.masksToBounds=YES;
        _avatra.layer.cornerRadius=[GLUserConfigurator getAvatraSize]/2;
    }
    return _avatra;
}

- (UIImageView*)gender{
    if(_gender == nil){
        _gender=[[UIImageView alloc] init];
        _gender.image= [self.baseInfo.gender intValue] == 1 ? [UIImage imageNamed:@"boy"] : [UIImage imageNamed:@"girl"];
        _gender.layer.borderWidth=0;
    }
    return _gender;
}

- (UIButton*)backBtn{
    if(_backBtn == nil){
        _backBtn = [[UIButton alloc] init];
        [_backBtn setImage:[UIImage imageNamed:@"arrowLeft"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchDown];
    }
    return _backBtn;
}

- (UILabel*)userName{
    if (_userName == nil){
        _userName=[[UILabel alloc] init];
        _userName.text=self.baseInfo.userName;
        _userName.textAlignment=NSTextAlignmentCenter;
    }
    return _userName;
}

- (UILabel*)userTitle{
    if (_userTitle == nil){
        _userTitle=[[UILabel alloc] init];
        _userTitle.text=self.baseInfo.userTitle;
        _userTitle.textAlignment=NSTextAlignmentCenter;
        _userTitle.textColor=[GLGlobalConfigurator getColorByLevel:[self.baseInfo.level intValue]];
    }
    return _userTitle;
}

- (UIButton*)follow{
    if (_follow == nil){
        _follow=[[UIButton alloc] init];
        _follow.layer.borderWidth=0;
        [_follow setTitle:@"+关注" forState:UIControlStateNormal];
        [_follow setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _follow.backgroundColor=[GLUserConfigurator getFollowButtonColor];
        _follow.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
        _follow.titleLabel.font=[GLUserConfigurator getButtonFont];
        _follow.layer.cornerRadius=[GLUserConfigurator getHomeAttenButtonHeight]/2;
        _follow.layer.masksToBounds=YES;
        [_follow addTarget:self action:@selector(followUser:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _follow;
}

-(UILabel*) navigationBar{
    if(_navigationBar==nil){
        _navigationBar = [[UILabel alloc] init];
        _navigationBar.backgroundColor = UIColorFromHex(0x964B67);
    }
    return _navigationBar;
}

-(GLPostBasicTableViewController*) userPosts{
    if (_userPosts==nil){
        _userPosts = [[GLPostBasicTableViewController alloc]init];
        _userPosts.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _userPosts.delegate = self;
    }
    return _userPosts;
}

- (UISearchBar*)search{
    if(_search == nil){
        _search=[[UISearchBar alloc] init];
        _search.barStyle=UIBarStyleDefault;
        //_search.showsBookmarkButton=YES;
        //_search.showsCancelButton=YES;
        _search.delegate=self;
        _search.prompt=@"";
        _search.placeholder=@"搜一搜";
    }
    return _search;
}

@end
