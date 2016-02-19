//
//  ViewController.m
//  FrameworkDemo
//
//  Created by yachaocn on 16/2/18.
//  Copyright © 2016年 NavchinaMacBook. All rights reserved.
//

#import "ViewController.h"
#import <Dylib/Dylib.h>
#import <Dylib/Person.h>
#include <dlfcn.h>


static void *libHandle = NULL;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#if 0
//    连接Document目录下的动态库,需要将动态库导入沙河的Document目录中。
    NSString *documentsPath = [NSString stringWithFormat:@"%@/Documents/Dylib.framework/Dylib",NSHomeDirectory()];
    [self dlopenLoadDylibWithPath:documentsPath];
#else
//    程序启动自动连接动态库，需要Targets-->Build Setting-->Linking-->Runpath Search Paths 设置@executable_path/
    Person *p = [[Person alloc]init];
    [p run];
//
#endif
}
- (void)dlopenLoadDylibWithPath:(NSString *)path
{
    libHandle = NULL;
    libHandle = dlopen([path cStringUsingEncoding:NSUTF8StringEncoding], RTLD_NOW);
    if (libHandle == NULL) {
        char *error = dlerror();
        NSLog(@"dlopen error: %s", error);
    } else {
        NSLog(@"dlopen load framework success.");
        Class rootClass = NSClassFromString(@"Person");
        if (rootClass) {
            id object = [[rootClass alloc] init];
            [(Person *)object run];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
