enum Novel: String, CaseIterable {
    case mrAndMrsRossi
    case hotBayouNights
    
    var title: String {
        switch self {
        case .mrAndMrsRossi:
            return "Mr And Mrs Rossi"
        case .hotBayouNights:
            return "Hot Bayou Nights"
        }
    }
}
