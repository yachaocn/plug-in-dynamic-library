//
//  Person.m
//  Dylib
//
//  Created by yachaocn on 16/2/18.
//  Copyright © 2016年 NavchinaMacBook. All rights reserved.
//

#import "Person.h"
#import <UIKit/UIKit.h>
#import "Desk.h"

@implementation Person

- (void)run
{
    NSLog(@"let's run.");
    Desk *desk = [[Desk alloc]init];
    desk.deskName = @"desk";
    [desk sayName];
   
}
@end
