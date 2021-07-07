//
//  HomeViewController.m
//  Instagram App
//
//  Created by Ileen Fan on 7/6/21.
//

#import "HomeViewController.h"
#import "Parse/Parse.h"
#import "SceneDelegate.h"
#import "ComposeViewController.h"
#import "PostCell.h"
#import "Post.h"


@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *posts;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)handleLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
    }];
    
    SceneDelegate *myDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
    //[[UIApplication sharedApplication].keyWindow setRootViewController: HomeNavController];
    
    [self dismissViewControllerAnimated:false completion:nil];
}

-(void)loadPosts{
    PFQuery * query = [PFQuery queryWithClassName:@"Post"];
    [query findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (error == nil){
            self.posts = objects;
            [self.tableView reloadData];
        } else {
            NSLog(@"error");
        }
    }];
    
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    Post *post = self.posts[indexPath.row];
    //cell.postUsername.text = post[@"username"];
    cell.postCaption.text = post[@"caption"];
    //PFFileObject *image = post[@"image"];
    //[cell.postImage setImageWithURL:image.url];
    //cell.post = post;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   
}


@end
