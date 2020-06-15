import 'package:flutter/material.dart';
import '../../../i18n/app_locale.dart';
import '../../../src/models/super_hero_model.dart';
import '../../../src/shared/custom_cached_network_image.dart';

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
    final size = MediaQuery.of(context).size;
    final double heightSpace = 8.0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).colorScheme.onBackground),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Text(
            widget.superHero.name,
            style: Theme.of(context).textTheme.headline1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Hero(
              tag: widget.superHero.id,
              child: Align(
                alignment: Alignment.center,
                child: CustomCachedNetworkImage(
                  width: size.height * 0.35,
                  height: size.height * 0.35,
                  imageUrl: widget.superHero.image.url,
                ),
              ),
            ),
          ),
          Text(
            _locale.getString('power_stats_label'),
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _locale.getString('intelligence_label'),
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: Text(widget.superHero.powerstats.intelligence)),
                  ],
                ),
                SizedBox(height: heightSpace),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('strength_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(widget.superHero.powerstats.strength)),
                  ],
                ),
                SizedBox(height: heightSpace),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('speed_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(widget.superHero.powerstats.speed)),
                  ],
                ),
                SizedBox(height: heightSpace),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('durability_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(widget.superHero.powerstats.durability)),
                  ],
                ),
                SizedBox(height: heightSpace),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('power_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(widget.superHero.powerstats.power)),
                  ],
                ),
                SizedBox(height: heightSpace),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('combat_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(widget.superHero.powerstats.combat)),
                  ],
                ),
              ],
            ),
          ),
          Text(
            _locale.getString('biography_label'),
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('fullname_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
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
                        child: Text(
                      _locale.getString('alter_egos_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(widget.superHero.biography.alterEgos)),
                  ],
                ),
                SizedBox(height: heightSpace),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('aliases_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
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
                        child: Text(
                      _locale.getString('place_birth_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(widget.superHero.biography.placeOfBirth)),
                  ],
                ),
                SizedBox(height: heightSpace),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('first_appearance_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
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
                        child: Text(
                      _locale.getString('publisher_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
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
                        child: Text(
                      _locale.getString('alignment_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(widget.superHero.biography.alignment)),
                  ],
                ),
              ],
            ),
          ),
          Text(
            _locale.getString('appearance_label'),
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('gender_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
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
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(widget.superHero.appearance.race)),
                  ],
                ),
                SizedBox(height: heightSpace),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('height_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(widget.superHero.appearance.height.last)),
                  ],
                ),
                SizedBox(height: heightSpace),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('weight_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(widget.superHero.appearance.weight.last)),
                  ],
                ),
                SizedBox(height: heightSpace),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('eye_color_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
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
                        child: Text(
                      _locale.getString('hair_color_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
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
          Text(
            _locale.getString('work_label'),
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('occupation_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
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
                        child: Text(
                      _locale.getString('base_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
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
          Text(
            _locale.getString('connections_label'),
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _locale.getString('group_affiliation_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
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
                        child: Text(
                      _locale.getString('relatives_label'),
                      style:
                          Theme.of(context).textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                    )),
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
    );
  }
}
