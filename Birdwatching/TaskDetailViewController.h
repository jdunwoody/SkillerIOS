#import <UIKit/UIKit.h>

@class TaskDataController;
@class SkillTree;

@interface TaskDetailViewController : UITableViewController

@property (strong, nonatomic) SkillTree *skillTree;
@property (strong, nonatomic) TaskDataController *dataController;

@end
