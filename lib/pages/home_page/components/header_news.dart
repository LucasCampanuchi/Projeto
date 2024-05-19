import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_teste/pages/home_page/components/field_data.dart';
import 'package:projeto_teste/pages/home_page/store/home_page.store.dart';

class HeaderNews extends StatefulWidget {
  final HomePageStore store;
  const HeaderNews({
    super.key,
    required this.store,
  });

  @override
  State<HeaderNews> createState() => _HeaderNewsState();
}

class _HeaderNewsState extends State<HeaderNews> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Exibindo ${widget.store.newsList.isNotEmpty ? 1 : 0} de ${widget.store.newsList.length}',
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  '${widget.store.news?.count ?? 0} resultados',
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.store.searchController,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                      widget.store.init();
                    },
                    decoration: InputDecoration(
                      hintText: 'Pesquisar notícias',
                      suffixIcon: InkWell(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          widget.store.init();
                        },
                        child: const Icon(
                          Icons.search,
                          color: Color(0xFFD5D5D5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: expanded ? 40 : 0,
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    FieldDate(
                      label: 'De',
                      date: widget.store.fromDate ?? '-',
                      onChanged: (value) => widget.store.setFromDate(value),
                    ),
                    const SizedBox(width: 10),
                    FieldDate(
                      label: 'Até',
                      date: widget.store.toDate ?? '-',
                      onChanged: (value) => widget.store.setToDate(value),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
