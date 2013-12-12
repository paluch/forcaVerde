//
//  denuncia.m
//  forcaVerde
//
//  Created by Tiago Paluch on 12/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "denuncia.h"

@implementation denuncia

- (id)initWithFoto:(UIImage*)f Crime:(NSString*)c DataHora:(NSString*)d Latitude:(float)la Longitude:(float)lo Precisao:(float)pr
{
    self = [super init];
    if (self) {
        [self setFoto:f];
        [self setCrime:c];
        [self setDataHora:d];
        [self setLatitude:la];
        [self setLongitude:lo];
        [self setPrecisao:pr];
    }
    return self;
}

@end
