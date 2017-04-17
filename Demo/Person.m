//
//  Person.m
//  Demo
//
//  Created by GCO on 4/5/17.
//  Copyright © 2017 GCO. All rights reserved.
//

#import "Person.h"

@implementation Person

-(instancetype)initWithPersonName:(NSString*)name withAge:(NSUInteger)age {
    _name = name;
    _age = age;
    
    return self;
}

@end
