#! /bin/bash
instruments -t /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate ~/Library/Application\ Support/iPhone\ Simulator/5.1/Applications/0ADDFB7C-2811-48B2-9F8E-047ACC9531A6//Kotoba.app -e UIASCRIPT ./ci.js 
