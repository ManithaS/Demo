//
//  Person.h
//  Demo
//
//  Created by GCO on 4/5/17.
//  Copyright © 2017 GCO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger age;


-(instancetype)initWithPersonName:(NSString*)name withAge:(NSUInteger)age;

@end
