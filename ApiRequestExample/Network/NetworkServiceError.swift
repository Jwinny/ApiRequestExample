//
//  NetworkServiceError.swift
//  ApiRequestExample
//
//  Created by José Winny on 05/12/23.
//

import Foundation

enum NetworkServiceError: String, Error, CaseIterable {
    case unauthorized = "Sua sessão expirou.\nEfetue o login novamente."
    case dataError = "Verifique os dados informados."
    case clientError = "Verifique os dados informados e a sua conexão com a internet. Caso o error persista entre em contato com o nosso suporte."
    case serverError = "Parece que estamos passando por manutenção nos servidores.\nTente novamente mais tarde."
    case unknownError = "Um erro inesperado ocorreu.\n Entre em contato com o nosso suporte ou tente novamente mais tarde."
    case decodeError = "Erro de decode, verifique os modelos"
    case urlCreateError = "Erro em criar a url"
}
