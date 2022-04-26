extension String {
    func capitalizeFirstLetter() -> String {
        prefix(1).capitalized + dropFirst()
    }
}
