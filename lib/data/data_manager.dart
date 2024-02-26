import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import 'models/match_models/club_model.dart';
import 'models/match_models/league_model.dart';
import 'models/match_models/match_model.dart';
import 'models/news_model.dart';
import 'models/quiz_result_model.dart';

class DataManager {
  static DateTime getRandomDate() {
    final random = Random();
    final now = DateTime.now();
    final randomDays =
        random.nextInt(30); // Генерация случайного числа от 0 до 29 для дней
    return now.subtract(Duration(days: randomDays));
  }

  static Future<List<NewsModel>> getAllNews() async {
    List<NewsModel> news = [
      NewsModel(
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/169C5/production/_132731629_gettyimages-2028782291.jpg",
          title:
              "Bournemouth 0-1 Manchester City: Pep Guardiola praises players as win closes gap at top",
          body:
              "Pep Guardiola praised his Manchester City players as \"supermen\" as they kept up their chase for a fourth straight league title by beating Bournemouth.Phil Foden's goal was enough for a narrow and nervy 1-0 Premier League win at Vitality Stadium, which moves City one point behind leaders Liverpool.City manager Guardiola praised his team for finding a way to win having played in midweek against Brentford.\"I adore my players - they are supermen,\" Guardiola told Sky Sports.Dominic Solanke and John StonesManchester City beat Bournemouth on Saturday evening, having defeated Brentford at home on Tuesday\"They are so good. Where we come from, for many years, playing every three days - they [Bournemouth] had seven days to prepare for the game and we always have less.\"We demand too much of our players but they respond. I know people say \'they earn a lot of money\' but it [the schedule] is too much. Honestly.\"But business must go on and it surprises me every time how we are still there. They have an incredible character and are so competitive - even when they are tired, they give extra.\"Our fans have to be so proud of these guys.\"Latest Manchester City news, analysis and fan view Get Man City news notificationsCity toiled at times at Bournemouth on their way to a second successive 1-0 victory, after beating Brentford by the same score on Tuesday as they continue their attempt to be the first side to win four successive top-flight English titles.Guardiola defended his team, who are also in contention for back-to back-trebles as they compete in the FA Cup and Champions League.\"The last 10-15 minutes were tough,\" he said. \"We won the Treble and people think we have to win every game 4-0, 5-0 but that is not the reality and hopefully soon we can have a week off and refresh our minds and legs.\"City next travel to Luton in the FA Cup fifth round on Tuesday (20:00 GMT), before a local derby against Manchester United next weekend followed by the second leg of their Champions League last-16 tie with Copenhagen on 6 March.It is a hectic schedule, but defender John Stones says City can deal with it.\"We thrive off the pressure,\" Stones told Sky Sports.\"It's just focusing on ourselves - every game is a final for us. They come thick and fast now and we know we have to perform well.\""),
      NewsModel(
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/0139/production/_132731300_gettyimages-2035634129.jpg",
          title:
              "Manchester United 1-2 Fulham: Erik ten Hag looks to 'bigger picture' despite defeat",
          body:
              'Manchester United manager Erik ten Hag insists the future is positive despite losing at home to Fulham for only the second time in 61 years.The 2-1 defeat was United’s 10th loss in the Premier League this season To put that into context, Sir Alex Ferguson never experienced the ignominy of 10 league losses in 21 Premier League campaigns. It has now happened to United five times in the past 11 seasons.\nThey are now eight points adrift of fourth-placed Aston Villa, even though they have done the double over Unai Emery\’s men.\nAlthough the home side had more possession, corners, shots and shots on target at Old Trafford on Saturday, most observers would have agreed with Fulham boss Marco Silva\’s concise summary: \“It is clear in my opinion, the better team won the game. \”\nBut, in the week when Sir Jim Ratcliffe had his co-ownership of United confirmed, talked of knocking Manchester City and Liverpool off their perch and the importance of Champions League qualification, Ten Hag came up with an alternative narrative.\n“After one defeat you have to see the bigger picture - and the bigger picture looks very good, \” said the Dutchman.\nTen Hag’s reasoning is threefold.\nFirstly, he needs his injured players back. The United boss bemoaned the loss of influential midfielder Casemiro, who suffered a hefty bang on the head when the game was still goalless. With Rasmus Hojlund, Luke Shaw and Lisandro Martinez already out, it was a blow United could ill-afford.\nTen Hag can also see the promise of Alejandro Garnacho, Kobbie Mainoo and Omari Forson, who was defended by his manager after failing to spark on his full debut: \“I thought it was a reasonable performance. \”\nAnd then there is the transfer window, even though Ratcliffe mentioned earlier in the week that without Champions League qualification, finances in the summer will be tight.\n\“When we get the injuries back we will be more in balance in the team, \” said Ten Hag. \“We also need to strengthen the squad in the transfer windows and then there are many good players, with high potential coming up.\n\“Definitely we are going in the right direction. So when everyone is available we have a very good team. \”\nLatest Manchester United news, analysis and fan views\nGet Man Utd news notifications\nPressure on FA Cup tie before City meeting\nAnalysis - Simon Stone, BBC Sport\nUnited can now add Fulham to Crystal Palace, Bournemouth and Nottingham Forest as unheralded clubs on a fraction of their budget whom they have been beaten by this season.\nNext weekend they go to Manchester City. Few would be confident of United avoiding an 11th defeat of the league season at the Etihad Stadium.\nThey also still have to face Liverpool and Arsenal at Old Trafford later in the campaign, which evidently makes Champions League qualification significantly harder, even if five places end up being on offer.\nThat puts even more focus on the midweek FA Cup fifth-round trip to Forest.\nFamously, it was a win at the City Ground in 1990 that sparked the run to Wembley which kept an under-pressure Ferguson in a job and paved the way to more than two decades of sustained success.\nFor all Ratcliffe\’s bold words, United\’s ambitions at present are significantly more modest. For Ten Hag, the \“bigger picture\” is uncertain.\nIt cannot be known at this point whether victory or defeat by the Trent will make or break Ten Hag\’s reign. But at the very least, the looming encounter with Pep Guardiola could be approached from a far more solid base if United still had a chance of winning something.'),
      NewsModel(
          // Выбери соответствующую категорию
          date: getRandomDate(),
          imgUrl:
              "https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/B827/production/_132734174_nicholl.jpg",
          title:
              "Chris Nicholl: Former Northern Ireland, Southampton and Aston Villa defender dies at 77",
          body:
              'Former Northern Ireland, Southampton and Aston Villa defender Chris Nicholl has died. \nThe English-born 77-year-old started his career at Burnley but is best remembered for spells at Aston Villa and Southampton. \nHe was Saints manager for six years and Walsall boss from 1994 to 1997. \nNicholl made his international debut in 1974 and won 51 caps for Northern Ireland. \nHe was part of the Northern Ireland team which reached the World Cup finals in 1982. \n“We are saddened to learn of the passing of Chris Nicholl. He played 51 times for us, including the 1982 World Cup in Spain. Our thoughts are with his family and friends at this time, ” the Irish Football Association wrote on X (formerly Twitter). \nNicholl also played for Halifax Town, Luton Town and Grimsby Town in a professional career spanning 19 years. \nChris Nicholl challenges West Brom’s John Wile while playing for Southampton in 1979 \nChris Nicholl challenges West Brom’s John Wile while playing for Southampton in 1979 \nHe managed Southampton between 1985 and 1991 before his three years in charge of Walsall and he was assistant manager to the Northern Ireland team from 1998 to 2000. \nNicholl made 210 appearances for Villa, winning two League Cups and famously scoring all four goals in a 2-2 draw with Leicester - including two at the wrong end - before playing 228 times for Southampton. \n“Aston Villa is deeply saddened to learn of the passing of former player Chris Nicholl, who has died at the age of 77, ” a statement read on the club’s X account. \n“The thoughts of everyone at the club are with Chris’ family and friends at this difficult time. ” \nIn the 2017 BBC documentary Dementia, Football and Me, Nicholl told Alan Shearer, who played under him at Southampton, he was “brain-damaged from heading balls”. \nNicholl said: “My memory is in trouble. Everyone forgets regular things, where your keys are. But when you forget where you live, that’s different. \n“I’ve had that for the last four or five years, it is definitely getting worse. It bothers me. ” \nNicholl’s former Northern Ireland team-mate John O’Neill said he was “very saddened to hear the news about my good friend Chris”. \n“When I first got into the Northern Ireland squad Danny Blanchflower the manager put me into room with him. Then I only knew him as a wonderful player not as a person, ” said former Leicester City defender O’Neill. \n“Danny said he will teach you everything you need to know about playing centre half and he most certainly did. \n“He was a hell of a player, a really tough, old school competitor. But most of all he was one of the good guys and will be sorely missed. ”'),
      NewsModel(
        // Выбери соответствующую категорию
        date: getRandomDate(),
        imgUrl:
            'https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/13009/production/_132733877_20998236.jpg',
        title:
            'Celtic scored twice in stoppage time as a comeback victory at Motherwell moved them back to two points behind Rangers in the Premiership title race.',
        body:
            'Adam Idah completed a double on 94 minutes, adding to his smart header at the start of the second half. \nFellow substitute Luis Palma added a tap-in while the visiting fans were still celebrating that late reprieve. \nBlair Spittal had curled in a fantastic shot at the end of a first half the hosts had much the better of. \nThe champions, who had drawn two of their three previous league outings, looked spooked during that period but found some much-needed urgency to dominate the second half. \nAnd Idah was the hero, replacing Kyogo Furuhashi at the interval and giving Celtic a real presence up front. \nThe on-loan Norwich striker levelled the game when rising well to steer in a Greg Taylor cross. \nBoth he and Daizen Maeda went close with further headers as the champions laid siege to the home penalty area and that pressure finally paid when the 23-year-old met an Alistair Johnston pass to slot low into the corner. \nYang Hyun-Jun, who also helped liven up Celtic from the bench, then teed up Palma for the simplest of finishes. \nMotherwell who remain ninth, four points ahead of Ross County in the play-off place, were running on fumes in the closing stages, dealing with an onslaught. \nThe home side played with confidence in the first half, epitomised by the lovely footwork from teenager Lennon Miller to set up Spittal’s cracking finish from the edge of the penalty area. \nTheo Bair had an early effort ruled out for offside and Miller was denied by a good Joe Hart save at 1-1 as they found gaps in a Celtic backline that has gone four matches without a clean sheet. \nKeep up to date with Motherwell \nThe latest Celtic news \nCeltic use wings more wisely to gain upper hand - analysis \nOn their previous visit to Fir Park, Celtic found a 97th-minute winner. That goal from Matt O’Riley moved them seven points clear of Rangers after seven games. \nNow the champions are playing catch up, having lost just twice all season. Draws have been costly as the Ibrox team have rattled off eight league wins in a row. \nMidway through the six minutes added on it appeared another share of the points was on the cards for Brendan Rodgers’ side but a change of attitude and approach eventually swung the match in their favour. \nWhile they were sluggish in the first half, the tempo increased markedly and the Idah change was not the only telling substitution. \nYang was much livelier than Nicolas Kuhn, while Maeda upped his level as Celtic worked the wings much more effectively in the second half. \nMotherwell competed commendably but were overwhelmed by the sheer volume of crosses coming in.',
      ),
      NewsModel(
        // Выбери соответствующую категорию
        date: getRandomDate(),
        imgUrl: 'https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/8D6B/production/_132730263_gettyimages-2035431681.jpg',
        title: 'Aston Villa proved their hunger to qualify for the Champions League as a scintillating attacking display earned all three points against Nottingham Forest, says winger Leon Bailey.',
        body: '\nA breathtaking first-half saw Villa race into a 3-0 lead at Villa Park and ultimately saw them bounce back from successive home defeats. \nThey took the lead in the fourth minute with Ollie Watkins tapping in his 14th Premier League goal of the season after brilliant work down the right by Bailey. \nDouglas Luiz then scored twice in 10 minutes, first slotting home a Jacob Ramsey cut-back in the 29th minute, before heading in John McGinn’s right-wing cross. \nMoussa Niakhate chested home his first Forest goal in first-half stoppage-time, before Morgan Gibbs-White dinked over the advancing Emi Martinez three minutes after the break. \nBailey secured the three points for the hosts, tapping into a vacant net after Watkins’ effort was saved following Forest losing the ball high up in their own half. \nThe result sees fourth-placed Villa open a five-point lead on Tottenham, who are not in action this weekend, and a eight-point gap to sixth-placed Manchester United, who lost 2-1 against Fulham at Old Trafford. \n“That [the top four] is the goal for us, ” Bailey told BBC Match of the Day. “We want to be in the Champions League next season. \n“The key is to be consistent and take it step by step. ” \nVilla boss Unai Emery was more cautious though, telling Sky Sports: “It is still the same, if we arrive to game 33 in the same position we maybe look to Champions League; for now it is about being in the top seven positions. We have to always be positive, and focus on each match. ” \nEmery’s side moved 15 points clear of eighth-placed Newcastle, who can close the gap when they visit Arsenal at 20:00 GMT on Saturday. \nForest remain 16th, four points clear of the relegation zone. \nFollow Saturday’s Premier League action and reaction to Aston Villa v Nottingham Forest \nHow did you rate Aston Villa’s performance? Have your say here \nWhat did you make of Forest’s display? Send us your views here \nVilla get home form back on track \nVilla’s charge into the Champions League places - and as possible title contenders a few weeks ago - has been based around an exemplary home record that saw them go 17 games unbeaten, winning 16. \nTheir slight drop-off in recent weeks has coincided with that run ending with successive defeats by Newcastle and Manchester United. \nThis win was earned in a rip-roaring opening half an hour where they consistently caused issues down their right wing. \nThe opener saw Bailey nip past Murillo, with his cross nutmegging Felipe and put on a plate for Watkins to tap home. \nBoth of Luiz’s goals came down the same side, with Ramsey showing brilliant composure to pick out the Brazil midfielder and McGinn’s cross pinpoint. \nThe three first-half goals mean Villa have now scored a league-high 27 in the opening period this season. \nEmery will be disappointed by both of the goals they conceded, with Niakhete and Gibbs-White allowed unchallenged efforts on their goal. \nHowever, with Europa Conference League football on the horizon again in a fortnight, he will be grateful for the gap his side are opening on their challengers. \n“It was very important, ” Emery told Match of the Day. \n“We adapted well at Sheffield United and Fulham after defeats at home, but we needed confidence here and a reaction. We are feeling very comfortable and confident at Villa Park. \n“We played a really fantastic match in the first half and only the first 15 minutes of the second half we had some doubts, but we stayed calm and reacted well. ” \nEnforced change sees Forest exploited \nForest had picked up 10 points from the first eight games of Nuno Espirito Santo’s tenure but they were blown away by Villa here. \nThey were forced into one change from their win over West Ham last weekend with Nuno Tavares missing out through injury, and Villa duly exploited centre-back Niakhete playing at left-back. \nHe was often out of position, dragging centre-backs Murillo and Felipe, who were both booked in the first half, wider. \nNuno was clearly furious with his side’s first-half display, opting to make a triple switch at the break, and his team were better in the second period. \nAt 3-2 Forest had a big chance to equalise when Anthony Elanga went through on goal but dragged his effort wide of the target. \nBailey’s goal came from efficient Villa pressing. \nForest have now scored 17 Premier League goals in Nuno’s time in charge - the same as in the first 17 games of the season under Steve Cooper - and that is a positive heading into the final stretch of the season. \nHowever, their Premier League status may well depend on the outcome of the charge against the club for alleged breaches of profit and sustainability rules in their accounts for 2022-23. \n“We started very bad, we conceded too easily. This is something we have to improve, ” Nuno told Match of the Day. \n“It is too easy for the opponent to score. We are always able to score, so we need to balance these two parts of the game. ”',
      ),
      NewsModel(
        // Выбери соответствующую категорию
        date: getRandomDate(),
        imgUrl: 'https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/00AA/production/_132707100_736cf2672b0993e9bb36aee060500b5322732b50.jpg',
        title: 'Chelsea: What would silverware mean for Mauricio Pochettino?',
        body: 'A breathtaking first-half saw Villa race into a 3-0 lead at Villa Park and ultimately saw them bounce back from successive home defeats. They took the lead in the fourth minute with Ollie Watkins tapping in his 14th Premier League goal of the season after brilliant work down the right by Bailey. Douglas Luiz then scored twice in 10 minutes, first slotting home a Jacob Ramsey cut-back in the 29th minute, before heading in John McGinn’s right-wing cross. Moussa Niakhate chested home his first Forest goal in first-half stoppage-time, before Morgan Gibbs-White dinked over the advancing Emi Martinez three minutes after the break. Bailey secured the three points for the hosts, tapping into a vacant net after Watkins’ effort was saved following Forest losing the ball high up in their own half. The result sees fourth-placed Villa open a five-point lead on Tottenham, who are not in action this weekend, and a eight-point gap to sixth-placed Manchester United, who lost 2-1 against Fulham at Old Trafford. “That [the top four] is the goal for us, ” Bailey told BBC Match of the Day. “We want to be in the Champions League next season. “The key is to be consistent and take it step by step. ” Villa boss Unai Emery was more cautious though, telling Sky Sports: “It is still the same, if we arrive to game 33 in the same position we maybe look to Champions League; for now it is about being in the top seven positions. We have to always be positive, and focus on each match. ” Emery’s side moved 15 points clear of eighth-placed Newcastle, who can close the gap when they visit Arsenal at 20:00 GMT on Saturday. Forest remain 16th, four points clear of the relegation zone. Follow Saturday’s Premier League action and reaction to Aston Villa v Nottingham Forest How did you rate Aston Villa’s performance? Have your say here What did you make of Forest’s display? Send us your views here Villa get home form back on track Villa’s charge into the Champions League places - and as possible title contenders a few weeks ago - has been based around an exemplary home record that saw them go 17 games unbeaten, winning 16. Their slight drop-off in recent weeks has coincided with that run ending with successive defeats by Newcastle and Manchester United. This win was earned in a rip-roaring opening half an hour where they consistently caused issues down their right wing. The opener saw Bailey nip past Murillo, with his cross nutmegging Felipe and put on a plate for Watkins to tap home. Both of Luiz’s goals came down the same side, with Ramsey showing brilliant composure to pick out the Brazil midfielder and McGinn’s cross pinpoint. The three first-half goals mean Villa have now scored a league-high 27 in the opening period this season. Emery will be disappointed by both of the goals they conceded, with Niakhete and Gibbs-White allowed unchallenged efforts on their goal. However, with Europa Conference League football on the horizon again in a fortnight, he will be grateful for the gap his side are opening on their challengers. “It was very important, ” Emery told Match of the Day. “We adapted well at Sheffield United and Fulham after defeats at home, but we needed confidence here and a reaction. We are feeling very comfortable and confident at Villa Park. “We played a really fantastic match in the first half and only the first 15 minutes of the second half we had some doubts, but we stayed calm and reacted well. ” Enforced change sees Forest exploited Forest had picked up 10 points from the first eight games of Nuno Espirito Santo’s tenure but they were blown away by Villa here. They were forced into one change from their win over West Ham last weekend with Nuno Tavares missing out through injury, and Villa duly exploited centre-back Niakhete playing at left-back. He was often out of position, dragging centre-backs Murillo and Felipe, who were both booked in the first half, wider. Nuno was clearly furious with his side’s first-half display, opting to make a triple switch at the break, and his team were better in the second period. At 3-2 Forest had a big chance to equalise when Anthony Elanga went through on goal but dragged his effort wide of the target. Bailey’s goal came from efficient Villa pressing. Forest have now scored 17 Premier League goals in Nuno’s time \nSigns of progress? \nWhen Pochettino arrived in the summer, there was lots of optimism. There was an understanding that he had a lot of new players to integrate in the squad but the hierarchy at the club had planned for European football to be returning to Stamford Bridge. \n \nHowever, the obstacles started in pre-season. \n \nHe lost £52m summer signing Christopher Nkunku to a knee injury, with the striker making just nine appearances since returning in December. \n \nChelsea’s ruthlessness in front of goal has been criticised this season but it is hard not to be sympathetic when Pochettino has been without one of the key cogs of his attack. \n \nThe injury issues have not stopped there. Captain Reece James has again been troubled by hamstring problems and has had to have surgery, and has also been limited to nine appearances this season. \n \nAlongside injuries to Ben Chilwell, Benoit Badiashile and £58m signing Romeo Lavia, it’s been hard for Pochettino to build a settled line-up. \n \nWould silverware mark first season as success? \nPochettino holds his hand to his head on the touchline \nChelsea currently sit in 10th place in the Premier League, 14 points adrift of the top four \nWhen Chelsea lost against Liverpool on 31 January and Wolves four days later, there were some supporters who were calling for Pochettino to be sacked. \n \nThose at the club said the manager was never in danger and pointed to the month of progress before that poor run of results, which had seen them secure their place in Sunday’s final. \n \nSince losing at home to Wolves, Chelsea are unbeaten in three away games - beating Aston Villa 3-1 in an FA Cup fourth-round replay, defeating Crystal Palace by the same score in the Premier League and then drawing 1-1 at champions Manchester City. \n \nFormer Chelsea midfielder Pat Nevin said: “Chelsea have suddenly begun to resemble a grown-up football team. \n \n”The maturing process was always going to take a while, but the performances against Aston Villa, Crystal Palace and now Man City have underlined that Mauricio Pochettino should lead them to much more than mid-table mediocrity next season. ” \n \nCompeting at the top of the league and being back in the Champions League is the long-term ambition but a piece of silverware could be the start of a new era at the club. \n \nWhen Jose Mourinho was in charge at Chelsea, the League Cup in 2005 was the first trophy he won and started a period of dominance, which saw him and the club win the Premier League twice, the FA Cup and the League Cup again. \n \nFor Pochettino, being able to say he has won silverware in his first season as Chelsea boss, while delivering European football, would be a huge milestone and the manager believes it could just be the start. \n \n”The job is done but now it is about winning the final. From another side it is like it is not important as Chelsea is about winning the Champions League and Premier League, ” Pochettino said. \n \n”We need to start to realise and give credit to the team - as this is a team where a massive percentage didn’t maybe play at Wembley [before]. It’s important for the club, important for us and in this process to build a new team. “in charge - the same as in the first 17 games of the season under Steve Cooper - and that is a positive heading into the final stretch of the season. However, their Premier League status may well depend on the outcome of the charge against the club for alleged breaches of profit and sustainability rules in their accounts for 2022-23. “We started very bad, we conceded too easily. This is something we have to improve, ” Nuno told Match of the Day. “It is too easy for the opponent to score. We are always able to score, so we need to balance these two parts of the game. ”',
      ),
      NewsModel(
        // Выбери соответствующую категорию
        date: getRandomDate(),
        imgUrl: 'https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/12A67/production/_132419367_guardiola_getty.jpg',
        title: 'Pep Guardiola, Jose Mourinho and the game that changed everything',
        body: 'A decision in time sends history down two very different tracks. \nIn 1998, a Hollywood film starring Gwyneth Paltrow catapulted the term ‘Sliding Doors’ into popular lexicon. \nTen years later, football had its own Sliding Doors moment. \nIn the summer of 2008, Barcelona - managed by Frank Rijkaard - were a club stalled and set to fall. \nA second trophyless season in succession had ended with Barca third in La Liga and suffering ignominy at the Bernabeu. \nWith Real Madrid confirmed as champions in the days before, Barcelona had to give their arch-rivals a guard of honour on to the pitch before their league meeting. \nBarcelona give Real Madrid a guard of honour on to the pitch before the teams’ league meeting at the Bernabeu in May 2008 \nBarcelona’s 4-1 humiliation at the Bernabeu in May 2008 was followed by manager Frank Rijkaard leaving the club less than 24 hours later \nThe embarrassment didn’t stop there. A 4-1 thrashing followed, with the Madrid fans chanting “Laporta please stay! ” to Barca’s under-pressure president Joan Laporta. \nOff the pitch, dressing-room ringleader Ronaldinho was spending more time in the city’s nightclubs than banging in goals. \nTeam discipline seemed to have drained away, with stories of the Brazilian being left to get his head down and sleep off the night’s excesses rather than knuckle down in training. \nWATCH: Pep Guardiola: Chasing Perfection \nQuestions over Ronaldinho’s weight gain, and penchant for a night out, peppered the front and back pages of Barcelona’s newspapers while in press conferences, every question directed at Rijkaard included the word “resign”. \nWith the Madrid fans’ catcalls still ringing in his ears, Laporta provided his own answer. \nLess than 24 hours after the embarrassment in Madrid, Rijkaard was sacked. \nWho would replace him? \nTop of the billing, and top of the list for any football pragmatist, was Jose Mourinho. \nMourinho had a positive historical relationship with the club as assistant to previous managers Bobby Robson and Louis van Gaal. \nHe also had a CV surpassing anyone else in Europe at the time, following Uefa Cup and Champions League triumphs with Porto, and successive and unprecedented Premier League titles with Chelsea. \nBut, rather than opt for the A-list football celebrity, Barcelona opted for someone from the B-list. Literally. \nThey chose their own B team manager, who was entirely unproven at the top level, and had spent the previous campaign - his first as a boss - in Spain’s fourth tier and a Catalan regional division. \nThe decision? \nGuardiola over Mourinho. \nTo understand why, and to get to the bottom of that decision that changed football, you have to dig deep into Barcelona DNA’s where poetry, not pragmatism, is the primary motivator and one man’s methods, opinions and gut instinct trump everything. \nJohan Cruyff and Pep Guardiola during a Barcelona training session in Guardiola’s playing career \nCruyff shared a close relationship with Guardiola, who made his Barcelona first-team breakthrough under the Dutchman \nAs the new BBC Sport documentary Pep Guardiola: Chasing Perfection explores, to understand Pep, you have to understand Johan Cruyff. \nCruyff is synonymous with Barcelona, winning La Liga in 1974 and the Copa del Rey in 1978 as a player, before lifting four consecutive Spanish top-flight titles, and the European Cup, as the club’s manager between 1988 and 1996. \nAnd Cruyff wielded an incredible influence over Guardiola’s career. \nIt was Cruyff who plucked a 19-year-old Guardiola from the Barcelona reserves in 1990 and catapulted him into an all-conquering first team full of global stars such as Michael Laudrup to Ronald Koeman. Cruyff saw in the teenage Guardiola a quality that endures. \nSpanish journalist Lu Martin knows Guardiola better than most, having ghost-written his little-known 2001 book La Meva Gent, El Meu Futbol (My People, My Football in Catalan). \n“In Catalonia, we say ‘seny’ and ‘rauxa’. [Legendary Barcelona captain Carles] Puyol has ‘rauxa’ - impulse, drive, ” Martin says. \n“The ‘seny’ - the brains - at FC Barcelona was Pep. \n“Pep brought sense to the team - because Pep could understand everything Johan wanted from him. \n“Johan had two sons. Jordi, his son by blood, and his sports son... Pep. ” \nLISTEN: Sporting Giants: Pep Guardiola - a four-part podcast series on a footballing great \nJordi Cruyff echoes Martin’s assessment of his father and Guardiola’s close relationship. \nJordi remembers his father having supreme confidence in Guardiola as a budding manager after his protege wound down his playing career with underwhelming spells at Brescia, Roma, Al-Ahli and Mexican club Dorados. \n“I know in that time Pep and my father had a lot of contact, ” Jordi Cruyff says of the months after Guardiola’s retirement in 2006. \n“I think my father had this kind of intuition that he could feel when somebody is going to be a good coach. ” \nA frequent criticism of Guardiola is that all three of his top-level managerial jobs - Barcelona, Bayern Munich and Manchester City - have been clubs with big-name players and big pockets. \nThe inference is that the Spaniard couldn’t work his magic in a smaller, more humble, setting. \nIt didn’t get much smaller than Barcelona B. \nPep Guardiola \nGuardiola opted to take on Barcelona’s B team rather than the more prestigious role as head of the club’s academy after his playing days came to an end \n“Yes, I was a player, but I’ll start from zero as a coach, ” said Guardiola, then 37, in his first press conference in charge of Barcelona B. \nIt was a surprise he had taken the job, given a role as head of the academy - seen as more prestigious - was also on the table. \nHowever, Barcelona B, like Guardiola, were starting from scratch. In the previous season, they had been relegated after failing to win their final 10 matches. \nGuardiola’s first match in charge was a pre-season friendly played on a tiny, artificial pitch against Banyoles. Small pitches and, when matches were played on grass, bobbly surfaces were a theme in a tricky start to managerial life. \nBarcelona B won one of their first three matches. \nAfter a 2-0 defeat by lowly Manresa, who were eventually relegated, Guardiola endured his first test of faith. Could his playing style - prioritising possession over position on the pitch - thrive in the testing conditions of the fourth tier? \nBy the time he arrived at training on the Wednesday after that defeat, he had made his mind up. \n“I had thought we have to change because the pitches are so small, ” he says. \n“I doubted for two days. But, in that moment, I decided - if we could win and play quite good football on a small pitch, I could do it at a higher level with better players and better pitches. \n“I arrived at training and said: ‘This is what I believe. ’ The alternatives, the ways we looked at changing, they did not convince me. That is why I could not change. \n“It was an important moment because I was new, I was not experienced. Aged 37, never trained big players. I had to prove myself. ” \nOne man he didn’t need to prove himself to was Domenec Torrent. \nTorrent had been managing fellow fourth-tier outfit Girona. When Guardiola, a man he had revered as a player came knocking, Torrent jumped at the chance to join him. \nTorrent spent 11 years at Guardiola’s side as his assistant before leaving Manchester City for a head coach role with New York City FC in 2018. \n“I always say Pep has great powers of seduction, ” he says. \n“He’s someone who can convince players with his everyday work with them. He’s a sponge. \n“He learns very quickly about everything and everyone. \n“He turned Barcelona B into a very compact side who played very good football. And he put across to the players his ideas, which were totally different from anything they’d heard up until then. \n“It’s true that we built a very good squad. ” \nSergio Busquets, Pedro and Thiago Alcantara were rookie faces in that squad and Guardiola was the uncompromising, relentless, ruthless driving force at the centre of it. \nProfessionalism was to the fore. Opposition sides were scouted and video-analysed, a level of detail unheard of in that division at the time. \nAn 11pm curfew was introduced - as were fines. \n“Pep had very clear boundaries, he did not let anybody do anything that he thought was out of place, ” Pep’s then-captain Marc Valiente has said. “He had a very clear code. You had to adhere to that in terms of the rules, in terms of fines, and I think that was fair. ” \nBarcelona’s then-sporting director Txiki Begiristain - now in the same job at Manchester City - also remembers Guardiola’s pursuit of perfection. \n“It was unbelievable, ” Begiristain says. “In England, the level would be like League Two. \n“Pep was working in League Two like he was in [charge of] the [Barcelona] first team: Looking after the players, food, chefs, travelling, recording the games. \n“He was really amazing. He was thinking ‘one day I’m gonna be a first-team coach, I wanna work like this’. \n“And so, he was already doing it in the fourth tier. It was crazy. ” \nAfter their inauspicious start, Guardiola’s Barcelona B’s form dramatically improved en route to winning promotion. \nGuardiola’s work-rate won hearts in the boardroom, most notably with the most influential Barcelona face of all. \n“I remember that Johan Cruyff visited a lot with his wife to see the Barca B games, ” Torrent says. \n“And, strangely, I saw that instead of watching the game, he was watching Pep, how he managed, how he behaved, how he moved: his body language. \n“And I remember mentioning to Pep: ‘That’s the second time Johan’s been to see you and he was just watching you. ’ All that made sense when Pep took over the first team. \n“I remembered those afternoons when Johan came to see him, not the football. ” \nPromotion cost Guardiola a fair bit of money. \nAt the beginning of the campaign, he had promised to buy the team lunch if they won three games in a row. It happened on five occasions. \nThe team’s most important performance, though, was to come in a friendly against Rijkaard’s increasingly disjointed and disengaged first team, watched by a handful of spectators.',
      ),

    ];

    return news;
  }

  static Future<List<QuizResultModel>> readResults() async {
    String _key = 'quiz_results';
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? jsonStringList = prefs.getStringList(_key);
    if (jsonStringList != null) {
      final List<QuizResultModel> results = jsonStringList
          .map(
              (jsonString) => QuizResultModel.fromJson(json.decode(jsonString)))
          .toList();
      return results;
    } else {
      return [];
    }
  }

  static Future<void> writeResult(QuizResultModel result) async {
    String _key = 'quiz_results';
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<QuizResultModel> results = await readResults();
    results.add(result);
    final List<String> jsonStringList =
        results.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(_key, jsonStringList);
  }

  static Future<List<MatchModel>> fillMatchesData() async {
    // Создаем клубы
    final ClubModel barcelona =
        ClubModel(icon: 'barcelona_icon', name: 'Barcelona');
    final ClubModel realMadrid =
        ClubModel(icon: 'real_madrid_icon', name: 'Real Madrid');
    final ClubModel liverpool =
        ClubModel(icon: 'liverpool_icon', name: 'Liverpool');
    final ClubModel manchesterCity =
        ClubModel(icon: 'manchester_city_icon', name: 'Manchester City');
    final ClubModel bayernMunich =
        ClubModel(icon: 'bayern_munich_icon', name: 'Bayern Munich');
    final ClubModel juventus =
        ClubModel(icon: 'juventus_icon', name: 'Juventus');
    final ClubModel dortmund =
        ClubModel(icon: 'dortmund_icon', name: 'Borussia Dortmund');
    final ClubModel milan = ClubModel(icon: 'milan_icon', name: 'AC Milan');
    final ClubModel inter = ClubModel(icon: 'inter_icon', name: 'Inter Milan');
    final ClubModel leverkusen =
        ClubModel(icon: 'leverkusen_icon', name: 'Bayer Leverkusen');

    // Создаем команды для разных лиг
    final LeagueTeam barcelonaTeam = LeagueTeam(
        team: barcelona, gamesCount: 20, totalPoints: '50', overall: 1);
    final LeagueTeam realMadridTeam = LeagueTeam(
        team: realMadrid, gamesCount: 20, totalPoints: '45', overall: 2);
    final LeagueTeam liverpoolTeam = LeagueTeam(
        team: liverpool, gamesCount: 20, totalPoints: '40', overall: 3);
    final LeagueTeam manCityTeam = LeagueTeam(
        team: manchesterCity, gamesCount: 20, totalPoints: '55', overall: 1);
    final LeagueTeam bayernMunichTeam = LeagueTeam(
        team: bayernMunich, gamesCount: 20, totalPoints: '60', overall: 1);
    final LeagueTeam juventusTeam = LeagueTeam(
        team: juventus, gamesCount: 20, totalPoints: '48', overall: 2);
    final LeagueTeam dortmundTeam = LeagueTeam(
        team: dortmund, gamesCount: 20, totalPoints: '42', overall: 4);
    final LeagueTeam milanTeam =
        LeagueTeam(team: milan, gamesCount: 20, totalPoints: '38', overall: 5);
    final LeagueTeam interTeam =
        LeagueTeam(team: inter, gamesCount: 20, totalPoints: '41', overall: 3);
    final LeagueTeam leverkusenTeam = LeagueTeam(
        team: leverkusen, gamesCount: 20, totalPoints: '36', overall: 6);

    // Создаем списки команд для разных лиг
    final List<LeagueTeam> laLigaTeams = [
      barcelonaTeam,
      realMadridTeam,
      liverpoolTeam
    ];
    final List<LeagueTeam> premierLeagueTeams = [
      manCityTeam,
      liverpoolTeam,
      barcelonaTeam
    ];
    final List<LeagueTeam> bundesligaTeams = [
      bayernMunichTeam,
      dortmundTeam,
      leverkusenTeam
    ];
    final List<LeagueTeam> serieATeams = [juventusTeam, milanTeam, interTeam];

    // Создаем лиги
    final LeagueModel laLiga =
        LeagueModel(name: 'La Liga', leagueTeamsList: laLigaTeams);
    final LeagueModel premierLeague = LeagueModel(
        name: 'Premier League', leagueTeamsList: premierLeagueTeams);
    final LeagueModel bundesliga =
        LeagueModel(name: 'Bundesliga', leagueTeamsList: bundesligaTeams);
    final LeagueModel serieA =
        LeagueModel(name: 'Serie A', leagueTeamsList: serieATeams);

    // Создаем будущие матчи
    final DateTime match1StartDateTime = DateTime.now();
    final Timer match1Time = Timer.periodic(Duration(minutes: 80), (timer) {
      print('Match 1 time elapsed');
    });
    final MatchModel match1 = MatchModel(
      league: premierLeague,
      matchStartDateTime: match1StartDateTime,
      firstClub: manchesterCity,
      secondClub: liverpool,
      matchTime: match1Time,
      firstClubScore: 0,
      secondClubScore: 0,
    );

    final DateTime match2StartDateTime = DateTime.now().add(Duration(days: 14));
    final Timer match2Time = Timer.periodic(Duration(minutes: 1), (timer) {
      print('Match 2 time elapsed');
    });
    final MatchModel match2 = MatchModel(
      league: bundesliga,
      matchStartDateTime: match2StartDateTime,
      firstClub: bayernMunich,
      secondClub: dortmund,
      matchTime: match2Time,
      firstClubScore: 0,
      secondClubScore: 0,
    );

    final DateTime match3StartDateTime = DateTime.now().add(Duration(days: 21));
    final Timer match3Time = Timer.periodic(Duration(minutes: 1), (timer) {
      print('Match 3 time elapsed');
    });
    final MatchModel match3 = MatchModel(
      league: serieA,
      matchStartDateTime: match3StartDateTime,
      firstClub: juventus,
      secondClub: milan,
      matchTime: match3Time,
      firstClubScore: 0,
      secondClubScore: 0,
    );

    return [match1, match2, match3];
  }
}
