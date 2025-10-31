import 'package:flutter/material.dart';
import 'package:users_pagination_task/app/core/utils/utils_exporter.dart';

class SearchBoxWidget extends StatelessWidget {
  final TextEditingController searchBoxController;
  final Function(String)? onChanged;

  const SearchBoxWidget({
    super.key,
    required this.searchBoxController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      padding: const EdgeInsets.all(Dimensions.padding),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: searchBoxController,
        builder: (context, value, child) {
          final hasText = value.text.isNotEmpty;
          return TextField(
            controller: searchBoxController,
            decoration: InputDecoration(
              hintText: AppStrings.searchHint,
              prefixIcon: const Icon(
                Icons.search,
                size: Dimensions.iconMedium,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true,
              suffixIcon: hasText
                  ? IconButton(
                      onPressed: () {
                        searchBoxController.clear();
                        if (onChanged != null) onChanged!('');
                      },
                      icon: const Icon(
                        Icons.close,
                        size: Dimensions.iconMedium,
                      ),
                    )
                  : null,
            ),
            onChanged: onChanged,
          );
        },
      ),
    );
  }
}