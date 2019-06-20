# Instruction to run the code 
"pod install"

# News-Api
contain 2 view controllers

 1- NewsListViewController (for listing all the news come from top-headlines service of newsapi.org)
 
 2- NewsDetailsViewController (for displying all the coming info from the api and also contain a button to open the url of the article itself)
 
 News-Api contain 3 models
 
 1- TopHeadLinesModel (responsible for mapping the response from the api and contain a list of ArticleModel)
 
 2- ArticleModel (responsible for mapping the article data itself)
 
 3- SourceModel (responsible for mapping the source data inside the article model)
 
 News-Api also contain
 
 1- NetworkManager which responsible for adding all the calls to the api and managing the response and mapping
 
 2- Endpoint extenstion for creating the url and the requests
 
 3- ApiUrls which contain the base url and enum to have all the required paths for our case it is only "topHeadLines"
 
 
News-Api are using the following pods

'Alamofire' for calling Api

'AlamofireObjectMapper' for mapping Json with models

'MBProgressHUD' for displying loader

'SDWebImage' for loading images from urls with lazy loading
# Design concept

Tried to display all the important information in the list to enable the user having a look befor opening the article itself

In the details page I tried to display all the available information which comming from api and adding an option to open the url in a seprate page for more information

also added "Powered by newsApi.org" label for the copyrights as they mention in the documentation
 
