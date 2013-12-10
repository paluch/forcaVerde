//
//  PoliciaMilitar.h
//  forcaVerde
//
//  Created by Karoline Schulis on 09/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PoliciaMilitar : NSObject

- (id)initWithName:(NSString *)n Cidade:(NSString *)c telefone:(NSString*)t endereço:(NSString *)e email:(NSString *)em;

@property (nonatomic, strong)NSString *Nome;
@property (nonatomic, strong)NSString *Cidade;
@property (nonatomic, strong)NSString *tel;
@property (nonatomic, strong)NSString *end;
@property (nonatomic, strong)NSString *email;

@end
