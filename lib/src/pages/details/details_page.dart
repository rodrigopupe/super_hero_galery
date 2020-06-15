import 'package:flutter/material.dart';
import 'package:superherogalery/src/pages/details/components/super_hero_header.dart';

import '../../../i18n/app_locale.dart';
import '../../../src/models/super_hero_model.dart';

class DetailsPage extends StatefulWidget {
  final SuperHeroModel superHero;

  const DetailsPage({Key key, @required this.superHero}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  AppLocale _locale;
  @override
  Widget build(BuildContext context) {
    _locale = AppLocale.of(context);
    final double heightSpace = 8.0;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SuperHeroHeader(
              superHeroId: widget.superHero.id,
              imageURL: widget.superHero.image.url,
              name: widget.superHero.name,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Text(_locale.getString('power_stats_label'), style: textTheme.headline4),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(_locale.getString('intelligence_label'),
                                  style: textTheme.caption.copyWith(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.powerstats.intelligence,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('strength_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.powerstats.strength,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('speed_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.powerstats.speed,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('durability_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.powerstats.durability,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('power_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.powerstats.power,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('combat_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.powerstats.combat,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(_locale.getString('biography_label'), style: textTheme.headline4),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('fullname_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.biography.fullName,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('alter_egos_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(child: Text(widget.superHero.biography.alterEgos)),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('aliases_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  widget.superHero.biography.aliases.length,
                                  (i) => Text(widget.superHero.biography.aliases[i]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('place_birth_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(child: Text(widget.superHero.biography.placeOfBirth)),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('first_appearance_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.biography.firstAppearance,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('publisher_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.biography.publisher,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('alignment_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(child: Text(widget.superHero.biography.alignment)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _locale.getString('appearance_label'),
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('gender_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.appearance.gender,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              _locale.getString('race_label'),
                              style: textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                            )),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.appearance.race,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('height_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(child: Text(widget.superHero.appearance.height.last)),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('weight_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(child: Text(widget.superHero.appearance.weight.last)),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('eye_color_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.appearance.eyeColor,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('hair_color_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.appearance.hairColor,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(_locale.getString('work_label'), style: textTheme.headline4),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('occupation_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.work.occupation,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('base_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.work.base,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(_locale.getString('connections_label'), style: textTheme.headline4),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('group_affiliation_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.connections.groupAffiliation,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('relatives_label'),
                                    style:
                                        textTheme.caption.copyWith(fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.superHero.getFieldOrDefaultValue(
                                  widget.superHero.connections.relatives,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
