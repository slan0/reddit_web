from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
from robot.api.deco import keyword

options = Options()
options.add_argument("start-maximized")

webdriver_service = Service('C:\Users\yrcy1\.cache\selenium\chromedriver\win64\124.0.6367.207')
driver = webdriver.Chrome(options=options, service=webdriver_service)
wait = WebDriverWait(driver, 30)

url = "https://books-pwakit.appspot.com/"
driver.get(url)

def get_first_shadow():
    shadow_host1 = driver.find_element(By.CSS_SELECTOR, "book-app[apptitle='BOOKS']")
    shadow_root1 = driver.execute_script('return arguments[0].shadowRoot', shadow_host1)
    return shadow_root1

shadow_host2 = shadow_root1.find_element(By.CSS_SELECTOR, "app-header[effects='waterfall']")
shadow_root2 = driver.execute_script('return arguments[0].shadowRoot', shadow_host2)

shadow_host3 = shadow_root1.find_element(By.CSS_SELECTOR, '.toolbar-top')
shadow_root3 = driver.execute_script('return arguments[0].shadowRoot', shadow_host3)

shadow_host4 = shadow_root1.find_element(By.CSS_SELECTOR, '.toolbar-bottom')
shadow_root4 = driver.execute_script('return arguments[0].shadowRoot', shadow_host4)

shadow_host5 = shadow_root1.find_element(By.CSS_SELECTOR, 'book-input-decorator')
shadow_root5 = driver.execute_script('return arguments[0].shadowRoot', shadow_host5)

shadow_content = shadow_host5.find_element(By.CSS_SELECTOR, '#input')
shadow_content.send_keys("Twilight")