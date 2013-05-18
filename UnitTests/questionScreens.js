/**
 * All methods in this class assumes you are on the tableView that shows the list of the questions.
 */
function QuestionEditScreen(target, appWindow, navigationBar) {
    
    var _screen = {
        addNewQuestion: function (value, answer) {
            navigationBar.rightButton().tap();
            this._addOrEditQuestion(value, answer);
        },
    
        editQuestion: function(oldValue, newValue, newAnswer) {
            var cell = appWindow.tableViews()[0].cells()[oldValue];
            cell.tap();
            this._addOrEditQuestion(newValue, newAnswer);
        },
        
        removeQuestion: function(value) {
            app.toolbar().buttons()["Edit"].tap();
            var cell = appWindow.tableViews()[0].cells()[value];
            cell.switches()[0].tap();
            cell.buttons()[0].tap();
            app.toolbar().buttons()["Done"].tap();
        },
        
        removeAllQuestions:function() {
            app.toolbar().buttons()["Edit"].tap();
            var cells = appWindow.tableViews()[0].cells()
            while( cells.length > 0 ) {
                cell = cells[0];
                cell.switches()[0].tap();
                cell.buttons()[0].tap();
                cells = appWindow.tableViews()[0].cells()                
            }
            app.toolbar().buttons()["Done"].tap();
            
        },
    
        _addOrEditQuestion: function(value, answer) {
            cleanAndTypeTextInElement(value, appWindow.textFields()[0]);
            cleanAndTypeTextInElement(answer, appWindow.textViews()[0]);
            navigationBar.rightButton().tap();
            target.delay(1);
            

        },
        
    };
    
    return _screen;




}
