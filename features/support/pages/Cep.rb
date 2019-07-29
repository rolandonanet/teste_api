class Cep

    def requisicao_cep(validez)
        cep = '03718050' if validez == "valido"
        cep = '00000000' if validez == "invalido"
        response = HTTParty.get("https://viacep.com.br/ws/#{cep}/json/")
        return response
    end

    def resposta_cep(response)
        if response.include?('erro')
            puts "Este Cep é invalido".red
        else
            puts "Este é o código IBGE do seu CEP: #{response['ibge']}".green
        end
    end

end