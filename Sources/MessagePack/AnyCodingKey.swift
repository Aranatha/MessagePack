struct AnyCodingKey: CodingKey, Equatable {
    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
    
    init<Key>(_ base: Key) where Key : CodingKey {
        if let intValue = base.intValue {
            self.init(intValue: intValue)!
        } else {
            self.init(stringValue: base.stringValue)!
        }
    }
}

extension AnyCodingKey: Hashable {
	func hash(into hasher: inout Hasher) {
		if let int = intValue {
			int.hash(into: &hasher)
		} else {
			stringValue.hash(into: &hasher)
		}
	}
}

extension CodingKey {
	init?(_ key: AnyCodingKey) {
		if let int = key.intValue {
			self.init(intValue: int)
		} else {
			self.init(stringValue: key.stringValue)
		}
	}
}
