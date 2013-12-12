//
//  denuncia.h
//  forcaVerde
//
//  Created by Tiago Paluch on 12/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface denuncia : NSObject

@property (strong, nonatomic) NSString *cod;
@property (strong, nonatomic) UIImage* Foto;
@property (strong, nonatomic) NSString* Crime;
@property float Latitude;
@property float Longitude;
@property float Precisao;
@property (strong, nonatomic) NSString* DataHora;


-(id)initWithFoto:(UIImage*)f Crime:(NSString*)c DataHora:(NSString*)d Latitude:(float)la Longitude:(float)lo Precisao:(float)pr;
@end
