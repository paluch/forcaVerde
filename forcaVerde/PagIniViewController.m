//
//  PagIniViewController.m
//  forcaVerde
//
//  Created by Karoline Schulis on 03/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "PagIniViewController.h"
#import "SelectTipoCrime.h"


@interface PagIniViewController ()

@end

@implementation PagIniViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)denuncia:(id)sender
{
    SelectTipoCrime *sel = [[SelectTipoCrime alloc]init];
    [self presentViewController:sel animated:YES completion:nil];
    
    
}

- (IBAction)CA:(id)sender {
}

- (IBAction)MPM:(id)sender {
}
@end
