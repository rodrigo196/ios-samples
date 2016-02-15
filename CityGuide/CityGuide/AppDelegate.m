//
//  AppDelegate.m
//  CityGuide
//
//  Created by Rodrigo Fernandes Bulgarelli on 2/13/16.
//  Copyright © 2016 Rodrigo Fernandes Bulgarelli. All rights reserved.
//

#import "AppDelegate.h"
#import "City.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    City *london = [[City alloc] init];
    london.cityName = @"Londres";
    london.cityDescription = @"A capital do Reino Unido e Inglaterra.";
    london.cityPicture = [UIImage imageNamed:@"London.jpg"];
    
    City *sanFrancisco = [[City alloc] init];
    sanFrancisco.cityName = @"São francisco";
    sanFrancisco.cityDescription = @"Umas das mais belas cidades dos Estados Unidos.";
    sanFrancisco.cityPicture = [UIImage imageNamed:@"SanFrancisco.jpg"];
                                
    City *sydney = [[City alloc] init];
    sydney.cityName = @"Sidnei";
    sydney.cityDescription = @"A maior cidade da australia.";
    sydney.cityPicture = [UIImage imageNamed:@"Sydney.jpg"];
    
    City *madrid = [[City alloc] init];
    madrid.cityName = @"Madrid";
    madrid.cityDescription = @"A capital e maior cidade da espanha.";
    madrid.cityPicture = [UIImage imageNamed:@"Madrid.jpg"];
    
    self.cities = [[NSMutableArray alloc] initWithObjects:london, sanFrancisco, sydney, madrid, nil];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end