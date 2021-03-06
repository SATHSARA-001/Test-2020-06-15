//
// ProfileAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class ProfileAPI {
    /**
     Update My Avatar
     
     - parameter image: (form) Image 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func avatarPost(image: URL, completion: @escaping ((_ data: SuccessResponse?,_ error: Error?) -> Void)) {
        avatarPostWithRequestBuilder(image: image).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Update My Avatar
     - POST /avatar
     - 
     - API Key:
       - type: apiKey x-access-token 
       - name: accessToken
     - API Key:
       - type: apiKey x-api-key 
       - name: apiKey
     - examples: [{contentType=application/json, example={
  "result" : true,
  "payload" : "{}",
  "message" : "message"
}}]
     
     - parameter image: (form) Image 

     - returns: RequestBuilder<SuccessResponse> 
     */
    open class func avatarPostWithRequestBuilder(image: URL) -> RequestBuilder<SuccessResponse> {
        let path = "/avatar"
        let URLString = SwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "image": image
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<SuccessResponse>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     My Profile
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func profileGet(completion: @escaping ((_ data: ProfileMyProfileResponse?,_ error: Error?) -> Void)) {
        profileGetWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     My Profile
     - GET /profile
     - Get currently logged in user's profile
     - API Key:
       - type: apiKey x-access-token 
       - name: accessToken
     - API Key:
       - type: apiKey x-api-key 
       - name: apiKey
     - examples: [{contentType=application/json, example={
  "result" : true,
  "payload" : "{}",
  "message" : "message"
}}]

     - returns: RequestBuilder<SuccessResponse> 
     */
    open class func profileGetWithRequestBuilder() -> RequestBuilder<ProfileMyProfileResponse> {
        let path = "/profile"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ProfileMyProfileResponse>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Update My Profile
     
     - parameter firstName: (form) First name 
     - parameter email: (form) Email 
     - parameter lastName: (form) Last name (optional)
     - parameter phone: (form) Phone (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func profilePut(firstName: String, email: String, lastName: String? = nil, phone: String? = nil, completion: @escaping ((_ data: ProfileMyProfileResponse?,_ error: Error?) -> Void)) {
        profilePutWithRequestBuilder(firstName: firstName, email: email, lastName: lastName, phone: phone).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Update My Profile
     - PUT /profile
     - 
     - API Key:
       - type: apiKey x-access-token 
       - name: accessToken
     - API Key:
       - type: apiKey x-api-key 
       - name: apiKey
     - examples: [{contentType=application/json, example={
  "result" : true,
  "payload" : "{}",
  "message" : "message"
}}]
     
     - parameter firstName: (form) First name 
     - parameter email: (form) Email 
     - parameter lastName: (form) Last name (optional)
     - parameter phone: (form) Phone (optional)

     - returns: RequestBuilder<SuccessResponse> 
     */
    open class func profilePutWithRequestBuilder(firstName: String, email: String, lastName: String? = nil, phone: String? = nil) -> RequestBuilder<ProfileMyProfileResponse> {
        let path = "/profile"
        let URLString = SwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "phone": phone
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ProfileMyProfileResponse>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
