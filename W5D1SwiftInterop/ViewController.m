//
//  ViewController.m
//  W5D1SwiftInterop
//
//  Created by Daniel Mathews on 2017-06-26.
//  Copyright © 2017 Daniel Mathews. All rights reserved.
//

#import "ViewController.h"
#import "W5D1SwiftInterop-Swift.h"

@interface ViewController ()

@property NSMutableArray *objects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //    self.navigationItem.rightBarButtonItem = addButton;
    
    
    NSString *urlString = @"https://api.github.com/users/dmathewwws/repos";
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (!error) {
            
            NSError *jsonError = nil;
            
            NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            NSMutableArray *reposArray = [NSMutableArray array];
            
            for (NSDictionary *eachRepo in repos){
                
                NSString *name = eachRepo[@"name"];
                NSURL *url = [NSURL URLWithString:eachRepo[@"html_url"]];
                NSNumber *size = eachRepo[@"size"];
                
                Repo* aRepo = [[Repo alloc] initWithName:name url:url size:size.intValue];
                
                [reposArray addObject:aRepo];
                
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.objects = reposArray;
                [self.tableView reloadData];
                
            });
            
        }
        
    }];
    
    [dataTask resume];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Repo *repo = self.objects[indexPath.row];
    cell.textLabel.text = repo.name;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
