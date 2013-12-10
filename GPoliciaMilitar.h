//
//  GPoliciaMilitar.h
//  forcaVerde
//
//  Created by Karoline Schulis on 09/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PoliciaMilitar;

@interface GPoliciaMilitar : NSObject
{
    PoliciaMilitar *sel;
}
+(GPoliciaMilitar*)sharedPolInfo;
- (PoliciaMilitar *)returnSelectPol;

-(NSArray *) TodasUnidades;

- (void)initWithName:(NSString *)n Cidade:(NSString *)c telefone:(NSString *)t endereço:(NSString *)e;
- (void)selectUnidade:(NSIndexPath *)i;



@end
