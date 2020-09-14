Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6027268F4A
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 17:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgINPMy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 11:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbgINPMr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 11:12:47 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9497C06174A
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:12:42 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id g29so39114pgl.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 08:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ObshwgAbv+WRzMSkofb9FmvMT5/I3e3y2AVlBsuc6Uo=;
        b=b8WQXXzrqpnymCz3VKUVIwli7Ud+87x6AqoRIMRF6vBOuVoI4lHli134cxq8EqrKEB
         CAHDxkoi2j+890t3WOkJ2Itj7ySC0o9g6syM1xGTQiZWV375bi0REzH5ZzZ1FJ7F/VAh
         uS8jy4BYik+HpIa6IcQ4Qa7JkL0bIt405mraWYOd3uZfJJlgrs+ZT7Qx4a/FnZEJ76YV
         iPUsAzrmSI87xHazzfgERvGhGBB8JUjHklKZyOYE/DbDWcplNdfikg9fcrwYsDXjb/fs
         W+J/41gqv+cguBh/zbGULWeoY2PBKhgrSYU6wSFX8kCQF+0GuZ6FInjTFziisDwoI5Ws
         7TUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ObshwgAbv+WRzMSkofb9FmvMT5/I3e3y2AVlBsuc6Uo=;
        b=dLX9fAKxtw4PyK2IFtiMk19DdIRs8O2qdHX7ah6xFwWOLyRmGoERQnwHVEj/IybS9x
         JoJQ24o9IIE74uUrbBYsBIx5BcfmRbbT1aeVjk8YJARrV+hhnxriKOH14kJ3NPsetYyZ
         gMCPs5Ns/k0dIRc7XBpASKznvSgaC/J5pm5uvYSmrR58yTeIvld7Fay8114Dy0kN45xW
         TX1+1xVouybTj0QHvCecPQhvKbtoNvotPD3aLeGuXsiYTfqWovh1hoS06/V5OyCX9MdU
         ZyYST5ieeSAi2Ix9IlbbG2A7q8W0/ztQ7pFjDaLNlXe8AOHq898km/9hi/c8P2hDJQ0f
         yBbg==
X-Gm-Message-State: AOAM5311RphSS50CgSxmUQeRoqrgUBwUl3UdZWc5va/eItb3Ms/GjX+L
        Ta+snf37WRodLnRy5oWBGv5sOO14L0y4VIAVK5E=
X-Google-Smtp-Source: ABdhPJxm+ehWUnRE2ly2INcBJeiEgs3nBFoaqxw9qvCL6CUSOgR62meeviEQEM3pxNsY2ErJcI01ZURYirpYUB2y0UM=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr10852490pgj.74.1600096361808;
 Mon, 14 Sep 2020 08:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
In-Reply-To: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 14 Sep 2020 18:12:24 +0300
Message-ID: <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
Subject: Re: [libgpiod] gpiomon loses events
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 1:40 PM Maxim Devaev <mdevaev@gmail.com> wrote:
>
> Hi. I noticed a strange behavior of gpiomon and gpiomon.py. It seems
> that in some cases, if the signal arrives at the GPIO pin too quickly,
> the last event on it may be rising, despite the fact that the actual
> signal is already set to 0.

I'm not sure I understood what's wrong here. 'Event' by definition is
something that has already happened. If pin floats from 0 to 1 to 0
you will get one rising and one falling event.

> a Cursory study of the sources showed that
> both of these utilities read only one (the first?) event from the
> line. I changed gpiomon.py rby replacing read_event() to
> read_event_multiply() and iterating by all events, and it looks like
> the lost faling events were there.
>
> So, I have a few questions.
>
> 1) Is this really a bug in gpiomon, or is it intended to be?
>
> 2) If I use read_events_multiple(), can it skip some events? I noticed
> that sometimes I can get several falling and rising in a row.
> Why is
> this happening?

I can assume that IRQ handler is reentrant and since it has been run
in the thread we will get it messed up. The timestamp of the event
(when recorded) should be used for serialization of events. But if my
assumption is the case, we have to record it in a hard IRQ context.

> Shouldn't they be paired? Can the state transition,
> i.e. the final falling or rising, be lost?
>
> 3) It seems there can only be 16 events in a line. What happens if
> more events occur in one iteration of the loop, such as 20? The last 4
> events will be lost, they will be available in the next iteration of
> event_wait(), or the first 4 events in the current iteration will be
> discarded?

It's how kfifo works, AFAIU it should rewrite first (older) ones.

-- 
With Best Regards,
Andy Shevchenko
