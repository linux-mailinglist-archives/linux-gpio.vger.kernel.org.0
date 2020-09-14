Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A032691C2
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 18:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgINQis (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 12:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgINQiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 12:38:15 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0D7C061788
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 09:38:14 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id x8so383524ybm.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 09:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ezixVREhRKp3aQ7isRNoNODkSvCjP3/NTzshSq3+hKo=;
        b=hFUDpOD3KN4RjzJzao5MxvvzpjUbplire9KA9dXJdf80e/wZvJnTNcGW9zc67EUNad
         tLNixH9YRXg1IwacZqm1QR72UMqXzdXAvPwp2z2ABU/yzl+w1QrSvtBlLUbYHBrUsyVM
         moKo7d/iqPLZcwWknt5C+r7UE/+eoZGxTF+hNRDZCSOTj6p5reag1qiamnTzKwpd9hQ8
         rWZ10rVIr/Ye0vgOKSRaf58xXCmcEyNvNzIIG/WUOwb682UScW3JfcABcY0uKYFXzU7q
         5heZUn6Ou+rp0lyrSbk3pghOdqN6QiuJTBKt0uVRcP4Ywv5yquijRh+6oyV/S9shFn3t
         1Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ezixVREhRKp3aQ7isRNoNODkSvCjP3/NTzshSq3+hKo=;
        b=uHwZdtctca1hOmO1G8QN32kS8M7u7dotZOfDiJTSML+Lyggs4ZTUjBVf5nKH1nOxGy
         wUR2F3wDWnvMTIilrFz2rOk6vKE7o9IZ4011hHdcv6IH9KzyC2J+uUCYDf1fjYWwIaya
         q9RFsWSeY5yfd9uXjC/1/ub0CyUVUqz2ZJzwNR8QeUytOoGtyP20VPWXqeGY4I2Ad4g8
         BByS69r20d2mxluQu5CWRXajoGJ5BIPnWQj2DAp9jI32CDO0YDqcLJ/qYOXDogz/Bwvk
         ADGOh66JPFFmW2ohyb+Bz7g+me/0lzNxWd7TDvx0LrkvccyU3F72aKDLYiEP2TAHi4yv
         /U3Q==
X-Gm-Message-State: AOAM531MKHRLWXlyMU3g69hhuvGt9CQ6AQxqByHHR189W3rufTdKdRMZ
        9ysG4CYswBS/42at2+4emLw/ZUHKrcaza2rB2Xk=
X-Google-Smtp-Source: ABdhPJydijqsMvtjaLmoHPPrREyqGqaZ4YCqz2q95mnRz4gPPCRqwZNZlRcODKQQrytXH4Xj4ITHAtmIEPyAvhOxAJw=
X-Received: by 2002:a5b:f47:: with SMTP id y7mr20016721ybr.340.1600101494187;
 Mon, 14 Sep 2020 09:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com> <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
In-Reply-To: <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
From:   Maxim Devaev <mdevaev@gmail.com>
Date:   Mon, 14 Sep 2020 19:38:03 +0300
Message-ID: <CAM4ZDbC7wqVdt0xV47Ht2wVNch7O6i=Xucp-RCduWeSJ1Ftipw@mail.gmail.com>
Subject: Re: [libgpiod] gpiomon loses events
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> I'm not sure I understood what's wrong here. 'Event' by definition is
> something that has already happened. If pin floats from 0 to 1 to 0
> you will get one rising and one falling event.

Well, it looks like something's wrong. Look, I took a Raspberry Pi 4
and libgpiod 1.5.2. Pin 13 receives a non-periodic signal. And here is
the result: https://gist.github.com/mdevaev/bcd6bb8e9c73383c88e410645c4d179=
7

Despite the fact that all event timestamps are increasing, I get a
large number of duplicate transitions without a reverse transition.
But the most important thing is the last line. I interrupted receiving
the signal, meaning the actual level at the end is 0. However, gpiomon
did not see this, and still believes that there is a 1. The reason for
this is that a single event on a line can contain up to 16 transition
events. However, the gpiomon tool and all python examples only read
the first event. I think this is a problem. I used the python sample
code in my project and was very surprised when my indicator showed the
1 state, but the actual state after the end of a series of events was
turned 0.

For the next example, I took the python implementation of gpiomon. The
git example behaves similarly to the C utility. I modified it as
follows: https://gist.github.com/mdevaev/70b9aa1505bd415167f3feb0e78e2f78
The result is: https://gist.github.com/mdevaev/776d8f8f600053fc42d019d92406=
641f

Here you can clearly see how several transition events are extracted
from a single line event. The timestamps are still consistently
increasing, however you still see several rising or falling without a
paired opposite event. Pay attention to the last 9 events. If I were
using a normal gpiomon at this point (which only reads the first event
on the line), I would skip the final falling. I see two problems here:
- The absence of the opposite pairs of events. I expected that for
every rising there should be a falling, but I don't see it. If that's
the way it should be, then fine. I admit, I didn't understand your
explanation about IRQ a bit, I'm sorry :)
- The second problem is that using the python example and the gpiomon
tool can lead to a desynchronization of understanding what state the
pin may actually be in. Both utilities should use
gpiod_line_event_read_multiple() instead of gpiod_line_event_read(),
as I think.

> It's how kfifo works, AFAIU it should rewrite first (older) ones.

In other words, it is the last transition event from a series of
events on the line that will reflect the current state of the pin,
right? Provided that there were no other events on the line.

=D0=BF=D0=BD, 14 =D1=81=D0=B5=D0=BD=D1=82. 2020 =D0=B3. =D0=B2 18:55, Andy =
Shevchenko <andy.shevchenko@gmail.com>:
>
> +Cc: libgpiod maintainers
>
> On Mon, Sep 14, 2020 at 6:54 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Sep 14, 2020 at 6:12 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Mon, Sep 14, 2020 at 1:40 PM Maxim Devaev <mdevaev@gmail.com> wrot=
e:
> > > >
> > > > Hi. I noticed a strange behavior of gpiomon and gpiomon.py. It seem=
s
> > > > that in some cases, if the signal arrives at the GPIO pin too quick=
ly,
> > > > the last event on it may be rising, despite the fact that the actua=
l
> > > > signal is already set to 0.
> > >
> > > I'm not sure I understood what's wrong here. 'Event' by definition is
> > > something that has already happened. If pin floats from 0 to 1 to 0
> > > you will get one rising and one falling event.
> > >
> > > > a Cursory study of the sources showed that
> > > > both of these utilities read only one (the first?) event from the
> > > > line. I changed gpiomon.py rby replacing read_event() to
> > > > read_event_multiply() and iterating by all events, and it looks lik=
e
> > > > the lost faling events were there.
> > > >
> > > > So, I have a few questions.
> > > >
> > > > 1) Is this really a bug in gpiomon, or is it intended to be?
> > > >
> > > > 2) If I use read_events_multiple(), can it skip some events? I noti=
ced
> > > > that sometimes I can get several falling and rising in a row.
> > > > Why is
> > > > this happening?
> > >
> > > I can assume that IRQ handler is reentrant and since it has been run
> > > in the thread we will get it messed up. The timestamp of the event
> > > (when recorded) should be used for serialization of events. But if my
> > > assumption is the case, we have to record it in a hard IRQ context.
> >
> > ...but this is exactly what we are doing in the latest code (didn't
> > check from which kernel it's a default approach).
> >
> > So, do you have the timestamps not paired?
> >
> > > > Shouldn't they be paired? Can the state transition,
> > > > i.e. the final falling or rising, be lost?
> > > >
> > > > 3) It seems there can only be 16 events in a line. What happens if
> > > > more events occur in one iteration of the loop, such as 20? The las=
t 4
> > > > events will be lost, they will be available in the next iteration o=
f
> > > > event_wait(), or the first 4 events in the current iteration will b=
e
> > > > discarded?
> > >
> > > It's how kfifo works, AFAIU it should rewrite first (older) ones.
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
> >
> >
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
>
>
>
> --
> With Best Regards,
> Andy Shevchenko
