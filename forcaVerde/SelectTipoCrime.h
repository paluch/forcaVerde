//
//  SelectTipoCrime.h
//  forcaVerde
//
//  Created by Karoline Schulis on 03/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTipoCrime : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *PickerCrimes;

@end
