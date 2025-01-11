

import 'package:event_bus/event_bus.dart';
import 'package:lance/shared/services/apiService/api_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> getProviders({required ApiService apiService}) {
  return [
    Provider<EventBus>(create: (_) => EventBus()),
  ];
}