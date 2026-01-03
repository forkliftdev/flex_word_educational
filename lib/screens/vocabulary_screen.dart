import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Word Lists & Philosophy", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.techBlue,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. TITLE SECTION
            const Text(
              "FlexWord: The Three-Letter Word Puzzle",
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
                color: AppColors.techBlue
              ),
            ),
            const SizedBox(height: 20),
            
            const Text(
              "Welcome to our new word puzzle game!\n\nWhile there are over 1,200 three-letter words in the English language, I’ve carefully curated the lists to ensure a fun and accessible experience, narrowing the field down to a total of 462 words accepted as guesses, with a core pool of 261 words that can appear as answers.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 30),

            // 2. IMAGE PLACEHOLDER (Venn Diagram)
            // When you have your image, replace this Container with:
            // Image.asset('assets/venn_diagram.png')
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image, size: 50, color: Colors.grey),
                  SizedBox(height: 10),
                  Text("Venn Diagram Illustration Goes Here", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 3. PHILOSOPHY SECTION
            const Text(
              "Word Selection Philosophy",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textBlack),
            ),
            const SizedBox(height: 10),
            const Text(
              "I’ve designed FlexWord with an accessible difficulty curve in mind. Similar to the popular 5-letter game originally created by Josh Wardle, the answer pool is restricted to more common words.\n\nIn such games, obscure or niche words might be acceptable as guesses (for example, the 5-letter word 'hyphy'), but they are never chosen as answers. Most people would find the game extremely frustrating if they had to target these obscure words.\n\nFor this three-letter game, I’ve pared down the pool of accepted guesses to words an early learner might encounter. For example, 'rum' is an acceptable guess, but is not one of the 261 possible answers.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            
            const Divider(height: 40),

            // 4. THE LISTS
            _buildWordListSection(
              "Accepted Guesses (462 Words)", 
              "ace, act, add, ado, age, ago, aid, aim, air, ale, all, and, ant, any, ape, apt, arc, are, ark, arm, arr, art, ash, ask, asp, ate, ave, awe, awl, aye, bad, bag, bah, bam, ban, bap, bar, bat, bay, bed, bee, beg, bet, bib, bid, big, bin, bit, boa, bob, bod, bog, boo, bop, bot, bow, box, boy, bra, bro, brr, bud, bug, bun, bus, but, buy, bye, cab, cad, cam, can, cap, car, cat, caw, cay, cod, cog, coo, cop, cot, cow, coy, cry, cub, cue, cup, cut, dab, dad, dam, day, den, dew, did, die, dig, dim, din, dip, doe, dog, don, dot, dry, dub, dud, due, dug, duo, dye, ear, eat, ebb, eel, egg, ego, ehh, elf, elk, elm, emu, end, era, eve, ewe, eww, eye, fad, fam, fan, far, fat, fed, fee, few, fib, fig, fin, fir, fit, fix, flu, fly, foe, fog, for, fox, fry, fun, fur, gag, gah, gal, gap, gas, gay, gee, gel, gem, get, gig, god, goo, got, grr, gum, gun, gut, guy, gym, had, hag, hah, ham, has, hat, hay, heh, hem, hen, her, hew, hey, hid, him, hip, his, hit, hmm, hoe, hog, hop, hot, how, hub, hue, hug, huh, hum, hut, ice, icy, ilk, ill, ink, inn, ion, ire, ivy, jab, jam, jar, jaw, jay, jet, jib, jig, job, jog, joy, jug, jut, keg, key, kid, kin, kit, lab, lad, lag, lap, law, lax, lay, lea, led, lee, leg, let, lid, lie, lip, lit, log, loo, lot, low, lox, lye, mad, man, map, mar, mat, maw, max, may, med, men, met, mew, mid, mix, mmm, mob, mom, moo, mop, mow, mud, mug, mum, nab, nag, nah, nap, naw, nay, net, new, nil, nip, nod, non, nor, not, now, nub, nun, nut, oar, oat, odd, ode, off, oil, old, one, oof, oop, opt, ore, our, out, owl, own, pad, pal, pan, par, pat, paw, pay, pea, peg, pen, pep, pet, pew, pie, pig, pin, pip, pit, ply, pod, pop, pot, pro, pry, pun, pup, put, rag, ram, ran, rap, rat, raw, ray, red, rib, rid, rig, rim, rip, rob, rod, roe, rot, row, rub, rug, rum, run, rut, rye, sad, sag, sap, sat, saw, sax, say, sea, see, set, sew, she, shy, sib, sin, sip, sir, sis, sit, six, ski, sky, sly, sob, soy, spa, spy, sub, sue, sum, sun, sup, tab, tag, tan, tap, tar, tat, tax, tea, tee, ten, the, thy, tie, tin, tip, toe, tog, ton, too, top, tot, tow, toy, try, tub, tug, tum, two, ugh, umm, urn, use, van, vat, vet, vid, vie, vow, wag, war, was, wax, way, web, wed, wee, wet, who, why, wig, win, wit, woe, won, wow, wry, yak, yam, yap, yea, yes, yet, yin, you, yum, yup, zap, zed, zip, zoo, zzz"
            ),
            const SizedBox(height: 20),
            _buildWordListSection(
              "Possible Answers (261 Words)", 
              "act, add, aim, air, all, and, ant, any, ape, are, arm, ash, ask, ate, bad, bag, bam, bar, bat, bed, bib, bid, big, bin, bit, box, boy, bud, bug, bun, bus, but, buy, bye, cab, cap, cat, cod, cot, cow, cub, cup, cut, day, den, did, dig, dim, din, dip, doe, dog, dot, dry, dud, dug, ear, eat, eel, elk, emu, end, ewe, eye, fan, far, fed, fig, fin, fit, fix, fly, fog, for, fox, fun, gap, gas, gel, get, gig, got, gum, gun, gut, had, ham, has, hat, hem, hen, her, hid, him, hip, his, hit, hog, hop, hot, how, hub, hug, hum, hut, ice, jaw, jet, jig, jog, kid, kin, kit, lap, lay, led, leg, let, lid, lie, lip, lit, log, lot, mad, man, map, mat, men, met, mid, mix, mop, mow, mud, mug, mum, nap, net, new, nip, nod, non, not, now, nut, one, our, out, owl, pad, pal, pan, pat, pay, peg, pen, pep, pig, pin, pip, pit, pod, pop, pot, pup, put, rag, ram, ran, rap, rat, red, rib, rid, rig, rim, rip, rod, row, rub, rug, run, rut, sag, sap, sat, say, sea, see, set, she, sip, sit, six, sky, sly, sun, tab, tag, tan, tap, ten, the, tie, tin, tip, toe, ton, too, top, tot, tow, try, tub, tug, two, use, vet, wag, wax, way, web, wed, wet, who, why, wig, win, wow, yak, yam, yap, yes, you, zap, zip"
            ),

            const Divider(height: 40),

            // 5. CONTACT
            const Center(
              child: Text(
                "You’ve read this far. You must have thoughts.\nPlease, share them with me at:",
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: SelectableText( // Allows user to copy/paste email
                "forklift2flutter@gmail", 
                style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.techBlue),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildWordListSection(String title, String words) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.techBlue),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: SelectableText(
            words,
            style: const TextStyle(fontFamily: 'Courier', fontSize: 13, height: 1.5),
          ),
        ),
      ],
    );
  }
}