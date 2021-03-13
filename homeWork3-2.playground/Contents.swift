import Foundation

// MARK:-
//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

struct SportCar {
    let carBrand: String
    let yearOfRelease: Int
    let trunkVolume: Double
    var engineRunning: Bool
    var windowsIsOpen: Bool
    var filledTrunkVolume: Double
          
    enum Action {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case fillTrunk(cargoVolume: Double)
        case emptyTrunk(cargoVolume: Double)
    }
    
    mutating func makeAction(action: Action) {
        switch action {
        case .startEngine:
            engineRunning = true
            print("Двигатель запущен")
        case .stopEngine:
            engineRunning = false
            print("Двигатель заглушен")
        case .openWindow:
            windowsIsOpen = true
            print("Окна открыты")
        case .closeWindow:
            windowsIsOpen = false
            print("Окна закрыты")
        case .fillTrunk(let cargoVolume):
            if cargoVolume <= (trunkVolume - filledTrunkVolume) {
                filledTrunkVolume += cargoVolume
                print("Багажник загружен: \(filledTrunkVolume) л")
            } else {
                print("Объем багажника не позволяет поместить весь груз. Заполненный объем: \(trunkVolume - filledTrunkVolume)")
            }
        case .emptyTrunk(let cargoVolume):
            if cargoVolume <= filledTrunkVolume {
                print("Недостаточное количество груза в багажнике")
            } else {
                filledTrunkVolume -= cargoVolume
                print("Багажник разгружен")
            }
        }
    }
    
    func printInfo() {
        print("Марка авто: \(self.carBrand)")
        print("Год выпуска: \(self.yearOfRelease)")
        print("Объем багажника: \(self.trunkVolume)")
        print("Состояние двигателя: \(self.engineRunning ? "Запущен" : "Заглушен")")
        print("Положение окон: \(self.windowsIsOpen ? "Открыты" : "Закрыты")")
        print("Загрузка багажника: \(self.trunkVolume)")
    }
}

var reno = SportCar(carBrand: "reno",
                    yearOfRelease: 2020,
                    trunkVolume: 300,
                    engineRunning: true,
                    windowsIsOpen: true,
                    filledTrunkVolume: 100)

reno.printInfo()
reno.makeAction(action: .closeWindow)
reno.makeAction(action: .fillTrunk(cargoVolume: 50))
reno.makeAction(action: .fillTrunk(cargoVolume: 200))
print(reno.filledTrunkVolume)

var mazda = SportCar(carBrand: "mazda",
                     yearOfRelease: 2021,
                     trunkVolume: 500,
                     engineRunning: false,
                     windowsIsOpen: false,
                     filledTrunkVolume: 0)

mazda.printInfo()
mazda.makeAction(action: .startEngine)
mazda.makeAction(action: .fillTrunk(cargoVolume: 200))
mazda.makeAction(action: .fillTrunk(cargoVolume: 200))
print(mazda.filledTrunkVolume)

var nissan = SportCar(carBrand: "nissan",
                      yearOfRelease: 2019,
                      trunkVolume: 400,
                      engineRunning: true,
                      windowsIsOpen: false,
                      filledTrunkVolume: 0)

nissan.printInfo()
nissan.makeAction(action: .startEngine)
nissan.makeAction(action: .closeWindow)
nissan.makeAction(action: .fillTrunk(cargoVolume: 200))
nissan.makeAction(action: .fillTrunk(cargoVolume: 300))
print(nissan.filledTrunkVolume)

//MARK:-

struct TrunkCar {
    let carBrand: String
    let yearOfRelease: Int
    let bodyVolume: Double
    var engineRunning: Bool
    var windowsIsOpen: Bool
    var filledBodyVolume: Double
      
    enum Action {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case fillBody(cargoVolume: Double)
        case emptyBody(cargoVolume: Double)
    }
    
    mutating func makeAction(action: Action) {
        switch action {
        case .startEngine:
            engineRunning = true
            print("Двигатель запущен")
        case .stopEngine:
            engineRunning = false
            print("Двигатель заглушен")
        case .openWindow:
            windowsIsOpen = true
            print("Окна открыты")
        case .closeWindow:
            windowsIsOpen = false
            print("Окна закрыты")
        case .fillBody(let cargoVolume):
            if cargoVolume <= (bodyVolume - filledBodyVolume) {
                filledBodyVolume += cargoVolume
                print("Багажник загружен: \(filledBodyVolume) л")
            } else {
                print("Объем багажника не позволяет поместить весь груз. Заполненный объем: \(bodyVolume - filledBodyVolume)")
            }
        case .emptyBody(let cargoVolume):
            if cargoVolume <= filledBodyVolume {
                print("Недостаточное количество груза в багажнике")
            } else {
                filledBodyVolume -= cargoVolume
                print("Багажник разгружен")
            }
        }
    }
    
    func printInfo() {
        print("Марка авто: \(self.carBrand)")
        print("Год выпуска: \(self.yearOfRelease)")
        print("Объем багажника: \(self.bodyVolume)")
        print("Состояние двигателя: \(self.engineRunning ? "Запущен" : "Заглушен")")
        print("Положение окон: \(self.windowsIsOpen ? "Открыты" : "Закрыты")")
        print("Загрузка багажника: \(self.bodyVolume)")
    }
}

var ford = TrunkCar(carBrand: "ford",
                    yearOfRelease: 2020,
                    bodyVolume: 3000,
                    engineRunning: true,
                    windowsIsOpen: true,
                    filledBodyVolume: 0)

ford.printInfo()
ford.makeAction(action: .closeWindow)
ford.makeAction(action: .fillBody(cargoVolume: 2000))
ford.makeAction(action: .fillBody(cargoVolume: 3010))
print(ford.filledBodyVolume)

var volvo = TrunkCar(carBrand: "volvo",
                     yearOfRelease: 2021,
                     bodyVolume: 1200,
                     engineRunning: false,
                     windowsIsOpen: false,
                     filledBodyVolume: 0)

volvo.printInfo()
volvo.makeAction(action: .startEngine)
volvo.makeAction(action: .fillBody(cargoVolume: 200))
volvo.makeAction(action: .fillBody(cargoVolume: 800))
print(volvo.filledBodyVolume)

var iveco = TrunkCar(carBrand: "iveco",
                     yearOfRelease: 2019,
                     bodyVolume: 1300,
                     engineRunning: true,
                     windowsIsOpen: false,
                     filledBodyVolume: 0)

iveco.printInfo()
iveco.makeAction(action: .stopEngine)
iveco.makeAction(action: .fillBody(cargoVolume: 350))
iveco.makeAction(action: .fillBody(cargoVolume: 750))
print(iveco.filledBodyVolume)










