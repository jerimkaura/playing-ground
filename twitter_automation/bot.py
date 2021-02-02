import selenium
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

class Twitter:
    def __init__(self, username, password):
        self.username = username
        self.password = password
        self.bot = webdriver.Firefox()
    
    def login(self):
        bot = self.bot
        bot.get('https://twitter.com/login')
        time.sleep(3)
        email = bot.find_element_by_name('session[username_or_email]')
        password = bot.find_element_by_name('session[password]')
        email.clear()
        password.clear()
        email.send_keys(self.username)
        password.send_keys(self.password)
        password.send_keys(Keys.RETURN)
        time.sleep(5)
    
    def like_tweet(self, hashtag):
        bot = self.bot
        bot.get('https://twitter.com/search?q= '+hashtag+'+&src=typed_query')
        for i in range(1, 3):
            bot.execute_script('window.scrollTo(0, document.body.scrollHeight)')
            time.sleep(5)
            tweets = bot.find_elements_by_name('tweet')
            links = [element.get_attribute('data-permalink-path') for element in tweets]
            print(links)
            for link in links:
                bot.get('https://twitter.com' +link)
                try:
                    bot.find_element_by_name('HeartAnimation').click()
                    time.sleep(3)
                except Exception as ext:
                    time.sleep(40)    

jerry = Twitter('email', 'pass')
jerry.login()
jerry.like_tweet('webdevelopment')
