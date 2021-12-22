import 'package:flutter/material.dart';
import 'package:ibilling/core/constants/my_colors.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  var _selectedDay;
  var _focusedDay;
  //No need for disposal. Disposed internally by TableCalendar
  PageController? _calendarController;
  bool contractsTabActive = true;

  Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHorizontalCalendar(),
        _buildContractsInvoiceTabs(),
      ],
    );
  }

  Widget _buildHorizontalCalendar() {
    return Container(
      color: MyColors.darkGrey,
      child: TableCalendar(
        firstDay: DateTime.utc(2000, 1, 1),
        lastDay: DateTime.utc(2030, 1, 1),
        focusedDay: widget._focusedDay ?? DateTime.now(),
        calendarFormat: CalendarFormat.week,
        daysOfWeekVisible: false,
        startingDayOfWeek: StartingDayOfWeek.monday,
        rowHeight: 90,
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          headerPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leftChevronVisible: false,
          rightChevronVisible: false,
        ),
        onCalendarCreated: (PageController calendarPageController) {
          widget._calendarController = calendarPageController;
        },
        selectedDayPredicate: (day) {
          return isSameDay(widget._selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            widget._selectedDay = selectedDay;
            widget._focusedDay = focusedDay;
          });
        },
        onPageChanged: (focusedDay) {
          widget._focusedDay = focusedDay;
        },
        calendarStyle: const CalendarStyle(
          isTodayHighlighted: false,
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (
            BuildContext context,
            DateTime day,
            DateTime focusedDay,
          ) =>
              defaultCalendarBuilder(context, day, focusedDay),
          outsideBuilder: (
            BuildContext context,
            DateTime day,
            DateTime focusedDay,
          ) =>
              defaultCalendarBuilder(context, day, focusedDay),
          selectedBuilder: (
            BuildContext context,
            DateTime day,
            DateTime events,
          ) =>
              selectedCalendarBuilder(context, day, events),
          headerTitleBuilder: (BuildContext context, DateTime day) =>
              titleCalendarBuilder(
            context,
            day,
          ),
        ),
      ),
    );
  }

  defaultCalendarBuilder(
    BuildContext context,
    DateTime day,
    DateTime focusedDay,
  ) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            DateFormat('EEEE').format(day).substring(0, 2),
            style: const TextStyle(
              color: MyColors.calDefDaysColor,
            ),
          ),
          Text(
            day.day.toString(),
            style: const TextStyle(
              color: MyColors.calDefDaysColor,
            ),
          ),
          Container(
            height: 1.5,
            width: 16,
            color: MyColors.calDefDaysColor,
          ),
        ],
      ),
    );
  }

  selectedCalendarBuilder(
    BuildContext context,
    DateTime day,
    DateTime events,
  ) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: MyColors.jade,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            DateFormat('EEEE').format(day).substring(0, 2),
            style: const TextStyle(
              color: MyColors.white,
            ),
          ),
          Text(
            day.day.toString(),
            style: const TextStyle(
              color: MyColors.white,
            ),
          ),
          Container(
            height: 1.5,
            width: 16,
            color: MyColors.white,
          ),
        ],
      ),
    );
  }

  titleCalendarBuilder(BuildContext context, DateTime day) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${DateFormat('MMMM').format(day)}, ${DateFormat('yyyy').format(day)}',
          style: const TextStyle(
            color: MyColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        _buildPrevNextButtons(),
      ],
    );
  }

  Widget _buildPrevNextButtons() {
    return Row(
      children: [
        IconButton(
          onPressed: () => widget._calendarController?.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          ),
          icon: const Icon(
            Icons.chevron_left,
            size: 36,
            color: MyColors.white,
          ),
        ),
        IconButton(
          onPressed: () => widget._calendarController?.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          ),
          icon: const Icon(
            Icons.chevron_right,
            size: 36,
            color: MyColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildContractsInvoiceTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16.0,
      ),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.contractsTabActive = true;
              });
            },
            child: const Text("Contracts"),
            style: ElevatedButton.styleFrom(
              primary: widget.contractsTabActive
                  ? MyColors.jade
                  : MyColors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          const SizedBox(width: 15),
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.contractsTabActive = false;
              });
            },
            child: const Text("Invoice"),
            style: ElevatedButton.styleFrom(
              primary: !widget.contractsTabActive
                  ? MyColors.jade
                  : MyColors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
