import 'package:flutter/material.dart';

class CustomPaginationWidget extends StatelessWidget {
  final int? totalPages;
  final int? currentPage;
  final Function(int newPage)? changePage;
  final int? numberOfPages;
  final double marginVertical;

  const CustomPaginationWidget({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.changePage,
    this.marginVertical = 32.0,
    this.numberOfPages = 7,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages == null || totalPages == 1 || currentPage == null)
      return Container();
    List pages = [];
    final startPage = currentPage! < 4
        ? 0
        : totalPages! - currentPage! < 5
            ? totalPages! - numberOfPages!
            : currentPage! - 3;
    final pageButtonQuantity = startPage +
        ((totalPages! <= numberOfPages!) ? totalPages! : numberOfPages!);
    int c = 0;
    for (var i = startPage; i < pageButtonQuantity; i++) {
      pages.add(
        totalPages! <= i
            ? null
            : (currentPage! > 3 && c == 1) ||
                    (totalPages! > numberOfPages! &&
                        totalPages! - currentPage! > 4 &&
                        c == 5)
                ? '...'
                : c == 0
                    ? 0
                    : c == 6
                        ? totalPages! - 1
                        : i,
      );
      c += 1;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: marginVertical),
          child: Row(
            mainAxisAlignment: pageButtonQuantity < numberOfPages!
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                  ),
                  onPressed: currentPage == 0
                      ? null
                      : () {
                          changePage!(currentPage! - 1);
                        },
                ),
              ),
              for (var i = 0; i < pages.length; i++)
                Container(
                  alignment: const Alignment(0, 0),
                  height: 40.0,
                  width: constraints.maxWidth / 10,
                  child: pages[i] != null
                      ? AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Container(
                            child: InkWell(
                              onTap: pages[i] == null ||
                                      "${pages[i]}" == '...' ||
                                      currentPage == pages[i]
                                  ? null
                                  : () {
                                      changePage!(pages[i]);
                                    },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: pages[i] != '...' &&
                                          currentPage == pages[i]
                                      ? Colors.greenAccent.withOpacity(0.4)
                                      : Theme.of(context).cardTheme.color,
                                ),
                                child: Center(
                                  child: Text(
                                    pages[i] == '...'
                                        ? "${pages[i]}"
                                        : "${pages[i] + 1}",
                                    style: pages[i] != '...' &&
                                            currentPage == pages[i]
                                        ? const TextStyle(color: Colors.white)
                                        : const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
              Container(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                  onPressed: (totalPages! - currentPage!) < 2
                      ? null
                      : () {
                          changePage!(currentPage! + 1);
                        },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
