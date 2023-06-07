
FormatTime, now, %now%, HH
if (now = 07)
{
sleep, 60000 ;wait for OS fully prepare (60s)

;==========update_chrome (2 mins)==========
run C:\Program Files\Google\Chrome\Application\chrome.exe
sleep, 3000
send, chrome://settings/help
sleep, 1000
send, {enter}
sleep, 120000
send, {alt down}{F4}{alt up}
sleep, 5000

;==========web_crawler==========
run userorder.py, C:\Users\***\python\8way
sleep, 60000
run userorder.py, C:\Users\***\python\8way
sleep, 60000

;==========arguments_setting==========
url1 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url2 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url3 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url4 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url5 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url6 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url7 = https://docs.google.com/spreadsheets/d/***-***/edit#gid=0
url8 = https://docs.google.com/spreadsheets/d/***-***/edit#gid=0
url9 = https://docs.google.com/spreadsheets/d/***-***/edit#gid=0
url10 = https://docs.google.com/spreadsheets/d/***-***/edit#gid=0
url11 = https://docs.google.com/spreadsheets/d/***-***-***/edit#gid=0
url12 = https://docs.google.com/spreadsheets/d/******/edit#gid=0
url13 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url14 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url15 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url16 = https://docs.google.com/spreadsheets/d/***-***-***/edit#gid=0
url17 = https://docs.google.com/spreadsheets/d/***-***/edit#gid=0
url18 = https://docs.google.com/spreadsheets/d/***-***/edit#gid=0
url19 = https://docs.google.com/spreadsheets/d/***-***/edit#gid=0
url20 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url21 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url22 = https://docs.google.com/spreadsheets/d/***-***-***/edit#gid=0
url23 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url24 = https://docs.google.com/spreadsheets/d/***-***/edit#gid=0
url25 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url26 = https://docs.google.com/spreadsheets/d/***-***/edit#gid=0
url27 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url28 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url29 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url30 = https://docs.google.com/spreadsheets/d/***/edit#gid=0
url31 = https://docs.google.com/spreadsheets/d/***-***/edit#gid=0

;==========date_condition==========
FormatTime, today, %today%, dd
if (today = 1)
{
run %url1%
}
else if (today = 2)
{
run %url2%
}
else if (today = 3)
{
run %url3%
}
else if (today = 4)
{
run %url4%
}
else if (today = 5)
{
run %url5%
}
else if (today = 6)
{
run %url6%
}
else if (today = 7)
{
run %url7%
}
else if (today = 8)
{
run %url8%
}
else if (today = 9)
{
run %url9%
}
else if (today = 10)
{
run %url10%
}
else if (today = 11)
{
run %url11%
}
else if (today = 12)
{
run %url12%
}
else if (today = 13)
{
run %url13%
}
else if (today = 14)
{
run %url14%
}
else if (today = 15)
{
run %url15%
}
else if (today = 16)
{
run %url16%
}
else if (today = 17)
{
run %url17%
}
else if (today = 18)
{
run %url18%
}
else if (today = 19)
{
run %url19%
}
else if (today = 20)
{
run %url20%
}
else if (today = 21)
{
run %url21%
}
else if (today = 22)
{
run %url22%
}
else if (today = 23)
{
run %url23%
}
else if (today = 24)
{
run %url24%
}
else if (today = 25)
{
run %url25%
}
else if (today = 26)
{
run %url26%
}
else if (today = 27)
{
run %url27%
}
else if (today = 28)
{
run %url28%
}
else if (today = 29)
{
run %url29%
}
else if (today = 30)
{
run %url30%
}
else if (today = 31)
{
run %url31%
}
sleep, 30000 ;wait for gogole sheet open
;==========date_condiditon_confirm==========

;==========從.txt複製貼上到google sheet==========
x = 1
fileencoding, UTF-8 ;解碼
loop, 26
{
sleep, 2000
fileread, order_content, C:\Users\***\python\8way\order%x%.txt ;檔案讀取
clipboard = %order_content%

sleep, 2000
Send, {Blind}{Ctrl Down}a{Ctrl Up}
sleep, 2000
Send, {Blind}{Ctrl Down}a{Ctrl Up}  ;選取舊資料
sleep, 2000
Send, {Blind}{Delete}               ;刪除舊資料
sleep, 2000
Send, {Blind}{Ctrl Down}v{Ctrl Up}  ;貼上
sleep, 4000
Send, {Blind}{Alt Down}{Down}{Alt Up}
x+=1
}
order_content := "" ;釋放變數記憶體
;==========結束複製貼上作業==========

;==========execute_marco==========
sleep, 1000
Clipboard = 
Sleep, 1000
Send, {Blind}{Shift Down}{Ctrl Down}{Alt Down}1{Alt Up}{Ctrl Up}{Shift Up}
Sleep, 1000
;-----done_condition-----
loop
{
sleep, 30000
Send, {Blind}{Ctrl Down}c{Ctrl Up}
sleep, 1000
if (Clipboard = "done")
break
}
;-----end_of_done_condition-----
Sleep, 1000
Send, {Blind}{Alt Down}{Down}{Alt Up}
;==========end_macro==========

;==========auto_shutdown==========
sleep, 3000
send, {blind}{alt down}{F4}{alt up}
;------------------------------
sleep, 3000
run "C:\Users\***\python\8way\cmdmsg.txt"
sleep, 1000
Send, {Blind}{Ctrl Down}a{Ctrl Up}
sleep, 250
Send, {Blind}{Ctrl Down}c{Ctrl Up}
sleep, 250
WinClose, cmdmsg.txt
;------------------------------
sleep, 1000
Send, {Blind}{LWin Down}r{LWin Up}
sleep, 1000
send, {blind}{ctrl down}v{ctrl up}
sleep, 1000
send, {blind}{enter}
;------------------------------
sleep, 1000
run "C:\Users\***\python\8way\shutdownmsg.txt"
sleep, 1000
Send, {Blind}{Ctrl Down}a{Ctrl Up}
sleep, 250
Send, {Blind}{Ctrl Down}c{Ctrl Up}
sleep, 250
WinClose, shutdownmsg.txt
;------------------------------
sleep, 3000
send, {blind}{ctrl down}v{ctrl up}
sleep, 1000
send, {blind}{enter}
;==========endofscript==========
}
else
{
exitapp
}

return
esc::exitapp
