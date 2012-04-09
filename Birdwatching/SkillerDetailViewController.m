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

@synthesize sighting = _sighting, nameLabel = _nameLabel, scoreLabel = _scoreLabel, dateLabel = _dateLabel;

#pragma mark - Managing the detail item

- (void)setSighting:(SkillTree *)newSighting
{
    if (_sighting != newSighting) {
        _sighting = newSighting;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    SkillTree *theSighting = self.sighting;

    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
         
    if (theSighting) {
        self.nameLabel.text = theSighting.name;
        self.scoreLabel.text = theSighting.score;
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)theSighting.date];
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
