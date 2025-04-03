
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sssss/screens/change_password_screen.dart';
import 'package:sssss/screens/confirm_logout.dart';
import 'package:sssss/screens/doctor_data.dart';
import 'package:sssss/screens/list_of_requests_doctor_screen.dart';
import 'package:sssss/screens/user_data.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Admin Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: SidebarDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuickStats(),
            SizedBox(height: 20),
            _buildSectionTitle('User Growth Curve (Last 30 Days)'),
            ChartContainer(child: UserGrowthChart()),
            SizedBox(height: 20),
            _buildSectionTitle('Doctor Requests (Last 7 Days)'),
            ChartContainer(child: DoctorRequestsChart()),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.indigo.shade700,
        ),
      ),
    );
  }
}

class SidebarDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Hi, I am Admin',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text('Admin@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.admin_panel_settings,
                  size: 40,
                  color: Colors.indigo,
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade900, Colors.blue.shade500],
                ),
              ),
            ),
            _buildDrawerItem(
              icon: Icons.dashboard,
              title: 'Dashboard',
              onTap: () => _navigateToDashboard(context),
            ),
            _buildExpandableTile(
              icon: Icons.medical_services,
              title: 'Doctor Management',
              children: [
                _buildSubDrawerItem(
                  icon: Icons.list,
                  title: 'Doctor Data',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DoctorData();
                        },
                      ),
                    );
                  },
                ),
                _buildSubDrawerItem(
                  icon: Icons.pending,
                  title: 'Doctor Requests',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ListOfRequestsDoctorScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            _buildExpandableTile(
              icon: Icons.group,
              title: 'User Management',
              children: [
                _buildSubDrawerItem(
                  icon: Icons.person,
                  title: 'Users',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UsersDataScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            _buildExpandableTile(
              icon: Icons.settings,
              title: 'Settings',
              children: [
                _buildSubDrawerItem(
                  icon: Icons.lock,
                  title: 'Change Password',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChangePasswordScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            _buildDrawerItem(
              icon: Icons.logout,
              title: 'Log Out',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LogoutConfirmationDialog();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // دوال التنقل
  void _navigateToDashboard(BuildContext context) {
    Navigator.pop(context); // إغلاق الدراور
    // إضافة التنقل إلى صفحة Dashboard
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }

  // بناء عناصر القائمة مع GestureDetector
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableTile({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        children: children,
      ),
    );
  }

  Widget _buildSubDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: ListTile(
          leading: Icon(icon, color: Colors.white70),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}

class QuickStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 2.2,
      children: [
        StatCard(title: 'Total Users', value: '1000', icon: Icons.people),
        StatCard(
          title: 'Total Doctors',
          value: '300',
          icon: Icons.medical_services,
        ),
        StatCard(
          title: 'Total Requests',
          value: '20',
          icon: Icons.pending_actions,
        ),
        StatCard(
          title: 'Approved Doctors',
          value: '100',
          icon: Icons.check_circle,
        ),
      ],
    );
  }
}

class UserGrowthChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              30,
              (index) => FlSpot(index.toDouble(), (index * 1.5) % 10),
            ),
            isCurved: true,
            color: Colors.indigo.shade700,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.indigo.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorRequestsChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: List.generate(7, (index) {
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: (index + 2).toDouble(),
                color: Colors.indigo.shade800,
              ),
            ],
          );
        }),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(show: false),
      ),
    );
  }
}

class ChartContainer extends StatelessWidget {
  final Widget child;

  ChartContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(height: 250, child: child),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  StatCard({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.indigo.shade500,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
