var target = UIATarget.localTarget();
var app = target.frontMostApp();
var appWindow = app.mainWindow();
var navigationBar = app.navigationBar();


function typeTextInElement(text, element) {
	element.tap();
	UIATarget.localTarget().frontMostApp().keyboard().typeString(text);
}

function cleanAndTypeTextInElement(text, element) {
    element.setValue("");
    typeTextInElement(text, element);
}

function addQuestionTest() {
    UIALogger.logStart("Create question");
    navigationBar.rightButton().tap();
    
    var originalNumberOfQuestions = appWindow.tableViews()[0].cells().length;
    
    navigationBar.rightButton().tap();
    
    var randomNumber = Math.floor(Math.random() * 1000000 );
    var questionName = "Question no. " + randomNumber;

    typeTextInElement(questionName, appWindow.textFields()[0]);
    typeTextInElement("This is an automated test question!", appWindow.textViews()[0]);
    navigationBar.rightButton().tap();
    
    var numberOfQuestionsDelta =  appWindow.tableViews()[0].cells().length;
    if ( numberOfQuestionsDelta != 1 ) {
        UIALogger.logFail( "Create question: error in number of questions in  table" );
    }
    
    
    var cell = appWindow.tableViews()[0].cells()[questionName];
    if ( cell.isValid() ) {
        UIALogger.logPass("Create question");
    } else {
        UIALogger.logFail("Create question");
    }
    
    navigationBar.leftButton().tap();
    
    return questionName;
}

function editQuestion(questionName) {
    UIALogger.logStart("Edit question " + questionName);
    
    navigationBar.rightButton().tap();
    
    var cell = appWindow.tableViews()[0].cells()[questionName];
    cell.tap();
    cleanAndTypeTextInElement("Update!", appWindow.textViews()[0]);
    navigationBar.rightButton().tap();
    
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
    
    app.toolbar().buttons()["Edit"].tap();
    var cell = appWindow.tableViews()[0].cells()[questionName];
    cell.switches()[0].tap();
    cell.buttons()[0].tap();
    app.toolbar().buttons()["Done"].tap();
    
    navigationBar.leftButton().tap();
    
    UIALogger.logPass("Delete question");
    
}

question = addQuestionTest();
editQuestion(question);
removeQuestionTest(question);