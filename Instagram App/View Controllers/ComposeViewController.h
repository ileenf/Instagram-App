//
//  ComposeViewController.h
//  Instagram App
//
//  Created by Ileen Fan on 7/6/21.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@protocol ComposeViewControllerDelegate <NSObject>

-(void)didPost;

@end

@interface ComposeViewController : UIViewController
@property (weak, nonatomic) id<ComposeViewControllerDelegate>delegate;
@property (strong, nonatomic) NSArray *posts;

@end

NS_ASSUME_NONNULL_END
