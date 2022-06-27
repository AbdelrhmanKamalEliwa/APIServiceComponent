# APIServiceComponent  :rocket:
###### A powerful, scalable, and clean Network-Layer for Swift.
----------

### Features

- **APIServiceContract:** it's a protocol that has a func *`request()`* implemeted by the **[APIService](#APIService)** class.
- **APIService:** it's a singletion class that implements the **[APIServiceContract](#APIServiceContract)** protocol to use func *`request()`*, this func take the `URLRequest` and make the request then return a `completionHandler` of type **[APIResult](#APIResult)**
- **APIBuilder:** it's a builder class that builds the `URLRequest` to send it to the **[APIService](#APIService)** class to make the request.
- **APIResult:** it's an enum type that has two cases, *`success`*  of type Genereic, and *`error`* of type **[APIError](#APIError)**.
- **APIError:** it's an enum type that has many custom types of errors like: `decodingFailure`, `requestTimeOut`, `requestError`, `unexpected`, and etc.
- **NetworkConstants:** it's a constant file that contains the constants helps the **APIServiceComponent** like: `BaseURL`, `timeoutIntervalForRequest`, `serviceQueue`, and etc.
- **APIEndPoints:** it's an enum type that contains the end points that used to build the **URLRequest**.
- **HTTPMethod:** it's an enum type that contains all HTTP Methods that used to build the `URLRequest`.
- **HTTPHeader:** it's a constant file that contains the constants of the request Header.
- **ContentType:** it's a constant file that contains the constants of the Content Type.
- **RequestParameters:** it's an enum type that has two cases `body(_: Parameters)`, and `query(_: Parameters)`, to set neither body or query parameters to the request. `Parameters` is a typealias for the Dictionary type `[String: Any]`.

---------------

### Architecture
![](https://github.com/AbdelrhmanKamalEliwa/APIServiceComponent/blob/main/Readme%20Assets/Architecture.png)
