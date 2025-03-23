import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class TicketBookingPage extends StatefulWidget {
  final String? type;
  final List<Map<String, String>> selectedPackages;
  final double totalPrice;

  const TicketBookingPage({
    super.key,
    required this.type,
    required this.selectedPackages,
    required this.totalPrice,
  });

  @override
  _TicketBookingPageState createState() => _TicketBookingPageState();
}

class _TicketBookingPageState extends State<TicketBookingPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _startDate;
  DateTime? _endDate;

  int _adultTickets = 1;
  int _childTickets = 0;
  TimeOfDay _selectedTime = TimeOfDay(hour: 9, minute: 0);

  final double _adultTicketPrice = 50.0;
  final double _childTicketPrice = 25.0;

  double get _totalAmount {
    return (_adultTickets * _adultTicketPrice) +
        (_childTickets * _childTicketPrice) +
        widget.totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Tickets",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF203A58),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Selected Packages
              Text(
                'Selected Packages:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 8),
              ...widget.selectedPackages.map((package) {
                return ListTile(
                  title: Text(
                    package['name']!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF203A58),
                    ),
                  ),
                  subtitle: Text(
                    '${package['details']!} - ${package['price']!}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF203A58),
                    ),
                  ),
                );
              }).toList(),
              SizedBox(height: 20),

              // Calendar Section
              Text(
                'Select Travel Dates',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'March 2025',
                style: TextStyle(fontSize: 18, color: Color(0xFF203A58)),
              ),
              SizedBox(height: 8),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 400,
                    child: TableCalendar(
                      firstDay: DateTime.utc(2025, 1, 1),
                      lastDay: DateTime.utc(2025, 12, 31),
                      focusedDay: _focusedDay,
                      rangeStartDay: _startDate,
                      rangeEndDay: _endDate,
                      calendarFormat: _calendarFormat,
                      rangeSelectionMode: RangeSelectionMode.toggledOn,
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      onPageChanged: (focusedDay) {
                        setState(() {
                          _focusedDay = focusedDay;
                        });
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _focusedDay = focusedDay;
                          if (_startDate == null || _endDate != null) {
                            _startDate = selectedDay;
                            _endDate = null;
                          } else if (selectedDay.isAfter(_startDate!)) {
                            _endDate = selectedDay;
                          } else {
                            _startDate = selectedDay;
                            _endDate = null;
                          }
                        });
                      },
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF203A58),
                        ),
                      ),
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Color(0xFF203A58),
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Color(0xFF203A58),
                          shape: BoxShape.circle,
                        ),
                        rangeStartDecoration: BoxDecoration(
                          color: Color(0xFF203A58),
                          shape: BoxShape.circle,
                        ),
                        rangeEndDecoration: BoxDecoration(
                          color: Color(0xFF203A58),
                          shape: BoxShape.circle,
                        ),
                        rangeHighlightColor: Colors.deepPurple[100]!,
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF203A58),
                        ),
                        weekendStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF203A58),
                        ),
                      ),
                      calendarBuilders: CalendarBuilders(
                        dowBuilder: (context, day) {
                          final text = DateFormat.E().format(day);
                          return Center(
                            child: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF203A58),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Selected Duration
              if (_startDate != null && _endDate != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Duration:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF203A58),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'From: ${DateFormat('yyyy-MM-dd').format(_startDate!)}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF203A58),
                      ),
                    ),
                    Text(
                      'To: ${DateFormat('yyyy-MM-dd').format(_endDate!)}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF203A58),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 20),

              // Time Selection
              Text(
                'Select Time',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: _selectedTime,
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _selectedTime = pickedTime;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF203A58),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Selected Time: ${_selectedTime.format(context)}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),

              // Adult Tickets
              Text(
                'Adult Tickets (Seasonal pricing applies)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Color(0xFF203A58)),
                    onPressed: () {
                      setState(() {
                        if (_adultTickets > 1) {
                          _adultTickets--;
                        }
                      });
                    },
                  ),
                  Text(
                    '$_adultTickets ticket${_adultTickets != 1 ? 's' : ''}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF203A58),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Color(0xFF203A58)),
                    onPressed: () {
                      setState(() {
                        _adultTickets++;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Child Tickets
              Text(
                'Child Tickets (Seasonal pricing applies)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Color(0xFF203A58)),
                    onPressed: () {
                      setState(() {
                        if (_childTickets > 0) {
                          _childTickets--;
                        }
                      });
                    },
                  ),
                  Text(
                    '$_childTickets ticket${_childTickets != 1 ? 's' : ''}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF203A58),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Color(0xFF203A58)),
                    onPressed: () {
                      setState(() {
                        _childTickets++;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Trip Information
              Text(
                'Trip Information',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "What's Included:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 4),
              Text(
                "- Guided tours of ancient pyramids",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF203A58),
                ),
              ),
              Text(
                "- Local Egyptian cuisine experience",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF203A58),
                ),
              ),
              Text(
                "- Transportation between sites",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF203A58),
                ),
              ),
              Text(
                "- Professional English-speaking guide",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF203A58),
                ),
              ),
              Text(
                "- Entry fees to historical sites",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Important Notes:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 4),
              Text(
                "- Tours start at selected time",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF203A58),
                ),
              ),
              Text(
                "- Comfortable walking shoes recommended",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF203A58),
                ),
              ),
              Text(
                "- Bring sunscreen and water",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 20),

              // Total Amount and Book Now Button
              Text(
                'Total Amount:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$${_totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF203A58),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_startDate == null || _endDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please select a valid date range.'),
                        ),
                      );
                    } else {
                      _showOrderConfirmationDialog(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF203A58),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 10,
                  ),
                  child: Text(
                    'Book Now',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showOrderConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text('Order Placed!', textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 60),
            SizedBox(height: 10),
            Text('Your order has been successfully placed.',
                textAlign: TextAlign.center),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
