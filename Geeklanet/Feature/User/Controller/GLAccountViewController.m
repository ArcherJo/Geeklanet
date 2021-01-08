//
//  GLAccountViewController.m
//  Geeklanet
//
//  Created by ITLab on 2020/12/30.
//  Copyright © 2020 A_Jo-Smilyt. All rights reserved.
//

#import "GLAccountViewController.h"

@interface GLAccountViewController ()

@property (strong, nonatomic) UILabel *appName;
@property (strong, nonatomic) UILabel *appSlogan;
@property (strong, nonatomic) UIImageView *appIcon;

@property (strong, nonatomic) UITextField *email;
@property (strong, nonatomic) UITextField *name;
@property (strong, nonatomic) UITextField *password;
@property (strong, nonatomic) UITextField *passwordConfirm;

@property (strong, nonatomic) UIButton *goSignIn;
@property (strong, nonatomic) UIButton *goSignUp;
@property (strong, nonatomic) UIButton *signIn;
@property (strong, nonatomic) UIButton *signUp;

@property (nonatomic) BOOL signFlag;

@end


@implementation GLAccountViewController

#pragma mark - init

- (instancetype)init {
    if(self=[super init]){
        _signFlag = false;
    }
    
    return self;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self willLayoutSubviews];
    
    [self.view addSubview:self.appName];
    [self.view addSubview:self.appSlogan];
    [self.view addSubview:self.appIcon];
    
    [self.view addSubview:self.email];
    [self.view addSubview:self.name];
    [self.view addSubview:self.password];
    [self.view addSubview:self.passwordConfirm];
    
    [self.view addSubview:self.goSignIn];
    [self.view addSubview:self.goSignUp];
    [self.view addSubview:self.signUp];
    [self.view addSubview:self.signIn];
}

- (void)willLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.appName.frame=CGRectMake(207-150, 280, 300, 50);
    self.appSlogan.frame=CGRectMake(207-150, 340, 300, 30);
    self.appIcon.frame=CGRectMake(207-75, 120, 150, 150);
    
    self.email.frame=CGRectMake(-300, 300, 300, 50);
    self.name.frame=CGRectMake(40, 380, 300, 50);
    self.password.frame=CGRectMake(40, 460, 600, 50);
    self.passwordConfirm.frame=CGRectMake(-300, 540, 300, 50);
    
    self.goSignIn.frame=CGRectMake(414-40-30, 725, 60, 30);
    self.goSignUp.frame=CGRectMake(414-40-30, 725, 60, 30);
    self.signUp.frame=CGRectMake(100, 550, 200, 40);
    self.signIn.frame=CGRectMake(100, 550, 200, 40);
}

#pragma mark - response

- (void)getSignInPage:(UIButton*)sender{
    [UIView animateWithDuration:1.0 animations:^{
        self.appIcon.transform = CGAffineTransformIdentity;
        self.appName.transform = CGAffineTransformIdentity;
        self.appSlogan.transform = CGAffineTransformIdentity;
        self.email.transform = CGAffineTransformIdentity;
        self.passwordConfirm.transform = CGAffineTransformIdentity;
        self.goSignIn.transform = CGAffineTransformIdentity;
        self.goSignUp.transform = CGAffineTransformIdentity;
        self.signIn.transform = CGAffineTransformIdentity;
        self.signUp.transform = CGAffineTransformIdentity;
        self.goSignUp.alpha=1;
        self.signIn.alpha=1;
    }];
}

- (void)getSignUpPage:(UIButton*)sender{
    [UIView animateWithDuration:1.0 animations:^{
        self.appIcon.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(-120, -20),0.8,0.8);
        self.appName.transform = CGAffineTransformScale(CGAffineTransformMakeTranslation(40, -130),0.7,0.7);
        self.appSlogan.transform = CGAffineTransformMakeTranslation(35, -140);
        
        self.email.transform = CGAffineTransformMakeTranslation(340, 0);
        self.passwordConfirm.transform = CGAffineTransformMakeTranslation(340, 0);
        
        self.goSignIn.transform = CGAffineTransformMakeTranslation(-304, 0);
        self.goSignUp.transform = CGAffineTransformMakeTranslation(-304, 0);
        self.goSignUp.alpha=0;
        
        self.signIn.transform = CGAffineTransformMakeTranslation(0, 100);
        self.signIn.alpha=0;
        self.signUp.transform = CGAffineTransformMakeTranslation(0, 100);
    }];
}

- (void)postSignIn:(UIButton*)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//- (void)postSignUp:(UIButton*)sender{
//    [self.navigationController popViewControllerAnimated:YES];
//}

#pragma mark - getters and setters

- (UILabel*)appName{
    if(_appName == nil){
        _appName=[[UILabel alloc] init];
        _appName.text=@"Geeklanet: 猩 球";
        _appName.font = [UIFont systemFontOfSize:29];
        _appName.textAlignment=NSTextAlignmentCenter;
    }
    return _appName;
}

- (UILabel*)appSlogan{
    if(_appSlogan == nil){
        _appSlogan=[[UILabel alloc] init];
        _appSlogan.text=@"汇集每一缕猩光～";
        _appSlogan.textAlignment=NSTextAlignmentCenter;
    }
    return _appSlogan;
}

- (UIImageView*)appIcon{
    if(_appIcon == nil){
        _appIcon=[[UIImageView alloc] init];
        _appIcon.image=[UIImage imageNamed:@"appicon"];
    }
    return _appIcon;
}

- (UITextField *)email{
    if (_email == nil) {
        _email = [[UITextField alloc] init];
        _email.autocapitalizationType=UITextAutocapitalizationTypeNone;
        _email.layer.borderColor=UIColor.clearColor.CGColor;
        _email.layer.borderWidth=0;
        _email.placeholder = @"邮箱";
    }
    return _email;
}

- (UITextField *)name{
    if(_name == nil){
        _name=[[UITextField alloc] init];
        _name.autocapitalizationType=UITextAutocapitalizationTypeNone;
        _name.layer.borderColor=UIColor.clearColor.CGColor;
        _name.layer.borderWidth=0;
        _name.placeholder = @"用户名";
    }
    return _name;
}

- (UITextField *)password{
    if(_password == nil){
        _password=[[UITextField alloc] init];
        _password.autocapitalizationType=UITextAutocapitalizationTypeNone;
        _password.layer.borderColor=UIColor.clearColor.CGColor;
        _password.layer.borderWidth=0;
        _password.secureTextEntry=YES;
        _password.placeholder = @"密码";
    }
    return _password;
}

- (UITextField *)passwordConfirm{
    if(_passwordConfirm == nil){
        _passwordConfirm=[[UITextField alloc] init];
        _passwordConfirm.autocapitalizationType=UITextAutocapitalizationTypeNone;
        _passwordConfirm.layer.borderColor=UIColor.clearColor.CGColor;
        _passwordConfirm.layer.borderWidth=0;
        _passwordConfirm.secureTextEntry=YES;
        _passwordConfirm.placeholder = @"确认密码";
    }
    return _passwordConfirm;
}

- (UIButton*)goSignIn{
    if(_goSignIn==nil){
        _goSignIn=[[UIButton alloc] init];
        [_goSignIn setTitle:@"登录" forState:UIControlStateNormal];
        _goSignIn.layer.cornerRadius=[GLAccountConfigurator getGoButtonCornerRadius];
        _goSignIn.layer.borderWidth=[GLAccountConfigurator getGoButtonBorderWidth];
        _goSignIn.backgroundColor=[GLAccountConfigurator getFollowButtonColor];
        [_goSignIn addTarget:self action:@selector(getSignInPage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goSignIn;
}

- (UIButton*)goSignUp{
    if(_goSignUp==nil){
        _goSignUp=[[UIButton alloc] init];
        [_goSignUp setTitle:@"注册" forState:UIControlStateNormal];
        _goSignUp.layer.cornerRadius=[GLAccountConfigurator getGoButtonCornerRadius];
        _goSignUp.layer.borderWidth=[GLAccountConfigurator getGoButtonBorderWidth];
        _goSignUp.backgroundColor=[GLAccountConfigurator getFollowButtonColor];
        [_goSignUp addTarget:self action:@selector(getSignUpPage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goSignUp;
}

- (UIButton*)signIn{
    if(_signIn==nil){
        _signIn=[[UIButton alloc] init];
        [_signIn setTitle:@"登录" forState:UIControlStateNormal];
        _signIn.layer.cornerRadius=[GLAccountConfigurator getButtonCornerRadius];
        _signIn.layer.borderWidth=[GLAccountConfigurator getButtonBorderWidth];
        _signIn.backgroundColor=UIColor.orangeColor;
        [_signIn addTarget:self action:@selector(postSignIn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _signIn;
}

- (UIButton*)signUp{
    if(_signUp==nil){
        _signUp=[[UIButton alloc] init];
        [_signUp setTitle:@"注册" forState:UIControlStateNormal];
        _signUp.layer.cornerRadius=[GLAccountConfigurator getButtonCornerRadius];
        _signUp.layer.borderWidth=[GLAccountConfigurator getButtonBorderWidth];
        _signUp.backgroundColor=UIColor.orangeColor;
        [_signUp addTarget:self action:@selector(postSignUp:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _signUp;
}

@end
