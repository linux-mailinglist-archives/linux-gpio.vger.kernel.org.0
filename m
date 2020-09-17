Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B5B26D937
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 12:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgIQKhl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 06:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgIQKhO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 06:37:14 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12CC7C06174A
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 03:37:09 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id h206so1311893ybc.11
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 03:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sv9mZuXXv+waigilYd/Yq/LJxWbjiWuYw2Z+C7OiwOQ=;
        b=ay6Hl8F19y6fd7u22ixyaqZwRaSIRpN/oZQtkNImeke0nMNg6E8FGV+U9ngN9flDgy
         eD4v6exkOhqICkCx3PPKANoIC3X9GE0CVjC2Wyq29to0B38ojrtgcAAiAEpvY7CD6ayd
         9V1H/JXQqmYb628ZnKkQUku0dN8C3DMvwpZmuuwN55WIBfWhsL/p/7Gqww8EuA/gZCIG
         RdhQxzuBEbgQ///QMemGEMFCnYrrV5X8a0CbHY/+nzyBvcRMuzz2VgBB0e2hHdT8LSVx
         DD7D/jsyKC7cB3S/9dJSKBTe11O13Dg6hJI1fsL7TsB/Fh/kFG5qt2Ob1mjgDQt7cC4o
         Hlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sv9mZuXXv+waigilYd/Yq/LJxWbjiWuYw2Z+C7OiwOQ=;
        b=P7gsuQDrgBL3ICUOdP00ZtG8LIp1dGkGuH/kqli/bU9W9FBrJVenCsC12VzX3KuIRn
         NbcdxP/oGXx4eO+DjqpTl8cAtjCiXjX9rqdperBi+Gs+KSyD8ePPegMpB3pfSsD6DeLC
         TjqCORZ01JtxbbuQ89Had037zftaawRdFTVxZ3NMPrwsnev8nGUjONBKimeK3ULlTJIt
         JcD/hzkpetKsRCTciHL15+6InRQOIC+2CyntGXUt+ndGgTGftIzdY9DVsHfl8jPUaSRI
         nR9mP0tLgMSaNVfppGm2nzTPY6clb+C2la0/gAS7XVDtGgnvb3E1LZ1RLU5fOFD3Uv3X
         xKuw==
X-Gm-Message-State: AOAM531I4Ji/PSxkc5AyQ7RRlc2dT67jMQY3xKmdttcXuDNP0//dfRdA
        TFlMfLt4PUkPmn4g4a3ETKiR3QJqO9/Hv9vPAbk=
X-Google-Smtp-Source: ABdhPJyY3/lGK0eJ0PMd+3kpAGLAKQgmAW33iA6nd5CseOYRNUqvJ83UI8gPR5lxAWYfBflKcalbNrLp0ey8dgsDrpE=
X-Received: by 2002:a25:5882:: with SMTP id m124mr408173ybb.209.1600339028027;
 Thu, 17 Sep 2020 03:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
 <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
 <20200915004541.GC4138@sol> <20200915033428.GA14286@sol> <CAM4ZDbAeLcZt3TaWQ7AH-VapR6fx9WrcHFT+v_MnXiL17Hu-9Q@mail.gmail.com>
 <20200915135732.GA100294@sol> <CAMRc=MdbZh2CE3BXg0gg6CJxMGonvUN=yFc4kjXjUnkduwJgpA@mail.gmail.com>
 <20200916095734.GA32888@sol>
In-Reply-To: <20200916095734.GA32888@sol>
From:   Maxim Devaev <mdevaev@gmail.com>
Date:   Thu, 17 Sep 2020 13:36:56 +0300
Message-ID: <CAM4ZDbCvTsQ9QyW9bF2n-noF1+kArZpCb216W9tf7X=tqSHhwg@mail.gmail.com>
Subject: Re: [libgpiod] gpiomon loses events
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi again and sorry for delay.

> I already applied the patch to the master branch and backported it to
> v1.5.x[1]. Please give it a try. I will make a bugfix release soon
> too.

Everything seems to be working fine now. In any case, I plan to use
event_read_multiple (), just for reasons of paranoia (and for older
versions) :)

> If you are losing events then this is what you will get.
> No attempt is made in the kernel or libgpiod to keep rising and falling
> events paired (until debounce support in GPIO CDEV uAPI v2 arrives).

Okay, thanks. I will take this into account.

> What is your use case?  Are you seeing these problems in practice or
> only because you are generating events faster than you service them
> for testing?

I make an IP-KVM and use GPIO to read the status of the HDD led on the
managed server's motherboard. This led operates in PWM mode, and if
the frequency is high enough and then the activity is stopped, then
there is a chance that the actual state of the led will be 0, while
the last state received from the library will be 1.

=D1=81=D1=80, 16 =D1=81=D0=B5=D0=BD=D1=82. 2020 =D0=B3. =D0=B2 12:57, Kent =
Gibson <warthog618@gmail.com>:
>
> On Wed, Sep 16, 2020 at 11:29:00AM +0200, Bartosz Golaszewski wrote:
> > On Wed, Sep 16, 2020 at 2:27 AM Kent Gibson <warthog618@gmail.com> wrot=
e:
> > >
> > > On Tue, Sep 15, 2020 at 10:34:31AM +0300, Maxim Devaev wrote:
> > > > > The bug was introduced in libgpiod v1.5 so, depending on your
> > > > > circumstances, I would revert to an earlier libgpiod or apply my =
patch.
> > > > > ...
> > > >
> > > > Is this behavior documented somewhere? It's a complete surprise to =
me
> > > > that this is how it works. I expected to lose the old events. It se=
ems
> > > > to me that for software that catches edge, the loss of new events i=
s a
> > > > serious problem, since it can lead to a desynchronization of the
> > > > physical state of the pin and the user's information about it. For
> > > > example, if event 16 was falling and event 17 was rising, and the
> > > > signal stopped changing and remains at 1, the kernel will tell us t=
hat
> > > > it was only falling (i.e. 0), while the real state will be 1.
> > > >
> > > > If we lose events in any case, then in my opinion it is much more
> > > > important to keep the current state, not the past. I can't think of=
 a
> > > > case where the loss of old events can lead to problems, but the
> > > > desynchronization of the current state actually means that the
> > > > software can make the wrong decision in its logic based on the
> > > > driver's lies. Yes, this would be a breaking change, but it seems t=
o
> > > > me that it is the current behavior that is incorrect. Don't get me
> > > > wrong, I don't insist on it. If this decision was made for certain
> > > > reasons, I would like to understand where I am wrong.
> > > >
> > >
> > > I agree - it makes more sense to discard the older events.
> > > The existing behaviour pre-dates me, so I'm not sure if it is
> > > intentional and if so what the rationale for it is.
> > >
> >
> > While it predates me too (Linus: any particular reason to do it like
> > this?) I think that requesting events from user-space is a contract
> > where the user-space program commits to reading the events fast enough
> > to avoid this kind of overflow. In V2 we can adjust the size of the
> > queue to make it bigger if the process isn't capable of consuming all
> > the data as they come.
> >
>
> For sure, but if there is an overflow for whatever reason - maybe they
> need to debounce ;-) - then it would be preferable for the final event
> to correspond to the current state.
>
> > > And I'm still trying to think of a case where it would be harmful to
> > > change this behaviour - what could it break?
> > >
> >
> > Well, I wouldn't change it in V1 but since V2 is a new thing - I think
> > it should be relatively straightforward right? If we see the kfifo is
> > full, we should simply consume the oldest event on the kernel side,
> > drop it and add in the new one. Maybe worth considering for v9? I
> > don't see any cons of this and this behavior is quite reasonable.
> >
>
> It is pretty straight forward - my current patch for this looks like:
>
> @@ -537,9 +537,15 @@ static irqreturn_t edge_irq_thread(int irq, void *p)
>         le.seqno =3D (lr->num_lines =3D=3D 1) ? le.line_seqno : line->req=
_seqno;
>         le.offset =3D gpio_chip_hwgpio(line->desc);
>
> -       ret =3D kfifo_in_spinlocked_noirqsave(&lr->events, &le,
> -                                           1, &lr->wait.lock);
> -       if (ret)
> +       overflow =3D false;
> +       spin_lock(&lr->wait.lock);
> +       if (kfifo_is_full(&lr->events)) {
> +               overflow =3D true;
> +               kfifo_skip(&lr->events);
> +       }
> +       kfifo_in(&lr->events, &le, 1);
> +       spin_unlock(&lr->wait.lock);
> +       if (!overflow)
>                 wake_up_poll(&lr->wait, EPOLLIN)
>
> I'll incorporate that into v9.
>
> Cheers,
> Kent.
>
