//
//  ATLApiTarget.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-22.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//
import Foundation
import Moya


enum UndergroungTarget {
    
    case authenticateUser(name:String,userid:String,acessToken:String,photourl:String,isfb:Bool)
    case sharedApplication(userid:String)
    case getBannerImagesAPI(parameters: [String : String])
    case getPromotionsAPI(parameters: [String : String])
    case getPlaces(parameters: [String : String])
    case getMetroListForStoreAPI(parameters: [String : String])
    case getCountriesList(parameters: [String : String])
    case getCitiesList(parameters: [String : String])
}
let locationPath = "\(Public.CountryName)/\(Public.CityName)/"



extension UndergroungTarget: TargetType{
    func getPrePath() -> String {
        return "\(Public.CountryName)/\(Public.CityName)/"
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL{
             return URL(string:Constants.API_URL_BASE)!
    }
    
    var path: String{
        switch self {
        case .authenticateUser:
            return "registerUser"
        case .sharedApplication:
            return "\(getPrePath())sharedApplication"
        case .getBannerImagesAPI:
            return "\(getPrePath())getbannerimages"
        case .getPlaces:
            return "\(getPrePath())getPlaces"
        case .getPromotionsAPI:
            return "\(getPrePath())getplacesforar"
        case .getMetroListForStoreAPI:
            return "\(getPrePath())getMetroListForStore"
        case .getCitiesList:
            return "getcities"
        case .getCountriesList:
            return "getCountry"
        }
        
    }
    
    
    var method: Moya.Method {
        switch self {
        case .authenticateUser, .sharedApplication:
            return .post
        default:
            return .get
        }
    }

    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
            
        case .authenticateUser(let name,let userid,let acessToken,let photourl,let isfb):
            return .requestParameters(parameters: ["name":name,"userid":userid,"token":acessToken,"pictureUrl":photourl,"isfb":isfb], encoding: URLEncoding.default)
            
        case .sharedApplication(let userid):
            return .requestParameters(parameters: ["userid":userid], encoding: URLEncoding.default)
        
        case .getBannerImagesAPI(let parameters), .getPromotionsAPI(let parameters), .getMetroListForStoreAPI(let parameters), .getCountriesList(let parameters), .getCitiesList(let parameters), .getPlaces(let parameters) :
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    
        }
    }
}

