cd..
cd Scripts

start /B pybot -d Report\mac_Chrome -t demo -v DESIRED_CAPABILITIES:"name:MY_POC_DEMO_ON_MAC_USING_CHROME" -v REMOTE_URL:http://naveda:2312453d-fa1b-4486-8e9b-56c6c7df4761@ondemand.saucelabs.com:80/wd/hub Demo.robot

start /B pybot -d Report\Win7_chrome -t demo -v DESIRED_CAPABILITIES:"name:MY_POC_DEMO_On_WINDOW7_USING_CHROME,build:demo,platform:Windows 7,browserName:chrome,version:47.0" -v REMOTE_URL:http://naveda:2312453d-fa1b-4486-8e9b-56c6c7df4761@ondemand.saucelabs.com:80/wd/hub Demo.robot

start /B pybot -d Report\Win8_firefox -t demo -v DESIRED_CAPABILITIES:"name:MY_POC_DEMO_ON_WINDOS8_USING_FIREFOX,build:demo,platform:Windows 8,browserName:firefox,version:45.0" -v REMOTE_URL:http://naveda:2312453d-fa1b-4486-8e9b-56c6c7df4761@ondemand.saucelabs.com:80/wd/hub Demo.robot