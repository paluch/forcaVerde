//
//  infoPol.h
//  forcaVerde
//
//  Created by Karoline Schulis on 09/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PoliciaMilitar;
@interface infoPol : UIViewController
{
    PoliciaMilitar *unidades;
}

@property (weak, nonatomic) IBOutlet UILabel *unidade;
@property (weak, nonatomic) IBOutlet UILabel *tel;
@property (weak, nonatomic) IBOutlet UILabel *End;
@property (weak, nonatomic) IBOutlet UILabel *email;

- (IBAction)voltar:(id)sender;







@end
