# -*- coding: UTF-8 -*-
import os
from selenium.webdriver.chrome.options import Options as chrome_options
from webdriver_manager.chrome import ChromeDriverManager

def get_browser_options(isEnableBrowser):
    """
    獲取瀏覽器的的相關設定參數值。
    Args:
        isEnableBrowser (str): 當 isEnableBrowser 為 False 將背景執行，否則將開啟畫面執行。
    Returns:
        options (class): 回傳瀏覽器的相關設定參數值。
    """
    options = chrome_options()
    prefs = {'profile.default_content_setting_values.notifications' : 2}
    options.add_experimental_option('prefs', prefs)
    options.add_argument('--disable-notifications')
    if isEnableBrowser == 'False':
        options.add_argument('--headless')
        options.add_argument('--disable-dev-shm-usage')
        options.add_argument('--no-sandbox')
        options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")
    return options

def get_driver_path():
    """
    使用 ChromeDriverManager 安裝。
    Returns:
        driverPath (str): 回傳 chromedriver 的路徑位置。
    """
    driverPath = ChromeDriverManager().install()
    return driverPath
