class Numerator {
	private let operation: Function
	
	init(with function: Function) {
		operation = function
		// print("Chosen function: \(operation.rawValue)")
	}
	
	convenience init() {
		self.init(with: Numerator.chosenFunction())
	}
	
	func performChosenOperation() {
		let number = baseNumber()
		var result = -1
		
		switch operation {
		case .Factorial:
			result = factorial(for: number)
		case .Square:
			result = square(for: number)
		}
		
		print("Your result is: \(result)")
	}
	
}

private extension Numerator {
	func factorial(for number: Int) -> Int {
		switch number {
		case 0...1:
			return 1
		default:
			return number * factorial(for: number - 1)
		}
	}
	
	func square(for number: Int) -> Int {
		return number * number
	}
	
	func baseNumber() -> Int {
		print("Please, provide a base number (Integer):\n")
		
		if let string = readLine(), let number = Int(string) {
			return number
		} else {
			return baseNumber()
		}
	}
	
	static func chosenFunction() -> Function {
		print("Choose your favourite function:")
		print("a - factorial")
		print("b - square\n")
		
		if let string = readLine(), let function = Function(rawValue: string) {
			return function
		} else {
			return chosenFunction()
		}
	}
}