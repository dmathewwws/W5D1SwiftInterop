//
//  Repos.h
//  W4D3 - Networking
//
//  Created by Daniel Mathews on 2015-07-22.
//  Copyright © 2015 Daniel Mathews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repos : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSURL *url;
@property (nonatomic) NSNumber *size;

- (instancetype)initWithName:(NSString*)name url:(NSURL*)url size:(NSNumber*)size;

@end
