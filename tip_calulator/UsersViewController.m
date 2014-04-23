//
//  UsersViewController.m
//  tip_calulator
//
//  Created by Simon Chaffetz on 4/22/14.
//
//

#import "UsersViewController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"

@interface UsersViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *names;
@property (nonatomic, strong) NSArray *movies;

@end

@implementation UsersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"Names";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.movies = object[@"movies"];
        [self.tableView reloadData];
    }];
    
    self.tableView.rowHeight = 134;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView: (UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    NSDictionary *movie = self.movies[indexPath.row];
    NSDictionary *posters = movie[@"posters"];
    NSString *posterUrl = posters[@"detailed"];
    
    cell.movieTitleLabel.text = movie[@"title"];
    cell.synopsisLabel.text = movie[@"synopsis"];
    [cell.posterView setImageWithURL: [NSURL URLWithString: posterUrl]];

    return cell;
}

- (void)tableView:(UITableView *) tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
