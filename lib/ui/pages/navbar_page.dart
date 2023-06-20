import 'package:event_application/bloc/navigation/navbar_items.dart';
import 'package:event_application/bloc/navigation/navigation_cubit.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/pages/home_page.dart';
import 'package:event_application/ui/pages/profile_Page.dart';
import 'package:event_application/ui/pages/search_page.dart';
import 'package:event_application/ui/pages/ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavbarBottom extends StatefulWidget {
  const NavbarBottom({super.key});

  @override
  State<NavbarBottom> createState() => _NavbarBottomState();
}

class _NavbarBottomState extends State<NavbarBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        return BottomAppBar(
          color: whiteColor,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          child: BottomNavigationBar(
            currentIndex: state.index,
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            elevation: 0,
            selectedItemColor: primaryColor,
            unselectedItemColor: blackColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
            unselectedLabelStyle: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_home.png',
                  width: 30,
                  color: state.navbarItem == NavbarItem.home
                      ? primaryColor
                      : greyColor,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_search.png',
                  width: 30,
                  color: state.navbarItem == NavbarItem.search
                      ? primaryColor
                      : greyColor,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_booking.png',
                  width: 30,
                  color: state.navbarItem == NavbarItem.ticket
                      ? primaryColor
                      : greyColor,
                ),
                label: 'Ticket',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_profile.png',
                  width: 30,
                  color: state.navbarItem == NavbarItem.profile
                      ? primaryColor
                      : greyColor,
                ),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.search);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.ticket);
              } else if (index == 3) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.profile);
              }
            },
          ),
        );
      }),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return HomePage();
          } else if (state.navbarItem == NavbarItem.search) {
            return SearchPage();
          } else if (state.navbarItem == NavbarItem.ticket) {
            return TicketPage();
          } else if (state.navbarItem == NavbarItem.profile) {
            return ProfilePage();
          }
          return Container();
        },
      ),
    );
  }
}
