import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iservices/controllers/controllers.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class Home extends StatefulWidget with ControllersMixin {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with ControllersMixin {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    controller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;
    double delta = MediaQuery.of(context).size.height * 0.20;
    if (maxScroll - currentScroll <= delta) {
      requestsController.getPaginatedRequests();
    }
  }

  @override
  Widget build(BuildContext context) {
    var rc = requestsController;
    return ValueListenableBuilder(
        valueListenable: rc.isLoading,
        builder: (context, isLoading, __) {
          if (isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!isLoading && rc.requests.value.isNotEmpty) {
            return ListView.builder(
                controller: controller,
                itemBuilder: (context, i) {
                  var req = rc.requests.value[i];
                  return Slidable(
                    endActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (context) => {},
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.green,
                        icon: Icons.check,
                        label: 'Done',
                      ),
                      SlidableAction(
                        spacing: 2,
                        onPressed: (context) => {},
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ]),
                    child: Container(
                      height: 100,
                      child: ListTile(
                        title: Text(req.name.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton.filledTonal(
                                onPressed: () {
                                  url_launcher.canLaunchUrl(Uri(
                                      scheme: 'tel', path: "tel:${req.mobile}"));
                                },
                                icon: const Icon(Icons.call_outlined)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: rc.requests.value.length);
          } else {
            return Center(
              child: Image.asset('assets/images/no_data.png'),
            );
          }
        });
  }
}
