// варианты ошибок
enum refuelingError: Error{
    case noFuel;
    case broken;
    case littleSpace;
}
// стурктура бака куда заправлять
struct tank{
    var tankVolume:Double;
}

// класс заправка
class gasStation{
    let volume:Double = 1000;
    var loadvolume:Double = 300;
    var gasStationBroken = false;
    
// функкция заправки с ошибками
    func refuling (tank:tank)throws{
        guard gasStationBroken == false else{
            throw refuelingError.broken;
        }
        guard tank.tankVolume <= loadvolume else {
            throw refuelingError.noFuel;
        }
        loadvolume = self.loadvolume - tank.tankVolume;
    }
// функция пополнения топлива на заправке с ошибкой
    func moreFuel(fuel:Double)throws{
        guard self.loadvolume + fuel <= volume else{
            throw refuelingError.littleSpace;
        }
        loadvolume = self.loadvolume + fuel;
    }
// функции поломки заправки и вывода состояния хранилища
    func brokenGasStation(gasStationBroken:Bool){
        switch gasStationBroken{
        case true:
            self.gasStationBroken = true;
        case false:
            self.gasStationBroken = false;
        }
    }
    func fuelState(){
        print("Количество топлива в хранилище \(loadvolume), максимальное количество \(volume)");
    }
}

// Эксперементы
var bp = gasStation();
bp.fuelState();
do {
    try bp.moreFuel(fuel: 1000);
} catch _ as refuelingError{
    print("В хранилище недостаточно места");
}
do {
    try bp.refuling(tank:.init(tankVolume: 1500));
} catch _ as refuelingError{
    print("Недостаточно топлива в хранилище");
}
bp.brokenGasStation(gasStationBroken: true);
do {
    try bp.refuling(tank:.init(tankVolume: 100));
} catch _ as refuelingError{
    print("Станция сломана");
}
