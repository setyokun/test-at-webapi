class RegisterConfigData
    include DataMagic
    DataMagic.load 'register.yml'
  
    def load_data(register)
      data_for "register/#{register}"
    end
  end
