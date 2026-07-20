const double vatRate = 0.07;

double calcTotal({
  required int price,
  required int qty,
  double discount = 0.0,
}) {
  return (price * qty - discount) * (1 + vatRate);
}

void main() {
  final String shopName = 'Dart Cafe';

  print('ร้าน: $shopName');
  print('อัตราภาษี (vatRate): $vatRate');
  print('---');

  final List<String> categories = ['เครื่องดื่ม', 'ของคาว', 'ของหวาน'];
  final Map<String, int> menu = {
    'อเมริกาโน่': 45,
    'ลาเต้': 55,
    'ข้าวผัด': 60,
    'เค้กส้ม': 40,
  };

  print('หมวดเมนู: $categories');
  print('จำนวนเมนูทั้งหมด: ${menu.length} รายการ');
  print('ราคาลาเต้: ${menu['ลาเต้']} บาท');
  print('---');

  print('เมนูราคาตั้งแต่ 50 บาทขึ้นไป:');
  for (final entry in menu.entries) {
    if (entry.value >= 50) {
      print('${entry.key} : ${entry.value} บาท');
    }
  }
  print('---');

  final totalNoDiscount = calcTotal(price: 55, qty: 2);
  final totalWithDiscount = calcTotal(price: 55, qty: 2, discount: 10.0);

  print('ยอดสุทธิ (ไม่มีส่วนลด): $totalNoDiscount บาท');
  print('ยอดสุทธิ (ส่วนลด 10 บาท): $totalWithDiscount บาท');
  print('---');

  String? coupon;

  print('ความยาวคูปอง: ${coupon?.length ?? 0}');

  coupon??= 'NO-COUPON';
  print('คูปองหลังกำหนดค่า: $coupon');
}