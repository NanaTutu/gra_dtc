import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gra_dtc/Utilities/color.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorPatch.pageBackground,

      // -----------------------------
      // 👉 Drawer (Replaces Sidebar)
      // -----------------------------
      drawer: Drawer(
        width: width * 0.65,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: height*0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Icon(Icons.apartment, size: 32, color: Colors.teal),
                    const SizedBox(width: 8),
                    Text("GRA Digital Tax",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              _drawerItem(Icons.dashboard, "Dashboard"),
              _drawerItem(Icons.receipt_long, "Invoices & Receipts", active: true),
              _drawerItem(Icons.assignment, "Tax Filings"),
              _drawerItem(Icons.settings, "Settings"),
            ],
          ),
        ),
      ),

      // ----------------------------------------
      // 👉 App Bar (To open drawer on mobile)
      // ----------------------------------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          "Invoices & Receipts",
          style: GoogleFonts.inter(
            fontSize: width*0.04,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),

      // ----------------------------------------
      // 👉 Main Scrollable Content
      // ----------------------------------------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------------------
            // Filter Row & Card
            // -------------------
            LayoutBuilder(
              builder: (context, constraints) {
                bool isMobile = constraints.maxWidth < 900;
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Filter Box
                        Expanded(
                          flex: 3,
                          child: _filterBox(),
                        ),

                        if (!isMobile) const SizedBox(width: 25),

                        // Generate Card
                        if (!isMobile)
                          Expanded(
                            flex: 1,
                            child: _generateInvoiceCard(),
                          ),
                      ],
                    ),

                    // On mobile → place card under filter
                    if (isMobile)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: _generateInvoiceCard(),
                      ),
                  ],
                );
              },
            ),

            const SizedBox(height: 30),

            // -------------------
            // Invoice Table
            // -------------------
            _invoiceTable(),
          ],
        ),
      ),
    );
  }

  // --------------------------
  // Drawer Items
  // --------------------------
  Widget _drawerItem(IconData icon, String label, {bool active = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      decoration: active
          ? BoxDecoration(
        color: const Color(0xffe8f3f3),
        border: Border(
          left: BorderSide(color: Colors.teal.shade900, width: 4),
        ),
      )
          : null,
      child: Row(
        children: [
          Icon(icon, size: 22,
              color: active ? Colors.teal.shade900 : Colors.black87),
          const SizedBox(width: 15),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: active ? Colors.teal.shade900 : Colors.black87,
            ),
          )
        ],
      ),
    );
  }

  // --------------------------
  // Filter Box
  // --------------------------
  Widget _filterBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _dateField("Start Date", "10/01/2023"),
              const SizedBox(width: 20),
              _dateField("End Date", "10/31/2023"),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
            _statusDropdown(),
            ]
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade900,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 14),
                ),
                onPressed: () {},
                child: Text(
                  "Apply",
                  style: GoogleFonts.inter(
                    color: ColorPatch.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(width: 15),
              OutlinedButton(
                onPressed: () {},
                child: const Text("Reset"),
              ),
            ],
          )
        ],
      ),
    );
  }

  // --------------------------
  // Generate New Invoice Card
  // --------------------------
  Widget _generateInvoiceCard() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xffe8f3f3),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.teal, size: 28),
          ),
          const SizedBox(height: 15),
          Text(
            "Need a new invoice?",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Easily create and send\na new tax invoice.",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal.shade900,
              minimumSize: const Size(double.infinity, 45),
            ),
            onPressed: () {},
            child: const Text("Generate New Invoice"),
          ),
        ],
      ),
    );
  }

  // --------------------------
  // Invoice Table
  // --------------------------
  Widget _invoiceTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _tableHeader(),
          const Divider(height: 1),

          // Scrollable table content
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              _invoiceRow("INV-2023-00123", "Value Added Tax", "\$1,500.00",
                  "Paid", "Oct 26, 2023"),
              _invoiceRow("INV-2023-00122", "Corporate Income Tax",
                  "\$4,250.50", "Pending", "Oct 25, 2023"),
              _invoiceRow("INV-2023-00121", "Property Tax", "\$850.00",
                  "Overdue", "Sep 15, 2023"),
              _invoiceRow("INV-2023-00120", "Value Added Tax", "\$1,320.00",
                  "Paid", "Sep 12, 2023"),
              _invoiceRow("INV-2023-00119", "Excise Duty", "\$500.75",
                  "Paid", "Aug 30, 2023"),
            ],
          ),
        ],
      ),
    );
  }

  // --------------------------
  // Reuse: (DateField, Status, Header, Items)
  // --------------------------

  Widget _dateField(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
              GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              children: [
                Text(value,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.black87,
                    )),
                const Spacer(),
                const Icon(Icons.calendar_today_outlined, size: 18),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _statusDropdown() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Status",
              style:
              GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12),
            ),
            child: Row(
              children: [
                Text("All",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.black87,
                    )),
                const Spacer(),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          _headerCell("INVOICE ID", flex: 2),
          _headerCell("TAX TYPE", flex: 2),
          _headerCell("AMOUNT", flex: 1),
          _headerCell("STATUS", flex: 1),
          _headerCell("DATE", flex: 1),
          _headerCell("DOWNLOAD", flex: 1),
        ],
      ),
    );
  }

  Widget _headerCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _invoiceRow(
      String id, String tax, String amount, String status, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(id)),
          Expanded(flex: 2, child: Text(tax)),
          Expanded(flex: 1, child: Text(amount)),
          Expanded(flex: 1, child: _statusBadge(status)),
          Expanded(flex: 1, child: Text(date)),
          const Expanded(
            flex: 1,
            child:
            Icon(Icons.download_outlined, color: Colors.black87, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _statusBadge(String status) {
    Color color;
    Color bg;

    if (status == "Paid") {
      color = Colors.green.shade700;
      bg = Colors.green.shade100;
    } else if (status == "Pending") {
      color = Colors.orange.shade700;
      bg = Colors.orange.shade100;
    } else {
      color = Colors.red.shade700;
      bg = Colors.red.shade100;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        status,
        style: GoogleFonts.inter(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

