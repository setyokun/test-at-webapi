Given("open amazon register page") do
    @pages.register_page.load
    @pages.login_page.nav_login.click
    @pages.login_page.btn_register.click
    expect(current_url).to include('/register')
    expect(@pages.register_page.title_register_page).to have_text 'Create account'               
end

When("input invalid {string} with several {string}") do |register_data, scenario|
    @scenario = scenario
    @input_register_data = RegisterConfigData.new.load_data(register_data)
    case scenario
    when 'all field is blank' 
        @pages.login_page.btn_continue.click
    when 'input with invalid data' 
        @pages.register_page.input_name.set @input_register_data['wrong_format_email']  
        @pages.register_page.input_email.set @input_register_data['wrong_format_email']  
        @pages.register_page.input_password.set @input_register_data['password']  
        @pages.register_page.input_password_check.set @input_register_data['mismatch_password']  
        @pages.login_page.btn_continue.click
    end
end

Then("failed to register") do
    case @scenario
    when 'all field is blank' 
        expect(@pages.register_page.validation_mesasage_name).to have_text 'Enter your name'   
        expect(@pages.register_page.validation_mesasage_email1).to have_text 'Enter your email'   
        expect(@pages.register_page.validation_mesasage_password).to have_text 'Enter your password'   
    when 'input with invalid data'
        expect(@pages.register_page.validation_mesasage_mismatch_pass).to have_text 'Passwords must match'   
        begin
            expect(@pages.register_page.validation_mesasage_email3).to have_text 'Enter a valid email address'   
            p 'validate valid email'
        rescue Exception => e
            p e.message
            expect(@pages.register_page.validation_mesasage_email2).to have_text 'Wrong or Invalid email address or mobile phone number. Please correct and try again.'   
            p 'validate invalid email'
        end
    end
end