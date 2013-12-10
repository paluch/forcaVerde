//
//  PoliciaMilitar.m
//  forcaVerde
//
//  Created by Karoline Schulis on 09/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "PoliciaMilitar.h"

@implementation PoliciaMilitar

- (id)init
{
    return [self initWithName:@"default" Cidade:@"default" telefone:@"default" endereço:@"default" email:@"default"] ;
}

- (id)initWithName:(NSString *)n
            Cidade:(NSString *)c
          telefone:(NSString *)t
          endereço:(NSString *)e
        email:(NSString *)em
{
    self = [super init];
    if (self) {
        
        [self setNome:n];
        [self setCidade:c];
        [self setTel:t];
        [self setEnd:e];
        [self setEmail:em];
    }
    return self;
}
@end
