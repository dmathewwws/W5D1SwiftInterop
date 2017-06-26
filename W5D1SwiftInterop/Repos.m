//
//  Repos.m
//  W4D3 - Networking
//
//  Created by Daniel Mathews on 2015-07-22.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

#import "Repos.h"

@implementation Repos

- (instancetype)initWithName:(NSString*)name url:(NSURL*)url size:(NSNumber*)size
{
    self = [super init];
    if (self) {
        _name = name;
        _url = url;
        _size = size;
    }
    return self;
}


@end
