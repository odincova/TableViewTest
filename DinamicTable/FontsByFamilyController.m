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

@property (nonatomic, strong) NSArray *fontNames;

@end

@implementation FontsByFamilyController

- (NSArray *)fontNames {
    if (!_fontNames) {
        _fontNames = [UIFont fontNamesForFamilyName:self.familyName];
    }
    return _fontNames;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.fontNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Font Cell Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = [self.fontNames objectAtIndex:indexPath.row];
   // cell.imageView
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    NSString *fontName = [self.fontNames objectAtIndex:indexPath.row];
    ((TextViewController *)segue.destinationViewController).font = [UIFont fontWithName:fontName size:21];
}

@end
