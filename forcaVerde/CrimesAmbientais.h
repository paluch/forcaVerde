//
//  CrimesAmbientais.h
//  forcaVerde
//
//  Created by Karoline Schulis on 05/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrimesAmbientais : NSObject

- (id)initWithName:(NSString *)n info:(NSString *)i picture:(NSString*)p;

@property (nonatomic, strong)NSString *Crime;
@property (nonatomic, strong)NSString *info;
@property (nonatomic, strong)UIImage *picture;


@end
