//
//  GCrimesAmbientais.h
//  forcaVerde
//
//  Created by Karoline Schulis on 05/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  CrimesAmbientais;

@interface GCrimesAmbientais : NSObject
{
    
    CrimesAmbientais *seleciona;
}
+(GCrimesAmbientais *)sharedCrimes;
- (CrimesAmbientais *)returnSelectCrime;

-(NSArray *) TodosCrimes;

-(void)initWithName:(NSString *)n info:(NSString *)i picture:(NSString *)p;

- (void)selectCrime:(NSIndexPath *)i;

@end
