//
//  banco.h
//  forcaVerde
//
//  Created by Tiago Paluch on 12/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@class denuncia;

@interface banco : NSObject

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *meuDB;
@property (strong, nonatomic) denuncia* escolhida;

+ (banco *)meuBanco;

- (NSArray *)itens;
- (BOOL) saveData:(denuncia *)den;
- (BOOL) removeData:(denuncia *)den;
- (int) tamanhoDoBanco;


@end
