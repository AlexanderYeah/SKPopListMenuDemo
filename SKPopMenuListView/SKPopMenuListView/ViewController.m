//
//  ViewController.m
//  SKPopMenuListView
//
//  Created by AY on 2017/11/13.
//  Copyright © 2017年 AY. All rights reserved.
//

#import "ViewController.h"
#import "SKPopMenuListView.h"
#define kPopLeftPadding 60
@interface ViewController ()<SKPopMenuSelectDelegate>

@property (nonatomic,strong)SKPopMenuListView *popListView;


@property (nonatomic,strong)UIView *bgView;

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	
		
	UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn setTitle:@"show" forState:UIControlStateNormal];
	btn.frame = CGRectMake(0, 150, 100, 40);
	btn.backgroundColor = SKRandomColor;
	[btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn];
	
	_bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
	_bgView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.6];
	_bgView.userInteractionEnabled = YES;
	_bgView.hidden = YES;

	
	[self.view addSubview:_bgView];
	
	
	
	_popListView = [[SKPopMenuListView alloc]init];
	_popListView.backgroundColor = SKRandomColor;
	_popListView.layer.cornerRadius = 5;
	_popListView.layer.masksToBounds = YES;
	_popListView.delegate = self;
	_popListView.titleLbl.text = @"价格区间";
	_popListView.dataArr = @[@"100-300",@"300-500",@"500-700",@"800-1500",@"100-300",@"300-500",@"500-700",@"800-1500"];
	[_bgView addSubview:_popListView];
	[_popListView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.width.equalTo(SCREEN_WIDTH - 2 * kPopLeftPadding);
			make.height.equalTo(300);
			make.top.equalTo(_bgView.mas_top).offset(-300);
			make.centerX.equalTo(_bgView.mas_centerX);
	}];

	
}

- (void)btnClick
{

	_bgView.hidden = NO;
	// 弹出
	// Damping 值越小 越有弹性
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
        self.popListView.frame = CGRectMake(kPopLeftPadding, 150, SCREEN_WIDTH - 2 * kPopLeftPadding, 300);
		
    } completion:nil];
	
}

// MARK: 代理方法 用户选择结果
- (void)selectResultWithString:(NSString *)str
{
	
	SKLog(@"%@", str);
	_bgView.hidden = YES;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

	_bgView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
