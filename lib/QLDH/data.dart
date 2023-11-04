class Order {
  final String orderName;
  final String orderID;
  final String customerID;
  final String orderDate;
  final String address;
  final String orderStatus;
  final String paymentMethod;
  final double totalAmount;

  Order({
    required this.orderName,
    required this.orderID,
    required this.customerID,
    required this.orderDate,
    required this.address,
    required this.orderStatus,
    required this.paymentMethod,
    required this.totalAmount,
  });
}

List<Order> orders = [
  Order(
    orderName: "Đơn hàng 1",
    orderID: "DH001",
    customerID: "Nguyễn Thảo Huyền",
    orderDate: "01/11/2023",
    address: "248/2 Ngu Hanh Son, Da Nang",
    orderStatus: "Đã giao hàng",
    paymentMethod: "Thanh toán khi nhận hàng",
    totalAmount: 100.0,
  ),
  Order(
    orderName: "Đơn hàng 2",
    orderID: "DH002",
    customerID: "Cust002",
    orderDate: "21/10/2023",
    address: "09 Son Tra",
    orderStatus: "Đã giao hàng",
    paymentMethod: "Thanh toán khi nhận hàng",
    totalAmount: 100.0,
  ),
  Order(
    orderName: "Đơn hàng 3",
    orderID: "DH003",
    customerID: "Cust003",
    orderDate: "04/11/2023",
    address: "274 Le Hong Phong",
    orderStatus: "Đang vận chuyển",
    paymentMethod: "Thanh toán bằng ví điện tử",
    totalAmount: 100.0,
  ),
  Order(
    orderName: "Đơn hàng 4",
    orderID: "DH004",
    customerID: "Cust004",
    orderDate: "02/10/2023",
    address: "123 Main St, City",
    orderStatus: "Đã giao hàng",
    paymentMethod: "Thanh toán khi nhận hàng",
    totalAmount: 100.0,
  ),
  Order(
    orderName: "Đơn hàng 5",
    orderID: "DH005",
    customerID: "Cust005",
    orderDate: "02/10/2023",
    address: "123 Main St, City",
    orderStatus: "Đã giao hàng",
    paymentMethod: "Thanh toán khi nhận hàng",
    totalAmount: 100.0,
  ),
  Order(
    orderName: "Đơn hàng 6",
    orderID: "DH006",
    customerID: "Cust006",
    orderDate: "29/10/2023",
    address: "123 Main St, City",
    orderStatus: "Đã giao hàng",
    paymentMethod: "Thanh toán bằng ví VNpay",
    totalAmount: 100.0,
  ),
  // Thêm các đơn hàng khác vào danh sách
];
