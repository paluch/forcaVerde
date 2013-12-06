//
//  SelectTipoCrime.m
//  forcaVerde
//
//  Created by Karoline Schulis on 03/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "SelectTipoCrime.h"

@interface SelectTipoCrime ()

@end

@implementation SelectTipoCrime

{
    int opcaoAtual;
    NSMutableArray *Crimes;
}

- (id)init
{
    self = [super init];
    if (self) {
        opcaoAtual = 0;
 
        Crimes = [[NSMutableArray alloc]initWithObjects:@"contra a Fauna",@"contra a Flora ", @"Poluição e outros",@"Contra Ordenamento Urbano", @"contra a Administração Ambiental", nil];
        
        [self.tabBarItem setTitle:@"Denuncia"];
        [self.tabBarItem setImage:nil];
        
        
    }
    return self;
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
            return [Crimes count];
    
}

- (UIView *)pickerView:(UIPickerView *)seleciona viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [seleciona rowSizeForComponent:component].width-10, [seleciona rowSizeForComponent:component].height-10)];
    
                lbl.text =[Crimes objectAtIndex:row];
                lbl.adjustsFontSizeToFitWidth = YES;
                lbl.font=[UIFont systemFontOfSize:20];
                lbl.backgroundColor = [UIColor colorWithRed:0
                                                      green:0.2
                                                       blue:0
                                                      alpha:0.5];
    
    
    return lbl;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

        opcaoAtual = (int) row;
  
}



- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
