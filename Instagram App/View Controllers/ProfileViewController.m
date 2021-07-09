//
//  ProfileViewController.m
//  Instagram App
//
//  Created by Ileen Fan on 7/8/21.
//

#import "ProfileViewController.h"
#import "ProfileCell.h"
#import "Parse/Parse.h"
#import <Parse/PFImageView.h>
#import "User.h"
#import "Post.h"

@interface ProfileViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet PFImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) UIImage *imageForProfile;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.user = [PFUser currentUser];
    
    self.profileImage.layer.cornerRadius = 60;
    
    self.usernameLabel.text = self.user.username;
//    PFFileObject *profilePhoto = self.user[@"profileImage"];
//    NSURL *photoURL = [NSURL URLWithString:profilePhoto.url];
    self.profileImage.file = self.user[@"profileImage"];
    [self.profileImage loadInBackground];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*) self.collectionView.collectionViewLayout;
    
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    CGFloat postersPerLine = 3;
    CGFloat itemWidth = (self.collectionView.frame.size.width - layout.minimumInteritemSpacing * (postersPerLine-1)) / postersPerLine - 15;
    CGFloat itemHeight = itemWidth;
    
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    
    [self loadPosts];
}

-(void)loadPosts{
    PFQuery * query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    [query whereKey:@"author" equalTo:[PFUser currentUser]];
   
    query.limit = 20;
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (error == nil){
            self.arrayOfUserPosts = objects;
            [self.collectionView reloadData];
        } else {
            NSLog(@"error");
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    editedImage = [self resizeImage:editedImage withSize:CGSizeMake(300, 300)];
    self.imageForProfile = editedImage;

    // Do something with the images (based on your use case)
    
    if(editedImage) {
        [self.profileImage setImage:self.imageForProfile];
        NSData *imageData = UIImagePNGRepresentation(self.imageForProfile);
        PFFileObject *photo = [PFFileObject fileObjectWithData:imageData];
        self.user[@"profileImage"] = photo;
        [self.user saveInBackground];
        
        
        //[cell.profileImageView setImage:self.user[@"profileImage"]];
//        self.user[@"profileImage"] = [self getPFFileFromImage:editedImage];
//
//        [self.user saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//
//        }];
////
//        PFFileObject * profileImage = self.user[@"profileImage"]; // set your column name from Parse here
//        NSURL * imageURL = [NSURL URLWithString:profileImage.url];
//        [self.profileImageView setImageWithURL:imageURL];
            
        }
        else {
            [self.profileImage setImage:originalImage];
        }
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
 
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"image.png" data:imageData];
}

- (IBAction)editProfilePhoto:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
}





//create a tap gesture recognizer for the image
//make sure image user intereaction is enables
//on tap, allow user to either take a picture or pick a picture
//create a UIImageView property that you can use throughout this class
// set the "original image" to the property you created
//then set the property equal to the profile picture
//set the profile picture imageview equal to the image picked


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ProfileCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfileCell" forIndexPath:indexPath];
    
    Post *post = self.arrayOfUserPosts[indexPath.item];
    
    //[cell.profileImageView setImage:self.user[@"profileImage"]];
    
    NSLog(@"loading");
    
    cell.post = post;
    
    //set image view in cell equal to post image
    
    
    return cell;
    
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayOfUserPosts.count;
    
}

@end
