import re

def remove_https(link):
    webpage = re.sub(r'^https?:\/\/', '', link)
    
    return webpage