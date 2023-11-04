class Customer {
  final String customerID;
  final String name;
  final String gender;
  final String birthDate;
  final String phoneNumber;
  final String address;

  Customer({
    required this.customerID,
    required this.name,
    required this.gender,
    required this.birthDate,
    required this.phoneNumber,
    required this.address,
  });
}

class CustomerData {
  static List<Customer> customers = [
    Customer(
      customerID: 'KH001',
      name: 'Khách hàng A',
      gender: 'Nam',
      birthDate: '01/01/2000',
      phoneNumber: '1234567890',
      address: 'Đại lộ, Thành phố',
    ),
    Customer(
      customerID: 'KH002',
      name: 'Khách hàng B',
      gender: 'Nữ',
      birthDate: '02/02/2001',
      phoneNumber: '9876543210',
      address: 'Phố cổ, Quê hương',
    ),
    Customer(
      customerID: 'KH003',
      name: 'Khách hàng C',
      gender: 'Nam',
      birthDate: '01/01/2000',
      phoneNumber: '1234567890',
      address: 'Đại lộ, Thành phố',
    ),
    Customer(
      customerID: 'KH004',
      name: 'Khách hàng D',
      gender: 'Nữ',
      birthDate: '02/02/2001',
      phoneNumber: '9876543210',
      address: 'Phố cổ, Quê hương',
    ),
    Customer(
      customerID: 'KH005',
      name: 'Khách hàng E',
      gender: 'Nam',
      birthDate: '01/01/2000',
      phoneNumber: '1234567890',
      address: 'Đại lộ, Thành phố',
    ),
    Customer(
      customerID: 'KH006',
      name: 'Khách hàng F',
      gender: 'Nữ',
      birthDate: '02/02/2001',
      phoneNumber: '9876543210',
      address: 'Phố cổ, Quê hương',
    ),
    Customer(
      customerID: 'KH007',
      name: 'Khách hàng J',
      gender: 'Nam',
      birthDate: '01/01/2000',
      phoneNumber: '1234567890',
      address: 'Đại lộ, Thành phố',
    ),
    Customer(
      customerID: 'KH008',
      name: 'Khách hàng H',
      gender: 'Nữ',
      birthDate: '02/02/2001',
      phoneNumber: '9876543210',
      address: 'Phố cổ, Quê hương',
    ),
  ];
}
