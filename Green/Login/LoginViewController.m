//
//  LoginViewController.m
//  Green
//
//  Created by Stefan Thomsen on 18/08/18.
//  Copyright © 2018 CreativeDev. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
    
@property (weak, nonatomic) IBOutlet UIView *alertView;
@property (weak, nonatomic) IBOutlet UILabel *alertLabel;
    
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLoginButtonPresed:(id)sender{
    if ([self isCredencialsValid]){
        //TODO: Send params to the api for example
        
    }
}
    
- (IBAction)onRegisterButtonPressed:(id)sender{
    [self performSegueWithIdentifier:@"RegisterView" sender:NULL];
}
    
- (BOOL)isCredencialsValid{
    _alertView.hidden = TRUE;
    if (_usernameField.text.length < 5){
        _alertView.hidden = FALSE;
        _alertLabel.text = @"Username must have at leat 5 characters";
        return FALSE;
    }
    
    if (_passwordField.text.length < 5){
        _alertView.hidden = FALSE;
        _alertLabel.text = @"Pasword must have at leat 5 characters";
        return FALSE;
    }
    
    return TRUE;
}

@end
