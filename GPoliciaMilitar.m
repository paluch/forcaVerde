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
        PoliciaMilitar *uni1 = [[PoliciaMilitar alloc]initWithName:@"BATALHÃO DE POLÍCIA AMBIENTAL" Cidade:@"Curitiba" telefone:@"0800 643 0304" endereço:@"Avenida das Torres,10.000, Parque Metropolitano do Iguaçu. CEP: 83.040-300 " email: @"bpambfv@pm.pr.gov.br"];
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
