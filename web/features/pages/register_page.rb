class RegisterPage < SitePrism::Page
    set_url '/'
    element :title_register_page, '.a-box-inner h1'
    element :input_name, '#ap_customer_name'
    element :input_email, '#ap_email'
    element :input_password, '#ap_password'
    element :input_password_check, '#ap_password_check'
    element :validation_mesasage_name, '#auth-customerName-missing-alert .a-alert-content'
    element :validation_mesasage_email1, '#auth-email-missing-alert'
    element :validation_mesasage_email2, '#auth-email-invalid-claim-alert'
    element :validation_mesasage_email3, '#auth-email-invalid-email-alert'
    
    element :validation_mesasage_password, '#auth-password-missing-alert .a-alert-content'
    element :validation_mesasage_mismatch_pass, '#auth-password-mismatch-alert .a-alert-content'
end