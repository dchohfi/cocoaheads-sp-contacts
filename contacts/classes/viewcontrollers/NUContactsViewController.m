//
//  NUContactsViewController.m
//  contacts
//
//  Created by Diego Chohfi on 8/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NUContactsViewController.h"
#import "NUContactsAPI.h"
#import "NUPerson.h"
#import "NUContactCell.h"

#import "SVProgressHUD.h"
#import "MTLJSONAdapter.h"
#import "UIImageView+AFNetworking.h"

@interface NUContactsViewController()

@property (nonatomic, strong) NSArray *contacts;

@end

@implementation NUContactsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Contatos nubank";
    }
    return self;
}

- (void)viewDidLoad {
    self.tableView.rowHeight = 92.f;
    [self.tableView registerNib:[UINib nibWithNibName:@"NUContactCell" bundle:nil]
         forCellReuseIdentifier:@"NUContactCell"];
    
    [SVProgressHUD showWithStatus:@"Carregando contatos"];
    [[NUContactsAPI sharedAPI] GET:@"people.json"
                        parameters:nil
                           success:^(NSURLSessionDataTask *task, id responseObject) {
                               [SVProgressHUD showSuccessWithStatus:@"Contatos carregados :)"];
                               NSArray *contactsData = responseObject[@"contacts"];
                               
                               self.contacts = [MTLJSONAdapter modelsOfClass:[NUPerson class]
                                                               fromJSONArray:contactsData
                                                                       error:nil];
                           } failure:^(NSURLSessionDataTask *task, NSError *error) {
                               [SVProgressHUD showErrorWithStatus:@"Ops, tivemos um problema :("];
                           }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NUPerson *person = self.contacts[indexPath.row];
    NUContactCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NUContactCell"
                                                               forIndexPath:indexPath];
    
    [cell.imageProfile setImageWithURL:person.image];
    cell.labelName.text = person.name;
    cell.labelEmail.text = person.email;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd/MM/yyyy";
    
    
    NSString *dayOfBirthday = [formatter stringFromDate:person.dayOfBirthday];
    cell.labelDayOfBirthday.text = dayOfBirthday;
    
    return cell;
}

@end
