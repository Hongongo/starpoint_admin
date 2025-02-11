import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:starpoint_admin/features/auth/presentation/providers/auth_provider.dart';
import 'package:starpoint_admin/features/products/domain/domain.dart';
import '../../infrastructure/infrastructure.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';
  final productsRepository = ProductsRepositoryImpl(ProductsDatasourceImpl(accessToken: accessToken));
  return productsRepository;
});
