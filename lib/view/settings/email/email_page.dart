import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/yahoo.dart';
import 'package:rhyme_me/global/ui_assets/my_assets/colors.dart';

@RoutePage()
class MailPage extends StatelessWidget {
  const MailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController subjectController = TextEditingController();
    final TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer support"),
        actions: [
          TextButton(
            onPressed: () {
              if (emailController.text.isEmpty ||
                  subjectController.text.isEmpty ||
                  textController.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    /// do delate action on button
                    return AlertDialog(
                      actionsAlignment: MainAxisAlignment.center,
                      title: const Text(
                        "Warning!",
                        style: TextStyle(color: AppColors.redColor),
                        textAlign: TextAlign.center,
                      ),
                      content: const Text(
                        "Please fill all required information",
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                          child: const Text("Ok"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(emailController.text)) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    /// do delate action on button
                    return AlertDialog(
                      actionsAlignment: MainAxisAlignment.center,
                      title: const Text(
                        "Warning!",
                        style: TextStyle(color: Colors.redAccent),
                        textAlign: TextAlign.center,
                      ),
                      content: const Text(
                        "The email address must be correctly filled in!",
                        textAlign: TextAlign.center,
                        // style: TextStyle(
                        //   color: AppColors.settingsTextActionMainColor,
                        //   fontSize: 12,
                        //   fontStyle: FontStyle.normal,
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text("Ok"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                sendMailFromYahooToYahoo(emailController.text,
                    subjectController.text, textController.text);
                Navigator.pop(context);
              }
            },
            child: const Text("Send"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(15),
                width: double.maxFinite,
                height: 80.0,
                child: TextFormField(
                  style: const TextStyle(color: AppColors.blackColor),
                  controller: emailController,
                  autofocus: true,
                  maxLines: 1,
                  minLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        AppColors.whiteColor, // Set the background color here
                    contentPadding: const EdgeInsets.all(10),
                    focusColor: Colors.black,
                    hoverColor: Colors.black,
                    hintText: "Enter your Email",
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 2,
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 2,
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: InputBorder.none,
                  ),
                )),
            Container(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              width: double.maxFinite,
              child: TextFormField(
                style: const TextStyle(color: AppColors.blackColor),
                controller: subjectController,
                // maxLength: null,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      AppColors.whiteColor, // Set the background color here
                  contentPadding: const EdgeInsets.all(10),
                  focusColor: Colors.black,
                  hoverColor: Colors.black,
                  hintText: "Subject",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 2,
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    gapPadding: 2,
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
                height: 200,
                padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
                child: TextFormField(
                  style: const TextStyle(color: AppColors.blackColor),
                  controller: textController,
                  scribbleEnabled: true,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  expands: true,
                  minLines: null,
                  maxLines: null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        AppColors.whiteColor, // Set the background color here
                    contentPadding: const EdgeInsets.all(10),
                    focusColor: Colors.black,
                    hoverColor: Colors.black,
                    hintText: "Message text",
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 2,
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 2,
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: InputBorder.none,
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom.toDouble(),
            )
          ],
        ),
      ),
    );
  }

  sendMailFromYahooToYahoo(String email, String subject, String body) async {
    final yahooSmtp =
        yahoo(dotenv.env["YAHOO_EMAIL"]!, dotenv.env["YAHOO_PASSWORD"]!);
    final message = Message()
      ..from = Address(dotenv.env["YAHOO_EMAIL"]!, 'Confirmation Bot')
      ..recipients.add('kairat.parmanov@yahoo.com')
      ..subject = subject
      ..text = 'email - $email, TEXT: $body';
    // ..html =
    //     '<body style="text-align: center; font-family: Tahoma, Geneva, Verdana, sans-serif;"> <div style="margin:auto; border-radius: 10px; width: 300px; padding: 10px; box-shadow: 1px 1px 1px 1px rgb(174, 174, 174);"> <img style="height: 150px;" src="https://static.vecteezy.com/system/resources/previews/018/930/122/non_2x/email-marketing-campaign-subscription-on-web-and-sending-email-newsletter-for-discount-or-promotion-information-businessmen-standing-next-to-email-envelope-announcing-promotion-through-megaphone-vector.jpg" alt="newsletter"> <h2>Thanks for accepting our Newsletter 🙌</h2> <p>Now you will never miss any updates.</p><p>Thanks for your support 😍</p></div></body>';

    try {
      await send(message, yahooSmtp);
    } catch (e) {
      // Handle errors by emitting a failure state
      log(e.toString());
    }
  }
}
