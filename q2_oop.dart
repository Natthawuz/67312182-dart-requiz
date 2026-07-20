abstract class MenuItem {
  final String name;
  final double basePrice;

  static int itemCount = 0;

  MenuItem(this.name, this.basePrice) {
    itemCount++;
  }

  double price();

  void show() {
    print('$name - ${price()} บาท');
  }
}

class Drink extends MenuItem {
  final int toppings;

  Drink(String name, double basePrice, this.toppings) : super(name, basePrice);

  @override
  double price() => basePrice + (10 * toppings);
}

class Food extends MenuItem {
  final String size;

  Food(String name, double basePrice, this.size) : super(name, basePrice);

  @override
  double price() {
    switch (size) {
      case 'S':
        return basePrice * 1.0;
      case 'M':
        return basePrice * 1.2;
      case 'L':
        return basePrice * 1.5;
      default:
        throw ArgumentError('Invalid size');
    }
  }
}

class Wallet {
  double _balance;

  Wallet(double balance) : _balance = balance;

  double get balance => _balance;

  set balance(double value) {
    if (value < 0) {
      print('ผิดพลาด : ยอดเงินติดลบไม่ได้');
      return;
    }
    _balance = value;
  }

  bool pay(double amount) {
    if (amount > _balance) {
      print('ยอดเงินไม่พอ');
      return false;
    }

    _balance -= amount;
    return true;
  }
}

enum OrderStatus { pending, paid, cancelled }

void printOrderStatus(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      print('รอชำระเงิน');
      break;
    case OrderStatus.paid:
      print('ชำระเงินแล้ว');
      break;
    case OrderStatus.cancelled:
      print('สถานะ: ยกเลิกคำสั่งซื้อ');
      break;
  }
}

void main() {
  final order = <MenuItem>[
    Drink('ลาเต้', 65, 0),
    Food('ข้าวผัด', 75, 'M'),
    Food('อเมริกาโน่', 30, 'L'),
  ];
  
  double total = 0;
  for (final item in order) {
    item.show();
    total += item.price();
  }

  print('ยอดรวมทั้งสิ้น : $total บาท');
  print('______________________');

  final wallet = Wallet(200);
  wallet.balance = -50;
  final paid = wallet.pay(100);
  if (paid) {
    print('ชำระเงินสำเร็จ');
  }  
  print('สถานะ: ชำระเงินแล้ว');
  print('ยอดคงเหลือ : ${wallet.balance} บาท');

  final canPay = wallet.pay(500);
  if (!canPay) {
    print('ยอดเงินไม่พอ');
  }
  printOrderStatus(OrderStatus.pending);
  print('ยอดคงเหลือ : ${wallet.balance} บาท');

  print('______________________');
  print('จำนวนรายการเมนูที่ถูกสร้าง: ${MenuItem.itemCount}');
}
