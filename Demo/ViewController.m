//
//  ViewController.m
//  Demo
//
//  Created by GCO on 3/27/17.
//  Copyright © 2017 GCO. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"ViewController viewDidLoad....");
    

//    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//    [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert)
//                          completionHandler:^(BOOL granted, NSError * _Nullable error) {
//                              if (!error) {
//                                  NSLog(@"request succeeded!");
//                                  [self testAlrt];
//                              }
//                          }];
  

    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert)
                          completionHandler:^(BOOL granted, NSError * _Nullable error) {
                              if (!error) {
                                  NSLog(@"request succeeded!");
                                  [self testAlert];
                              }
                          }];
    
    
    //Person *personObj = [[Person alloc] initWithPersonName:@"Manitha" withAge:24];
    Person *personObj = [[Person alloc] init];
    personObj.name = @"Manitha";
    personObj.age = 24;

    NSLog(@"Name : %@",personObj.name);
    NSLog(@"Age : %ld",(long)personObj.age);

}


- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"ViewController viewWillAppear....");
}

-(void)testAlert {

    NSDate *now = [NSDate date];
    
    // NSLog(@"NSDate--before:%@",now);
    
    now = [now dateByAddingTimeInterval:10];
    
    NSLog(@"NSDate:%@",now);
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    [calendar setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitTimeZone fromDate:now];
    
    NSDate *todaySehri = [calendar dateFromComponents:components]; //unused
    
    UNMutableNotificationContent *objNotificationContent = [[UNMutableNotificationContent alloc] init];
    objNotificationContent.title = [NSString localizedUserNotificationStringForKey:@"Notification!" arguments:nil];
    objNotificationContent.body = [NSString localizedUserNotificationStringForKey:@"This is local notification message!"
                                                                        arguments:nil];
    objNotificationContent.sound = [UNNotificationSound defaultSound];
    
    /// 4. update application icon badge number
    objNotificationContent.badge = @([[UIApplication sharedApplication] applicationIconBadgeNumber] + 1);
    
    
    UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:NO];
    
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"ten"
                                                                          content:objNotificationContent trigger:trigger];
    /// 3. schedule localNotification
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"Local Notification succeeded");
        }
        else {
            NSLog(@"Local Notification failed");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
