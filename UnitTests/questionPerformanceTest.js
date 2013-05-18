#import "utils.js"
#import "questionScreens.js"

var target = UIATarget.localTarget();
var app = target.frontMostApp();
var appWindow = app.mainWindow();
var navigationBar = app.navigationBar();


navigationBar.rightButton().tap();


for(var i = 0; i < 100; i++) {
    UIALogger.logStart("Create question " + i);

    var randomNumber = Math.floor(Math.random() * 1000000 );
    var questionName = "Question no. " + randomNumber;

    screen = QuestionEditScreen(target, appWindow, navigationBar);
    screen.addNewQuestion(questionName, "This is an automated test question!");

    UIALogger.logDebug("After adding question " + i);
}
