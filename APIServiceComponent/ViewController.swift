//
//  ViewController.swift
//  APIServiceComponent
//
//  Created by Abdelrhman Eliwa on 20/06/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testAPIService()
    }
    
    func testAPIService() {
        /// build `URL Request` unsing `API Builder`
        let request = APIBuilder()
            .setPath(using: .country)
            .setMethod(using: .get)
            .build()
        
        /// make the request
        _ = APIService.shared.request(using: request) { (result: APIResult<[CountryEntity]>) in
            switch result {
            case .success(let data):
                dump(data)
            case .error(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - HELPER
//
struct CountryEntity: Codable {
    let countryCode: String?
    let country, countryName: String?
    let lat, lng: Double?
    let totalConfirmed, totalDeaths, totalRecovered, dailyConfirmed: Int?
    let dailyDeaths, activeCases, totalCritical, totalConfirmedPerMillionPopulation: Int?
    let totalDeathsPerMillionPopulation: Int?
    let fr, pr: String?
    let lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case countryCode, country, countryName, lat, lng, totalConfirmed, totalDeaths, totalRecovered, dailyConfirmed, dailyDeaths, activeCases, totalCritical, totalConfirmedPerMillionPopulation, totalDeathsPerMillionPopulation
        case fr = "FR"
        case pr = "PR"
        case lastUpdated
    }
}

