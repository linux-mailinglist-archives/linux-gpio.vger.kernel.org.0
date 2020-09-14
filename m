Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1EF2690BA
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 17:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgINP4a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 11:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgINPzi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 11:55:38 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE36C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:55:38 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id k14so100955pgi.9
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UzV8BqvZdY8ZcLnE49QK8phz1nGON+YKNxfck/AOhrs=;
        b=L05u89JqjJRh+aJ4CVMhJcw++OtJyVR5PeXvfbMJgHIfbxg1UoimtZ6WCxGII2ifBZ
         IChX4UYvL3dr0RwUDIW0+/91saoUFqvwDQpBdQ0+Ev+O3MAd78q7l1x1Xg/z7PuJZhUA
         77BRZFWfyRQtHV6FXoGwyXtH2pWEgTjdgLI8R2zDyejjbWfBn4iqcfuGPSFrhabX/Mx5
         bov5eZIX4jJWIrr2lpqGm2VH/1EQTT225vM920oMgNwWe7k+g9AJ6ZpZBrZP0j7qzduH
         M20oaON/6Q5YO2eFGV801eHNVmQM7sHo9jCbTBhNN09bBL22QxsQnZMaNPToTGQbsxrj
         2PCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UzV8BqvZdY8ZcLnE49QK8phz1nGON+YKNxfck/AOhrs=;
        b=QnkAQpXLqlPK4Rv1VaBsATs2hUDYRRTU3MdHSnEafO2aSRzoc5mZjfDo0uQ0DZJN7k
         7ibCqATjXY8k+clE9a5FyR6LW2qCWMcGMqliOLyjNC1s/qbGLTq34sLFafMVelTFKTDB
         PbCBHcb+XiZF9QmA/H574iUIrAs6w+7Aq7oIFjf43oeEfHgFcz+/AsmAY6TsugLdcK1Y
         FtjRZ6aCJudNAMO8+zFwuRpkLMq2Lmyy0lgA5gBNwpUsjELNvMQ7DpQzb9t2mUwzD+9E
         P5mnG+pygh2Oj2i2MHOEoz5mm/3B0OmN0PuMM6FAsMvhBDWlXB/CGhGYhtAeNmJHDhNj
         IyAg==
X-Gm-Message-State: AOAM532Ipw0YKRXH+gn2jk4qaEtCSHz9PFmWllq4LfTuXsWTPOrBQFQu
        yvlg5Qr+6Qko7Y0X5gIr6QnOJQ9V+dm4L3r0AB0=
X-Google-Smtp-Source: ABdhPJzSEH80OU+b4Xowv3xICmBMpHwW1YtuqSf5KSfekalOTSlh6vIOqscYbY5G3m/F33vb0pX7IZrZSqbzoKgema0=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr10991415pgj.74.1600098938100;
 Mon, 14 Sep 2020 08:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com> <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
In-Reply-To: <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 18:55:20 +0300
Message-ID: <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
Subject: Re: [libgpiod] gpiomon loses events
To:     Maxim Devaev <mdevaev@gmail.com>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: libgpiod maintainers

On Mon, Sep 14, 2020 at 6:54 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 14, 2020 at 6:12 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Sep 14, 2020 at 1:40 PM Maxim Devaev <mdevaev@gmail.com> wrote:
> > >
> > > Hi. I noticed a strange behavior of gpiomon and gpiomon.py. It seems
> > > that in some cases, if the signal arrives at the GPIO pin too quickly,
> > > the last event on it may be rising, despite the fact that the actual
> > > signal is already set to 0.
> >
> > I'm not sure I understood what's wrong here. 'Event' by definition is
> > something that has already happened. If pin floats from 0 to 1 to 0
> > you will get one rising and one falling event.
> >
> > > a Cursory study of the sources showed that
> > > both of these utilities read only one (the first?) event from the
> > > line. I changed gpiomon.py rby replacing read_event() to
> > > read_event_multiply() and iterating by all events, and it looks like
> > > the lost faling events were there.
> > >
> > > So, I have a few questions.
> > >
> > > 1) Is this really a bug in gpiomon, or is it intended to be?
> > >
> > > 2) If I use read_events_multiple(), can it skip some events? I noticed
> > > that sometimes I can get several falling and rising in a row.
> > > Why is
> > > this happening?
> >
> > I can assume that IRQ handler is reentrant and since it has been run
> > in the thread we will get it messed up. The timestamp of the event
> > (when recorded) should be used for serialization of events. But if my
> > assumption is the case, we have to record it in a hard IRQ context.
>
> ...but this is exactly what we are doing in the latest code (didn't
> check from which kernel it's a default approach).
>
> So, do you have the timestamps not paired?
>
> > > Shouldn't they be paired? Can the state transition,
> > > i.e. the final falling or rising, be lost?
> > >
> > > 3) It seems there can only be 16 events in a line. What happens if
> > > more events occur in one iteration of the loop, such as 20? The last 4
> > > events will be lost, they will be available in the next iteration of
> > > event_wait(), or the first 4 events in the current iteration will be
> > > discarded?
> >
> > It's how kfifo works, AFAIU it should rewrite first (older) ones.
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



-- 
With Best Regards,
Andy Shevchenko
