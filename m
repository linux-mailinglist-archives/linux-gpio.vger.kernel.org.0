Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B0A269AA4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 02:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgIOApu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 20:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgIOApr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 20:45:47 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9E8C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 17:45:46 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id e4so418086pln.10
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 17:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6UShhjDjGNsI3rqXCV0GUc4F3My1ZufB9jyWFmCe45I=;
        b=CueY6ftfigbIZe7+3RkByr5U/j2Pu7jSpsUST04aEeYhODl9JjOAFjP1o8zYULIWlU
         BStcvalE0/8K13ySK0p9OL7UxBv8Ff0YF3W6uxn9iEMQW99GkqO5vVYv/ze9UWJS6ATg
         msmAy68wjtog3EalVGZ6ksXniu27xp1KqFRSPsz3zUtG0Fjfc6bmWDW2FBP11uCFLIv/
         Ow26nioZlKgaKFGhwAjDix77nhvqxq6Hstzl6nAnYMR22J8fy1/qAhySTDhoKjuIIHit
         ha256cJLNFp9gqEgr4m00RqWUlZRcAHlBQwewaYsQZo4VMLpuG4OQ54bvOb0GAdSBZzP
         bKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6UShhjDjGNsI3rqXCV0GUc4F3My1ZufB9jyWFmCe45I=;
        b=RatLKk+WoEj4mZNYQTyDlkn4SHiRIppEuN4OL8ovpCU5qNQAAyoTf7XFhYWDFDfBJ2
         3us+cEZK7yLV9K7KnEUhbY33cSb8PNdBMp+b4DiiWMDwUBN5OMJ1uDOJ+O/iDveT8sae
         HSfCnL/1YCFkio5SRRhR+HwxfpIxT4pmkW+rxY4ej970cSDvBtW4ZyM0iheipadbyVj8
         DUjIfRkx1eyntddguf3X1KnObZTBFBBl7zaJsdz/Pra6HAt6pP0IccDTkqEpTib7QQjq
         JtzCNwW4/aK1ePQVZ+07fJD/x++tC8mva5p6m+TPZUEV3Y55Jff0QYqdH18qyoSCQWI8
         wqwA==
X-Gm-Message-State: AOAM532TUJ9YLEY+w0ZLCs234Lpx3MPHIYqguk76jSoqm2GjhdBKRWBb
        6Q6UNqYzga647Uzzj2iCaBo=
X-Google-Smtp-Source: ABdhPJxwjIzt9MJHuzNLOwO3HuxesgQz0lIvuHdJ+oP5wzFiBkmTiT0AVNZGeqIPAPW044RX1ab4RQ==
X-Received: by 2002:a17:902:9e08:b029:d0:8a6a:d5e8 with SMTP id d8-20020a1709029e08b02900d08a6ad5e8mr16642522plq.0.1600130746396;
        Mon, 14 Sep 2020 17:45:46 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id h5sm9726579pgn.75.2020.09.14.17.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 17:45:45 -0700 (PDT)
Date:   Tue, 15 Sep 2020 08:45:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] gpiomon loses events
Message-ID: <20200915004541.GC4138@sol>
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
 <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 06:55:20PM +0300, Andy Shevchenko wrote:
> +Cc: libgpiod maintainers
> 
> On Mon, Sep 14, 2020 at 6:54 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Sep 14, 2020 at 6:12 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Mon, Sep 14, 2020 at 1:40 PM Maxim Devaev <mdevaev@gmail.com> wrote:
> > > >
> > > > Hi. I noticed a strange behavior of gpiomon and gpiomon.py. It seems
> > > > that in some cases, if the signal arrives at the GPIO pin too quickly,
> > > > the last event on it may be rising, despite the fact that the actual
> > > > signal is already set to 0.
> > >

Hi Maxim,

It looks like you have run across a bug in libgpiod, that I recently submitted
a patch for, whereby reading events can discard events from the kfifo.
The discarded events are the most recent.
The problem is particularly bad for reading single events, as gpiomon
does - any other events in the kfifo will be lost.

The bug was introduced in libgpiod v1.5 so, depending on your
circumstances, I would revert to an earlier libgpiod or apply my patch.
(let me know if you can't find it and I'll send you a copy).

A workaround with the unpatched v1.5.x is to only read events using
gpiod_line_event_read_fd_multiple(), or one of the functions that wrap
it, with num_lines=16.
For the python binding that would be event_read_multiple() - as you have
discovered.

> > > I'm not sure I understood what's wrong here. 'Event' by definition is
> > > something that has already happened. If pin floats from 0 to 1 to 0
> > > you will get one rising and one falling event.
> > >
> > > > a Cursory study of the sources showed that
> > > > both of these utilities read only one (the first?) event from the
> > > > line. I changed gpiomon.py rby replacing read_event() to
> > > > read_event_multiply() and iterating by all events, and it looks like
> > > > the lost faling events were there.
> > > >
> > > > So, I have a few questions.
> > > >
> > > > 1) Is this really a bug in gpiomon, or is it intended to be?
> > > >
> > > > 2) If I use read_events_multiple(), can it skip some events? I noticed
> > > > that sometimes I can get several falling and rising in a row.
> > > > Why is
> > > > this happening?
> > >

Generated events are buffered in the kernel - to a point.  Beyond that
any new events are discarded.  The current limit is hard coded in the
kernel at 16.

Also, if you toggle the line faster than the kernel can service the
resulting interrupts then you can lose events.

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
> > > > more events occur in one iteration of the loop, such as 20? The last 4
> > > > events will be lost, they will be available in the next iteration of
> > > > event_wait(), or the first 4 events in the current iteration will be
> > > > discarded?
> > >
> > > It's how kfifo works, AFAIU it should rewrite first (older) ones.
> > >

The edge detection in the kernel only writes to the kfifo if it is NOT
full, so it actually discards the most recent - you will only get the
first 16 events. The last 4 events of your 20 will be lost.

I would actually prefer it worked as Andy thinks it does as the more
recent events are generally more valuable.
Bart, do you have any opinion on that?
(this would be for uAPI v2, not lineevent, so as not to alter existing
behaviour)

We are working on changes that will make debugging cases such as this
easier, as well as allowing some userspace control over the event
buffer size, but those wont be available until libgpiod v2.

Cheers,
Kent.
