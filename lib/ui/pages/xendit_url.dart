import 'package:event_application/bloc/xendit/xendit_bloc.dart';
import 'package:event_application/shared/theme.dart';
import 'package:event_application/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class XenditUrl extends StatefulWidget {
  const XenditUrl({super.key});

  @override
  State<XenditUrl> createState() => _XenditUrlState();
}

class _XenditUrlState extends State<XenditUrl> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<XenditBloc, XenditState>(builder: (context, state) {
      if (state is XenditSuccess) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Logo.png',
                  width: 100,
                ),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  state.data.merchant_name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  state.data.invoice_url.toString(),
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  width: 183,
                  title: 'Go to Xendit',
                  onPressed: () {
                    _launchUrl(state.data.invoice_url.toString());
                    Navigator.pushNamed(
                      context,
                      '/payment-success',
                    );
                  },
                  color: secondaryColor,
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomFilledButton(
                  width: 183,
                  title: 'Go Home',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/navbar',
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
