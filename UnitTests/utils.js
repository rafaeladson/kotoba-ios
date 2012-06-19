function typeTextInElement(text, element) {
	element.tap();
	UIATarget.localTarget().frontMostApp().keyboard().typeString(text);
}

function cleanAndTypeTextInElement(text, element) {
    element.setValue("");
    typeTextInElement(text, element);
}
