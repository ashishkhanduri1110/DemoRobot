$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path
$demo = $directorypath.IndexOf("Batch_File")
$excelPath = $directorypath.Substring(0,$demo)
$file = $excelPath+"Excel\POC_Excel.xls"
$sheetName = "POCSheet"
$objExcel = New-Object -ComObject Excel.Application
$workbook = $objExcel.Workbooks.Open($file)
$sheet = $workbook.Worksheets.Item($sheetName)
$objExcel.Visible=$false
$testCaseName = ""
$executeBrowser=""
$browserWindow=""
$suite = ""
$name = ""
$execute = ""
$browser = ""
$feature=""
$sauceLabs = ""

#FOR CHROME SCRIPT
$chromeScript=""
$chromeExecuteBrowser = ""
$chromeTestCaseName = ""
$chromeSuite = ""

#Count max row
$rowMax = ($sheet.UsedRange.Rows).count

#Declare the starting positions
$rowName,$colName = 1,2
$rowExecute,$colExecute = 1,4
$rowBrowser,$colBrowser = 1,5
$rowFeature,$colFeature = 1,6
$rowSauceLabs,$colSauceLabs = 1,8

#loop to get values and store it
for ($i=1; $i -le $rowMax-1; $i++)
{
    if($sheet.Cells.Item($rowExecute+$i,$colExecute).text -eq "Yes" -and $sheet.Cells.Item($rowBrowser+$i,$colBrowser).text -eq "Chrome" -and $sheet.Cells.Item($rowSauceLabs+$i,$colSauceLabs).text -eq "Yes")
    {
        $name = $sheet.Cells.Item($rowName+$i,$colName).text
        $execute = $sheet.Cells.Item($rowExecute+$i,$colExecute).text
        $browser = $sheet.Cells.Item($rowBrowser+$i,$colBrowser).text
        $feature = $sheet.Cells.Item($rowFeature+$i,$colFeature).text
        $sauceLabs = $sheet.Cells.Item($rowSauceLabs+$i,$colSauceLabs).text
        
        $chromeExecuteBrowser = "Chrome"
        $chromeTestCaseName = $chromeTestCaseName+"-t "+$name+" "
        $chromeSuite = $chromesuite+$feature+".robot "
    }
}
if($chromeExecuteBrowser -eq "Chrome")
{
    $chromeScript = "start /B pybot -d Report\Win7_chrome "+$chromeTestCaseName+"-v DESIRED_CAPABILITIES:""name:MY_POC_DEMO_On_WINDOW7_USING_CHROME,build:demo,platform:Windows 7,browserName:chrome,version:47.0"" -v REMOTE_URL:http://naveda:2312453d-fa1b-4486-8e9b-56c6c7df4761@ondemand.saucelabs.com:80/wd/hub "+$chromeSuite
    $chromeScript = "cd..`ncd Scripts`n "+ $chromeScript
    
    $invocation = (Get-Variable MyInvocation).Value
    $path = Split-Path $invocation.MyCommand.Path
    $filePath = $path+"\ChromeSauceLabs.bat"
   
    $chromeScript | Set-Content $filePath
}

#close excel file
$objExcel.quit()