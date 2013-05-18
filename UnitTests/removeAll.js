#import "utils.js"
#import "questionScreens.js"

var target = UIATarget.localTarget();
var app = target.frontMostApp();
var appWindow = app.mainWindow();
var navigationBar = app.navigationBar();


navigationBar.rightButton().tap();

screen = QuestionEditScreen(target, appWindow, navigationBar);
screen.removeAllQuestions();