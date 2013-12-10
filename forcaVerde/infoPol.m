//
//  infoPol.m
//  forcaVerde
//
//  Created by Karoline Schulis on 09/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "infoPol.h"
#import "GPoliciaMilitar.h"
#import "PoliciaMilitar.h"

@implementation infoPol

- (void)viewDidLoad
{
    [super viewDidLoad];
    unidades  = [[GPoliciaMilitar sharedPolInfo]returnSelectPol];
    [[self unidade] setText:[unidades Nome]];
    [[self tel]setText:[unidades tel]];
    [[self End]setText:[unidades end]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



- (IBAction)voltar:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
