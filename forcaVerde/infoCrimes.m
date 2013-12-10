//
//  infoCrimes.m
//  forcaVerde
//
//  Created by Karoline Schulis on 05/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "infoCrimes.h"
#import "CrimesAmbientais.h"
#import "GCrimesAmbientais.h"

@implementation infoCrimes

- (void)viewDidLoad
{
    [super viewDidLoad];
    crime  = [[GCrimesAmbientais sharedCrimes]returnSelectCrime];
    [[self Titulo] setText:[crime Crime]];
    [[self info]setText:[crime info]];
    [[self imagem] setImage:[crime picture]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
