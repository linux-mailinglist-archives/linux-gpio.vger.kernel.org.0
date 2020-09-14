Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EB92690B6
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 17:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgINPy6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 11:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgINPyr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 11:54:47 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21F4FC06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:54:47 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id l126so12995523pfd.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/7zDjQiSuKrMSm3MyAYPeIrqco74yWNaePqfby1dK7Q=;
        b=hp0WBE7IYbqKSMy8B0cCYdOvlRIrm0gBkSXsHatoGrX6ADHH3HicPqWYylKbWxqauQ
         ycaLEWj16g2Yi73n6cHAyjsrPtfvJjtin8U/0W/9Uz5cPBjAMPL5YaVjQM3+SKaCw6c7
         QImAzJP/uPKOnjTlA3YqHk6//iISnCHhkV+42VG+wddrOf8DLEBSa4tyMpaDl3CC8e3t
         KoClIqDmJn4t2tbxT/fWVeKhMSQy3r3Ll6dSoTbEqpg4hONN9t+aY+i8ANmCt+HTJc2l
         JtpPAG+FB+tj30vH4rBMthLLK2tvJ2vbm4x/dFJ6K/fIi6O3SmjPLtlV8QyXr+d5023R
         P/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/7zDjQiSuKrMSm3MyAYPeIrqco74yWNaePqfby1dK7Q=;
        b=plREuAlYn4bbYRJRd6cWzSEo8AKkX/a/teZycGLrsBws7NkHaDtP6c5M2pOe7oo62N
         3Xozp0ll48EoMVTxcZtIP/S6F3DjhI4BsP/gg7URfyr7/dVFM3bGAr99AUQel6zvbMAD
         w2pB0FDl2wWmDGnC64vVQM9OTfLg3zbF2vnsBr6/mBQf+fybLU8x+79dGybzuLSSF9vD
         LLGPMZl3MsTtxmbD1uBb3o4nRBim267auI24JtAmAWu3Tnp0qDK+C5jBAugk0sIVrF2+
         XNUzxn+hwoJWq/RCpPsv6lhf6WWG39GXsWSUu7S4PBEITBtMtp5fqcUjqDZE/sjUv/3O
         bbgA==
X-Gm-Message-State: AOAM530M06LlHoKcQ+A7B//MKGx6BdyFG9DBnzk+HPKZx4apulX9+jL4
        1LGEEbhKvUIXsmRNTc6HFGhGsOKQOd8iSfrOoiu4n0N0dMy6tA==
X-Google-Smtp-Source: ABdhPJzYRFrr3LGSDt2fLGF1wtUFhgCsaQBbZmh7tj4yjXlDwbF1CVrfVIdQpSJEmY9Kbtc94f60ns55iZTBOrsl5/I=
X-Received: by 2002:a62:ed08:: with SMTP id u8mr1934752pfh.130.1600098883954;
 Mon, 14 Sep 2020 08:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
In-Reply-To: <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 18:54:26 +0300
Message-ID: <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
Subject: Re: [libgpiod] gpiomon loses events
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 6:12 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 14, 2020 at 1:40 PM Maxim Devaev <mdevaev@gmail.com> wrote:
> >
> > Hi. I noticed a strange behavior of gpiomon and gpiomon.py. It seems
> > that in some cases, if the signal arrives at the GPIO pin too quickly,
> > the last event on it may be rising, despite the fact that the actual
> > signal is already set to 0.
>
> I'm not sure I understood what's wrong here. 'Event' by definition is
> something that has already happened. If pin floats from 0 to 1 to 0
> you will get one rising and one falling event.
>
> > a Cursory study of the sources showed that
> > both of these utilities read only one (the first?) event from the
> > line. I changed gpiomon.py rby replacing read_event() to
> > read_event_multiply() and iterating by all events, and it looks like
> > the lost faling events were there.
> >
> > So, I have a few questions.
> >
> > 1) Is this really a bug in gpiomon, or is it intended to be?
> >
> > 2) If I use read_events_multiple(), can it skip some events? I noticed
> > that sometimes I can get several falling and rising in a row.
> > Why is
> > this happening?
>
> I can assume that IRQ handler is reentrant and since it has been run
> in the thread we will get it messed up. The timestamp of the event
> (when recorded) should be used for serialization of events. But if my
> assumption is the case, we have to record it in a hard IRQ context.

...but this is exactly what we are doing in the latest code (didn't
check from which kernel it's a default approach).

So, do you have the timestamps not paired?

> > Shouldn't they be paired? Can the state transition,
> > i.e. the final falling or rising, be lost?
> >
> > 3) It seems there can only be 16 events in a line. What happens if
> > more events occur in one iteration of the loop, such as 20? The last 4
> > events will be lost, they will be available in the next iteration of
> > event_wait(), or the first 4 events in the current iteration will be
> > discarded?
>
> It's how kfifo works, AFAIU it should rewrite first (older) ones.
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
