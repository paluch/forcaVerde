//
//  infoCrimes.h
//  forcaVerde
//
//  Created by Karoline Schulis on 05/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CrimesAmbientais;
@interface infoCrimes : UIViewController
{
    CrimesAmbientais* crime;
}
@property (weak, nonatomic) IBOutlet UILabel *Titulo;
@property (weak, nonatomic) IBOutlet UILabel *info;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;


- (IBAction)voltar:(id)sender;

@end
