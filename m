Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E63328B221
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 12:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbgJLKV4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 06:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbgJLKV4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Oct 2020 06:21:56 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A90C0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 03:21:53 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id t12so15487669ilh.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2020 03:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ju4K5ZX9G/rX33zgxqjDQk7pb97KHZPepBXzpm1rRHE=;
        b=SQ6AdeNI9ns6jRg6BBDFfnuW/kA2v8TyQwM7LmOZG8BbbZNR+W8CiO0K/bdh8teG9b
         PtitR3RnMgrk1NXq2XkiSOK7+awl63HTR1J4BDrdu+VuUVJnRIR/ro1CfHooO9qw4fsZ
         rLzWd3Fl9dvEpKTV8b1+khgtM/6O2mOczcL+lKu6Ak32Y9QlT9Swcjfj4EOOH7hod8sr
         bBsjo1ZbbHOiAZhiYF7dq66AUhy1s6t0YNRMVCNPp+1AoR0/UzZXElRhxvl8nQBBbeeA
         RnIQReB3kuk2bP/wp1Sf99hil06d6NvQNAr5B2R71sYikcu8/LPR1wgonS++JCUDc15K
         rQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ju4K5ZX9G/rX33zgxqjDQk7pb97KHZPepBXzpm1rRHE=;
        b=dIkY62s6vk7xtgdoEuJ49RTy8Srfl/w8vgBRy7fDcaCYfwaJNgEh+e63eAzZmw++iH
         CVVkrE1xzSDL8w7OyIa84pwwgt8IkVZfmVL0qIj75JP0t+YBZEHBksieI9/gCn6XR0oU
         YpI+s01/7mHxMh3szQ5gOB7tT3TG05XiunX1C6cNLrZWAClm+AYFlQBE1aLDFzgn9ks2
         8suQ/GvOvdgfUVN7IayV6usg254C14BM6xGaaNxFvXM8PrYWzXeFRxrXY3R7RUHpyYh7
         FtIxYpbJhR3XElQK6CCRd8xVsb0EsuWwfBppASqpMjBi3aPvahY12n17NUUoi7JIoAag
         GMwA==
X-Gm-Message-State: AOAM530Ilz6Y1x9etH+55D5LimV7dehCeBBx0tbrY1QvvcoWLe8Z4HZE
        xZZz1dNC7yP5ScgnWFh++MlTID6i4pknmniuHJ2l+g==
X-Google-Smtp-Source: ABdhPJx+GeTI2w7AsyAaajQH36FCSYI6pF0aMLqshyosH673URAe4MpD8YoV9I7sDXHEQNWW6nw1YuJW+0qCZ5G0Wkc=
X-Received: by 2002:a92:b610:: with SMTP id s16mr15279108ili.6.1602498112998;
 Mon, 12 Oct 2020 03:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
In-Reply-To: <CAFhCfDa_FNNC7ushPApRguj3Omik27wRjb3Eh1-_4a1js63FVw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Oct 2020 12:21:42 +0200
Message-ID: <CAMRc=Mch42qdf8Z6FSOutGkcB79ScBi-bidwA5P2s9WhiyRaHg@mail.gmail.com>
Subject: Re: Suggestion - Configurable Source Clock Type for Line Event Timestamping
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 11, 2020 at 5:11 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:
>
> Hi Folks,
>

Hi!

Thanks Kent for bringing this to my attention. I've Cc'd even more
people who may be interested in this discussion.

> I recently noticed that in Linux 5.7, gpiolib was changed such that
> line events are now timestamped using the system 'monotonic' clock
> rather than the system realtime clock.  The rationale for this change
> appears to be due to the major use-case of the line event timestamp
> data in relation to the nature of the system realtime clock (which can
> jump backwards or forwards in time due to adjustments by third-parties
> - e.g., NTP or PTP clients, etc).
>
> For most users of the line event timestamp value, the use of the
> realtime clock could be problematic due to the potential for
> chronological line events to receive timestamp values with a
> non-chronological progression (resulting from adjustments being made
> to the clock).  This could be the source of a number of bugs,
> functional limitations and frustrations which was solved easily enough
> by transitioning to the use of the system monotonic clock.  That being
> said, I know there are users of the line event timestamp who actively
> rely on that value being obtained from the system realtime clock.
>

Technically we're not allowed to break user-space so had anyone
actually complained we would be forced to revert this.

> My suggestion (which I would be happy to implement myself) is to allow
> users to select the clock to be used for line event timestamping on a
> per line handle basis.  The merit of this approach is that the
> appropriate clock type may be selected on a per line handle basis
> according to the needs of the user.  This of course has some
> implications which are not desirable without merit, but may be deemed
> acceptable in balance with the resultant functionality.  In summary,
> these are:
>

We still haven't released uAPI v2 so I'm open to some last-minute
changes if they make sense (as you explained in the other email about
in-kernel timestamping) and are posted soon (before rc3-rc4). I'd like
to hear Arnd's opinion on this first though.

As for v1 - I think we all agree that it won't be getting any new
features anymore.

> 1. Increase in processing overhead and latency of timestamp
> acquisition on line event interrupts.  Implementing the proposed
> change requires a function call to be made to the appropriate ktime
> accessor function, based on what the user has configured as the
> timestamp clock source.  In kernel versions from 5.7 to current, a
> call is made to the ktime_get_ns() function which is most likely
> inlined by the compiler.  This change will result in an actual jump
> having to be made, which will have processor and memory access
> overhead (potential I$ and D$ misses).  Then there is of course the
> overhead of resolving which function to call - either a switch
> statement or call by function pointer (probably the latter option).
>
> 2. Additions required to the userspace ABI.  Additional IOCTLs will be
> required for line handles, allowing the source clock type for line
> event timestamping to be get or set.
>
> 3. Additions required to libgpiod.  The existing API will have to be
> added to in order to provide an abstraction for this new
> functionality.  This requires changes to the core C library, as well
> as the provided C++ and Python bindings (and their test cases).
> Changes will also be required to the WiP libgpiod service and its
> d-bus interface.  This change will also affect the proposed future
> lightweight libgpiod service.
>

I'm not sure if you're referring to my incomplete d-bus interface I
worked on some time ago and never finished (I plan to get back to it
once libgpiod v2.0 is out) or something else? And what is libgpiod
service and lightweight libgpiod service?

Backward incompatible changes in libgpiod are currently fine - we're
working on a new major release to provide support for new features of
uAPI v2 so it's the best moment to propose them.

> 4. Documentation for both the GPIO subsystem and libgpiod will require
> updating.  This should be done as part of the effort to implement this
> functionality (if agreed upon) for the target version of the kernel
> and libgpiod.
>
> Such that applications now relying on the use of the 'monotonic'
> system clock for timestamping line events do not require modification
> after the implementation of this functionality (most applications), I
> propose the 'monotonic' system clock be the default source clock.  If
> the user wants to change this to another clock type, then they may do
> so via the proposed additional IOCTLs and / or the proposed changes to
> libgpiod.
>
> I would be interested in hearing your thoughts on this suggestion / proposal.
>
> ~ Jack

Bartosz
