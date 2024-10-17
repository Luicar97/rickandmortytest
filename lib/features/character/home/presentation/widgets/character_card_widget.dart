import 'package:flutter/material.dart';

class CharacterCardWidget extends StatelessWidget {
  final String name;
  final String image;
  final String status;
  final String species;

  const CharacterCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.status,
    required this.species,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          child: Image.network(
            image,
            width: 170,
            height: 170,
          ),
        ),
        Container(
          width: 170,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(39, 43, 51, 1),
                  ),
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: Text(
                        '$status - $species',
                        style: const TextStyle(
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis,
                          color: Color.fromRGBO(39, 43, 51, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
