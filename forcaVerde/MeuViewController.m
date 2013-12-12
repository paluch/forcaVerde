//
//  MeuViewController.m
//  forcaVerde
//
//  Created by Tiago Paluch on 03/12/13.
//  Copyright (c) 2013 Tiago Paluch. All rights reserved.
//

#import "MeuViewController.h"
#import "Anotacao.h"

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

- (IBAction)selectPhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    


    
    [self presentViewController:picker animated:YES completion:NULL];
    [locationManager startUpdatingLocation];
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

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    [self setDescriGPS:newLocation.description];
    CLLocation *currentLocation = newLocation;
    self.Descricao = newLocation.description;
    if (currentLocation != nil) {
        self.longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        self.latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        CLLocationCoordinate2D cld = CLLocationCoordinate2DMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
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
             [[UIApplication sharedApplication] setApplicationIconBadgeNumber:1];
         }];
        
        
    }
}


- (IBAction)enviar:(id)sender {
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    [composer setMailComposeDelegate:self];
    if([MFMailComposeViewController canSendMail]) {
        [composer setToRecipients:[NSArray arrayWithObjects:@"paluch.tiago@gmail.com",nil]];
        [composer setSubject:[self Cidade]];
        
        NSString *corpo = [[NSString alloc] initWithFormat:@"%@ \n %@",[self Logradouro],[self descriGPS]];
        
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
@end
