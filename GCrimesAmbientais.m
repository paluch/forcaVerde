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
        CrimesAmbientais *crime1 = [[CrimesAmbientais alloc]initWithName:@"Crimes contra fauna" info:@"Matar, perseguir, caçar, apanhar, utilizar espécimes da fauna silvestre, nativos ou em rota migratória, sem a devida permissão, licença ou autorização da autoridade competente, ou em desacordo com a obtida; Também enquadram-se nesse tipo legal quem impede a procriação da fauna, sem licença; quem modifica, danifica ou destrói ninho, abrigo ou criadouro natural; quem vende, expõe à venda, exporta ou adquire, guarda, tem em cativeiro ou depósito, utiliza ou transporta ovos, larvas ou espécimes da fauna silvestre, nativa ou em rota migratória, bem como produtos e objetos dela oriundos, provenientes de criadouros não autorizados ou sem a devida permissão." picture:@"filhotes.jpg"];
        [CrimesInfo addObject:crime1];
        
        CrimesAmbientais *crime2 = [[CrimesAmbientais alloc]initWithName:@"Crimes contra flora"info:@"Cortar, Destruir ou danificar floresta considerada de preservação permanente, mesmo que em formação, ou utilizá-la com infringência das normas de proteção;Provocar incêndio em mata ou floresta;Fabricar, vender, transportar ou soltar balões que possam provocar incêndios nas florestas e demais formas de vegetação, em áreas urbanas ou qualquer tipo de assentamento humano;Extrair de florestas de domínio público ou consideradas de preservação permanente, sem prévia autorização, pedra, areia, cal ou qualquer espécie de minerais;Cortar ou transformar em carvão madeira de lei, assim classificada por ato do Poder Público, para fins industriais, energéticos ou para qualquer outra exploração, econômica ou não, em desacordo com as determinações legais." picture:nil];
        [CrimesInfo addObject:crime2];
        
        CrimesAmbientais *crime3 = [[CrimesAmbientais alloc]initWithName:@"Poluição e outros crimes ambientais" info:@"Causar poluição de qualquer natureza em níveis tais que resultem ou possam resultar em danos à saúde humana, ou que provoquem a mortalidade de animais ou a destruição significativa da flora. Se este crime tiver os resultados de: tornar um área, urbana ou rural, imprópria para a ocupação humana; causar poluição atmosférica que provoque a retirada, ainda que momentânea, dos habitantes das áreas afetadas, ou que cause danos diretos à saúde da população; causar poluição hídrica que torne necessária a interrupção do abastecimento público de água de uma comunidade; dificultar ou impedir o uso público das praias; ocorrer por lançamento de resíduos sólidos, líquidos ou gasosos, ou detritos, óleos ou substâncias oleosas, em desacordo com as exigências estabelecidas em leis ou regulamentos, haverá aumento de pena, pois será o tipo qualificado, incorrendo ainda nas mesmas penas quem deixar de adotar, quando assim o exigir a autoridade competente, medidas de precaução em caso de risco de dano ambiental grave ou irreversível."  picture:nil];
        [CrimesInfo addObject:crime3];
        
        CrimesAmbientais *crime4 = [[CrimesAmbientais alloc]initWithName:@"Crimes contra o ordenamento Urbano e Patrimônio Cultural" info:@"1. Destruir, inutilizar ou deteriorar: bem especialmente protegido por lei, ato administrativo ou decisão judicial; arquivo, registro, museu, biblioteca, pinacoteca, instalação científica ou similar protegido por lei, ato administrativo ou decisão judicial;2. Alterar o aspecto ou estrutura de edificação ou local especialmente protegido por lei, ato administrativo ou decisão judicial, em razão de seu valor paisagístico, ecológico, turístico, artístico, histórico, cultural, religioso, arqueológico, etnográfico ou monumental, sem autorização da autoridade competente ou em desacordo com a concedida; 3. Promover construção em solo não edificável, ou no seu entorno, assim considerado em razão de seu valor paisagístico, ecológico, turístico, histórico, cultural, religioso, arqueológico, etnográfico ou monumental, sem autorização da autoridade competente ou em desacordo com a concedida;4. Pichar, grafitar ou por outro meio conspurcar edificação ou monumento urbano. "  picture:nil];
        [CrimesInfo addObject:crime4];
        
        CrimesAmbientais *crime5 = [[CrimesAmbientais alloc]initWithName:@"Crimes contra a administração ambiental" info:@" 1. Fazer o funcionário público afirmação falsa ou enganosa, omitir a verdade, sonegar informações ou dados técnico-científicos em procedimentos de autorização ou de licenciamento ambiental;2. Conceder o funcionário público licença, autorização ou permissão em desacordo com as normas ambientais, para as atividades, obras ou serviços cuja realização depende de ato autorizativo do Poder Público;3. Deixar, aquele que tiver o dever legal ou contratual de fazê-lo, de cumprir obrigação de relevante interesse ambiental;4. Obstar ou dificultar a ação fiscalizadora do Poder Público no trato de questões ambientais" picture:nil];
        [CrimesInfo addObject:crime5];
        
        CrimesAmbientais *Pena = [[CrimesAmbientais alloc]initWithName:@"Sanções e aplicações de penas." info:@"A Lei de Crimes Ambientais prevê as seguintes categorias de penas a) pena privativa de liberdade: É aquela em que o sujeito condenado deverá cumprir sua pena em regime penitenciário.Deve-se ressaltar ainda que há dois tipos de penas privativas de liberdade: detenção e reclusão.b) pena restritiva de direitos:Esse tipo de pena substituirá a aplicação da pena restritiva de liberdade.Conforme o art. 7º da Lei n.º 9.605/98, deverão ser observadas as seguintes condições para que haja essa conversão de penas: - tratar-se de crime culposo ou houver a aplicação de pena privativa de liberdade inferior a quatro anos;- a culpabilidade, os antecedentes, a conduta social e a personalidade do condenado, bem como os motivos e as circunstâncias do crime indicarem que a substituição seja suficiente para efeitos de reprovação e prevenção do crime.Essa pena poderá ser: prestação de serviços à comunidade, interdição temporária de direitos, suspensão parcial ou total de atividades, prestação pecuniária e recolhimento domiciliar.c) multa:Consiste na cominação de um valor pecuniário à pena aplicada ao réu."  picture:nil];
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
