class LoginPage < SitePrism::Page
    set_url '/'
    element :nav_login, '#nav-link-accountList-nav-line-1'
    element :input_email, '#ap_email'
    element :btn_continue, 'input#continue'
    element :input_password, '#ap_password'
    element :btn_submit_login, '#signInSubmit'
    element :validation_message_email, '#auth-email-missing-alert .a-alert-content'
    element :validation_message_password, '#auth-password-missing-alert .a-alert-content'
    element :btn_register, '#createAccountSubmit'

    #error and warning box
    element :error_box, '#auth-error-message-box'
    element :error_box_title, '#auth-error-message-box .a-alert-heading'
    element :error_box_message, '#auth-error-message-box .a-list-item'
    element :warning_box, '#auth-warning-message-box'
    element :warning_box_title, '#auth-warning-message-box .a-alert-heading'
    element :warning_box_message, '#auth-warning-message-box .a-list-item'
end