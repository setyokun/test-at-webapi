Feature: Register to Amazon 

@FailedRegister
Scenario Outline: Failed to Register  
  Given open amazon register page
  When input invalid 'register_data' with several '<scenario>'
  Then failed to register  

Examples:
    | scenario                |
    | all field is blank      |
    | input with invalid data |