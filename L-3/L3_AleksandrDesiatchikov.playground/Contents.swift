
// перечисления возможных действий с автомобилем
enum enginState {
    case started, off
}
enum windowState {
    case open, close;
}
enum loadBody{
    case full,half,empty;
}
// структура легкового автомобиля
struct car{
    let relese: Int;
    let model: String;
    var engine: enginState;
    var window: windowState;
    let bodyVolume: Double;
    var loadBodyVolume: Double;
// метод с аргументом типа перечисление, меняющий загрузку кузова
    mutating func bodyState(status: loadBody){
        switch status {
        case .full:
            loadBodyVolume = bodyVolume;
        case .half:
            loadBodyVolume = bodyVolume/2;
        default:
            loadBodyVolume = 0;
        }
    }
}

// структура грузовика
struct truck{
    let relese: Int;
    let model: String;
    var engine: enginState;
    var window: windowState;
    let bodyVolume: Double;
    var loadBodyVolume: Double;
// метод с аргументом типа перечисление, меняющий загрузку кузова
    mutating func bodyState(status: loadBody){
        switch status {
        case .full:
            loadBodyVolume = bodyVolume;
        case .half:
            loadBodyVolume = bodyVolume/2;
        default:
            loadBodyVolume = 0;
        }
    }
}


var car1 = car(relese: 2015, model: "Opel", engine: .off, window: .close, bodyVolume: 100.0, loadBodyVolume: 0)
var car2 = car(relese: 2010, model: "BMW", engine:.started, window: .open, bodyVolume: 50.0, loadBodyVolume: 0)

var truck1 = truck(relese: 2005, model: "Volvo", engine: .off, window: .close, bodyVolume: 1000, loadBodyVolume: 0)
var truck2 = truck(relese: 2019, model: "Kamaz", engine: .started, window: .close, bodyVolume: 1000, loadBodyVolume: 0)


car1.window = .open
car2.bodyState(status: .empty)
truck1.engine = .started
truck1.bodyState(status: .half)
truck2.bodyState(status: .full)

// функции для вывода информации о авто и грузовиках
func InfoCar (car: car){
    print("Год выпуска - ", car.relese,"Марка автомобиля - ",car.model,"Статус двигателя - ",car.engine, "Статус окон -",car.window, "Объем кузова -",car.bodyVolume, "Загруженый объем кузова -",car.loadBodyVolume)
}

func InfoTruck (truck: truck){
    print("Год выпуска - ", truck.relese,"Марка автомобиля - ",truck.model,"Статус двигателя - ",truck.engine, "Статус окон -",truck.window, "Объем кузова -",truck.bodyVolume, "Загруженый объем кузова -",truck.loadBodyVolume)
}

InfoCar(car: car1)
InfoTruck(truck: truck2)

