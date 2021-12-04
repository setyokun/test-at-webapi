Given("open amazon login page") do
    @pages.login_page.load
    @pages.login_page.nav_login.click
end

When("input valid {string}") do |valid_credential|
    expect(current_url).to include('/signin')
    @credential = LoginConfigData.new.load_data(valid_credential)
    @pages.login_page.input_email.set @credential['email']  
    @pages.login_page.btn_continue.click
    @pages.login_page.wait_until_input_password_visible
    @pages.login_page.input_password.set @credential['password']
    @pages.login_page.btn_submit_login.click
end

Then("successfully to logged in or catch warning message") do
    begin
        expect(@pages.login_page.nav_logged_in).to have_text 'Hello, kaito'
        p 'validate account have been logged in'
    rescue Exception => e
        p e.message
        expect(@pages.login_page.warning_box).to be_visible
        expect(@pages.login_page.warning_box_title).to have_text 'Important Message!'
        expect(@pages.login_page.warning_box_message).to have_text 'To better protect your account, please re-enter your password and then enter the characters as they are shown in the image below.'   
        p 'validate warning message'
    end

end

When("input invalid credential {string} with this data {string}") do |emailphone, credential|
    expect(current_url).to include('/signin')
    @emailphone = emailphone
    @credential = LoginConfigData.new.load_data(credential)
    case emailphone
    when 'blank emailphone' 
        @pages.login_page.btn_continue.click
    when 'unregistered emailphone'
        @pages.login_page.input_email.set @credential['invalid_email']  
        @pages.login_page.btn_continue.click
    when 'valid emailphone and blank password' 
        @pages.login_page.input_email.set @credential['email']  
        @pages.login_page.btn_continue.click
        @pages.login_page.wait_until_input_password_visible
        @pages.login_page.btn_submit_login.click
    when 'valid emailphone and invalid password' 
        @pages.login_page.input_email.set @credential['email']  
        @pages.login_page.btn_continue.click
        @pages.login_page.wait_until_input_password_visible
        @pages.login_page.input_password.set @credential['invalid_password']
        @pages.login_page.btn_submit_login.click
    end
end

Then("failed to logged in") do
    case @emailphone
    when 'blank emailphone'
        expect(@pages.login_page.validation_message_email).to have_text 'Enter your email or mobile phone number'    
    when 'unregistered emailphone'
        expect(@pages.login_page.error_box).to be_visible
        expect(@pages.login_page.error_box_title).to have_text 'There was a problem'
        expect(@pages.login_page.error_box_message).to have_text 'We cannot find an account with that email address'    
    when 'valid emailphone and blank password'
        expect(@pages.login_page.validation_message_password).to have_text 'Enter your password'     
    when 'valid emailphone and invalid password'
        begin
            expect(@pages.login_page.error_box).to be_visible
            expect(@pages.login_page.error_box_title).to have_text 'There was a problem'
            expect(@pages.login_page.error_box_message).to have_text 'Your password is incorrect'             
            p 'validate invalid password'
        rescue Exception => e
            p e.message
            expect(@pages.login_page.warning_box).to be_visible
            expect(@pages.login_page.warning_box_title).to have_text 'Important Message!'
            expect(@pages.login_page.warning_box_message).to have_text 'To better protect your account, please re-enter your password and then enter the characters as they are shown in the image below.'   
            p 'validate warning message'
        end
    end
end