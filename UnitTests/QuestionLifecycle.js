#import "utils.js"
#import "questionScreens.js"

var target = UIATarget.localTarget();
var app = target.frontMostApp();
var appWindow = app.mainWindow();
var navigationBar = app.navigationBar();



function addQuestionTest() {
    UIALogger.logStart("Create question");
    navigationBar.rightButton().tap();
    
    var originalNumberOfQuestions = appWindow.tableViews()[0].cells().length;
    
    
    var randomNumber = Math.floor(Math.random() * 1000000 );
    var questionName = "Question no. " + randomNumber;

    screen = QuestionEditScreen(target, appWindow, navigationBar);
    screen.addNewQuestion(questionName, "This is an automated test question!");
    
    UIALogger.logDebug("After adding question!!!");
    var numberOfQuestionsDelta =  appWindow.tableViews()[0].cells().length;
    if ( numberOfQuestionsDelta != 1 ) {
        UIALogger.logFail( "Create question: error in number of questions in  table" );
    }
    
    UIALogger.logDebug("Here again");
    var cell = appWindow.tableViews()[0].cells()[questionName];
    if ( cell.isValid() ) {
        UIALogger.logPass("Create question");
    } else {
        UIALogger.logFail("Create question");
    }
    
    UIALogger.logDebug("Now going back!!!");
    navigationBar.leftButton().tap();
    
    return questionName;
}

function editQuestion(questionName) {
    UIALogger.logStart("Edit question " + questionName);
    

    navigationBar.rightButton().tap();
    
    var screen = QuestionEditScreen(target, appWindow, navigationBar);
    screen.editQuestion(questionName, questionName, "Update!");
    
    cell = appWindow.tableViews()[0].cells()[questionName];
    cell.tap();
    var answerTextView = appWindow.textViews()[0];
    if( answerTextView.value() == "Update!") {
        UIALogger.logPass("Edit question " + questionName);
    } else {
        UIALogger.logFail("Edit question " + questionName);
    }
    navigationBar.leftButton().tap();
    navigationBar.leftButton().tap();
}

function removeQuestionTest(questionName) {
    UIALogger.logStart("Delete question");
    navigationBar.rightButton().tap();
    
    var screen = QuestionEditScreen(target, appWindow, navigationBar);
    screen.removeQuestion(questionName);
    
    navigationBar.leftButton().tap();
    
    UIALogger.logPass("Delete question");
    
}

question = addQuestionTest();
editQuestion(question);
removeQuestionTest(question);