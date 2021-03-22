Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81BAA3438FD
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 07:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhCVGB2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 02:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhCVGA7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 02:00:59 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA363C061574;
        Sun, 21 Mar 2021 23:00:54 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so7940966pjb.2;
        Sun, 21 Mar 2021 23:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0WFpTnoFKRhhfXIpK9M98T3Wdznu9u55Il92MVL253g=;
        b=pKDKx8ENAdzhp+Asv06L9honieS8lcPrAx1Bw3PNeyFWeRNZVBRcBvMkZnWkh0sFVV
         TKARWaQNc7boHcbxdJ550EbNg1gF9UYo7DaZ3quK8EBdgZXvwvAAvdYojptky20zsIwP
         s4yk+xeGSc0rmdH6Cc+OIuUUprQYXRUjYP3fyFbWGZM32MtRuuyHhmTOXhmLhFy+G9SW
         JEqVmBzyz2qqhrADGlpxOqLPPYz0J6CV52U3ZbbuXlTsSmZMjHQqDpAPokz00upSiJ7a
         TgCwoZtb1g5unneWvCpsVVxneKUWzkOHiALisTrkYhcvJg+pQgVvokVRa52ddr6bC+9u
         73qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0WFpTnoFKRhhfXIpK9M98T3Wdznu9u55Il92MVL253g=;
        b=YAZmJ0fx7EYv1tc/K65kqNkU+/b0IqZ9qviCBAg7pKYJSo/bl20GCvddH20chgEOCO
         kuV7OfRN91D90RqObJe6pw0g7uYx8hLCOykIeaaDSEu1XdzZXa/dbEYoZXTqPhxIjdpa
         +Z5gTiL1gn1BjOpmcJSL54tcU0vuwy4krmEF1xDchqWezgzqnHYujGiW+IZ7FBIY2Jav
         L/4kSkz218cfOZPuxSg2Wfq4iasD3ejQSKE/zAum3cPR6tj4GDjSdDsonjZXUGM/fcJm
         P38C3eeml6R4f7BRriiQddiAC6DD4znuny4LX+GorAfj60A3U9eAioXWZ5l3171VdOcx
         ZW9w==
X-Gm-Message-State: AOAM533i45YwNSoIT2CJk895Dhb/mQj37Z+G7E7UK5nEABGzac9oIdve
        r27ptO1FE0Sk/qGplTYGz+I=
X-Google-Smtp-Source: ABdhPJyslgxUB6OqND52kxjf3UcLiwlr4DVAk+Sxej+x1/pYZxp7xrLgS7+cHceZ72YKKtxD4lS1+A==
X-Received: by 2002:a17:90a:ff0f:: with SMTP id ce15mr11689305pjb.15.1616392854026;
        Sun, 21 Mar 2021 23:00:54 -0700 (PDT)
Received: from sol (106-69-186-212.dyn.iinet.net.au. [106.69.186.212])
        by smtp.gmail.com with ESMTPSA id 142sm12281548pfz.196.2021.03.21.23.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 23:00:53 -0700 (PDT)
Date:   Mon, 22 Mar 2021 14:00:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Dipen Patel <dipenp@nvidia.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <richardcochran@gmail.com>
Subject: Re: GTE - The hardware timestamping engine
Message-ID: <20210322060047.GA226745@sol>
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
 <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Mar 20, 2021 at 12:56:36PM +0100, Linus Walleij wrote:
> Hi Dipen,
> 
> thanks for your mail!
> 
> I involved some other kernel people to get some discussion.
> I think Kent Gibson can be of great help because he is using
> GPIOs with high precision.
> 

Actually I just extended the cdev uAPI to provide the REALTIME option,
which was the event clock until we changed to MONOTONIC in Linux 5.7,
as there were some users that were requiring the REALTIME clock.

> We actually discussed this a bit when adding support for
> realtime timestamps.
> 
> On Wed, Mar 17, 2021 at 11:29 PM Dipen Patel <dipenp@nvidia.com> wrote:
> 
> > Nvidia Tegra SoCs have generic timestamping engine (GTE) hardware module which
> > can monitor SoC signals like IRQ lines and GPIO lines for state change, upon
> > detecting the change, it can timestamp and store in its internal hardware FIFO.
> > The advantage of the GTE module can be realized in applications like robotics
> > or autonomous vehicle where it can help record events with precise timestamp.
> 
> That sounds very useful.
> 

Indeed - it could remove the latency and jitter that results from
timestamping events in the IRQ handler.

> Certainly the kernel shall be able to handle this.
> 
> > ============
> > For GPIO:
> > ============
> > 1.  GPIO has to be configured as input and IRQ must be enabled.
> > 2.  Ask GPIO controller driver to set corresponding timestamp bit in the
> >     specified GPIO config register.
> > 3.  Translate GPIO specified by the client to its internal bitmap.
> > 3.a For example, If client specifies GPIO line 31, it could be bit 13 of GTE
> >     register.
> > 4.  Set internal bits to enable monitoring in GTE module
> > 5.  Additionally GTE driver can open up lanes for the user space application
> >     as a client and can send timestamping events directly to the application.
> 
> I have some concerns:
> 
> 1. GPIO should for all professional applications be used with the character
> device /dev/gpiochipN, under no circumstances shall the old sysfs
> ABI be used for this. In this case it is necessary because the
> character device provides events in a FIFO to userspace, which is
> what we need.
> 

The cdev uAPI would certainly be the most sensible place to expose
this to userspace - its line events being a direct analog to what the GTE
provides.

> The timestamp provided to userspace is an opaque 64bit
> unsigned value. I suppose we assume it is monotonic but
> you can actually augment the semantics for your specific
> stamp, as long as 64 bits is gonna work.
> 
> 2. The timestamp for the chardev is currently obtained in
> drivers/gpio/gpiolib-cdev.c like this:
> 
> static u64 line_event_timestamp(struct line *line)
> {
>         if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
>                 return ktime_get_real_ns();
> 
>         return ktime_get_ns();
> }
> 
> What you want to do is to add a new flag for hardware timestamps
> and use that if available. FLAG_EVENT_CLOCK_HARDWARE?
> FLAG_EVENT_CLOCK_NATIVE?
> 

HARDWARE looks better to me, as NATIVE is more vague.

> Then you need to figure out a mechanism so we can obtain
> the right timestamp from the hardware event right here,
> you can hook into the GPIO driver if need be, we can
> figure out the gpio_chip for a certain line for sure.
> 

Firstly, line_event_timestamp() is called from the IRQ handler context.
That is obviously more constraining than if it were only called from the
IRQ thread. If the GTE is providing the timestamp then that could be
put off until the IRQ thread.
So you probably want to refactor line_event_timestamp() into two flavours
- one for IRQ handler that returns 0 if HARDWARE is set, and the other for
IRQ thread, where there is already a fallback call to
line_event_timestamp() for the nested threaded interrupt case, that gets
the timestamp from the GTE.

But my primary concern here would be keeping the two event FIFOs (GTE and
cdev) in sync.  Masking and unmasking in hardware and the kernel needs to
be coordinated to prevent races that would result in sync loss.
So this probably needs to be configured in the GTE driver via the irq
path, rather than pinctrl?

Is every event detected by the GTE guaranteed to trigger an interrupt in
the kernel?

How to handle GTE FIFO overflows?  Can they be detected or prevented?

> So you first need to augment the userspace
> ABI and the character device code to add this. See
> commit 26d060e47e25f2c715a1b2c48fea391f67907a30
> "gpiolib: cdev: allow edge event timestamps to be configured as REALTIME"
> by Kent Gibson to see what needs to be done.
> 

You should also extend gpio_v2_line_flags_validate() to disallow setting
of multiple event clock flags, similar to the bias flag checks.
Currently there is only the one event clock flag, so no need to check.

> 3. Also patch tools/gpio/gpio-event-mon.c to support this flag and use that
> for prototyping and proof of concept.
> 

The corresponding commit for the REALTIME option is
commit e0822cf9b892ed051830daaf57896aca48c8567b
"tools: gpio: add option to report wall-clock time to gpio-event-mon"

Cheers,
Kent.

> > ============
> > For IRQ:
> > ============
> 
> Marc Zyngier and/or Thomas Gleixner know this stuff.
> 
> It does make sense to add some infrastructure so that GPIO events
> and IRQs can use the same timestamping hardware.
> 
> And certainly you will also want to use this timestamp for
> IIO devices? If it is just GPIOs and IRQs today, it will be
> gyroscopes and accelerometers tomorrow, am I right?
> 
> Yours,
> Linus Walleij
