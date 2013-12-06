//
//  CrimesAmbientais.m
//  forcaVerde
//
//  Created by Karoline Schulis on 05/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "CrimesAmbientais.h"

@implementation CrimesAmbientais

- (id)init
{
    return [self initWithName:@"default" info:@"default" picture:@"default.jpg"] ;
}

- (id)initWithName:(NSString *)n
              info:(NSString *)i
           picture:(NSString *)p

{
    self = [super init];
    if (self) {
        
        [self setCrime:n];
        [self setInfo:i];
        [self setPicture:[UIImage imageNamed:p]];
    }
    return self;
}@end
