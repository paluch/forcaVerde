//
//  MaisInfoPolViewController.m
//  forcaVerde
//
//  Created by Karoline Schulis on 09/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "MaisInfoPolViewController.h"
#import "PoliciaMilitar.h"
#import "GPoliciaMilitar.h"
#import "infoPol.h"

@interface MaisInfoPolViewController ()

@end

@implementation MaisInfoPolViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewAutomaticDimension];
    if (self) {
      [[self tableView] setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        
        [[self tableView] setSeparatorColor:[UIColor colorWithRed:0 green:9 blue:9 alpha:0.4]];
        
        [self.tabBarItem setTitle:@"Mais Informações"];
        [self.tabBarItem setImage:nil];
        
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    infoPol *info = [[infoPol alloc]init];
    [[GPoliciaMilitar sharedPolInfo]selectUnidade:indexPath];
    [self presentViewController:info animated:YES completion:nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[[GPoliciaMilitar sharedPolInfo]TodasUnidades]count];;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Unidades";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    PoliciaMilitar *pol;
    pol = [[[GPoliciaMilitar sharedPolInfo]TodasUnidades]objectAtIndex:[indexPath row]];

    
    [[cell textLabel] setText:[pol Nome]];
    
    [cell setBackgroundColor:[UIColor colorWithRed:0 green:0.4 blue:0.1 alpha:0.1]];
    
    return cell;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}




@end
