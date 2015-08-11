//
//  FontsByFamilyController.m
//  DinamicTable
//
//  Created by Juliya on 07.08.15.
//  Copyright (c) 2015 Juliya Odincova. All rights reserved.
//

#import "FontsByFamilyController.h"
#import "TextViewController.h"

@interface FontsByFamilyController ()

@property (nonatomic, strong) NSArray *cities;

@end

@implementation FontsByFamilyController

- (NSArray *)cities {
    if (!_cities) {
        _cities = [[NSArray alloc] init];
    }
    return _cities;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Font Cell Identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.textLabel.text = [self.cities objectAtIndex:indexPath.row];
    
   // cell.imageView
    return cell;
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
//    
//    NSString *city = [self.cities objectAtIndex:indexPath.row];
//    
//    ((TextViewController *)segue.destinationViewController).font = [UIFont fontWithName:fontName size:21];
//}

@end
