from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.select import Select
from webdriver_auto_update import check_driver
import time
from bs4 import BeautifulSoup

#check if chromedriver is updated
check_driver('C:/Users/Remag/python/8way')

#open a new chrome brower
#load the page at the given URL
browser = webdriver.Chrome()
browser.get('http://order.8way.com.tw/index?msl=zh-TW')

#建立輸入物件
area = browser.find_element_by_name("area")
username = browser.find_element_by_id("username")
password = browser.find_element_by_id("password")

#Select a dropdown in webdriver
selectarea = Select(area)
selectarea.select_by_value('tpe')

#necessary elements input
username.send_keys('***')
password.send_keys('***')

#login button click
submit = browser.find_element_by_id("loginbtu")
submit.click()

#定義各家店URL及num_list
url_list = [
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#',
    'http://order.8way.com.tw/userorderindex?accno=***#'
]

#用for迴圈重複24家店的資料抓取
j=0
for i in url_list:
    j = j+1
    #go to userorder page
    time.sleep(0.5)
    browser.get(i)

    #把爬到的原始碼傳入BeautifulSoup套件進行解析
    soup = BeautifulSoup(browser.page_source, "lxml")
    idlist = soup.find(id="tab4")
    mytab4 = idlist.get_text()

    #檔案讀寫
    txt = open('temp.txt', 'w', encoding = 'UTF-8')
    txt.write(mytab4)
    txt.close()

    #檔案整理: 去除空行
    def delblankline(infile, outfile):
        infopen = open(infile, 'r',encoding="utf-8")
        outfopen = open(outfile, 'w',encoding="utf-8")
    
        lines = infopen.readlines()
        for line in lines:
            if line.split():
                outfopen.writelines(line)
            else:
                outfopen.writelines("")
    
    
        infopen.close()
        outfopen.close()
    
    delblankline("temp.txt", "order{}.txt".format(j))
    continue

browser.quit()
