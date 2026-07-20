import 'dart:async';

Future<Map<String, dynamic>> fetchOrder(int orderId) async {
  if (orderId <= 0) {
    throw Exception('รหัสคำสั่งซื้อไม่ถูกต้อง');
  }

  await Future.delayed(Duration(seconds: 2));

  return {
    'id': orderId,
    'menu': 'ข้าวหมูแดง',
    'total': 150,
  };
}

Stream<String> trackOrder(int orderId) async* {
  await Future.delayed(Duration(seconds: 1));
  yield 'รับออร์เดอร์แล้ว';

  await Future.delayed(Duration(seconds: 1));
  yield 'กำลังจัดทำ';

  await Future.delayed(Duration(seconds: 1));
  yield 'จัดส่งพร้อมแล้ว';
}

void main() async {
  print('เริ่มโหลดข้อมูล...');

  try {
    final order1 = await fetchOrder(7);
    print('ข้อมูลออร์เดอร์: $order1');
  } catch (e) {
    print('เกิดข้อผิดพลาด: $e');
  } finally {
    print('จบรายการ');
  }

  try {
    final order2 = await fetchOrder(0);
    print('ข้อมูลออร์เดอร์: $order2');
  } catch (e) {
    print('เกิดข้อผิดพลาด $e');
  } finally {
    print('จบรายการ');
  }

  print(' ');
  print('ติดตามสถานะ:');
  await for (String status in trackOrder(7)) {
    print(status);
  }
  print('ติดตามสถานะเสร็จสิ้น');
}
