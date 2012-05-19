#import "TaskDetailViewController.h"
#import "TaskDataController.h"
#import "SkillTree.h"
#import "ViewableInTable.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation TaskDetailViewController

@synthesize dataController = _dataController;
@synthesize skillTree = _skillTree;

- (void)setSkillTree:(SkillTree *)newSkillTree
{
    if (_skillTree != newSkillTree) {
        _skillTree = newSkillTree;
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //	// Do any additional setup after loading the view, typically from a nib.
    //    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    //
    //    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TaskCell";
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    id <ViewableInTable> valueAtIndex = [self.dataController objectInListAtIndex:indexPath.row];

    [[cell textLabel] setText:[valueAtIndex dataForTable]];
    
    if ([valueAtIndex isMemberOfClass:[SkillTree class]]) {
        [[cell textLabel] setTextColor:UIColorFromRGB(0xFF0000)];
    } else if ([valueAtIndex isMemberOfClass:[Level class]]) {
        [[cell textLabel] setTextColor:UIColorFromRGB(0x00FF00)];
    } else {
        [[cell textLabel] setTextColor:UIColorFromRGB(0x0000FF)];
    }
    
    UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
    cell.accessoryView = switchView;
    [switchView setOn:[self readCellStatus] animated:NO];
    [switchView addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
                
    return cell;
}

- (BOOL) readCellStatus
{
    return NO;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
////    switch( [indexPath row] ) {
////        case MY_SWITCH_CELL: {
//            UITableViewCell* aCell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
//            if( aCell == nil ) {
//                aCell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"TaskCell"];
//                aCell.textLabel.text = @"I Have A Switch";
//                aCell.selectionStyle = UITableViewCellSelectionStyleNone;
//                UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
//                aCell.accessoryView = switchView;
//                [switchView setOn:NO animated:NO];
//                [switchView addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
//            }
//            return aCell;
////        }
////        break;
////    }
////    return nil;
//}

- (void) switchChanged:(id)sender {
    UISwitch* switchControl = sender;
    NSLog( @"The switch is %@", switchControl.on ? @"ON" : @"OFF" );
}




- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"BLAH"]) {
//        TaskDetailViewController *taskDetailViewController = [segue destinationViewController];
// 
//        taskDetailViewController.skillTree = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
    }
}

@end