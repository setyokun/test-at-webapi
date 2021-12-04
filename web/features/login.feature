Feature: Login to Amazon 

@Login
Scenario: Successfully to logged in Amazon  
  Given open amazon login page  
  When input valid 'credential'      
  Then successfully to logged in or catch warning message    

@FailedLogin
Scenario Outline: Failed to logged in  
  Given open amazon login page  
  When input invalid credential '<invalid_credential>' with this data 'credential'
  Then failed to logged in  

Examples:
    | invalid_credential                      |
    | blank emailphone                        |
    | unregistered emailphone                 |
    | valid emailphone and blank password     |
    | valid emailphone and invalid password   |
