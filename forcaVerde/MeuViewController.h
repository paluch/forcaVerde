//
//  MeuViewController.h
//  forcaVerde
//
//  Created by Tiago Paluch on 03/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MessageUI/MessageUI.h>
#import <MapKit/MapKit.h>
#import <SystemConfiguration/SystemConfiguration.h>


@interface MeuViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate,CLLocationManagerDelegate, MFMailComposeViewControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
{
    CLLocationManager *locationManager;
}
@property (strong, nonatomic) IBOutlet UIView *telaInicial;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;
- (IBAction)selectPhoto:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (strong, nonatomic) NSString *descriGPS;
- (IBAction)enviar:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *meuMapView;
@property (weak,nonatomic) NSString *Descricao;
@property (strong,nonatomic) NSString *Logradouro;

@property (strong,nonatomic) NSString *Cidade;
@property (strong,nonatomic) NSString *tema;
@property (weak,nonatomic) NSString *outro;
@property (weak, nonatomic) IBOutlet UIPickerView *tiposcrimes;

@property (strong, nonatomic) NSString *DataHora;
@property float latitude;
@property float longetude;
@property float precisao;
@property int posicaoCrime;

- (void) updateLocalizacaoPaluch;
@end
