//
//  DetailsViewController.m
//  Instagram App
//
//  Created by Ileen Fan on 7/8/21.
//

#import "DetailsViewController.h"
#import <Parse/PFImageView.h>
#import "DateTools.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet PFImageView *profilePic;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showDetails];
}

- (void)showDetails {
    self.imageView.file = self.post[@"image"];
    self.profilePic.file = self.post[@"author"][@"profileImage"];
    [self.profilePic loadInBackground];
    self.profilePic.layer.cornerRadius = 20;
    
    self.captionLabel.text = self.post[@"caption"];
    self.usernameLabel.text = self.post[@"author"][@"username"];
    self.timeLabel.text = self.post.createdAt.timeAgoSinceNow;
    
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
