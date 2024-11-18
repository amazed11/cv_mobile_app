import 'package:flutter/material.dart';

class CommonDialog {
  void loading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Dialog(
          child: LoadingDialog(),
        );
      },
    );
  }

  void error(BuildContext context, String data) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: ErrorDialog(
            description: data,
          ),
        );
      },
    );
  }

  void success(BuildContext context, String data) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: SuccessDialog(
            description: data,
          ),
        );
      },
    );
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 8,
          ),
          Text("Loading please wait....."),
        ],
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  ErrorDialog({this.description, super.key});

  String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error,
            size: 25,
            color: Colors.red,
          ),
          const SizedBox(
            height: 8,
          ),
          Text("$description"),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () {
                debugPrint('OK button clicked');
                Navigator.pop(context);
              },
              child: const Text("OK"))
        ],
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  SuccessDialog({this.description, super.key});
  String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.done,
          size: 25,
          color: Colors.red,
        ),
        const SizedBox(
          height: 8,
        ),
        Text("$description"),
        const SizedBox(
          height: 8,
        ),
        ElevatedButton(
            onPressed: () {
              debugPrint('OK button clicked');
              Navigator.pop(context);
            },
            child: const Text("OK"))
      ],
    );
  }
}
