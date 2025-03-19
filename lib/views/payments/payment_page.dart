import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techonology_equipment/models/payment.dart';
import 'package:techonology_equipment/routes/app_routes.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PersonalPaymentState();
}

class _PersonalPaymentState extends State<PaymentPage>
    with SingleTickerProviderStateMixin {
  final List<Payment> _payments = [
    // Các khoản thanh toán tháng 3/2025
    Payment(
      id: '1',
      amount: 1500000,
      note: 'Tiền thuê nhà tháng 3',
      date: DateTime(2025, 3, 5),
      status: PaymentStatus.paid,
      personName: 'Nguyễn Văn A',
    ),
    Payment(
      id: '2',
      amount: 500000,
      note: 'Tiền điện tháng 3',
      date: DateTime(2025, 3, 10),
      status: PaymentStatus.paid,
      personName: 'Trần Thị B',
    ),
    Payment(
      id: '3',
      amount: 300000,
      note: 'Tiền nước tháng 3',
      date: DateTime(2025, 3, 15),
      status: PaymentStatus.unpaid,
      personName: 'Lê Văn C',
    ),

    // Các khoản thanh toán tháng 2/2025
    Payment(
      id: '4',
      amount: 2000000,
      note: 'Tiền thuê nhà tháng 2',
      date: DateTime(2025, 2, 5),
      status: PaymentStatus.paid,
      personName: 'Nguyễn Văn A',
    ),
    Payment(
      id: '5',
      amount: 450000,
      note: 'Tiền điện tháng 2',
      date: DateTime(2025, 2, 10),
      status: PaymentStatus.paid,
      personName: 'Trần Thị B',
    ),
    Payment(
      id: '6',
      amount: 250000,
      note: 'Tiền nước tháng 2',
      date: DateTime(2025, 2, 15),
      status: PaymentStatus.paid,
      personName: 'Lê Văn C',
    ),
  ];
  late TabController _tabController;
  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;
  bool _isYearlyView = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleViewMode() {
    setState(() {
      _isYearlyView = !_isYearlyView;
    });
  }

  void _selectMonth() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Chọn tháng"),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  final month = index + 1;
                  return ListTile(
                    title: Text('Tháng $month'),
                    onTap: () {
                      setState(() {
                        _selectedMonth = month;
                        _isYearlyView = false;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          );
        });
  }

  void _selectYear() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Chọn năm"),
            content: SizedBox(
              width: double.maxFinite,
              height: 300,
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final year = DateTime.now().year - index;
                    return ListTile(
                        title: Text('Năm $year'),
                        onTap: () {
                          setState(() {
                            _selectedYear = year;
                          });
                          Navigator.pop(context);
                        });
                  }),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán cá nhân'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _isYearlyView
                            ? "Năm $_selectedYear"
                            : "Tháng $_selectedMonth/$_selectedYear",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          if (!_isYearlyView)
                            IconButton(
                              onPressed: _selectMonth,
                              icon: const Icon(
                                Icons.calendar_month,
                                color: Colors.black,
                              ),
                              tooltip: 'Chọn tháng',
                            ),
                          IconButton(
                            onPressed: _selectYear,
                            icon: const Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                            ),
                            tooltip: 'Chọn năm',
                          ),
                          IconButton(
                              onPressed: _toggleViewMode,
                              icon: Icon(
                                _isYearlyView
                                    ? Icons.view_week
                                    : Icons.view_agenda,
                                color: Colors.black,
                              ),
                              tooltip: 'Chọn năm')
                        ],
                      )
                    ],
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Đã thanh toán'),
                    Tab(text: 'Chưa thanh toán'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      Text('Đã thanh toán'),
                      Text('Chưa thanh toán'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed(AppRoutes.addPaymentPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
