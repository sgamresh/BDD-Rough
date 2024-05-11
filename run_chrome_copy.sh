#!/bin/bash

EXE="katalonc"
if pgrep -x "$EXE" >/dev/null; then
    echo "There is a suite already running"
    exit 0
else
    cd /Applications/Katalon\ Studio\ Engine.app/Contents/MacOS
    ./katalonc -noSplash -runMode=console -projectPath="/Users/geetanjali/BDD-Rough/BDD-Project-Sample.prj" -retry=0 -testSuitePath="Test Suites/SampleSuite" -browserType="Chrome" -executionProfile="default" -apiKey="699232ce-ec99-436f-9caf-d02026900be4" --config -proxy.auth.option=NO_PROXY -proxy.system.option=NO_PROXY -proxy.system.applyToDesiredCapabilities=true -webui.autoUpdateDrivers=true
fi

if [ $? -eq 0 ]; then
    echo "Katalon execution completed successfully. No test case failed"
    exit 0
elif [ $? -eq 1 ]; then
    echo "Katalon execution completed successfully. But, one or more test cases failed"
    exit 0
else
    echo "There was an error executing the Katalon script"
    exit 1
fi
