cd..
cd Scripts
 start /B pybot -d Report\Win7_chrome -t TestTag1 -t TestTag3 -v DESIRED_CAPABILITIES:"name:MY_POC_DEMO_On_WINDOW7_USING_CHROME,build:demo,platform:Windows 7,browserName:chrome,version:47.0" -v REMOTE_URL:http://naveda:2312453d-fa1b-4486-8e9b-56c6c7df4761@ondemand.saucelabs.com:80/wd/hub Demo.robot Demo2.robot 
