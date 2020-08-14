Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403AE2442E9
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 04:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgHNCH2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 22:07:28 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:33804 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgHNCH2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 22:07:28 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1597370844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HszWUUJvd7EBksBKgBPNU6CHj9iNJBuG0ewO8MkRWQo=;
        b=PnfV4lPQzaJJb7IiJlarS8hzjvDJVXqlY+OVzhtgxRcx79krwkGJVBLMfYWlZm3GLrMFoR
        lshTb/yUYkutjbic0ygOtGFtykF7RsaQLSfOMs8He1AKWY7Ltn0Rz7368uBmYkyYw3rRuZ
        MIVhUAEZzPpLCPqfLXkjye5xlgz4sDXyonelO5JX4vs5J7KgEDioduJyqI9jwbWD30xIyC
        ig7LPzzqFD32Oh8ta5JZNV+RKtxAsGHTQJTnya9SALzf9IhbNyPIibUsuJfjUaFYlv+9e7
        9KfmN3FS0QZahnivJW4TE8/Zx8Fx8+YcBtD19dJ3QJ0n1zcKzZjdrZdnv2npvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1597370844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=HszWUUJvd7EBksBKgBPNU6CHj9iNJBuG0ewO8MkRWQo=;
        b=8djcXSCwB2u6hXA0mZQiZdIbTIgZlbVqk7umcsx0bo7yoDutngofTNKJcvogcrTHaiTokb
        laHR4gkeKsBbB7BQ==
To:     Doug Anderson <dianders@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Subject: Re: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and irq_resume_one() callbacks
In-Reply-To: <CAD=FV=Wyp8B6183avk4on4Akz6dANkuJ25h_o_ERDuiZ87mwNw@mail.gmail.com>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org> <1597058460-16211-4-git-send-email-mkshah@codeaurora.org> <87pn7ulwr5.fsf@nanos.tec.linutronix.de> <CAD=FV=WN4R1tS47ZzdZa_hsbvLifwnv6rgETVaiea0+QSZmiOw@mail.gmail.com> <878sei42ql.fsf@nanos.tec.linutronix.de> <CAD=FV=Wyp8B6183avk4on4Akz6dANkuJ25h_o_ERDuiZ87mwNw@mail.gmail.com>
Date:   Fri, 14 Aug 2020 04:07:24 +0200
Message-ID: <87364q3rqb.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Doug,

On Thu, Aug 13 2020 at 15:58, Doug Anderson wrote:
> On Thu, Aug 13, 2020 at 3:09 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>> > * If this interrupt fires while the system is suspended then please
>> > wake the system up.
>>
>> Well, that's kinda contradicting itself. If the interrupt is masked then
>> what is the point? I'm surely missing something subtle here.
>
> This is how I've always been told that the API works and there are at
> least a handful of drivers in the kernel whose suspend routines both
> enable wakeup and call disable_irq().  Isn't this also documented as
> of commit f9f21cea3113 ("genirq: Clarify that irq wake state is
> orthogonal to enable/disable")?

Fair enough. The wording there is unfortunate and I probably should have
spent more brain cycles before applying it. It suggests that this is a
pure driver problem. I should have asked some of the questions I asked
now back then :(

>> If that's the main problem which is solved in these callbacks, then I
>> really have to ask why this has not been raised years ago. Why can't
>> people talk?
>
> Not all of us have the big picture that you do to know how things
> ought to work, I guess.  If nothing else someone looking at this
> problem would think: "this must be a common problem, let's go see how
> all the other places do it" and then they find how everyone else is
> doing it and do it that way.  It requires the grander picture that a
> maintainer has in order to say: whoa, everyone's copying the same
> hack--let's come up with a better solution.

That's not the point. I know how these things happen, but I fail to
understand why nobody ever looks at this and says: OMG, I need to do yet
another variant of copy&pasta of the same thing every other driver
does. Why is there no infrastructure for that? 

Asking that question does not require a maintainer who always encouraged
people to talk about exactly these kind of things instead of going off
and creating the gazillionst broken copy of the same thing with yet
another wart working around core code problems and thereby violating
layering and introducing bugs which wouldn't exist otherwise.

Spare me all the $corp reasons. I've heard all of them and if not then
the not yet known reason won't be any more convincing. :)

One of the most underutilized strengths of FOSS is that you can go and
ask someone who has the big picture in his head before you go off and
waste time on distangling copy&pasta, dealing with the resulting obvious
bugs and then the latent ones which only surface 3 month after the
product has shipped. Or like in this case figure out that the copy&pasta
road is a dead end and then create something new without seeing the big
picture and having analyzed completely what consequences this might have.

I don't know how much hours you and others spent on this. I surely know
that after you gave me proper context it took me less than an hour to
figure out that one problem you were trying to solve was already solved
and the other one was just a matter of doing the counterpart of it. I
definitely spent way more time on reviewing and debating.

So if you had asked upfront, I probably would have spent quite some time
on it as well depending on the quality of the question and explanation
but the total amount on both sides would have been significantly lower,
which I consider a win-win situation.

Of course I know that my $corp MBA foo is close to zero, so I just can
be sure that it would have been a win for me :)

Seriously, we need to promote a 'talk to each other' culture very
actively. The people with the big picture in their head, aka
maintainers, are happy to answer questions and they also want that
others come forth and say "this makes no sense" instead of silently
accepting that the five other drivers do something stupid. This would
help to solve some of the well known problems:

 - Maintainer scalability

   I rather discuss a problem with you at the conceptual level upfront
   instead of reviewing patches after the fact and having to tell you
   that it's all wrong. The latter takes way more time.

   Having a quick and dirty POC for illustration is fine and usually
   useful.

 - Maintainer blinders
 
   Maintainers need input from the outside as any other people because
   they become blind to shortcomings in the area they are responsible
   for as any other person. Especially if they maintain complex and
   highly active subsystems.

 - Submitter frustration

   You spent a huge amount of time to come up with a solution for
   something and then you get told by the maintainer/reviewer that the
   time spent was wasted and your solution is crap. It does not matter
   much what the politeness level of that message is. It sets you back
   and causes frustration on both ends.

 - Turn around times

   A lot of time can be spared by talking to each other early. A half
   baken POC patch is fine for opening such a discussion, but going down
   all the way and then having the talk over the final patch review is
   more than suboptimal and causes grief on both sides.

>>   "These two callbacks are interesting because sometimes an irq chip
>>    needs to know about suspend/resume."
>>
>> Really valuable and precise technical information.
>
> Funny to get yelled at for not providing a detailed enough changelog.
> Usually people complain that my changelogs are too detailed.  Sigh.

The complaint you might get from me about an overly detailed changelog
is that it has redundant or pointless information in it, e.g.

  - the 500 lines of debug dump containing about 10 lines of valuable
    information which you already decoded and condensed in order to
    figure the problem out.

  - anecdotes around the discovery which carry zero information and
    often show that that the scope of the problem was not fully
    understood.

  - pointless examples of how to trigger the fail

  - In depth explanaations of what the patch does instead of a concise
    explanation at the conceptual level.

You won't hear me complain about a concise and coherent in depth
technical explanation of a problem.

Writing changelogs is an art and I surely look at some of my own
changelogs written long ago and yell at myself from time to time.

Reading a patch goes top down obviously:

      1) Subject line
      2) Changelog
      3) Patch.

If I have to rumage for my crystal ball before #3 then I already spent
more time than necessary. If the thing is some random feature then I
might just say: try again. But if I get the sense that it is about a bug
or  has some smell of a shorrcoming in the core code then I have to bite
the bullet and decode it the hard way. Not the most efficient way. And
from experience I can tell you that if #1 and #2 are already problematic
then #3 needs some serious scrutiny in most cases.

>> Hint: "Sometimes a chip needs to know" does not qualify :)
>
> Clearly I am not coherent.  ;-)  My only goal was to help enable
> interrupts that were disabled / marked as wakeup (as per above,
> documented to be OK) to work on Qualcomm chips.  This specifically
> affects me because a driver that I need to work (cros_ec) does this.

Mission acoomplished :)

> If IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND is good to add then it sounds like
> a great plan to me.

If it solves the problem and from what you explained it should do so
then this is definitely the right way to go.

Thanks,

        tglx
