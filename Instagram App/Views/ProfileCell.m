//
//  ProfileCell.m
//  Instagram App
//
//  Created by Ileen Fan on 7/8/21.
//

#import "ProfileCell.h"
#import <Parse/PFImageView.h>
#import "Post.h"

@implementation ProfileCell

- (void)setPost:(Post *)post {
    _post = post;
    self.profileImageView.file = post[@"image"];
    [self.profileImageView loadInBackground];
    
}

@end
