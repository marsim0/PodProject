//
//  ViewController.m
//  PodProject
//
//  Created by Мариам Б. on 28.05.15.
//  Copyright (c) 2015 Мариам Б. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getGroupId];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getGroupId {
    NSURL * url = [NSURL URLWithString:@"https://api.vk.com/method/"];
    AFHTTPRequestOperationManager * reqManager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
    NSDictionary * params = [[NSDictionary alloc]initWithObjectsAndKeys:
                             @"-50537266_122",@"posts",
                             @1,@"extended",
                             nil];
    
    [reqManager GET:@"wall.getById" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"%@", [[[responseObject valueForKey:@"response"] valueForKey:@"groups"]valueForKey:@"gid"] );
        } else {
            NSLog(@"uknown class");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
    }];
     
}

@end
