Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12AA26B7A3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 02:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgIPA0v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 20:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbgIOOH6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 10:07:58 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE804C0611BD
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 06:57:38 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d9so1994696pfd.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LfluhA8n5mrFmhkPdla64U4md3gVA1qS/Hh8gYPUDX0=;
        b=ApdwLhZSa5nAvv6QP98OGAKTHjqjx/y0+YDwXA40mZcHDwkB1y/MhMKzAA+wcK/uN7
         JaVSRXKQ+CGvAPCn57Hea7p+iPfx9rvZbvvyY0qv1izh9B2YtkK02cN+kzQlI3xygeLr
         eVobC+qFRw8D7f3Ju09Gq+nphOVn0/w8U0Uds8r6J0ZHhzIE50q9LNjuFOIcy7GIGvyT
         Iax6WLH1uYOYnzMhZoQF2sAp6bKjYIAO1NhBIwp960q+M8nVpBPIz2lQPix225PVHHF6
         NQdpQZam2tc3gNRtzfouS9FnSZiAevVFAmWjTG4Bl6Mm6I46B18E5ndPvJBVpUO/kkfB
         tLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LfluhA8n5mrFmhkPdla64U4md3gVA1qS/Hh8gYPUDX0=;
        b=AdHooMvDrJNgTHxcHuVh56q5Cfn95rOP35swwRmAy7/W6uJlZu3whJKy4CViQddJE4
         K+Tp1pRblPQuvrNljlz6e6HFtkWX/muuNll1aQV35R89JBcBbOy6Bu7jk+AlrAoGOHel
         I5DAiSjCLlXzLIBPX54czFH1l31ml4Yo79B6MpEPlVjVXEGF70fgyNda9+FL5YVY1Sdd
         zre7e7pUsAroMS90mxOYA2fvITYOMQCoKxxFhj31k7edTwTQxttb8MGrlD1E2D1E0mfH
         bYnU98w7h7BGlRZXrOOnNsSO5ELP8qcjh5OuVG+zGLeXiLirfQfEREBrR+gCZMvNOL69
         rqKg==
X-Gm-Message-State: AOAM531+d0UGijxzBToHeRAyDq6YUpf7nwQaikMy7QP1At3bOOdB6lIR
        +eY2F4UOCjCutWh+4egYrqE=
X-Google-Smtp-Source: ABdhPJw2bkMhutKFnSzhtbqCkBNZbjH7MPE0OqPHZHWt9+ErPUNs7p0PMOj1wfm6EMUhN/C+PpmbLg==
X-Received: by 2002:a63:36cc:: with SMTP id d195mr15219588pga.426.1600178258206;
        Tue, 15 Sep 2020 06:57:38 -0700 (PDT)
Received: from sol (106-69-184-100.dyn.iinet.net.au. [106.69.184.100])
        by smtp.gmail.com with ESMTPSA id ga3sm12625651pjb.18.2020.09.15.06.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 06:57:37 -0700 (PDT)
Date:   Tue, 15 Sep 2020 21:57:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] gpiomon loses events
Message-ID: <20200915135732.GA100294@sol>
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
 <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
 <20200915004541.GC4138@sol>
 <20200915033428.GA14286@sol>
 <CAM4ZDbAeLcZt3TaWQ7AH-VapR6fx9WrcHFT+v_MnXiL17Hu-9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM4ZDbAeLcZt3TaWQ7AH-VapR6fx9WrcHFT+v_MnXiL17Hu-9Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 10:34:31AM +0300, Maxim Devaev wrote:
> > The bug was introduced in libgpiod v1.5 so, depending on your
> > circumstances, I would revert to an earlier libgpiod or apply my patch.
> > ...
> 
> Is this behavior documented somewhere? It's a complete surprise to me
> that this is how it works. I expected to lose the old events. It seems
> to me that for software that catches edge, the loss of new events is a
> serious problem, since it can lead to a desynchronization of the
> physical state of the pin and the user's information about it. For
> example, if event 16 was falling and event 17 was rising, and the
> signal stopped changing and remains at 1, the kernel will tell us that
> it was only falling (i.e. 0), while the real state will be 1.
> 
> If we lose events in any case, then in my opinion it is much more
> important to keep the current state, not the past. I can't think of a
> case where the loss of old events can lead to problems, but the
> desynchronization of the current state actually means that the
> software can make the wrong decision in its logic based on the
> driver's lies. Yes, this would be a breaking change, but it seems to
> me that it is the current behavior that is incorrect. Don't get me
> wrong, I don't insist on it. If this decision was made for certain
> reasons, I would like to understand where I am wrong.
> 

I agree - it makes more sense to discard the older events.
The existing behaviour pre-dates me, so I'm not sure if it is
intentional and if so what the rationale for it is.

And I'm still trying to think of a case where it would be harmful to
change this behaviour - what could it break?

> I see a specific workaround and for this behavior, when the read
> timeout occurs, I can re-read the batch of all lines to check if the
> state has changed. But it partially makes it meaningless to wait for
> events. I still have to manually check if anything is lost or if the
> driver has started lying to me. Here the example:
> https://github.com/pikvm/kvmd/blob/7cdf597/kvmd/aiogp.py#L102
> 
> The fact is that after reading the presentation from Bartosz
> Golaszewski and seeing the line "Events never get lost!", I was
> impressed and satisfied, but the situation was not so happy:
> https://ostconf.com/system/attachments/files/000/001/532/original/Linux_Piter_2018_-_New_GPIO_interface_for_linux_userspace.pdf?1541021776
> 

To be fair, the slide in question is comparing SYSFS with CDEV.
With the SYSFS API it is impossible to queue events in the kernel.
CDEV can provide a queue, it is even in the slide, but all queues
are finite and so can only help iron out bursts - they aren't magic.
On average you need to be able to service the events at the rate
they are arriving or the queue will eventually overflow.

> BTW what about unpaired falling-rising events? Is this how it should be?
> 

If you are losing events then this is what you will get.
No attempt is made in the kernel or libgpiod to keep rising and falling
events paired (until debounce support in GPIO CDEV uAPI v2 arrives).

What is your use case?  Are you seeing these problems in practice or
only because you are generating events faster than you service them
for testing?

Cheers,
Kent.
