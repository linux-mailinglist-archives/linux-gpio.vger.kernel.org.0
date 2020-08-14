Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A452443CB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgHNDFN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgHNDFM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:05:12 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0C9C061384
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 20:05:12 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id r7so3996364vsq.5
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 20:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3h+hOtZ0O+sw6nZ7l5sUdheVk8E93Obg4yxo2/Jz3lU=;
        b=Odalo00kZdhQM/wJM4k3CuBjmJDqVr+KmWEjaDiQHPiLqou8vU09CEqX5RpdQSSUGx
         nD0GDSz6zbX6sdhZ6IXAWDOdxue1YsF3f2KMF3lGcmc3vgp/Ax79LKgZDGmAuh8ToJ9Z
         Fpa6Hj0hN0Z56Jk6/o21hj9T3CYktmFAiij40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3h+hOtZ0O+sw6nZ7l5sUdheVk8E93Obg4yxo2/Jz3lU=;
        b=UQAfzfvOeEMmfTdCX7Ylsor1e45MJHU2JCEeRZQax6RLBZwSWEoPHW0gh1ZxeDBY04
         RfUiX1fWHyBfBBl9TCurAgOA3bbX31NpmMg+3M4Fo8wQXF3kF+7S7DRWjEYf+Qh2eWdg
         /gxM1pO2Ck1UGgda+N/jCUJpPSi79dUkW1wsE1hhSV8vuGnLKk09ZCuvm2XyiobJl9z/
         c40kSop/SluzOqaIPl9A3Nb4IMv3glgZd+9w7SG+02kuiiR4Z0OH+6NpVskqz+MQrfBO
         oqru+ABarz3j3nMeaG3A2EL4y2VrF3EWAWbd3QM/8iyCwrBsjZ0QjM5j+QPx3F0lJSEt
         q9gA==
X-Gm-Message-State: AOAM533xSbswiZ/eW51Sr2S++ctS2H/5ICJugX4UI8if0HDPcQNe6euo
        JOC+yrxyVKByaTPqzu7uOEp+uTM0FXU=
X-Google-Smtp-Source: ABdhPJz90tQRW9QflIyhhqY8ujjtNQAl2CesSMPZM/Ec7GvtAWg3xqhZEocnj1P3X6is2T3AXgDG7w==
X-Received: by 2002:a67:8882:: with SMTP id k124mr308736vsd.27.1597374309391;
        Thu, 13 Aug 2020 20:05:09 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id b21sm1176583vkb.30.2020.08.13.20.05.08
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 20:05:08 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id k25so3980473vsm.11
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 20:05:08 -0700 (PDT)
X-Received: by 2002:a67:f44f:: with SMTP id r15mr291730vsn.42.1597374307349;
 Thu, 13 Aug 2020 20:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
 <1597058460-16211-4-git-send-email-mkshah@codeaurora.org> <87pn7ulwr5.fsf@nanos.tec.linutronix.de>
 <CAD=FV=WN4R1tS47ZzdZa_hsbvLifwnv6rgETVaiea0+QSZmiOw@mail.gmail.com>
 <878sei42ql.fsf@nanos.tec.linutronix.de> <CAD=FV=Wyp8B6183avk4on4Akz6dANkuJ25h_o_ERDuiZ87mwNw@mail.gmail.com>
 <87364q3rqb.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87364q3rqb.fsf@nanos.tec.linutronix.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 13 Aug 2020 20:04:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1hvWZ0ANX9nsvRX_iXjuzw0X_tL2hgg4zYGgsqRtLTQ@mail.gmail.com>
Message-ID: <CAD=FV=V1hvWZ0ANX9nsvRX_iXjuzw0X_tL2hgg4zYGgsqRtLTQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and
 irq_resume_one() callbacks
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        LinusW <linus.walleij@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Aug 13, 2020 at 7:07 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Doug,
>
> On Thu, Aug 13 2020 at 15:58, Doug Anderson wrote:
> > On Thu, Aug 13, 2020 at 3:09 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >> > * If this interrupt fires while the system is suspended then please
> >> > wake the system up.
> >>
> >> Well, that's kinda contradicting itself. If the interrupt is masked then
> >> what is the point? I'm surely missing something subtle here.
> >
> > This is how I've always been told that the API works and there are at
> > least a handful of drivers in the kernel whose suspend routines both
> > enable wakeup and call disable_irq().  Isn't this also documented as
> > of commit f9f21cea3113 ("genirq: Clarify that irq wake state is
> > orthogonal to enable/disable")?
>
> Fair enough. The wording there is unfortunate and I probably should have
> spent more brain cycles before applying it. It suggests that this is a
> pure driver problem. I should have asked some of the questions I asked
> now back then :(

I mean, certainly a driver could be rewritten not to do this.  ...and,
in fact, the easier approach (for just solving my immediate concern)
would be to change cros-ec not to do this.  However, it was my
understanding that what cros-ec was doing was actually just fine and
part of the API to drivers.  This understanding was solidified when
the patch I mentioned landed.  When looking at this before I found
that certainly there are other drivers that do this and it felt better
to implement the proper thing rather than add a hack to cros-ec to
work around the Qualcomm pinctrl driver.

In general the idea here, I think, is that in the "suspend" call of a
driver it might want to disable interrupts so that it doesn't have to
deal with them after the driver has configured things (and adjusted
its internal data structures) for suspend.  However, it might still
want its interrupt to cause a wakeup.  ...so it wants the wakeup to
happen (and its resume call to be made to get everything back in the
right state) and at the end of the resume call it wants to enable its
interrupt handler again.  That seems like a sane design pattern to me,
but maybe I'm crazy.  Yes, I guess the driver could implement the
"noirq" suspend function, but sometimes it's simpler to have a single
suspend function that first leverages interrupts, then disables them
at an exact point it can control, and then finishes adjusting its
state.

I'll also note that the concept that a masked interrupt can "wake you
up" is also not unlike how ARM SoCs work, which is part of what made
me feel like this API was fine.  Specifically if you have interrupts
masked at the CPU level and then enter "WFI" (wait for interrupt) it
will wake up (or come out of idle) from one of those masked
interrupts.


> >> If that's the main problem which is solved in these callbacks, then I
> >> really have to ask why this has not been raised years ago. Why can't
> >> people talk?
> >
> > Not all of us have the big picture that you do to know how things
> > ought to work, I guess.  If nothing else someone looking at this
> > problem would think: "this must be a common problem, let's go see how
> > all the other places do it" and then they find how everyone else is
> > doing it and do it that way.  It requires the grander picture that a
> > maintainer has in order to say: whoa, everyone's copying the same
> > hack--let's come up with a better solution.
>
> That's not the point. I know how these things happen, but I fail to
> understand why nobody ever looks at this and says: OMG, I need to do yet
> another variant of copy&pasta of the same thing every other driver
> does. Why is there no infrastructure for that?
>
> Asking that question does not require a maintainer who always encouraged
> people to talk about exactly these kind of things instead of going off
> and creating the gazillionst broken copy of the same thing with yet
> another wart working around core code problems and thereby violating
> layering and introducing bugs which wouldn't exist otherwise.
>
> Spare me all the $corp reasons. I've heard all of them and if not then
> the not yet known reason won't be any more convincing. :)

As per above, if I was simply motivated to hack it to get it done I
would have suggested we just muck with cros_ec.  I certainly do have a
bias for getting things done and getting things landed, but I also try
to pride myself in not saying that we should just accept any old hack.
Perhaps many people posting patches just want any old crap landed, but
I'd like to think I'm not one of them.


> One of the most underutilized strengths of FOSS is that you can go and
> ask someone who has the big picture in his head before you go off and
> waste time on distangling copy&pasta, dealing with the resulting obvious
> bugs and then the latent ones which only surface 3 month after the
> product has shipped. Or like in this case figure out that the copy&pasta
> road is a dead end and then create something new without seeing the big
> picture and having analyzed completely what consequences this might have.

I've found that one of the best ways to get something figured out is
to post a patch, even if it's not perfect.  Perhaps in cases where
you're involved, but in general most cases where you just ask a
question you get ignored.  You've gotta post a patch.  This solution
was the best I was able to come up with and was discussed with several
people before posting.


> I don't know how much hours you and others spent on this. I surely know
> that after you gave me proper context it took me less than an hour to
> figure out that one problem you were trying to solve was already solved
> and the other one was just a matter of doing the counterpart of it. I
> definitely spent way more time on reviewing and debating.

I did spend quite a bit of time on it, though perhaps it's not
obvious.  Though I agree that the patch in isolation didn't have a
good enough description, I felt like it combined with the later
patches in the series did show what I was trying to do.


> So if you had asked upfront, I probably would have spent quite some time
> on it as well depending on the quality of the question and explanation
> but the total amount on both sides would have been significantly lower,
> which I consider a win-win situation.
>
> Of course I know that my $corp MBA foo is close to zero, so I just can
> be sure that it would have been a win for me :)
>
> Seriously, we need to promote a 'talk to each other' culture very
> actively. The people with the big picture in their head, aka
> maintainers, are happy to answer questions and they also want that
> others come forth and say "this makes no sense" instead of silently
> accepting that the five other drivers do something stupid. This would
> help to solve some of the well known problems:
>
>  - Maintainer scalability
>
>    I rather discuss a problem with you at the conceptual level upfront
>    instead of reviewing patches after the fact and having to tell you
>    that it's all wrong. The latter takes way more time.
>
>    Having a quick and dirty POC for illustration is fine and usually
>    useful.

OK, I will try to remember that, in the future, I should send
questions rather than patches to you.  I'm always learning the
workflows of the different maintainers, so sorry for killing so much
time.  :(


>  - Maintainer blinders
>
>    Maintainers need input from the outside as any other people because
>    they become blind to shortcomings in the area they are responsible
>    for as any other person. Especially if they maintain complex and
>    highly active subsystems.
>
>  - Submitter frustration
>
>    You spent a huge amount of time to come up with a solution for
>    something and then you get told by the maintainer/reviewer that the
>    time spent was wasted and your solution is crap. It does not matter
>    much what the politeness level of that message is. It sets you back
>    and causes frustration on both ends.
>
>  - Turn around times
>
>    A lot of time can be spared by talking to each other early. A half
>    baken POC patch is fine for opening such a discussion, but going down
>    all the way and then having the talk over the final patch review is
>    more than suboptimal and causes grief on both sides.

Yup, definitely understand.  Again, sorry for the misunderstandings
this time around and hopefully we can find better ways to interact in
the future.


> >>   "These two callbacks are interesting because sometimes an irq chip
> >>    needs to know about suspend/resume."
> >>
> >> Really valuable and precise technical information.
> >
> > Funny to get yelled at for not providing a detailed enough changelog.
> > Usually people complain that my changelogs are too detailed.  Sigh.
>
> The complaint you might get from me about an overly detailed changelog
> is that it has redundant or pointless information in it, e.g.
>
>   - the 500 lines of debug dump containing about 10 lines of valuable
>     information which you already decoded and condensed in order to
>     figure the problem out.
>
>   - anecdotes around the discovery which carry zero information and
>     often show that that the scope of the problem was not fully
>     understood.
>
>   - pointless examples of how to trigger the fail
>
>   - In depth explanaations of what the patch does instead of a concise
>     explanation at the conceptual level.
>
> You won't hear me complain about a concise and coherent in depth
> technical explanation of a problem.
>
> Writing changelogs is an art and I surely look at some of my own
> changelogs written long ago and yell at myself from time to time.
>
> Reading a patch goes top down obviously:
>
>       1) Subject line
>       2) Changelog
>       3) Patch.
>
> If I have to rumage for my crystal ball before #3 then I already spent
> more time than necessary. If the thing is some random feature then I
> might just say: try again. But if I get the sense that it is about a bug
> or  has some smell of a shorrcoming in the core code then I have to bite
> the bullet and decode it the hard way. Not the most efficient way. And
> from experience I can tell you that if #1 and #2 are already problematic
> then #3 needs some serious scrutiny in most cases.
>
> >> Hint: "Sometimes a chip needs to know" does not qualify :)
> >
> > Clearly I am not coherent.  ;-)  My only goal was to help enable
> > interrupts that were disabled / marked as wakeup (as per above,
> > documented to be OK) to work on Qualcomm chips.  This specifically
> > affects me because a driver that I need to work (cros_ec) does this.
>
> Mission acoomplished :)
>
> > If IRQCHIP_UNMASK_WAKEUP_ON_SUSPEND is good to add then it sounds like
> > a great plan to me.
>
> If it solves the problem and from what you explained it should do so
> then this is definitely the right way to go.

Wonderful!  Looking forward to Maulik's post doing it this way.

-Doug
