//
//  WorldScreenViewcontroller.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-19.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit
import KVSpinnerView
import SVProgressHUD


//It will be used for demo in real word we use fetchCountriesAndCities function
let demoCountries = [
    Country(country: "Country", cities: ["City"]),
    Country(country: "Canada", cities: ["Montreal"]),
    Country(country: "France", cities: ["Paris"]),
    Country(country: "Spain", cities: ["Barcelona"]),
    Country(country: "UK", cities: ["London"]),
    Country(country: "USA", cities: ["New_York_City"])
]
class WorldScreenViewcontroller: AdViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    var countries = [Country]()
    let defaults = UserDefaults.standard
    var selectedCountry = String()
    var selectedCity = String()
    
    //display leftBarItem if its called from left menu side
    var isFromLeftMenu = false
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    
    @IBOutlet weak var cityLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setupBackButton()
        
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        SVProgressHUD.show()
        self.countries = demoCountries
        SVProgressHUD.dismiss()
//        fetchCountriesAndCities {
//            SVProgressHUD.dismiss(completion: {
//                self.pickerView.reloadAllComponents()
//            })
//         }
       }
  
    
    override func viewWillDisappear(_ animated: Bool) {
        self.isFromLeftMenu = false
    }
    
    @IBAction func btnConfirmTapped(_ sender: UIButton) {
        if(selectedCountry == "" || selectedCity == "") {
            let alert = UIAlertController(title: NSLocalizedString("Alert", comment:"country and city are not selected"), message: NSLocalizedString("Please select country and city", comment:"null link message"), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment:"ok"), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        defaults.setValue(selectedCountry, forKey: "country")
        defaults.setValue(selectedCity, forKey: "city")
        
        //Mark: -Initialize CityName
        Public.CityName = selectedCity
        Public.CountryName = selectedCountry
        let RootVC = self.storyboard?.instantiateViewController(withIdentifier: "sideMenuRoot") as! SideMenuRootController
        self.present(RootVC, animated: true, completion: nil)
    }
    
    
    //MARK: -Fetch Countries and cities list
    func fetchCountriesAndCities (completion: (()->())? ) {
        var countriesList : [[String: Any]]?
        var citiesList: [[String: Any]]?
        NetworkAdapter.request(target: .getCountriesList(parameters: [:]), success: { (json) in
            countriesList = json["CountryList"] as? [[String: Any]]
            NetworkAdapter.request(target: .getCitiesList(parameters: [:]), success: { (json) in
                citiesList = json["CitiesList"] as? [[String: Any]]
                //if fetching is successfull get cities related to countries and make an array of countries
                if countriesList != nil && citiesList != nil {
                    for country in countriesList! {
                        let countryShortCut = country["shortcut"] as! String
                        let countryName = country["full_name"] as! String
                        self.addToCountriesArray(countryShortcut: countryShortCut, citiesList: citiesList!,countryName: countryName)
                    }
                    self.countries = self.countries.sorted { $0.country < $1.country }
                    self.setDefaultLocation()
                    completion!()
                }
            }, error: nil, failure: nil)
        }, error: nil, failure: nil)
    }
    
    func addToCountriesArray(countryShortcut: String, citiesList: [[String:Any]], countryName: String) {
        var cities: [String] = []
        for city in citiesList {
            if  city["country"] as! String == countryShortcut {
                cities.append(city["full_name"] as! String)
            }
        }
        let newCountry = Country(country: countryName, cities: cities)
        self.countries.append(newCountry)
    }
    
    //MARK: - set default location if its empty
    func setDefaultLocation()  {
        selectedCountry = countries[0].country
        selectedCity = countries[0].cities[0]
//        pickerView.selectedRow(inComponent: 0)
//
//            defaults.setValue("Canada", forKey: "country")
//            defaults.setValue("Montreal", forKey: "city")
//            Public.CountryName = "Canada"
//            Public.CityName = "Montreal"
//
//            cityLable.text = "Country: Canada \nCity: Montreal"

    }
    
    //Mark: - setupBackButton
    func setupBackButton()  {
        if !isFromLeftMenu {
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
    //Mark: - Pickerview functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return countries.count
        }else {
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            if countries.count != 0{
            return countries[selectedCountry].cities.count
            }else{
            return 0
            }
        }
    }
    
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return countries[row].country
        }else {
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countries[selectedCountry].cities[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        let selectedCountryIndex = pickerView.selectedRow(inComponent: 0)
        let selectedCityIndex = pickerView.selectedRow(inComponent: 1)
        selectedCountry = countries[selectedCountryIndex].country
        selectedCity = countries[selectedCountryIndex].cities[selectedCityIndex]
        cityLable.text = "Country: \(selectedCountry)\nCity: \(selectedCity)"
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var titleData = String()
        var  attributedString = NSAttributedString()
        
        if component == 0 {
            titleData = countries[row].country
//            attributedString = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 15.0)!,NSAttributedStringKey.foregroundColor:UIColor (red: 192.0/255.0, green: 192.0/255.0, blue: 197/255.0, alpha: 1.0)])
            
            attributedString = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 15.0)!,NSAttributedStringKey.foregroundColor:UIColor (red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)])
            
            
        }else {
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            if let tData = countries[selectedCountry].cities[optional: row]{
                 titleData = tData
            }
//            attributedString = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Futura", size: 5.0)!,NSAttributedStringKey.foregroundColor:UIColor (red: 200/255.0, green: 192.0/255.0, blue: 200/255.0, alpha: 1.0)])
            
            
            attributedString = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Futura", size: 5.0)!,NSAttributedStringKey.foregroundColor:UIColor (red: 0/255.0, green: 0.0/255.0, blue: 0/255.0, alpha: 1.0)])
            
            
            
        }
        return attributedString
    }
    
}


//check if is index in range or out of range
extension Collection {
    subscript(optional i: Index) -> Iterator.Element? {
        return self.indices.contains(i) ? self[i] : nil
    }
    
}
