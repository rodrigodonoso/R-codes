setwd("~/Desktop")
library(RCurl) #General network (HTTP/FTP/...) client interface for R
library(rjson) #JSON for R
library(XML) #Tools for parsing and generating XML within R and S-Plus
library(igraph) #Network analysis and visualization

#PRUEBA 1
#Fuente: http://thinktostart.com/analyzing-facebook-with-r/
library(devtools)
install_github("pablobarbera/Rfacebook/Rfacebook")

require("Rfacebook")
fb_oauth <- fbOAuth(app_id="1127040717321430", app_secret="5b4f386e87bb4627aa77533f6e902e60",extended_permissions = TRUE)

save(fb_oauth, file="fb_oauth")

load("fb_oauth")
me <- getUsers("me",token=fb_oauth)

#PRUEBA 2
#Fuente: https://mkmanu.wordpress.com/2014/08/12/data-mining-on-facebook-data-basic-tutorial/
library(Rfacebook)
library(Rook)
require(RCurl)
require(rjson)

access_token = "CAACEdEose0cBAP0f7jFdyP0PHlFK9qTWWSZAAZA6lD8tF1wz0PiTiGB63ZCFVMCQCnZCYVvZCcWlqX8RWEnF97Of8PufSEoN1ZBy9A6UwaJ9rQePFYetVP1zegsqJqSEk23rCSms6LKqfBFQCPNZCC9FgjsLTDVpfk2KdKuWsJZAMTBxYwRVqn92peIY2FaMmtZCDUZAdupbw3H7EaZCVh2y4LK"
myFB = getUsers("me", token = access_token)
myFriends = getFriends(access_token, simplify=FALSE)
myFriends_info <- getUsers(myFriends$id, token=access_token, private_info=TRUE)
table(myFriends_info$relationship_status)

fb_oauth <- fbOAuth(app_id = "1127040717321430", 
app_secret = "5b4f386e87bb4627aa77533f6e902e60", extended_permissions = TRUE)

# Saving authorization file on the computer (in default working directory)
save(fb_oauth, file="fboauth")

# Loading authorization file from the computer (from default working directory)
load(file.choose())
myFB <- getUsers("me", token = fboauth)


#PRUEBA 3
$fb = new Facebook("1127040717321430","5b4f386e87bb4627aa77533f6e902e60");
$uri = $fb->getLoginUrl(array(
  'scope' => 'email,user_likes',
  'state' => 'some-fixed-value',
  'redirect_uri' => sprintf('http://%s/auth/facebook?a=auth',$_SERVER['SERVER_NAME']),

#PRUEBA 4 #https://github.com/pablobarbera/Rfacebook/issues/5 
install.packages("devtools")
require("devtools")
install_github("your-username/Rfacebook", subdir = "Rfacebook")
require(Rfacebook)



fb_oauth1 = "CAACEdEose0cBAP0f7jFdyP0PHlFK9qTWWSZAAZA6lD8tF1wz0PiTiGB63ZCFVMCQCnZCYVvZCcWlqX8RWEnF97Of8PufSEoN1ZBy9A6UwaJ9rQePFYetVP1zegsqJqSEk23rCSms6LKqfBFQCPNZCC9FgjsLTDVpfk2KdKuWsJZAMTBxYwRVqn92peIY2FaMmtZCDUZAdupbw3H7EaZCVh2y4LK"
getUsers("me", token=fb_oauth1, private_info=TRUE)
page <- getPage("barackobama", token=fb_oauth1, n=100)  

user_info <- getUsers("me", token=fb_oauth1, private_info=TRUE)
page_posts <- getPage(page="alvarobellolio", token=fb_oauth1, n=20, feed=TRUE)
other_users <- getUsers(page_posts$from_id, token=fb_oauth1, private_info=TRUE)

myFB <- getUsers("me", token = fb_oauth1)
page <- getPage("spinera?fref=ts", token=fb_oauth1, n=10)  

#dates session expired http://stackoverflow.com/questions/14007430/error-validating-access-token-session-has-expired-at-unix-time
  