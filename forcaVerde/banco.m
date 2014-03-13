//
//  banco.m
//  forcaVerde
//
//  Created by Tiago Paluch on 12/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "banco.h"
#import "denuncia.h"

@implementation banco
{
    NSMutableArray *itens;
    NSMutableArray *qryitens;
}
+ (banco *)meuBanco
{
    static banco *meuBanco = nil;
    
    if (!meuBanco)
        meuBanco = [[super alloc] init];
    
    return meuBanco;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSString *docsDir;
        NSArray *dirPaths;
        char *errMsg;
        BOOL BDExist;
        
        itens = [[NSMutableArray alloc] init];
        qryitens = [[NSMutableArray alloc] init];
        
        dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        docsDir = dirPaths[0];
        _databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"denuncias.db"]];
        NSFileManager *filemgr = [NSFileManager defaultManager];
        BDExist = [filemgr fileExistsAtPath:_databasePath];
        
        const char *dbpath = [_databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &_meuDB) == SQLITE_OK) {
            if (BDExist == NO)
                NSLog(@"BD criado com sucesso");
            else
                NSLog(@"BD aberto com sucesso");
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS denuncias (id INTEGER PRIMARY KEY AUTOINCREMENT, crime INTEGER, datahora TEXT, latitude FLOAT, longitude FLOAT, precisao FLOAT, imagefile TEXT)";
            if (sqlite3_exec(_meuDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
                NSLog(@"Falha ao criar a tabela");
            else
                NSLog(@"Tabela aberta/criada com sucesso");
            
            [self loadData];
            
            sqlite3_close(_meuDB);
        } else {
            NSLog(@"Falha ao criar/abrir o BD");
        }
    }
    return self;
}

- (void)loadData
{
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    
    if (sqlite3_open(dbpath, &_meuDB) == SQLITE_OK) {
        const char *query_stmt = [@"SELECT id, crime, datahora, latitude, longitude, precisao, imagefile FROM denuncias ORDER BY id" UTF8String];
        if (sqlite3_prepare_v2(_meuDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            [itens removeAllObjects];
            while (sqlite3_step(statement) == SQLITE_ROW) {
                NSString *cod = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                NSNumber *crime = [NSNumber numberWithInt:(int)sqlite3_column_int(statement, 3)];
                NSString *datahora = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
                NSNumber *latitude = [NSNumber numberWithFloat:(float)sqlite3_column_double(statement, 3)];
                NSNumber *longitude = [NSNumber numberWithFloat:(float)sqlite3_column_double(statement, 4)];
                NSNumber *precisao = [NSNumber numberWithFloat:(float)sqlite3_column_double(statement, 5)];
                NSString *imagefile = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 6)];
                
                UIImage *customImage = [UIImage imageWithContentsOfFile:imagefile];
                
                denuncia *den = [[denuncia alloc] initWithFoto:customImage Crime:(int)crime DataHora:datahora Latitude:latitude.floatValue Longitude:longitude.floatValue Precisao:precisao.floatValue];
                [den setCod:cod];
                [itens addObject:den];

            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_meuDB);
    }
}

- (NSArray *)itens
{
    return itens;
}

- (BOOL)saveData:(denuncia *)den
{
    char *errMsg;
    const char *dbpath = [_databasePath UTF8String];
    BOOL state;
    
    //salvar FOTO
    NSData *imageData = UIImagePNGRepresentation(den.Foto);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *imagePath =[documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",[NSString stringWithFormat:@"%@FOTO",den.DataHora]]];
    [imageData writeToFile:imagePath atomically:NO];
    
    
    
    if (sqlite3_open(dbpath, &_meuDB) == SQLITE_OK) {
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO denuncias (crime, datahora, latitude, longitude, precisao, imagefile) VALUES (%d, \"%@\", %f, %f, %f, \"%@\")", den.Crime, den.DataHora, den.Latitude, den.Longitude, den.Precisao, imagePath];
        const char *insert_stmt = [insertSQL UTF8String];
        if (sqlite3_exec(_meuDB, insert_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            state = NO;
        else
            state = YES;
        [self loadData];
        sqlite3_close(_meuDB);
    } else {
        state = NO;
    }
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:[self tamanhoDoBanco]];
    return state;
}
- (int)tamanhoDoBanco {
    return (int)[[self itens] count];
}

- (BOOL)removeData:(denuncia *)den
{
    char *errMsg;
    const char *dbpath = [_databasePath UTF8String];
    BOOL state;
    
    if (sqlite3_open(dbpath, &_meuDB) == SQLITE_OK) {
        NSString *removeSQL = [NSString stringWithFormat:@"DELETE FROM denuncias WHERE id = %@", den.cod];
        const char *remove_stmt = [removeSQL UTF8String];
        if (sqlite3_exec(_meuDB, remove_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            state = NO;
        else {
            state = YES;
            [itens removeObject:den];
        }
        [self loadData];
        sqlite3_close(_meuDB);
    } else {
        state = NO;
    }
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:[self tamanhoDoBanco]];
    return state;
}
@end
