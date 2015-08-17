//
//  ViewController.m
//  DinamicTable
//
//  Created by Juliya on 06.08.15.
//  Copyright (c) 2015 Juliya Odincova. All rights reserved.
//

#import "ViewController.h"
#import "FontsByFamilyController.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"


@interface TextFieldCell : UITableViewCell

//@property (nonatomic, weak) IBOutlet UITextField *textField;

@end

@implementation TextFieldCell

@end

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) NSArray *countries;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)setCountries:(NSArray *)countries {
//    NSArray *sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
//    _countries = [countries sortedArrayUsingDescriptors:sortDescriptors];
//    NSLog(@" array with %@", countries);
//    [self.tableView reloadData];
//}


- (IBAction)refresh:(UIRefreshControl *)sender {
    NSLog(@"Wants refresh");
    
    [self downloadListOfCountries:^(id result) {
        [self.refreshControl endRefreshing];
        if ([result isKindOfClass:[NSError class]]) {
            
        } else if ([result isKindOfClass:[NSData class]]) {
            NSError *error;
            self.countries = [NSJSONSerialization JSONObjectWithData:result options:0 error:&error];
        }
        
    }];
}



- (void)downloadListOfCountries:(void(^)(id result))completion {
    
    NSURL *url = [NSURL URLWithString:@"https://restcountries.eu/rest/v1/all"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
     __weak typeof(request) wRequest = request;
    
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:wRequest];
    
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
      
            NSLog(@"JSON: %@", responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    [[NSOperationQueue mainQueue] addOperation:op];


}



#pragma mark - UITableViewDataSource<NSObject>


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return self.countries.count;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        
    static NSString *identifier = @"Default Cell Identidier ";
    
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    id countryObject = self.countries[indexPath.row];
    
    cell.textLabel.text = countryObject[@"name"];
   
    }
    
    return cell;

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    NSString *city = [self.countries objectAtIndex:indexPath.row];
    
    ((FontsByFamilyController *)segue.destinationViewController).city = city;
}


@end
