//
//  ComposeViewController.m
//  Instagram App
//
//  Created by Ileen Fan on 7/6/21.
//

#import "ComposeViewController.h"
#import "Post.h"
#import "Parse/Parse.h"

@interface ComposeViewController () <UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *captionView;
@property (strong, nonatomic) UIImage *imageToPost;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.captionView.delegate = self;
    
    self.captionView.text = @"Write a caption...";
    self.captionView.textColor = [UIColor lightGrayColor];
    
    [self checkForCameraOption];
    
}

-(void)checkForCameraOption {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePickerVC animated:YES completion:nil];
    }
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (textView.textColor == [UIColor lightGrayColor]) {
        textView.text = nil;
        textView.textColor = [UIColor blackColor];
        }
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Write a caption...";
        textView.textColor = [UIColor lightGrayColor];
        }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    editedImage = [self resizeImage:editedImage withSize:CGSizeMake(300, 300)];
    self.imageToPost = editedImage;
    
    if(editedImage) {
        [self.imageView setImage:editedImage];
    } else {
        [self.imageView setImage:originalImage];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)getPhotos:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}
- (IBAction)cancelPost:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)sharePost:(id)sender {
    
    [Post postUserImage:self.imageToPost withCaption:self.captionView.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            self.captionView.text = @"";
            [self dismissViewControllerAnimated:true completion:nil];
            
        } else {            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sharing Failed"
                                                                                       message:@"Invalid caption or image"
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

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
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
