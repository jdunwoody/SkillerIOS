//
//  Created by James on 1/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SkillerDetailViewController.h"
#import "SkillTree.h"

@interface SkillerDetailViewController ()
- (void)configureView;
@end

@implementation SkillerDetailViewController

@synthesize skillTree = _skillTree;
@synthesize nameLabel = _nameLabel;
@synthesize scoreLabel = _scoreLabel;
@synthesize dateLabel = _dateLabel;

#pragma mark - Managing the detail item

- (void)setSighting:(SkillTree *)newSkillTree
{
    if (_skillTree != newSkillTree) {
        _skillTree = newSkillTree;
        
        [self configureView];
    }
}

- (void)configureView
{
    SkillTree *theSkillTree = self.skillTree;

    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
         
    if (theSkillTree) {
        self.nameLabel.text = theSkillTree.name;
        self.scoreLabel.text = [NSString stringWithFormat:@"%d", [theSkillTree.score intValue]];
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)theSkillTree.date];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    self.sighting = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end