//
//  AppDelegate.m
//  forcaVerde
//
//  Created by Tiago Paluch on 03/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "AppDelegate.h"
#import "PagIniViewController.h"
#import "MeuViewController.h"
#import "SelectTipoCrime.h"
#import "TiposCrimes.h"
#import "MaisInfoPolViewController.h"
#import "banco.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //PagIniViewController *mvc = [[PagIniViewController alloc] init];
    MeuViewController *mvc = [[MeuViewController alloc] init];
    PagIniViewController *pag = [[PagIniViewController alloc]init];
    //SelectTipoCrime *sel = [[SelectTipoCrime alloc]init];
    TiposCrimes *tip = [[TiposCrimes alloc]init];
    MaisInfoPolViewController *po = [[MaisInfoPolViewController alloc]init];
    
    //[[self window] setRootViewController:mvc];
   
    
    UITabBarController *tbc =[[UITabBarController alloc]init];
    [tbc setViewControllers:@[pag,mvc,tip,po]];
    
    [[self window]setRootViewController:tbc];
    
    [tbc.tabBar setBarTintColor:[UIColor colorWithRed:1 green:1 blue:0 alpha:0]];
    [tbc.tabBar setBounds:CGRectMake(0.0, 0.0, self.window.bounds.size.width, 50.0)];
    
 
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:[[banco meuBanco] tamanhoDoBanco]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
