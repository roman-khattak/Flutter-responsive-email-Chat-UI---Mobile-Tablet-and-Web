import 'package:flutter/material.dart';
import 'package:outlook/models/Email.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';
import '../../../extensions.dart';

class EmailCard extends StatelessWidget {

  final bool isActive;
  final Email? email;
  final VoidCallback? press;

   EmailCard({
    Key? key,
    this.isActive = true,
      this.email,
      this.press,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // here the shadow around the EmailCard is not showing properly
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding/2),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: isActive ? kPrimaryColor : kBgDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(email!.image),
                        ),
                      ),
                      SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "${email!.name} \n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isActive ? Colors.white : kTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: email!.subject,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color:
                                          isActive ? Colors.white : kTextColor,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            email!.time,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: isActive ? Colors.white70 : Colors.black54,
                                ),
                          ),
                          SizedBox(height: 5),

                          if (email!.isAttachmentAvailable)
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                isActive ? Colors.white70 : kGrayColor,
                                BlendMode.srcIn,
                              ),
                              child: WebsafeSvg.asset(
                                "assets/Icons/Paperclip.svg",
                                height: 24,
                                width: 24,
                              ),
                            ),

                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Text(
                    email!.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          height: 1.5,
                          color: isActive ? Colors.white70 : Colors.black54,
                        ),
                  )
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
            ),
            if (!email!.isChecked)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBadgeColor,
                  ),
                ).addNeumorphism(
                  blurRadius: 4,
                  borderRadius: 8,
                  offset: Offset(2, 2),
                ),
              ),

            if (email?.tagColor != null)
              Positioned(
                left: 8,
                top: 0,
                child: ColorFiltered(
                  // The ColorFilter.mode constructor is used to define the color filter, and the BlendMode.srcIn blend mode ensures that the color is applied to the asset.
                colorFilter: ColorFilter.mode(email!.tagColor, BlendMode.srcIn),
                  child: WebsafeSvg.asset(
                    "assets/Icons/Markup filled.svg",
                    height: 18,
                  ),
                ),
              )

          ],
        ),
      ),
    );
  }
}
