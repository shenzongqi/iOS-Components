//
//  ShNavPriorityView.h
//  LeeMall
//
//  Created by guest on 16/12/26.
//  Copyright © 2016年 zongqi.shen. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ShNavPriorityDelegate <NSObject>

@optional

//点击左侧按钮事件
-(void)btnNavLeftClick;

//点击右侧3按钮事件
-(void)btnNavRightClick;

//点击导航栏事件
-(void)navTouch;

@end

@interface ShNavPriorityView : UIView

@property(nonatomic,retain)UIButton *btnLeft;
@property(nonatomic,retain)UIButton *btnRight;
@property(nonatomic,retain)UITextField *centerTextF;
@property(nonatomic,assign)id<ShNavPriorityDelegate>delegate;

@end
