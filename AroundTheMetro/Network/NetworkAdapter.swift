//
//  NetworkAdapter.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-25.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import Moya
import SVProgressHUD

struct NetworkAdapter {
    
    static let provider = MoyaProvider<UndergroungTarget>()
    
    static func request(target: UndergroungTarget, success successCallback: @escaping (_ json: NSDictionary) -> Void, error errorCallback: ((Swift.Error) -> Void)?, failure failureCallback: ((MoyaError) -> Void)?) {

        if let request = try? MoyaProvider.defaultEndpointMapping(for: target).urlRequest(),
            let url = request.url {
            _ = url.absoluteString
          //print(url)
        }
   
        
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                // 1:
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    do{   let jsonResponse = try JSONSerialization.jsonObject(with: response.data, options: []) as! [String : Any]
                        successCallback(jsonResponse as NSDictionary)
                    }catch{
                        print("Error Parsing JSON from authenticateUser")
                        SVProgressHUD.dismiss()
                    }
                } else {
                    // 2:
                    let error = NSError(domain:"com.vsemenchenko.networkLayer", code:0, userInfo:[NSLocalizedDescriptionKey: "Parsing Error"])
                    print("Error Network Status: \(error.localizedDescription)")
                    SVProgressHUD.dismiss()
                errorCallback?(error)
                }
            case .failure(let error):
                // 3:
                SVProgressHUD.dismiss()
                print("AuthenticateUser request failure: \(String(describing: error.errorDescription))")
                failureCallback?(error)
            }
        }
    }
}
