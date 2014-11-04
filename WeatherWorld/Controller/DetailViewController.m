//
//  DetailViewController.m
//  WeatherWorld
//
//  Created by Pol Quintana on 4/11/14.
//  Copyright (c) 2014 Pol Quintana. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        [self configureView];
    }
}

- (void)configureView {
    if (self.detailItem) {
        self.nameTextField.text = self.detailItem.name;
        self.latitudeTextField.text = [NSString stringWithFormat:@"%@", self.detailItem.latitude];
        self.longitudeTextField.text = [NSString stringWithFormat:@"%@", self.detailItem.longitude];
        [self updateLabel];
        
    }
}

- (IBAction)updateLabel {
    self.mainLabel.text = [NSString stringWithFormat:@"%@ \nLat:%@º - Lon:%@º", self.nameTextField.text, self.latitudeTextField.text, self.longitudeTextField.text];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.detailItem.name = self.nameTextField.text;
    self.detailItem.latitude = [NSNumber numberWithInteger:[self.latitudeTextField.text integerValue]];
    self.detailItem.longitude = [NSNumber numberWithInteger:[self.longitudeTextField.text integerValue]];

    NSError *error;
    
    [self.detailItem.managedObjectContext save:&error];
    if (error) {
        abort();
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
