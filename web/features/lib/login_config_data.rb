class LoginConfigData
    include DataMagic
    DataMagic.load 'secret.yml'
  
    def load_data(login)
      data_for "secret/#{login}"
    end
  end
