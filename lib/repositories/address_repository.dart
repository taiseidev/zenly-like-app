import 'package:hooks_riverpod/hooks_riverpod.dart';

final addressRepositoryProvider = Provider.autoDispose(
  (ref) => AddressRepository(),
);

class AddressRepository {}
