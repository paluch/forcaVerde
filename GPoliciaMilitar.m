//
//  GPoliciaMilitar.m
//  forcaVerde
//
//  Created by Karoline Schulis on 09/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "GPoliciaMilitar.h"
#import "PoliciaMilitar.h"
@interface GPoliciaMilitar()
{
    NSMutableArray *unidades;
}
@end
@implementation GPoliciaMilitar


+(GPoliciaMilitar *)sharedPolInfo
{
    static GPoliciaMilitar *sharedPolInfo = nil;
    if (!sharedPolInfo)
        sharedPolInfo = [[super alloc] init];
    return sharedPolInfo;
}


- (id)init
{
    self = [super init];
    if (self) {
        unidades = [[NSMutableArray alloc]init];
        PoliciaMilitar *uni1 = [[PoliciaMilitar alloc]initWithName:@"12º BATALHÃO DE POLÍCIA MILITAR" Cidade:@"Curitiba" telefone:@"(41) 3269-8100 Fax: 3269-2110" endereço:@" Rua Curupaitis, 1132 - Santa Quitéria. CEP 80.310-180"];
        [unidades addObject: uni1];
  
        
        
    }
    return self;
}
- (PoliciaMilitar *)returnSelectPol
{
    return  sel;
}
- (void)selectUnidade:(NSIndexPath *)i
{
    sel = [unidades objectAtIndex:[i  row]];
}

-(NSArray *)TodasUnidades
{
    return  unidades ;
}


@end
