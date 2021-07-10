//
//  LoginViewController.m
//  Instagram App
//
//  Created by Ileen Fan on 7/6/21.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didLogin:(id)sender {
    
    NSString *username = self.usernameField.text;
        NSString *password = self.passwordField.text;
    
    if ([self.usernameField.text isEqual:@""] || [self.passwordField.text isEqual:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Failed"
                                                                                   message:@"Bad or missing username/password"
                                                                            preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *TryAgainAction = [UIAlertAction actionWithTitle:@"Try Again"
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                          }];
        [alert addAction:TryAgainAction];
        
        [self presentViewController:alert animated:YES completion:^{
        }];
    }
        
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
            if (error != nil) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Failed"
                                                                                           message:@"Invalid username/password"
                                                                                    preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *TryAgainAction = [UIAlertAction actionWithTitle:@"Try Again"
                                                                    style:UIAlertActionStyleCancel
                                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                                  }];
                [alert addAction:TryAgainAction];
                
                [self presentViewController:alert animated:YES completion:^{
                }];
            } else {
                [self performSegueWithIdentifier:@"LoginSegue" sender:nil];
                
            }
        }];
}

- (IBAction)didSignup:(id)sender {
    PFUser *newUser = [PFUser user];
        
        newUser.username = self.usernameField.text;
        newUser.password = self.passwordField.text;
    
    if ([self.usernameField.text isEqual:@""] || [self.passwordField.text isEqual:@""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sign up Failed"
                                                                                   message:@"Bad or missing username/password"
                                                                            preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *TryAgainAction = [UIAlertAction actionWithTitle:@"Try Again"
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                          }];
        [alert addAction:TryAgainAction];
        
        [self presentViewController:alert animated:YES completion:^{
        }];
    }
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
            if (error != nil) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sign up Failed"
                                                                                           message:@"Already existing username/password"
                                                                                    preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *TryAgainAction = [UIAlertAction actionWithTitle:@"Try Again"
                                                                    style:UIAlertActionStyleCancel
                                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                                  }];
                [alert addAction:TryAgainAction];
                
                [self presentViewController:alert animated:YES completion:^{
                }];
                
            }
        }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
