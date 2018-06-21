---
title: Hackaburg 2018
summary: "Last weekend the third annual Hackaburg hackathon has been held at the TechBase in Regensburg. If you're unfamiliar with the concept of a hackathon: It is basically a big get-together where we use caffeine in various forms to produce a prototype for a product over a short timespan, typically a weekend. You get to work on new technologies with friends and soon-to-be friends and in the end, you present your product to the whole crowd and a jury who rewards the best products…"
headerImage: '2018-05-30-hackaburg/assets/header_cut.png'
---
_Mai 30, 2018, by [Hans-Martin Schuller](https://number42.de/#team)_

#3,2,1 ... Hack!
![](assets/header_cut.png)

Last weekend the third annual [Hackaburg](https://hackaburg.de/) hackathon has been held at the [TechBase](https://www.techbase.de/) in Regensburg. If you're unfamiliar with the concept of a hackathon: It is basically a big get-together where we use caffeine in various forms to produce a prototype for a product over a short timespan, typically a weekend. You get to work on new technologies with friends and soon-to-be friends and in the end, you present your product to the whole crowd and a jury who rewards the best products. The last Hackaburgs were hosted at the *University of Applied Sciences* in Regensburg and were targeted at students. I've attended every Hackaburg so far, as I always like exchanging with fellow students who are interested in programming. The last Hackaburgs went pretty well, although I never got to win in a challenge or category. This year, I wanted this to change and persuaded my colleagues Maike and Maxi to join me in my quest for that sweet sweet victory. They also study *Media Computer Science* at the University of Regensburg with me and were just as eager to do well. We wanted to show ourselves (and maybe our senior colleagues, too?) how much we have grown since we started working at Number42. We and about 500 others registered to attend this event and we were elected to be three of the 140 lucky participants of Hackaburg.

Hackaburg was split into five tracks this year, each awarding its best team with prize money. The tracks were *Security*, *Smart-Society*, *Digital Journalism*, *E-Health* and *Free Choice (do-whatever-you-want-track)*. In addition to the tracks, there also were additional sponsored challenges with varying prize pools. We figured *Digital Journalism* would end up with the least number of participating teams and began to think of an idea that would fit into this track. Boy, were we wrong! It was in fact the track with the most submitted projects. And thus, we braced ourselves, as competition was coming.

We talked with a friend of us who works in the news business and came up with the idea to crawl social media platforms for their newest posts, analyze them and show upcoming and current trends on social media in a visually appealing way to the user. This way, no local trend is missed and every news magazine using our product is always up to date. Sounds great, right? Innovative? Not so much. We were so excited about this idea that we completely forgot to do any market research. Never ever forget market research!

At the start of the event, after welcoming everyone and thanking the sponsors for their support, the extra challenges were advertised again and we found out that our little project idea would fit quite well into one of the two bigger challenges by the [Mittelbayerische Zeitung](https://www.mittelbayerische.de/) (MZ), a local newspaper in Regensburg. These challenges were about using AI to advance local journalism and how technology can show what actually is interesting for people. After a quick chat with one of the representatives of the MZ they thought that our idea would be useful for them, too. This was the morale boost we needed. Any thought about doing market research had been forgotten at this point. They needed it and we were destined to make it!

The hacking started. Since we at Number42 have our office space in the TechBase we went back into our company offices. The convenience and comfort of having your very own offices in the same place or very near the hackathon location are priceless. The whole arsenal of whiteboards and extra monitors was waiting for us to be used to plan and implement our idea.

![](assets/Team.jpeg)
*Getting comfortable in one of our office rooms*

The idea seemed simple at first: Ask Instagram and Twitter for some data, combine that data into one big chunk of data and visualize that. This means we set up a website and server. We then had the server get the data and feed it to the website. When setting up the server, we hit the first wall: Authtokens. Getting your hands on real-time data meant needing authorization. Getting authorization meant getting tokens. And in Instagram's case, this meant getting reviewed and approved as a proper app. And this was not feasible in two days. We decided to postpone this step until way back after the hackathon (as if anyone ever gets back to quickly hacked code...) and just use mocked data. And in the end, this played out rather well.

Our "Trendanalyzer" was growing at a steady pace. Maxi was handling the data structures of Twitter and Instagram. I'm usually working in native mobile app development but nonetheless ended up building a node.js server. Since Maxi's last encounter with JavaScript and node.js is more recent than mine, she helped me whenever I felt stuck. The website is an ember.js web app. Maike usually works with Ember and since the girls know their way in designing a good-looking app or website, we got ourselves a pretty great looking frontend. And this is incredibly important. While you usually submit your code in the end, a visually appealing prototype presented in the final pitch has a greater retention time in the minds of everyone than some incredibly clean and well structured code. So don't forget to invest enough time to have a good looking prototype in the end.

![](assets/Screenshot.png)
*Isn't it pretty? Our little baby 👶*

On Sunday, the code freeze happened right before lunch. This meant that the state of the project was final and no more changes were allowed. Due to the number of teams (about 25) and the time it would take to pitch every project, we were asked to present our product to a part of the jury which was specialized in our track. The best 15 teams were then given three minutes to pitch their product to the whole crowd and the jury. Luckily, we were one of these teams. I already mentioned how using mock data played out well for us. For our presentation, we were able to create a cool and seemingly realistic scenario with \#hackaburg2018 being incredibly trending in Regensburg. Subtle, huh?

![](assets/Presentation.png)
*Setting up everything for the pre-selection presentation*

In our presentation, we described the scenario of Peter, a local news reporter who overslept. He couldn't prepare himself for the weekly team meeting because keeping up with social media is a long, dreading task and therefore he was not able to contribute at all. We presented our app, the Trendanalyzer, which would have saved Peter that day and pitched, how it simplifies working through social media for interesting posts. During the presentation, a live demo of the completely functional website (with mock data) was shown in the background. We figured this would be the most efficient way to present a good selling pitch and show our technical skills in the short timespan of three minutes.

![](assets/Maike.jpeg)
*Maike, slamming that presentation. Image: Facebook.com/Hackaburg*

After the presentation, we were asked a couple of questions about our project and also what made us different to our competitors. This is the reason why market research is so important: We slammed that presentation, but without knowledge about our direct competition that question gave us trouble. While we gave a spontaneous answer, we ourselves were not completely happy with it, as we were not prepared for this question.

In the end, we won the newspaper's special challenge, because it was what they were looking for and our project was the best implementation of their request. The (very unpolished!) code of our project is stored in [this](https://github.com/schmargi/trendanalyzer) public repository on GitHub.

![](assets/Winners.jpeg)
*From left: Maike, Maxi, Andrea Rieder (the representative of the MZ) and Hans-Martin, yours truly. Image: Facebook.com/Hackaburg*

We had a great time together, worked from early in the morning up until after midnight. We had our lows, where morale was fading doing tedious tasks like creating fake Instagram posts and tweets to fill our backend with believable dummy data. We had our highs, where morale was brought back by the good old tunes of Taylor Swift. We will return next year.
