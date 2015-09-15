//
//  GlobalFunctions.swift
//  design 01
//
//  Created by Leandro Hernandez on 9/8/15.
//  Copyright (c) 2015 antrax. All rights reserved.
//


import UIKit
import EventKit
import Foundation


func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}


func ImageWithColor(color: UIColor) -> UIImage {
    let rect = CGRectMake(0, 0, 1, 1)
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), false, 0)
    color.setFill()
    UIRectFill(rect)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}


func ImageWithColor(color: UIColor, size: CGSize) -> UIImage {
    let rect = CGRectMake(0, 0, size.width, size.height)
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), false, 0)
    color.setFill()
    UIRectFill(rect)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}


func getCountryDictionaryArray() -> NSArray {
    var countryArray = NSMutableArray()
    
    countryArray.addObject(["name" : "Estados Unidos", "region" : "US", "code" : "1"])
    countryArray.addObject(["name" : "Rusia", "region" : "RU", "code" : "7"])
    countryArray.addObject(["name" : "Egipto", "region" : "EG", "code" : "20"])
    countryArray.addObject(["name" : "Sudáfrica", "region" : "ZA", "code" : "27"])
    countryArray.addObject(["name" : "Grecia", "region" : "GR", "code" : "30"])
    countryArray.addObject(["name" : "Países Bajos", "region" : "NL", "code" : "31"])
    countryArray.addObject(["name" : "Bélgica", "region" : "BE", "code" : "32"])
    countryArray.addObject(["name" : "Francia", "region" : "FR", "code" : "33"])
    countryArray.addObject(["name" : "España", "region" : "ES", "code" : "34"])
    countryArray.addObject(["name" : "Hungría", "region" : "HU", "code" : "36"])
    countryArray.addObject(["name" : "Italia", "region" : "IT", "code" : "39"])
    countryArray.addObject(["name" : "Rumania", "region" : "RO", "code" : "40"])
    countryArray.addObject(["name" : "Suiza", "region" : "CH", "code" : "41"])
    countryArray.addObject(["name" : "Austria", "region" : "AT", "code" : "43"])
    countryArray.addObject(["name" : "Reino Unido", "region" : "GB", "code" : "44"])
    countryArray.addObject(["name" : "Dinamarca", "region" : "DK", "code" : "45"])
    countryArray.addObject(["name" : "Suecia", "region" : "SE", "code" : "46"])
    countryArray.addObject(["name" : "Noruega", "region" : "NO", "code" : "47"])
    countryArray.addObject(["name" : "Polonia", "region" : "PL", "code" : "48"])
    countryArray.addObject(["name" : "Alemania", "region" : "DE", "code" : "49"])
    countryArray.addObject(["name" : "Perú", "region" : "PE", "code" : "51"])
    countryArray.addObject(["name" : "México", "region" : "MX", "code" : "52"])
    countryArray.addObject(["name" : "Cuba", "region" : "CU", "code" : "53"])
    countryArray.addObject(["name" : "Argentina", "region" : "AR", "code" : "54"])
    countryArray.addObject(["name" : "Brasil", "region" : "BR", "code" : "55"])
    countryArray.addObject(["name" : "Chile", "region" : "CL", "code" : "56"])
    countryArray.addObject(["name" : "Colombia", "region" : "CO", "code" : "57"])
    countryArray.addObject(["name" : "Venezuela", "region" : "VE", "code" : "58"])
    countryArray.addObject(["name" : "Malasia", "region" : "MY", "code" : "60"])
    countryArray.addObject(["name" : "Australia", "region" : "AU", "code" : "61"])
    countryArray.addObject(["name" : "Indonesia", "region" : "ID", "code" : "62"])
    countryArray.addObject(["name" : "Filipinas", "region" : "PH", "code" : "63"])
    countryArray.addObject(["name" : "Nueva Zelanda", "region" : "NZ", "code" : "64"])
    countryArray.addObject(["name" : "Singapur", "region" : "SG", "code" : "65"])
    countryArray.addObject(["name" : "Tailandia", "region" : "TH", "code" : "66"])
    countryArray.addObject(["name" : "Japón", "region" : "JP", "code" : "81"])
    countryArray.addObject(["name" : "Corea del Sur", "region" : "KR", "code" : "82"])
    countryArray.addObject(["name" : "Viet Nam", "region" : "VN", "code" : "84"])
    countryArray.addObject(["name" : "China", "region" : "CN", "code" : "86"])
    countryArray.addObject(["name" : "Turquía", "region" : "TR", "code" : "90"])
    countryArray.addObject(["name" : "India", "region" : "IN", "code" : "91"])
    countryArray.addObject(["name" : "Pakistán", "region" : "PK", "code" : "92"])
    countryArray.addObject(["name" : "Afganistán", "region" : "AF", "code" : "93"])
    countryArray.addObject(["name" : "Sri Lanka", "region" : "LK", "code" : "94"])
    countryArray.addObject(["name" : "Myanmar", "region" : "MM", "code" : "95"])
    countryArray.addObject(["name" : "Irán", "region" : "IR", "code" : "98"])
    countryArray.addObject(["name" : "Sudán del Sur", "region" : "SS", "code" : "211"])
    countryArray.addObject(["name" : "Marruecos", "region" : "MA", "code" : "212"])
    countryArray.addObject(["name" : "Argelia", "region" : "DZ", "code" : "213"])
    countryArray.addObject(["name" : "Túnez", "region" : "TN", "code" : "216"])
    countryArray.addObject(["name" : "Libia", "region" : "LY", "code" : "218"])
    countryArray.addObject(["name" : "Gambia", "region" : "GM", "code" : "220"])
    countryArray.addObject(["name" : "Senegal", "region" : "SN", "code" : "221"])
    countryArray.addObject(["name" : "Mauritania", "region" : "MR", "code" : "222"])
    countryArray.addObject(["name" : "Malí", "region" : "ML", "code" : "223"])
    countryArray.addObject(["name" : "Guinea", "region" : "GN", "code" : "224"])
    countryArray.addObject(["name" : "Côte d'Ivoire", "region" : "CI", "code" : "225"])
    countryArray.addObject(["name" : "Burkina Faso", "region" : "BF", "code" : "226"])
    countryArray.addObject(["name" : "Níger", "region" : "NE", "code" : "227"])
    countryArray.addObject(["name" : "Togo", "region" : "TG", "code" : "228"])
    countryArray.addObject(["name" : "Benín", "region" : "BJ", "code" : "229"])
    countryArray.addObject(["name" : "Mauricio", "region" : "MU", "code" : "230"])
    countryArray.addObject(["name" : "Liberia", "region" : "LR", "code" : "231"])
    countryArray.addObject(["name" : "Sierra leona", "region" : "SL", "code" : "232"])
    countryArray.addObject(["name" : "Ghana", "region" : "GH", "code" : "233"])
    countryArray.addObject(["name" : "Nigeria", "region" : "NG", "code" : "234"])
    countryArray.addObject(["name" : "Chad", "region" : "TD", "code" : "235"])
    countryArray.addObject(["name" : "República Centroafricana", "region" : "CF", "code" : "236"])
    countryArray.addObject(["name" : "Camerún", "region" : "CM", "code" : "237"])
    countryArray.addObject(["name" : "Cabo Verde", "region" : "CV", "code" : "238"])
    countryArray.addObject(["name" : "Santo Tomé y Príncipe", "region" : "ST", "code" : "239"])
    countryArray.addObject(["name" : "Guinea Ecuatorial", "region" : "GQ", "code" : "240"])
    countryArray.addObject(["name" : "Gabón", "region" : "GA", "code" : "241"])
    countryArray.addObject(["name" : "Congo", "region" : "CG", "code" : "242"])
    countryArray.addObject(["name" : "Congo", "region" : "CD", "code" : "243"])
    countryArray.addObject(["name" : "Angola", "region" : "AO", "code" : "244"])
    countryArray.addObject(["name" : "Guinea-Bisáu", "region" : "GW", "code" : "245"])
    countryArray.addObject(["name" : "Territorio Británico del Océano Índico", "region" : "IO", "code" : "246"])
    countryArray.addObject(["name" : "Seychelles", "region" : "SC", "code" : "248"])
    countryArray.addObject(["name" : "Sudán", "region" : "SD", "code" : "249"])
    countryArray.addObject(["name" : "Ruanda", "region" : "RW", "code" : "250"])
    countryArray.addObject(["name" : "Etiopía", "region" : "ET", "code" : "251"])
    countryArray.addObject(["name" : "Somalia", "region" : "SO", "code" : "252"])
    countryArray.addObject(["name" : "Yibuti", "region" : "DJ", "code" : "253"])
    countryArray.addObject(["name" : "Kenia", "region" : "KE", "code" : "254"])
    countryArray.addObject(["name" : "Tanzania", "region" : "TZ", "code" : "255"])
    countryArray.addObject(["name" : "Uganda", "region" : "UG", "code" : "256"])
    countryArray.addObject(["name" : "Burundi", "region" : "BI", "code" : "257"])
    countryArray.addObject(["name" : "Mozambique", "region" : "MZ", "code" : "258"])
    countryArray.addObject(["name" : "Zambia", "region" : "ZM", "code" : "260"])
    countryArray.addObject(["name" : "Madagascar", "region" : "MG", "code" : "261"])
    countryArray.addObject(["name" : "Reunión", "region" : "RE", "code" : "262"])
    countryArray.addObject(["name" : "Zimbabue", "region" : "ZW", "code" : "263"])
    countryArray.addObject(["name" : "Namibia", "region" : "NA", "code" : "264"])
    countryArray.addObject(["name" : "Malaui", "region" : "MW", "code" : "265"])
    countryArray.addObject(["name" : "Lesoto", "region" : "LS", "code" : "266"])
    countryArray.addObject(["name" : "Botsuana", "region" : "BW", "code" : "267"])
    countryArray.addObject(["name" : "Suazilandia", "region" : "SZ", "code" : "268"])
    countryArray.addObject(["name" : "Comoras", "region" : "KM", "code" : "269"])
    countryArray.addObject(["name" : "Santa Helena, Ascensión y Tristán de Acuña", "region" : "SH", "code" : "290"])
    countryArray.addObject(["name" : "Eritrea", "region" : "ER", "code" : "291"])
    countryArray.addObject(["name" : "Aruba", "region" : "AW", "code" : "297"])
    countryArray.addObject(["name" : "Islas Feroe", "region" : "FO", "code" : "298"])
    countryArray.addObject(["name" : "Groenlandia", "region" : "GL", "code" : "299"])
    countryArray.addObject(["name" : "Gibraltar", "region" : "GI", "code" : "350"])
    countryArray.addObject(["name" : "Portugal", "region" : "PT", "code" : "351"])
    countryArray.addObject(["name" : "Luxemburgo", "region" : "LU", "code" : "352"])
    countryArray.addObject(["name" : "Irlanda", "region" : "IE", "code" : "353"])
    countryArray.addObject(["name" : "Islandia", "region" : "IS", "code" : "354"])
    countryArray.addObject(["name" : "Albania", "region" : "AL", "code" : "355"])
    countryArray.addObject(["name" : "Malta", "region" : "MT", "code" : "356"])
    countryArray.addObject(["name" : "Chipre", "region" : "CY", "code" : "357"])
    countryArray.addObject(["name" : "Finlandia", "region" : "FI", "code" : "358"])
    countryArray.addObject(["name" : "Bulgaria", "region" : "BG", "code" : "359"])
    countryArray.addObject(["name" : "Lituania", "region" : "LT", "code" : "370"])
    countryArray.addObject(["name" : "Letonia", "region" : "LV", "code" : "371"])
    countryArray.addObject(["name" : "Estonia", "region" : "EE", "code" : "372"])
    countryArray.addObject(["name" : "Moldavia", "region" : "MD", "code" : "373"])
    countryArray.addObject(["name" : "Armenia", "region" : "AM", "code" : "374"])
    countryArray.addObject(["name" : "Bielorrusia", "region" : "BY", "code" : "375"])
    countryArray.addObject(["name" : "Andorra", "region" : "AD", "code" : "376"])
    countryArray.addObject(["name" : "Mónaco", "region" : "MC", "code" : "377"])
    countryArray.addObject(["name" : "San Marino", "region" : "SM", "code" : "378"])
    countryArray.addObject(["name" : " Ciudad del Vaticano", "region" : "VA", "code" : "379"])
    countryArray.addObject(["name" : "Ucrania", "region" : "UA", "code" : "380"])
    countryArray.addObject(["name" : "Serbia", "region" : "RS", "code" : "381"])
    countryArray.addObject(["name" : "Montenegro", "region" : "ME", "code" : "382"])
    countryArray.addObject(["name" : "Croacia", "region" : "HR", "code" : "385"])
    countryArray.addObject(["name" : "Eslovenia", "region" : "SI", "code" : "386"])
    countryArray.addObject(["name" : "Bosnia y Herzegovina", "region" : "BA", "code" : "387"])
    countryArray.addObject(["name" : "Macedonia", "region" : "MK", "code" : "389"])
    countryArray.addObject(["name" : "República Checa", "region" : "CZ", "code" : "420"])
    countryArray.addObject(["name" : "Eslovaquia", "region" : "SK", "code" : "421"])
    countryArray.addObject(["name" : "Liechtenstein", "region" : "LI", "code" : "423"])
    countryArray.addObject(["name" : "Islas Malvinas", "region" : "FK", "code" : "500"])
    countryArray.addObject(["name" : "Belice", "region" : "BZ", "code" : "501"])
    countryArray.addObject(["name" : "Guatemala", "region" : "GT", "code" : "502"])
    countryArray.addObject(["name" : "El Salvador", "region" : "SV", "code" : "503"])
    countryArray.addObject(["name" : "Honduras", "region" : "HN", "code" : "504"])
    countryArray.addObject(["name" : "Nicaragua", "region" : "NI", "code" : "505"])
    countryArray.addObject(["name" : "Costa Rica", "region" : "CR", "code" : "506"])
    countryArray.addObject(["name" : "Panamá", "region" : "PA", "code" : "507"])
    countryArray.addObject(["name" : "San Pedro y Miquelón", "region" : "PM", "code" : "508"])
    countryArray.addObject(["name" : "Haití", "region" : "HT", "code" : "509"])
    countryArray.addObject(["name" : "Guadalupe", "region" : "GP", "code" : "590"])
    countryArray.addObject(["name" : "Bolivia", "region" : "BO", "code" : "591"])
    countryArray.addObject(["name" : "Guyana", "region" : "GY", "code" : "592"])
    countryArray.addObject(["name" : "Ecuador", "region" : "EC", "code" : "593"])
    countryArray.addObject(["name" : "Guayana Francesa", "region" : "GF", "code" : "594"])
    countryArray.addObject(["name" : "Paraguay", "region" : "PY", "code" : "595"])
    countryArray.addObject(["name" : "Martinica", "region" : "MQ", "code" : "596"])
    countryArray.addObject(["name" : "Surinam", "region" : "SR", "code" : "597"])
    countryArray.addObject(["name" : "Uruguay", "region" : "UY", "code" : "598"])
    countryArray.addObject(["name" : "Curaçao", "region" : "CW", "code" : "599"])
    countryArray.addObject(["name" : "Timor-Leste", "region" : "TL", "code" : "670"])
    countryArray.addObject(["name" : "Isla Norfolk", "region" : "NF", "code" : "672"])
    countryArray.addObject(["name" : "Brunéi Darussalam", "region" : "BN", "code" : "673"])
    countryArray.addObject(["name" : "Nauru", "region" : "NR", "code" : "674"])
    countryArray.addObject(["name" : "Papúa Nueva Guinea", "region" : "PG", "code" : "675"])
    countryArray.addObject(["name" : "Tonga", "region" : "TO", "code" : "676"])
    countryArray.addObject(["name" : "Islas Salomón", "region" : "SB", "code" : "677"])
    countryArray.addObject(["name" : "Vanuatu", "region" : "VU", "code" : "678"])
    countryArray.addObject(["name" : "Fiyi", "region" : "FJ", "code" : "679"])
    countryArray.addObject(["name" : "Palaos", "region" : "PW", "code" : "680"])
    countryArray.addObject(["name" : "Wallis y Futuna", "region" : "WF", "code" : "681"])
    countryArray.addObject(["name" : "Islas Cook", "region" : "CK", "code" : "682"])
    countryArray.addObject(["name" : "Niue", "region" : "NU", "code" : "683"])
    countryArray.addObject(["name" : "Samoa", "region" : "WS", "code" : "685"])
    countryArray.addObject(["name" : "Kiribati", "region" : "KI", "code" : "686"])
    countryArray.addObject(["name" : "Nueva Caledonia", "region" : "NC", "code" : "687"])
    countryArray.addObject(["name" : "Tuvalu", "region" : "TV", "code" : "688"])
    countryArray.addObject(["name" : "Polinesia Francesa", "region" : "PF", "code" : "689"])
    countryArray.addObject(["name" : "Tokelau", "region" : "TK", "code" : "690"])
    countryArray.addObject(["name" : "Estados Federados de Micronesia", "region" : "FM", "code" : "691"])
    countryArray.addObject(["name" : "Islas Marshall", "region" : "MH", "code" : "692"])
    countryArray.addObject(["name" : "Corea del Norte", "region" : "KP", "code" : "850"])
    countryArray.addObject(["name" : "Hong Kong", "region" : "HK", "code" : "852"])
    countryArray.addObject(["name" : "Macao", "region" : "MO", "code" : "853"])
    countryArray.addObject(["name" : "Camboya", "region" : "KH", "code" : "855"])
    countryArray.addObject(["name" : "Lao", "region" : "LA", "code" : "856"])
    countryArray.addObject(["name" : "Bangladés", "region" : "BD", "code" : "880"])
    countryArray.addObject(["name" : "Taiwán", "region" : "TW", "code" : "886"])
    countryArray.addObject(["name" : "Maldivas", "region" : "MV", "code" : "960"])
    countryArray.addObject(["name" : "Líbano", "region" : "LB", "code" : "961"])
    countryArray.addObject(["name" : "Jordania", "region" : "JO", "code" : "962"])
    countryArray.addObject(["name" : "Siria", "region" : "SY", "code" : "963"])
    countryArray.addObject(["name" : "Irak", "region" : "IQ", "code" : "964"])
    countryArray.addObject(["name" : "Kuwait", "region" : "KW", "code" : "965"])
    countryArray.addObject(["name" : "Arabia Saudita", "region" : "SA", "code" : "966"])
    countryArray.addObject(["name" : "Yemen", "region" : "YE", "code" : "967"])
    countryArray.addObject(["name" : "Omán", "region" : "OM", "code" : "968"])
    countryArray.addObject(["name" : "Estado de Palestina", "region" : "PS", "code" : "970"])
    countryArray.addObject(["name" : "Emiratos Árabes Unidos", "region" : "AE", "code" : "971"])
    countryArray.addObject(["name" : "Israel", "region" : "IL", "code" : "972"])
    countryArray.addObject(["name" : "Baréin", "region" : "BH", "code" : "973"])
    countryArray.addObject(["name" : "Catar", "region" : "QA", "code" : "974"])
    countryArray.addObject(["name" : "Bután", "region" : "BT", "code" : "975"])
    countryArray.addObject(["name" : "Mongolia", "region" : "MN", "code" : "976"])
    countryArray.addObject(["name" : "Nepal", "region" : "NP", "code" : "977"])
    countryArray.addObject(["name" : "Tayikistán", "region" : "TJ", "code" : "992"])
    countryArray.addObject(["name" : "Turkmenistán", "region" : "TM", "code" : "993"])
    countryArray.addObject(["name" : "Azerbaiyán", "region" : "AZ", "code" : "994"])
    countryArray.addObject(["name" : "Georgia", "region" : "GE", "code" : "995"])
    countryArray.addObject(["name" : "Kirguistán", "region" : "KG", "code" : "996"])
    countryArray.addObject(["name" : "Uzbekistán", "region" : "UZ", "code" : "998"])
    
    return NSArray(array: countryArray)
}

func getCountry(code: String) -> NSDictionary? {
    var countryArray = getCountryDictionaryArray()
    
    for dictCountry in countryArray {
        if dictCountry.valueForKey("code") as! String == code {
            return dictCountry as? NSDictionary
        }
    }
    return nil
}










