//
//  AppDelegate.h
//  Green
//
//  Created by Stefan Thomsen on 18/08/18.
//  Copyright © 2018 CreativeDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

