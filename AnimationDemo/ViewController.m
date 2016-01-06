//
//  ViewController.m
//  AnimationDemo
//
//  Created by rongfzh on 13-1-14.
//  Copyright (c) 2013年 rongfzh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *redView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *yellowView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"动画" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 50, 300, 40);
    [button addTarget:self action:@selector(changeUIView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"动画1" forState:UIControlStateNormal];
    button1.frame = CGRectMake(10, 100, 300, 40);
    [button1 addTarget:self action:@selector(changeUIView1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button3 setTitle:@"动画2" forState:UIControlStateNormal];
    button3.frame = CGRectMake(10, 150, 300, 40);
    [button3 addTarget:self action:@selector(changeUIView2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button4 setTitle:@"动画3" forState:UIControlStateNormal];
    button4.frame = CGRectMake(10, 200, 300, 40);
    [button4 addTarget:self action:@selector(changeUIView3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    moveView = [[UIView alloc] initWithFrame:CGRectMake(50, 260, 200, 40)];
    moveView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:moveView];

    
}

- (void)changeUIView{
    [UIView beginAnimations:@"animation" context:nil];
	[UIView setAnimationDuration:1.0f];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    [UIView commitAnimations];
}


- (void)changeUIView1{
    [UIView beginAnimations:@"animation" context:nil];
	[UIView setAnimationDuration:1.0f];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    //  交换本视图控制器中2个view位置
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    [UIView setAnimationDidStopSelector:@selector(animationFinish:)];
    [UIView commitAnimations];
}

- (void)changeUIView2{
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
      transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
//    transition.startProgress = 0.3;
//    transition.endProgress = 0.8;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    
    [self.view.layer addAnimation:transition forKey:@"animation"];
}

- (void)changeUIView3{
//    [UIView animateWithDuration:3 animations:^(void){
//        moveView.frame = CGRectMake(10, 270, 200, 40);
//    }completion:^(BOOL finished){
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
//        label.backgroundColor = [UIColor blackColor];
//        [self.view addSubview:label];
//    }];
    
    [UIView animateWithDuration:2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut animations:^(void){
        moveView.alpha = 0.0;
    }completion:^(BOOL finished){
        [UIView animateWithDuration:1
                              delay:1.0
                            options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                         animations:^(void){
                             [UIView setAnimationRepeatCount:2.5];
                             moveView.alpha = 1.0;
                         }completion:^(BOOL finished){
                             
                         }];
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
