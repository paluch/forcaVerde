//
//  Anotacao.h
//  forcaVerde
//
//  Created by Tiago Paluch on 10/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Anotacao : NSObject <MKAnnotation>{
    
    NSString *title;
    NSString *subtitle;
    NSString *note;
    CLLocationCoordinate2D coordinate;
}

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subtitle;
@property (nonatomic, assign)CLLocationCoordinate2D coordinate;


- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d;
@end