//
//  SKPopMenuListView.m
//  SKPopMenuListView
//
//  Created by AY on 2017/11/13.
//  Copyright © 2017年 AY. All rights reserved.
//

#import "SKPopMenuListView.h"
#define kTbWidth SCREEN_WIDTH - 2 * 60
#define kTbHeight 250
@interface SKPopMenuListView()<UITableViewDelegate,UITableViewDataSource>

/** 背景 tableview */
@property (nonatomic,strong)UITableView *mainTableView;

@end

@implementation SKPopMenuListView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//
- (instancetype)init
{
	if (self = [super init]) {
		[self createUI];
	}
	return self;
	
}

//
- (void)createUI
{
	// 标题
	_titleLbl = [[UILabel alloc]init];
	_titleLbl.textColor = [UIColor whiteColor];
	_titleLbl.backgroundColor = SKRandomColor;
	_titleLbl.font = [UIFont systemFontOfSize:19.0f];
	_titleLbl.textAlignment = NSTextAlignmentCenter;
	[self addSubview:_titleLbl];
	
	[_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
		make.width.equalTo(kTbWidth);
		make.height.equalTo(50);
		make.left.equalTo(self.mas_left).offset(0);
		make.top.equalTo(self.mas_top).offset(0);
	}];

	self.mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, kTbWidth, kTbHeight) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.mainTableView.showsVerticalScrollIndicator = NO;
	self.mainTableView.bounces = NO;
    [self addSubview:self.mainTableView];
	
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cellID";

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

	
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	cell.textLabel.text = self.dataArr[indexPath.row];
	
	cell.backgroundColor = SKRandomColor;
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	// 计算高度
	return self.dataArr.count >4 ? 50:kTbHeight / self.dataArr.count;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

	[self.delegate selectResultWithString:self.dataArr[indexPath.row]];
}



@end
