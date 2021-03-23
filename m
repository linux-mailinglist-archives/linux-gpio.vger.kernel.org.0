Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB9DC3453E7
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 01:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbhCWAct (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 20:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbhCWAcP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 20:32:15 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295CFC061574;
        Mon, 22 Mar 2021 17:32:15 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so11434269pjc.2;
        Mon, 22 Mar 2021 17:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H5DdMa3UXyM7kX0j8ZfJJTJDDB2PmBqap47iK72hy/c=;
        b=e1CZfMAV962djNCWE6IWUjCUKjGAezG100VtoPdVLGRw027i032wSemGI8nO7E+zU+
         yFup+q5EfZGl7L7rs/CfgH68dyt/EzoXVJ8x54aZlP0vX0bZoupGSCaLLZROYnuow88d
         LbHzZrinIdI+hcTHiHovxYizzKUoWn4BJecdhWFOkTPXJ1WBjjQSfXoQHPeqhCV6fYPk
         zzsAsx2J7BkZSjiFRThQXooACGFZM8yu+iY4imo878GvHU+LKGtbvzNAoNqv/nLZPNPW
         s2cRMMyI8RVdpFi/WJEC5wIzeQSKf20FPVFDllq+8IbsGEMI1lOyg/EUAfqcoN8M2k3B
         O0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H5DdMa3UXyM7kX0j8ZfJJTJDDB2PmBqap47iK72hy/c=;
        b=NmKa6WeCwaBlB/JQXkm2QaotDmqUJIWLSQt1GpAerL9ZUXm3ofaKw6M+qBZ47d8+ZY
         GNgGppsrCsynH5OTfgsr+D/c9G9Mn3dop/PVx/Z2S7momnzOyXTvQv6bDQsQa1kYIDC5
         rSdhIpzz1dT7FOOiUbngIygZEhk/flDfwSNRVRc+TcKhUeAZ0hue4gwTaJuWjEqLl5lU
         tuOrXOA9Ln99ZJTb+0enCC0jmm6S6lByrmBCYsjDrpSLkHBSmxui20TPefPBmj2lyglZ
         2DCylUC05KE7a6fYTw4Ny4b2eeTYR5lZ9eEdE/PAGpQgR4NXCgCaAR/BJW5H1LBV7Wmz
         jOsw==
X-Gm-Message-State: AOAM5300zGktOTdsubywzTPBDnHqbULlewE5V/t0RRUBPMqAMXTbxpAm
        HS3cWiFbr5gNZwg0eSox5JiX2w8eecA=
X-Google-Smtp-Source: ABdhPJwrbum3dk1747vLmTB6NamTB166akPYS92rcFtgusklmDOS52h5EHCe8U6IeV4p78B96WLIJQ==
X-Received: by 2002:a17:90a:d58a:: with SMTP id v10mr1732686pju.36.1616459534598;
        Mon, 22 Mar 2021 17:32:14 -0700 (PDT)
Received: from sol (106-69-186-212.dyn.iinet.net.au. [106.69.186.212])
        by smtp.gmail.com with ESMTPSA id t7sm14420858pfg.69.2021.03.22.17.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 17:32:14 -0700 (PDT)
Date:   Tue, 23 Mar 2021 08:32:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <richardcochran@gmail.com>
Subject: Re: GTE - The hardware timestamping engine
Message-ID: <20210323003208.GA6105@sol>
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
 <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
 <20210322060047.GA226745@sol>
 <d48fa7b5-8c17-c3d7-10a9-a9811c410a39@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d48fa7b5-8c17-c3d7-10a9-a9811c410a39@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 01:21:46PM -0700, Dipen Patel wrote:
> Hi Linus and Kent,
> 
> Thanks you so much for your valuable inputs and time, Please see below, my follow ups.
> 
> On 3/21/21 11:00 PM, Kent Gibson wrote:
> > On Sat, Mar 20, 2021 at 12:56:36PM +0100, Linus Walleij wrote:
> >> Hi Dipen,
> >>
> >> thanks for your mail!
> >>
> >> I involved some other kernel people to get some discussion.
> >> I think Kent Gibson can be of great help because he is using
> >> GPIOs with high precision.
> >>
> > 
> > Actually I just extended the cdev uAPI to provide the REALTIME option,
> > which was the event clock until we changed to MONOTONIC in Linux 5.7,
> > as there were some users that were requiring the REALTIME clock.
> > 
> >> We actually discussed this a bit when adding support for
> >> realtime timestamps.
> >>
> >> On Wed, Mar 17, 2021 at 11:29 PM Dipen Patel <dipenp@nvidia.com> wrote:
> >>
> >>> Nvidia Tegra SoCs have generic timestamping engine (GTE) hardware module which
> >>> can monitor SoC signals like IRQ lines and GPIO lines for state change, upon
> >>> detecting the change, it can timestamp and store in its internal hardware FIFO.
> >>> The advantage of the GTE module can be realized in applications like robotics
> >>> or autonomous vehicle where it can help record events with precise timestamp.
> >>
> >> That sounds very useful.
> >>
> > 
> > Indeed - it could remove the latency and jitter that results from
> > timestamping events in the IRQ handler.
> > 
> >> Certainly the kernel shall be able to handle this.
> >>
> >>> ============
> >>> For GPIO:
> >>> ============
> >>> 1.  GPIO has to be configured as input and IRQ must be enabled.
> >>> 2.  Ask GPIO controller driver to set corresponding timestamp bit in the
> >>>     specified GPIO config register.
> >>> 3.  Translate GPIO specified by the client to its internal bitmap.
> >>> 3.a For example, If client specifies GPIO line 31, it could be bit 13 of GTE
> >>>     register.
> >>> 4.  Set internal bits to enable monitoring in GTE module
> >>> 5.  Additionally GTE driver can open up lanes for the user space application
> >>>     as a client and can send timestamping events directly to the application.
> >>
> >> I have some concerns:
> >>
> >> 1. GPIO should for all professional applications be used with the character
> >> device /dev/gpiochipN, under no circumstances shall the old sysfs
> >> ABI be used for this. In this case it is necessary because the
> >> character device provides events in a FIFO to userspace, which is
> >> what we need.
> >>
> > 
> > The cdev uAPI would certainly be the most sensible place to expose
> > this to userspace - its line events being a direct analog to what the GTE
> > provides.
> > 
> >> The timestamp provided to userspace is an opaque 64bit
> >> unsigned value. I suppose we assume it is monotonic but
> >> you can actually augment the semantics for your specific
> >> stamp, as long as 64 bits is gonna work.
> >>
> >> 2. The timestamp for the chardev is currently obtained in
> >> drivers/gpio/gpiolib-cdev.c like this:
> >>
> >> static u64 line_event_timestamp(struct line *line)
> >> {
> >>         if (test_bit(FLAG_EVENT_CLOCK_REALTIME, &line->desc->flags))
> >>                 return ktime_get_real_ns();
> >>
> >>         return ktime_get_ns();
> >> }
> >>
> >> What you want to do is to add a new flag for hardware timestamps
> >> and use that if available. FLAG_EVENT_CLOCK_HARDWARE?
> >> FLAG_EVENT_CLOCK_NATIVE?
> >>
> > 
> > HARDWARE looks better to me, as NATIVE is more vague.
> > 
> >> Then you need to figure out a mechanism so we can obtain
> >> the right timestamp from the hardware event right here,
> >> you can hook into the GPIO driver if need be, we can
> >> figure out the gpio_chip for a certain line for sure.
> >>
> > 
> > Firstly, line_event_timestamp() is called from the IRQ handler context.
> > That is obviously more constraining than if it were only called from the
> > IRQ thread. If the GTE is providing the timestamp then that could be
> > put off until the IRQ thread.
> > So you probably want to refactor line_event_timestamp() into two flavours
> > - one for IRQ handler that returns 0 if HARDWARE is set, and the other for
> > IRQ thread, where there is already a fallback call to
> > line_event_timestamp() for the nested threaded interrupt case, that gets
> > the timestamp from the GTE.
> > 
> 
> My follow-up concerns on both Linus's and Kent's feedback:
> 
> 1.  Please correct me if I am wrong, lineevent in the gpiolib* is only
>     serves the userspace clients.
> 1.a What about kernel drivers wanting to use this feature for monitoring its
>     GPIO lines, see gyroscope example somewhere below. In that regards,
>     lineevent implementation is not sufficient.
> 1.b Are you also implying to extend lineevent implementation to kernel
>     drivers?
> 2.  For both above cases 1.a and 1.b, gpiolib* then would become holder
>     of all the GTE related datastructures per userspace or kernel clients,
>     is this acceptable? In another words, gpilib-cdev framework will become
>     client to GTE framework on behalf of those drivers. I believe we
>     can embed gte related data to per lineevent structures.
> 3.  I believe Kent touched on this, but double confirming, there will be a
>     use-case or scenario where in-kernel clients will want to block until
>     the next timestaming event. We need to cover that scenario as well.   
> 4.  What about kernel drivers wanting monitor certain IRQ lines? For example,
>     gycroscope drivers wants to monitor i2c IRQ line for transaction complete.
> 4.a Or you are suggesting all the GPIOs related requests will go through
>     gpiolib-cdev --> gte framework ---> gte driver and for the rests, it
>     it will be "some kernel driver" ---> gte framework --> gte driver.
> 
> I am assuming there will be gte framework/infrastructure for all above cases.
> 
> > But my primary concern here would be keeping the two event FIFOs (GTE and
> > cdev) in sync.  Masking and unmasking in hardware and the kernel needs to
> > be coordinated to prevent races that would result in sync loss.
> > So this probably needs to be configured in the GTE driver via the irq
> > path, rather than pinctrl?
> > 
> > Is every event detected by the GTE guaranteed to trigger an interrupt in
> > the kernel?
> 
> GTE interrupt will be triggered when its internal FIFO meets configurable
> thresholds, which could be set to 1 for example, in that case will trigger
> interrupt for every event detected.
> 
> Can you elaborate more on pinctrl part?
> 
> > 
> > How to handle GTE FIFO overflows?  Can they be detected or prevented?
> > 
> Currently, there is no hardware support to detect the overflow, it can be
> done certainly through software.
> 

In response to all your comments above...

Firstly, I'm not suggesting that other kernel modules would use the
cdev lineevents, only that they would use the same mechanism that
gpiolib-cdev would use to timestamp the lineevents for userspace.

As to that mechanism, my current thinking is that the approach of
associating GTE event FIFO entries with particular physical IRQ events is
problematic, as keeping the two in sync would be difficult, if not
impossible.

A more robust approach is to ignore the physical IRQs and instead service
the GTE event FIFO, generating IRQs from those events in software -
essentially a pre-timestamped IRQ.  The IRQ framework could provide the
timestamping functionality, equivalent to line_event_timestamp(), for
the IRQ handler/thread and in this case provide the timestamp from the GTE
event.

So this would be an IRQ feature of which the gpiolib would just be another
client.  But I don't know enough about the IRQ framework to do more
than just float the idea - I'm already way out over my skis here.

Btw, the pinctrl API is what the gpiolib uses to control the GPIO aspects
of physical hardware such as direction, value, bias and the like.
Almost certainly not relevant to this feature, so forget I mentioned it.

Cheers,
Kent.

> >> So you first need to augment the userspace
> >> ABI and the character device code to add this. See
> >> commit 26d060e47e25f2c715a1b2c48fea391f67907a30
> >> "gpiolib: cdev: allow edge event timestamps to be configured as REALTIME"
> >> by Kent Gibson to see what needs to be done.
> >>
> > 
> > You should also extend gpio_v2_line_flags_validate() to disallow setting
> > of multiple event clock flags, similar to the bias flag checks.
> > Currently there is only the one event clock flag, so no need to check.
> > 
> >> 3. Also patch tools/gpio/gpio-event-mon.c to support this flag and use that
> >> for prototyping and proof of concept.
> >>
> > 
> > The corresponding commit for the REALTIME option is
> > commit e0822cf9b892ed051830daaf57896aca48c8567b
> > "tools: gpio: add option to report wall-clock time to gpio-event-mon"
> > 
> > Cheers,
> > Kent.
> > 
> >>> ============
> >>> For IRQ:
> >>> ============
> >>
> >> Marc Zyngier and/or Thomas Gleixner know this stuff.
> >>
> >> It does make sense to add some infrastructure so that GPIO events
> >> and IRQs can use the same timestamping hardware.
> >>
> >> And certainly you will also want to use this timestamp for
> >> IIO devices? If it is just GPIOs and IRQs today, it will be
> >> gyroscopes and accelerometers tomorrow, am I right?
> >>
> 
> Gyroscope, accelerometers or any IIO are built on top of i2c/spi and/or GPIOs.
> So they are covered as long as they serve as client to GTE framework, For
> example, if gyroscope uses GPIO as an interrupt to indicate frame
> ready, GTE could timestamp that GPIO as well any IRQs like i2c transaction
> complete IRQ. To this to happen, gycroscope then register itself with
> GTE framework and enable required signals that it interfaces/interested with.
> 
> >> Yours,
> >> Linus Walleij
> 
> Best Regards,
> Dipen Patel
