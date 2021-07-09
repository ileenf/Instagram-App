//
//  ProfileViewController.h
//  Instagram App
//
//  Created by Ileen Fan on 7/8/21.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import <Parse/PFImageView.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController

@property (nonatomic, strong) NSArray *arrayOfUserPosts;
@property (nonatomic, strong) PFUser *user;

@end

NS_ASSUME_NONNULL_END
