Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE44E28B355
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 13:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387597AbgJLLB7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 07:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387594AbgJLLB7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 07:01:59 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF3CC0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 04:01:58 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 13so16812878wmf.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 04:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fnl+f9KYgmMdJ8KjcGdKqFqJZTqmUt+D4e8VBM8izyA=;
        b=BAubZSzpxvL/EYQHljc5oaPghssQDSEmjqA71scaNh7YYEY2pxkC7e7iC5vyIgpYdP
         yOzxpDvW3k81BZ9x8Z28m2YMi9Dmr7E1jbnpd+saj9HPVV6gtZ8GwLw6BqmwYGQ5kiim
         l3H8+CsyDAt7XVbMKAvuoUn2jOkccSZh+QECX2TtU5v0HmLdDDEc/y6Qz5xJ+ev7+Ozy
         +7bNNR5QYSce6Beph1WSP7cQCgQvU4cm8JC9QrD1MpBibAIXmVVCjEsJoGWMl+xOA5HI
         qmyyDSXz80CZDF4mE39n3TOMIoYHshskZBun69C4xv/d236vcoL+DAAhnsPV5t6xDymw
         uxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fnl+f9KYgmMdJ8KjcGdKqFqJZTqmUt+D4e8VBM8izyA=;
        b=B4Gn7Pxm4vihLkxjA8YwZnZs+9yJ0uB69Jv37x8mngJry9L3oJHXwHEkdwFSfBFVHV
         rs5aBselrAzxM0vGxVWCeEEtV9Nu0CClmi4Corwmlzw3OpDe3fHcFP9QaZN/8zsolGpc
         ezKEPqB3l3kPdPsfZazYUK+PsVpLPxdj4c4hjP+uGjVeZf+wBYjGwTD5RBhpCU5CWSfT
         bOY432lKDhRr94uGibDMumPTLBvVL8sZyhmGnJt1iqLwivpiXmTlgVO+2bRIL1K7movz
         lKkR9ZI1aVgONXenJ12Rb5q/6YRQeH4ipZBX3q6Ds03RpZ+3hLb4cyUPjcy32tdrUw1M
         Xtzw==
X-Gm-Message-State: AOAM532P6kWsgP4C1NcCj/mLHxuw5IPSQxysOyMoYKTuAK5BvhA4GNlP
        Ph/RwQZvCGtwZe8Rh9QX6S3Ky5IR/HXKjdOiae5SiHY00QDKmw==
X-Google-Smtp-Source: ABdhPJzSYFF9R1NyVvt5PhT2pPw+hGhT2p7yUShhGVWZ52YpfsAkHjIbt25gsIWIl3s2aRyzLVQEk5ZNp6IIcLpyGhU=
X-Received: by 2002:a1c:5a86:: with SMTP id o128mr9926971wmb.129.1602500517416;
 Mon, 12 Oct 2020 04:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
 <CAMRc=Mch42qdf8Z6FSOutGkcB79ScBi-bidwA5P2s9WhiyRaHg@mail.gmail.com>
In-Reply-To: <CAMRc=Mch42qdf8Z6FSOutGkcB79ScBi-bidwA5P2s9WhiyRaHg@mail.gmail.com>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Mon, 12 Oct 2020 11:05:20 +0100
Message-ID: <CAFhCfDbtK=d6PJHSfYFnt17vqC=TzbWD3reFYgM8WBXgS9gUYA@mail.gmail.com>
Subject: Re: Suggestion - Configurable Source Clock Type for Line Event Timestamping
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> It probably couldn't hurt, as would prefixing your subject with
> [libgpiod] if it is only relevant to the chardev and libgpiod.
> And including the relevant sections of the mail you are replying to helps
> as well.


Thanks for the pointers.

> So a mapping from the MONOTONIC timestamp, taken in the ISR and returned
> in the event, to the equivalent REALTIME timestamp is not reliable as
> there is jitter between the two clocks?


That is correct.  There are also other implications due to how
adjustments are made to the realtime clock by a system's PTP client
service.  The PTPv2 standard (IEEE 1588:2008) does not specify how the
calculated offset between a master and a slave clock is used to adjust
the slave clock, such that the slave clock is brought into
coordination with the master clock.  This procedure is called 'clock
discipline' and there are numerous ways of achieving it.

So the short answer to that question is it is better 'not to d*ck with
the data' and to obtain timestamp values directly from the realtime
clock when handling an event, rather than using the 'monotonic' clock
to try to resolve a realtime value.

> Technically we're not allowed to break user-space so had anyone
> actually complained we would be forced to revert this.


That was my initial thought, but for most users, they do want a
'monotonic' time value for the event timestamp.  So this functionality
really ought to be available to them (for they are in the majority).
I have only noticed the change recently due to the use of downstream
versions of the kernel.

> We still haven't released uAPI v2 so I'm open to some last-minute
> changes if they make sense (as you explained in the other email about
> in-kernel timestamping) and are posted soon (before rc3-rc4). I'd like
> to hear Arnd's opinion on this first though.


What's the timescales for this?  As I would be doing this in a
personal capacity, I will likely have to look at this over a couple of
weeks.  I would also be limited to testing on an ARMv8 platform, as I
currently have limited access to hardware.

> I'm not sure if you're referring to my incomplete d-bus interface I
> worked on some time ago and never finished (I plan to get back to it
> once libgpiod v2.0 is out) or something else? And what is libgpiod
> service and lightweight libgpiod service?


That's the one.  I asked you about its progress back in Feb, but it
seemed to be something on the backburner.  That's what I meant by
'libgpiod service' for want of a better term.

And by 'lightweight libgpiod service', I mean the planned minimal
server application which makes use of minimal dependencies and a
socket-based interface (as opposed to d-bus) to provide similar
capability on resource constrained devices.

Jack


On Mon, Oct 12, 2020 at 11:21 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Sun, Oct 11, 2020 at 5:11 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:
> >
> > Hi Folks,
> >
>
> Hi!
>
> Thanks Kent for bringing this to my attention. I've Cc'd even more
> people who may be interested in this discussion.
>
> > I recently noticed that in Linux 5.7, gpiolib was changed such that
> > line events are now timestamped using the system 'monotonic' clock
> > rather than the system realtime clock.  The rationale for this change
> > appears to be due to the major use-case of the line event timestamp
> > data in relation to the nature of the system realtime clock (which can
> > jump backwards or forwards in time due to adjustments by third-parties
> > - e.g., NTP or PTP clients, etc).
> >
> > For most users of the line event timestamp value, the use of the
> > realtime clock could be problematic due to the potential for
> > chronological line events to receive timestamp values with a
> > non-chronological progression (resulting from adjustments being made
> > to the clock).  This could be the source of a number of bugs,
> > functional limitations and frustrations which was solved easily enough
> > by transitioning to the use of the system monotonic clock.  That being
> > said, I know there are users of the line event timestamp who actively
> > rely on that value being obtained from the system realtime clock.
> >
>
> Technically we're not allowed to break user-space so had anyone
> actually complained we would be forced to revert this.
>
> > My suggestion (which I would be happy to implement myself) is to allow
> > users to select the clock to be used for line event timestamping on a
> > per line handle basis.  The merit of this approach is that the
> > appropriate clock type may be selected on a per line handle basis
> > according to the needs of the user.  This of course has some
> > implications which are not desirable without merit, but may be deemed
> > acceptable in balance with the resultant functionality.  In summary,
> > these are:
> >
>
> We still haven't released uAPI v2 so I'm open to some last-minute
> changes if they make sense (as you explained in the other email about
> in-kernel timestamping) and are posted soon (before rc3-rc4). I'd like
> to hear Arnd's opinion on this first though.
>
> As for v1 - I think we all agree that it won't be getting any new
> features anymore.
>
> > 1. Increase in processing overhead and latency of timestamp
> > acquisition on line event interrupts.  Implementing the proposed
> > change requires a function call to be made to the appropriate ktime
> > accessor function, based on what the user has configured as the
> > timestamp clock source.  In kernel versions from 5.7 to current, a
> > call is made to the ktime_get_ns() function which is most likely
> > inlined by the compiler.  This change will result in an actual jump
> > having to be made, which will have processor and memory access
> > overhead (potential I$ and D$ misses).  Then there is of course the
> > overhead of resolving which function to call - either a switch
> > statement or call by function pointer (probably the latter option).
> >
> > 2. Additions required to the userspace ABI.  Additional IOCTLs will be
> > required for line handles, allowing the source clock type for line
> > event timestamping to be get or set.
> >
> > 3. Additions required to libgpiod.  The existing API will have to be
> > added to in order to provide an abstraction for this new
> > functionality.  This requires changes to the core C library, as well
> > as the provided C++ and Python bindings (and their test cases).
> > Changes will also be required to the WiP libgpiod service and its
> > d-bus interface.  This change will also affect the proposed future
> > lightweight libgpiod service.
> >
>
> I'm not sure if you're referring to my incomplete d-bus interface I
> worked on some time ago and never finished (I plan to get back to it
> once libgpiod v2.0 is out) or something else? And what is libgpiod
> service and lightweight libgpiod service?
>
> Backward incompatible changes in libgpiod are currently fine - we're
> working on a new major release to provide support for new features of
> uAPI v2 so it's the best moment to propose them.
>
> > 4. Documentation for both the GPIO subsystem and libgpiod will require
> > updating.  This should be done as part of the effort to implement this
> > functionality (if agreed upon) for the target version of the kernel
> > and libgpiod.
> >
> > Such that applications now relying on the use of the 'monotonic'
> > system clock for timestamping line events do not require modification
> > after the implementation of this functionality (most applications), I
> > propose the 'monotonic' system clock be the default source clock.  If
> > the user wants to change this to another clock type, then they may do
> > so via the proposed additional IOCTLs and / or the proposed changes to
> > libgpiod.
> >
> > I would be interested in hearing your thoughts on this suggestion / proposal.
> >
> > ~ Jack
>
> Bartosz
