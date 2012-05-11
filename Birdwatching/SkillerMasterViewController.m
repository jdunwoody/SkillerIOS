#import "SkillerMasterViewController.h"
#import "TaskDetailViewController.h"
#import "SkillTreeDataController.h"
#import "SkillTree.h"

//@interface SkillerMasterViewController () {
//NSMutableArray *_objects;
//}
//@end

@implementation SkillerMasterViewController

@synthesize dataController = _dataController;

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

/*
- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
 */     

//#pragma mark - Table View

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
    static NSString *CellIdentifier = @"SkillerCell";
    static NSDateFormatter *formatter = nil;
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    SkillTree *skillTreeAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:skillTreeAtIndex.name];
    [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *) skillTreeAtIndex.date]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"TasksForSkillTree"]) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        NSDate *date = [dateFormatter dateFromString:@"2011-04-11"];
    
        
//        if ([[segue identifier] isEqualToString:@"relevantSegueIdentifier"])
//        {
//            // [segue destinationViewController] is read-only, so in order to
//            // write to that view controller you'll have to locally instantiate
//            // it here:
//            ViewController *upcomingViewController = [segue destinationViewController];
//            
//            // You now have a solid reference to the upcoming / destination view
//            // controller. Example use: Allocate and initialize some property of
//            // the destination view controller before you reach it and inject a
//            // reference to the current view controller into the upcoming one:
//            upcomingViewController.someProperty = [[SomePropertyClass alloc] initWithString:@"Whatever!"];
//            upcomingViewController.initialViewController = [segue sourceViewController];
//            // Or, equivalent, but more straightforward:
//            //upcomingViewController.initialViewController = self;
//        }
        
        TaskDetailViewController *taskDetailViewController = [segue destinationViewController];
        NSNumber *score = [NSNumber numberWithInt:2];
//        SkillTree *st = [[SkillTree alloc] initWithName:@"name" score:score date:date];
        SkillTree *st = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
        
        NSLog(@"SkillTree name: %@", st.name);
        
        taskDetailViewController.skillTree = [[SkillTree alloc]initWithName:@"name" score:score date:date];
        taskDetailViewController.skillTree = nil;
        taskDetailViewController.skillTree = st;
    }
}

@end
