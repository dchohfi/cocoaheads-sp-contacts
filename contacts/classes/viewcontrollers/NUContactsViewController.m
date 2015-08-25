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
#import "NUContactsController.h"
#import "NUContactCellViewModel.h"

#import "SVProgressHUD.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface NUContactsViewController()<MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) NSArray *contacts;

@end

@implementation NUContactsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.title = @"Contatos Nubank";
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    self.tableView.rowHeight = 92.f;
    self.tableView.accessibilityIdentifier = @"tabela-contatos";
    [self.tableView registerNib:[UINib nibWithNibName:@"NUContactCell" bundle:nil]
         forCellReuseIdentifier:@"NUContactCell"];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self
                            action:@selector(loadContacts)
                  forControlEvents:UIControlEventValueChanged];
    
    [self loadContacts];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NUPerson *person = self.contacts[indexPath.row];
    NUContactCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NUContactCell"
                                                               forIndexPath:indexPath];
    cell.viewModel = [[NUContactCellViewModel alloc] initWithContact:person];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NUPerson *person = self.contacts[indexPath.row];
    [self sendEmailToContact:person];
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:^{
        [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
    }];
}

#pragma mark - private methods

- (void)sendEmailToContact:(NUPerson *)person {
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;
    [mailComposer setSubject:@"Olar :)"];
    [mailComposer setToRecipients:@[person.email]];
    [mailComposer setMessageBody:@"\n\n\n\n\nEmail para Nubank." isHTML:NO];
    
    [self presentViewController:mailComposer animated:YES completion:nil];
}

- (void)loadContacts {
    self.contacts = [[NSArray alloc] init];
    [SVProgressHUD showWithStatus:@"Carregando contatos"];
    [NUContactsController getContactsWithBlock:^(NSArray *contacts, NSError *error){
        [self.refreshControl endRefreshing];
        if (error) {
            [SVProgressHUD showErrorWithStatus:@"Ops, tivemos um problema :("];
            return;
        }
        [SVProgressHUD showSuccessWithStatus:@"Contatos carregados :)"];
        
        self.contacts = contacts;
    }];
}

#pragma mark - getter/setter

- (void)setContacts:(NSArray *)contacts {
    _contacts = contacts;
    [self.tableView reloadData];
}

@end
