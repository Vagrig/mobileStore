import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:way_to_success/common/app_icons.dart';
import 'package:way_to_success/features/detail/domain/entities/detail_entity.dart';

class HardwareWidget extends StatelessWidget {
  HardwareWidget({
    Key? key,
    required this.detailEntity,
  }) : super(key: key);
  DetailEntity detailEntity;
  @override
  Widget build(BuildContext context) {
    final cpu = detailEntity.cpu!;
    final camera = detailEntity.camera;
    final ssd = detailEntity.ssd!;
    final sd = detailEntity.sd!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _HardwareIcons(text: cpu, icon: AppIcons.cpu),
        _HardwareIcons(text: camera, icon: AppIcons.camera),
        _HardwareIcons(text: ssd, icon: AppIcons.ssd),
        _HardwareIcons(text: sd, icon: AppIcons.sd),
      ],
    );
  }
}

class _HardwareIcons extends StatelessWidget {
  _HardwareIcons({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final text;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: [
          SvgPicture.asset(icon),
          if (icon == AppIcons.cpu || icon == AppIcons.sd)
            const SizedBox(height: 6)
          else
            const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
