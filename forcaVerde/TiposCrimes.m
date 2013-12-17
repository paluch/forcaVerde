//
//  TiposCrimes.m
//  forcaVerde
//
//  Created by Karoline Schulis on 05/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "TiposCrimes.h"
#import "CrimesAmbientais.h"
#import "GCrimesAmbientais.h"
#import "infoCrimes.h"
@interface TiposCrimes ()

@end

@implementation TiposCrimes

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewAutomaticDimension];
    if (self) {
        
        [[self tableView] setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        
        [[self tableView] setSeparatorColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0.4]];
        
        [self.tabBarItem setTitle:@"Crimes ambientais"];
        [self.tabBarItem setImage:nil];
        
    }
    return self;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    infoCrimes *info = [[infoCrimes alloc]init];
    [[GCrimesAmbientais sharedCrimes]selectCrime:indexPath];
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

    return [[[GCrimesAmbientais sharedCrimes]TodosCrimes]count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Crimes Ambientais";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    CrimesAmbientais* crime;
    crime = [[[GCrimesAmbientais sharedCrimes]TodosCrimes] objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[crime Crime]];
    
    [cell setBackgroundColor:[UIColor colorWithRed:0 green:0.4 blue:0.1 alpha:0.1]];
    
    return cell;
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
