import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/common/widgets/buttons.dart';
import 'package:stock_manager/src/common/widgets/dropdowns.dart';
import 'package:stock_manager/src/common/widgets/text_form_fields.dart';
import 'package:stock_manager/src/features/add_sales/presentation/view_models/sales_providers.dart';
import 'package:stock_manager/src/features/add_sales/presentation/widgets/sales_fetch_widgets.dart';
import 'package:stock_manager/src/features/home/presentation/widgets/dashboard_details_card.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager/src/features/inventory/presentation/widgets/pagination_widget.dart';
import 'package:stock_manager/src/utils/constants/constants.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class SalesScrn extends HookConsumerWidget {
  const SalesScrn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    FocusNode focusNode = useFocusNode();
    final searchFieldIsActive = ref.watch(isSearchFieldActiveProvider);
    final searchController = useTextEditingController();
    final selectedFilterDuration = ref.watch(generalDurationCode);
    final searchedSales = ref.watch(searchSalesNotifierProvider);
    focusNode.addListener(() {
      if (focusNode.hasFocus && !searchFieldIsActive) {
        ref.read(isSearchFieldActiveProvider.notifier).state =
            focusNode.hasFocus;
      }
    });
    return SingleChildScrollView(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(kCardRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Sales Summary",
                            style: context.titleLarge,
                          ),
                        ),
                        Expanded(
                          child: FilterInventoryCardDropdown(
                            selectedDurationCode: selectedFilterDuration,
                          ),
                        ),
                      ],
                    ),
                    8.vGap,
                    Row(
                      children: [
                        Expanded(
                          child: DashboardDetailsCard(
                            label: "Stock Sold",
                            value: "",
                            subTitle: "Items: ",
                            provider: ref.watch(getSoldProductsProvider(
                                selectedFilterDuration)),
                            providerHasTwoOutputs: true,
                          ),
                        ),
                        4.hGap,
                        Expanded(
                          child: DashboardDetailsCard(
                            label: "Total Sales",
                            value: "",
                            subTitle: "XAF ",
                            provider: ref.watch(
                                getSalesValueProvider(selectedFilterDuration)),
                          ),
                        ),
                        4.hGap,
                        Expanded(
                          child: DashboardDetailsCard(
                            label: 'Available Stock',
                            value: '',
                            subTitle: 'Items: ',
                            provider: ref.watch(getTotalProductsProvider(
                                selectedFilterDuration)),
                            providerHasTwoOutputs: true,
                          ),
                        ),
                      ],
                    ),
                    16.vGap,
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: BorderRadius.circular(kCardRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sales",
                              style: context.titleLarge,
                            ),
                            8.vGap,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: size.width * 0.25,
                                  child: CustomInputFormField(
                                    hintText: "Search Product",
                                    controller: searchController,
                                    focusNode: focusNode,
                                    onSubmitted: (p0) {
                                      'submitted with value $p0'.log();
                                      ref
                                          .read(searchSalesNotifierProvider
                                              .notifier)
                                          .searchSales(query: p0);
                                      // ref.read(searchProductsProvider(p0));
                                      focusNode.unfocus();
                                      ref
                                          .read(isSearchFieldActiveProvider
                                              .notifier)
                                          .state = false;
                                    },
                                    validator: (p0) {
                                      return null;
                                    },
                                    onChanged: (value) {
                                      ref
                                          .read(searchQueryProvider.notifier)
                                          .update((state) => value);
                                      ref.read(filteredProductNamesProvider);
                                    },
                                    onClear: () {
                                      searchController.clear();
                                      focusNode.unfocus();
                                      ref
                                          .read(isSearchFieldActiveProvider
                                              .notifier)
                                          .state = false;
                                      ref
                                          .read(searchQueryProvider.notifier)
                                          .update((state) => '');
                                      ref
                                          .read(filteredProductNamesProvider
                                              .notifier)
                                          .state = [];
                                    },
                                  ),
                                ),
                                MainBtns(
                                  size: size,
                                  flexWidth: true,
                                  prefixIcon: Icons.add,
                                  onPressed: () {
                                    context.go('/add_sales');
                                  },
                                  btnText: "Add Sale",
                                ),
                              ],
                            ),
                            20.vGap,
                            SizedBox(
                              // height: size.height * 0.65,
                              height: size.height - 445,
                              child: searchFieldIsActive
                                  ? SizedBox(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ...ref
                                                .watch(
                                                    filteredProductNamesProvider)
                                                .map((e) {
                                              return ListTile(
                                                onTap: () {
                                                  ref
                                                      .read(
                                                          filteredProductNamesProvider
                                                              .notifier)
                                                      .state = [];
                                                  ref
                                                      .read(
                                                          searchSalesNotifierProvider
                                                              .notifier)
                                                      .searchSales(
                                                          query: e,
                                                          searchFullText: true);
                                                  searchController.text = e;
                                                  'searching for $e'.log();
                                                  focusNode.unfocus();
                                                  ref
                                                      .read(
                                                          isSearchFieldActiveProvider
                                                              .notifier)
                                                      .state = focusNode.hasFocus;
                                                },
                                                title: Text(e),
                                                trailing: Icon(
                                                  Icons.arrow_outward_rounded,
                                                  color: context
                                                      .colorScheme.secondary,
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                    )
                                  : searchController.text.isNotEmpty
                                      ? searchedSales.when(
                                          error: (error, stackTrace) {
                                            return SalesErrorWidget(
                                              invalidateProvider:
                                                  salesNotifierProvider,
                                            );
                                          },
                                          loading: () {
                                            return const SalesLoadingWidget();
                                          },
                                          data: (sales) {
                                            return Column(
                                              children: [
                                                Expanded(
                                                  child: SalesDataWidget(
                                                    sales: sales,
                                                  ),
                                                ),
                                                PaginationWidget(size: size),
                                              ],
                                            );
                                          },
                                        )
                                      : ref.watch(salesNotifierProvider).when(
                                          error: (error, stackTrace) {
                                            return SalesErrorWidget(
                                              invalidateProvider:
                                                  salesNotifierProvider,
                                            );
                                          },
                                          loading: () {
                                            return const SalesLoadingWidget();
                                          },
                                          data: (sales) {
                                            return SalesDataWidget(
                                              sales: sales,
                                            );
                                          },
                                        ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SalesDataWidget extends StatelessWidget {
  const SalesDataWidget({
    super.key,
    required this.sales,
  });
  final List<SalesProductModel> sales;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 80,
      horizontalMargin: 12,
      minWidth: 1200,
      dataRowHeight: 60,
      dividerThickness: 0.25,
      fixedLeftColumns: 1,
      isHorizontalScrollBarVisible: true,
      isVerticalScrollBarVisible: true,
      columns: const [
        DataColumn2(
          label: Text('Product'),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Text('Sold'),
          // numeric: true,
          size: ColumnSize.S,
          fixedWidth: 140,
        ),
        DataColumn2(
          label: Text('Selling Price'),
        ),
        DataColumn2(
          label: Text('Sold On'),
        ),
      ],
      rows: [
        for (SalesProductModel sale in sales)
          DataRow(
            cells: [
              DataCell(
                Text(
                  sale.product.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              DataCell(
                Text(sale.salesModel.qtySold.toString()),
              ),
              DataCell(
                Text("XAF ${sale.salesModel.sellingPrice.toInt()}"),
              ),
              DataCell(
                Text(
                  sale.salesModel.dateAdded!.dateTimeToString,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
