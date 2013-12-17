//
//  MeuViewController.m
//  forcaVerde
//
//  Created by Tiago Paluch on 03/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "MeuViewController.h"
#import "Anotacao.h"
#import "denuncia.h"
#import "banco.h"
#import "Reachability.h"
#import "AbrirFoto.h"
#import "GCrimesAmbientais.h"
#include "CrimesAmbientais.h"

@interface MeuViewController ()

@end

@implementation MeuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        
        [self.view addSubview: [self telaInicial]];
        [self setTitle:@"Denuncia"];
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:@"Foto" style:UIBarButtonItemStyleBordered target:self action:@selector(takePhoto:)];
        [[self navigationItem] setLeftBarButtonItem:bbi animated:YES];
        UIBarButtonItem *bbr = [[UIBarButtonItem alloc] initWithTitle:@"Escolher" style:UIBarButtonItemStyleBordered target:self action:@selector(selectPhoto:)];
        [[self navigationItem] setRightBarButtonItem:bbr animated:YES];
    
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //[locationManager startUpdatingLocation];
    // Do any additional setup after loading the view from its nib.
    //[[self tiposcrimes] setTransform: CGAffineTransformMakeScale(1.0, 0.5)];
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
}
- (void)viewDidAppear:(BOOL)animated {
    if ([[banco meuBanco] escolhida]!=nil) {
        denuncia *den = [[banco meuBanco] escolhida];
        [[self imageView] setImage:[den Foto]];
        [self setLatitude:[den Latitude]];
        [self setLongetude:[den Longitude]];
        [self setPrecisao:[den Precisao]];
        [self setDataHora:[den DataHora]];
        [self setPosicaoCrime:[den Crime]];
        
        [[self tiposcrimes] selectRow:_posicaoCrime inComponent:0 animated:YES];
        
        [self updateLocalizacaoPaluch];
    }
}
- (IBAction)selectPhoto:(id)sender {
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    
//
//
//    
//    [self presentViewController:picker animated:YES completion:NULL];
//    [locationManager startUpdatingLocation];
    
    AbrirFoto *ab = [[AbrirFoto alloc] init];
    [[banco meuBanco] setEscolhida:nil];
    [[self navigationController] pushViewController:ab animated:YES];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
   
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [locationManager startUpdatingLocation];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    
}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void) updateLocalizacaoPaluch{
    BOOL internet = NO;
    if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == ReachableViaWiFi) {
        internet = YES;
    } else if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == ReachableViaWWAN) {
        internet = YES;
    } else if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == NotReachable) {
        internet = NO;
    }
    
    if (internet) {
        
        //[[self meuMapView] annotations];
        
        CLLocation *currentLocation = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longetude];
        CLLocationCoordinate2D cld = CLLocationCoordinate2DMake(self.latitude, self.longetude);
        [[self meuMapView] setCenterCoordinate:cld animated:YES];
        Anotacao *addAnnotation = [[Anotacao alloc] initWithTitle:@"teste" andCoordinate:cld];
        [[self meuMapView] addAnnotation:addAnnotation];
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(cld, 500, 500);
        MKCoordinateRegion adjustedRegion = [self.meuMapView regionThatFits:viewRegion];
        [self.meuMapView setRegion:adjustedRegion animated:YES];
        
        CLGeocoder *reverseGeocoder = [[CLGeocoder alloc] init];
        
        [reverseGeocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
         {
             NSLog(@"reverseGeocodeLocation:completionHandler: Completion Handler called!");
             if (error){
                 NSLog(@"Geocode failed with error: %@", error);
                 return;
             }
             
             NSLog(@"Received placemarks: %@", placemarks);
             
             
             CLPlacemark *myPlacemark = [placemarks objectAtIndex:0];
             NSString *city = myPlacemark.locality;
             NSString *countryName = [[NSString alloc] initWithFormat:@"Cidade: %@ e endereco: %@", city, myPlacemark.description];
             
             
             [self setCidade:city];
             [self setLogradouro:countryName];
             
         }];
    }
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //NSLog(@"didUpdateToLocation: %@", newLocation);
    [self setDescriGPS:newLocation.description];
    CLLocation *currentLocation = newLocation;
    self.Descricao = newLocation.description;
    if (currentLocation != nil) {
        self.longetude = currentLocation.coordinate.longitude;
        self.latitude = currentLocation.coordinate.latitude;
        self.precisao = currentLocation.horizontalAccuracy;
        self.DataHora = [[NSString alloc] initWithFormat:@"%@",currentLocation.timestamp.description];

        [self updateLocalizacaoPaluch];
        
    }
}


- (IBAction)enviar:(id)sender {
    BOOL internet = NO;
    
    CrimesAmbientais* crime;
    crime = [[[GCrimesAmbientais sharedCrimes]TodosCrimes] objectAtIndex: [[self tiposcrimes] selectedRowInComponent:0]];
    [self setTema:[crime Crime]];
    [self setPosicaoCrime:[[self tiposcrimes] selectedRowInComponent:0]];
    
    if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == ReachableViaWiFi) {
        internet = YES;
    } else if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == ReachableViaWWAN) {
        internet = YES;
    } else if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == NotReachable) {
        internet = NO;
    }
    
    if (!internet) {
        denuncia *den = [[denuncia alloc] initWithFoto:self.imageView.image Crime:_posicaoCrime DataHora:_DataHora Latitude:_latitude Longitude:_longetude Precisao:_precisao];
        [[banco meuBanco] saveData:den];
    } else {
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    [composer setMailComposeDelegate:self];
    if([MFMailComposeViewController canSendMail]) {
        [composer setToRecipients:[NSArray arrayWithObjects:@"paluch.tiago@gmail.com",nil]];
        [composer setSubject:[self Cidade]];
        
        NSString *corpo = [[NSString alloc] initWithFormat:@"%@ \n %@ \n %@",[self tema], [self Logradouro],[self descriGPS]];
        
        [composer setMessageBody:corpo isHTML:NO];
        
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        
        UIGraphicsBeginImageContext(self.meuMapView.frame.size);
        [self.meuMapView.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *mapImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        
        NSData *data = UIImageJPEGRepresentation(self.imageView.image,1);
        NSData *datm = UIImageJPEGRepresentation(mapImage,1);
        [composer addAttachmentData:data  mimeType:@"image/jpeg" fileName:@"Photograph.jpg"];
        [composer addAttachmentData:datm  mimeType:@"image/jpeg" fileName:@"mapa.jpg"];
        
        [self presentViewController:composer animated:YES completion:nil];
        
    }
    }
}
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[[GCrimesAmbientais sharedCrimes]TodosCrimes]count];
    
}

- (UIView *)pickerView:(UIPickerView *)seleciona viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [seleciona rowSizeForComponent:component].width-10, [seleciona rowSizeForComponent:component].height-10)];
    
    
    CrimesAmbientais* crime;
    crime = [[[GCrimesAmbientais sharedCrimes]TodosCrimes] objectAtIndex: row];
    
    lbl.text = [crime Crime];
    lbl.adjustsFontSizeToFitWidth = YES;
    lbl.font=[UIFont systemFontOfSize:20];
    lbl.backgroundColor = [UIColor colorWithRed:0
                                          green:0.2
                                           blue:0
                                          alpha:0.5];
    //[lbl setTransform:CGAffineTransformMakeScale(1.0, 2.0)];
    return lbl;
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    CrimesAmbientais* crime;
    crime = [[[GCrimesAmbientais sharedCrimes]TodosCrimes] objectAtIndex: row];
    [self setTema:[crime Crime]];
    [self setPosicaoCrime:(int)row];
}
- (CGSize)rowSizeForComponent:(NSInteger)component {
    return CGSizeMake(320, 120);
}
@end
