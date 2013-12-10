//
//  Anotacao.m
//  forcaVerde
//
//  Created by Tiago Paluch on 10/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "Anotacao.h"

@implementation Anotacao

@synthesize title;
@synthesize subtitle;
@synthesize coordinate;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d {
	self = [super init];
    if (self) {
        title = ttl;
        coordinate = c2d;
    }
	return self;
}
@end
