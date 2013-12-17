//
//  GCrimesAmbientais.m
//  forcaVerde
//
//  Created by Karoline Schulis on 05/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "GCrimesAmbientais.h"
#import "CrimesAmbientais.h"

@interface GCrimesAmbientais ()
{
    
    NSMutableArray *CrimesInfo;
}
@end

@implementation GCrimesAmbientais

+(GCrimesAmbientais *)sharedCrimes
{
    static GCrimesAmbientais *sharedCrimes = nil;
    if (!sharedCrimes)
        sharedCrimes = [[super alloc] init];
    return sharedCrimes;
}


- (id)init
{
    self = [super init];
    if (self) {
        CrimesInfo = [[NSMutableArray alloc]init];
        CrimesAmbientais *crime1 = [[CrimesAmbientais alloc]initWithName:@"Crimes contra fauna" info:@"Matar, perseguir, caçar, apanhar, utilizar espécimes da fauna silvestre, nativos ou em rota migratória, sem a devida permissão, licença ou autorização da autoridade competente" picture:@"jaguatirica-e1358515997707.jpg"];
        [CrimesInfo addObject:crime1];
        
        CrimesAmbientais *crime2 = [[CrimesAmbientais alloc]initWithName:@"Crimes contra flora"info:@"Cortar, Destruir ou danificar floresta considerada de preservação permanente, mesmo que em formação, ou utilizá-la com infringência das normas de proteção;Provocar incêndio em mata ou floresta;Fabricar, vender, transportar ou soltar balões que possam provocar incêndios nas florestas e demais formas de vegetação, em áreas urbanas ou qualquer tipo de assentamento humano." picture:@"pinheiro.jpg"];
        [CrimesInfo addObject:crime2];
        
        CrimesAmbientais *crime3 = [[CrimesAmbientais alloc]initWithName:@"Poluição e outros crimes ambientais" info:@"Causar poluição de qualquer natureza em níveis tais que resultem ou possam resultar em danos à saúde humana, ou que provoquem a mortalidade de animais ou a destruição significativa da flora."  picture:@"rios.jpg"];
        [CrimesInfo addObject:crime3];
        
        CrimesAmbientais *crime4 = [[CrimesAmbientais alloc]initWithName:@"Crimes contra o ordenamento Urbano e Patrimônio Cultural" info:@"1. Destruir, inutilizar ou deteriorar: bem especialmente protegido por lei, ato administrativo ou decisão judicial; arquivo, registro, museu, biblioteca, pinacoteca, instalação científica ou similar protegido por lei, ato administrativo ou decisão judicial."  picture:@"ordenamento.jpg"];
        [CrimesInfo addObject:crime4];
        
        CrimesAmbientais *crime5 = [[CrimesAmbientais alloc]initWithName:@"Crimes contra a administração ambiental" info:@" 1. Fazer o funcionário público afirmação falsa ou enganosa, omitir a verdade, sonegar informações ou dados técnico-científicos em procedimentos de autorização ou de licenciamento ambiental." picture:nil];
        [CrimesInfo addObject:crime5];
        
        CrimesAmbientais *Pena = [[CrimesAmbientais alloc]initWithName:@"Sanções e aplicações de penas." info:@"A Lei de Crimes Ambientais prevê as seguintes categorias de penas: a) pena privativa de liberdade.b) pena restritiva de direitos. c) multa."  picture:nil];
        [CrimesInfo addObject:Pena];
      
    }
    return self;
}
- (CrimesAmbientais*)returnSelectCrime
{
    return  seleciona;
}
- (void)selectCrime:(NSIndexPath *)i
{
    seleciona = [CrimesInfo objectAtIndex:[i  row]];
}

-(NSArray *)TodosCrimes
{
    return CrimesInfo ;
}

@end
