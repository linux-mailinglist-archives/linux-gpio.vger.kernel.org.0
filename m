Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1223DC6B5
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jul 2021 17:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbhGaPni (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 31 Jul 2021 11:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhGaPni (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Jul 2021 11:43:38 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043FDC06175F;
        Sat, 31 Jul 2021 08:43:32 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t3so12546791plg.9;
        Sat, 31 Jul 2021 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XVRpZG056mIQ+8TdrxgawCPGUlZQnukYr1UUE9QTGQ0=;
        b=k3lVQUztzyJalTBkiOK/YtbqQNAFVV8EnFy/niMxqEu/9WfwMfJhwFlrwdTYseaFS2
         oYJKjo6xzE8nbGwIT3yfUokWkyZx2qQ4MHSSB3CuhDqt9XcfV2kAO2QZiEPrcvsDcijg
         ySZyPHs07VZue7GJ2NIn0XOPv8g6hszKorkvyPhIH1A784iaLzN9mlTWVNlYVrB4fnuG
         T6e/zo3gkJmRF2+aXedD/r6t358OS3CsZZA2+7YK1q/IKnlElSQX4T3QI4mberhgOegI
         emFBft+vrZM8zHjM23q+/8GCisXzJe3KvWJ+9Wc6VzHX/j09QzPM/eMpPQXg5mDqU3gc
         Hm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XVRpZG056mIQ+8TdrxgawCPGUlZQnukYr1UUE9QTGQ0=;
        b=CxDWruLG6NQeiV47+yAaqd8/7sh2ogDwgODhT0onCQIUojqt+CWGycijV7V0xrRA94
         zDERknH1ohdu6qyQhCEwCs9WwyjYfS70l4nKr9o4kDtAzJTZ3y6rX5cgdjIm/9gVRRpj
         glOjEF1lfw1DchrQDQSGPL/C+hGSdqWcoj0N9VunzphkLI/Aa+hMPNMApzA9d+9wtm9c
         pLLuPDT826XXtuPGG0nT/upFORcff7Neb4XK3hH/9YAiWsq4tPV6ft00M5zEIs3DJR/M
         myBREuzk4gOOcq5FFO6XSQOynoCkU//tMDViNV0nfIkCvIm8xDHWZ7m/SS6VOX2KJrle
         h7Xw==
X-Gm-Message-State: AOAM531cekG9NUfwqNE93EK2ItBOfdHU1eaO+E7t3h/ZNKSdtiEEpLDK
        cmE1zH2zr/rf2kfLwW7ypV4=
X-Google-Smtp-Source: ABdhPJzvQ7ujWkaNHLW6J/s/R8hHeSw8G6SlVWwW7WI0atmoukvcqg+GejZWcaB88+AEwbDcPAcMKw==
X-Received: by 2002:a65:4382:: with SMTP id m2mr5760997pgp.205.1627746211450;
        Sat, 31 Jul 2021 08:43:31 -0700 (PDT)
Received: from sol (106-69-163-161.dyn.iinet.net.au. [106.69.163.161])
        by smtp.gmail.com with ESMTPSA id 131sm5665149pfv.129.2021.07.31.08.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 08:43:30 -0700 (PDT)
Date:   Sat, 31 Jul 2021 23:43:23 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
Message-ID: <20210731154323.GA24906@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com>
 <20210701142156.GA34285@sol>
 <52768891-6c01-7588-e557-5c9eae5375b6@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52768891-6c01-7588-e557-5c9eae5375b6@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 28, 2021 at 04:59:08PM -0700, Dipen Patel wrote:
> Thanks Kent for the review comment. My responses inline.
> 
> On 7/1/21 7:21 AM, Kent Gibson wrote:
> > On Fri, Jun 25, 2021 at 04:55:24PM -0700, Dipen Patel wrote:
> >> Tegra194 device has multiple HTE instances also known as GTE
> >> (Generic hardware Timestamping Engine) which can timestamp subset of
> >> SoC lines/signals. This provider driver focuses on IRQ and GPIO lines
> >> and exposes timestamping ability on those lines to the consumers
> >> through HTE subsystem.
> >>
> >> Also, with this patch, added:
> >> - documentation about this provider and its capabilities at
> >> Documentation/hte.
> >> - Compilation support in Makefile and Kconfig
> >>
> >> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> >> ---
> >>  Documentation/hte/index.rst        |  21 ++
> >>  Documentation/hte/tegra194-hte.rst |  65 ++++
> >>  Documentation/index.rst            |   1 +
> >>  drivers/hte/Kconfig                |  12 +
> >>  drivers/hte/Makefile               |   1 +
> >>  drivers/hte/hte-tegra194.c         | 554 +++++++++++++++++++++++++++++
> >>  6 files changed, 654 insertions(+)
> >>  create mode 100644 Documentation/hte/index.rst
> >>  create mode 100644 Documentation/hte/tegra194-hte.rst
> >>  create mode 100644 drivers/hte/hte-tegra194.c
> >>
> >> diff --git a/Documentation/hte/index.rst b/Documentation/hte/index.rst
> >> new file mode 100644
> >> index 000000000000..f311ebec6b47
> >> --- /dev/null
> >> +++ b/Documentation/hte/index.rst
> >> @@ -0,0 +1,21 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +============================================
> >> +The Linux Hardware Timestamping Engine (HTE)
> >> +============================================
> >> +
> >> +The HTE Subsystem
> >> +=================
> >> +
> >> +.. toctree::
> >> +   :maxdepth: 1
> >> +
> >> +   hte
> >> +
> >> +HTE Tegra Provider
> >> +==================
> >> +
> >> +.. toctree::
> >> +   :maxdepth: 1
> >> +
> >> +   tegra194-hte
> >> \ No newline at end of file
> >> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
> >> new file mode 100644
> >> index 000000000000..c23eaafcf080
> >> --- /dev/null
> >> +++ b/Documentation/hte/tegra194-hte.rst
> >> @@ -0,0 +1,65 @@
> >> +HTE Kernel provider driver
> >> +==========================
> >> +
> >> +Description
> >> +-----------
> >> +The Nvidia tegra194 chip has many hardware timestamping engine (HTE) instances
> >> +known as generic timestamping engine (GTE). This provider driver implements
> >> +two GTE instances 1) GPIO GTE and 2) IRQ GTE. The both GTEs instances get the
> >> +timestamp from the system counter TSC which has 31.25MHz clock rate, and the
> >> +driver converts clock tick rate to nano seconds before storing it as timestamp
> >> +value.
> >> +
> >> +GPIO GTE
> >> +--------
> >> +
> >> +This GTE instance help timestamps GPIO in real time, for that to happen GPIO
> >> +needs to be configured as input and IRQ needs to ba enabled as well. The only
> >> +always on (AON) gpio controller instance supports timestamping GPIOs in
> >> +realtime and it has 39 GPIO lines. There is also a dependency on AON GPIO
> >> +controller as it requires very specific bits to be set in GPIO config register.
> >> +It in a way creates cyclic dependency between GTE and GPIO controller. The GTE
> >> +GPIO functionality is accessed from the GPIOLIB. It can support both the in
> >> +kernel and userspace consumers. In the later case, requests go through GPIOLIB
> >> +CDEV framework. The below APIs are added in GPIOLIB framework to access HTE
> >> +subsystem and GPIO GTE for in kernel consumers.
> >> +
> >> +.. c:function:: int gpiod_hw_timestamp_control( struct gpio_desc *desc, bool enable )
> >> +
> >> +	To enable HTE on given GPIO line.
> >> +
> >> +.. c:function:: u64 gpiod_get_hw_timestamp( struct gpio_desc *desc, bool block )
> >> +
> >> +	To retrieve hardwre timestamp in nano seconds.
> >> +
> >> +.. c:function:: bool gpiod_is_hw_timestamp_enabled( const struct gpio_desc *desc )
> >> +
> >> +	To query if HTE is enabled on the given GPIO.
> >> +
> >> +There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
> >> +driver which demonstrates above APIs for the Jetson AGX platform. For userspace
> >> +consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE flag must be specifed during
> >> +IOCTL calls, refer ``tools/gpio/gpio-event-mon.c``, which returns the timestamp
> >> +in nano second.
> >> +
> > <snip>
> >
> >> +
> >> +static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
> >> +{
> >> +	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
> >> +	u64 tsc;
> >> +	int dir;
> >> +	struct hte_ts_data el;
> >> +
> >> +	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
> >> +		HTE_TESTATUS_OCCUPANCY_SHIFT) &
> >> +		HTE_TESTATUS_OCCUPANCY_MASK) {
> >> +		tsh = tegra_hte_readl(gs, HTE_TETSCH);
> >> +		tsl = tegra_hte_readl(gs, HTE_TETSCL);
> >> +		tsc = (((u64)tsh << 32) | tsl);
> >> +
> >> +		src = tegra_hte_readl(gs, HTE_TESRC);
> >> +		slice = (src >> HTE_TESRC_SLICE_SHIFT) &
> >> +			    HTE_TESRC_SLICE_DEFAULT_MASK;
> >> +
> >> +		pv = tegra_hte_readl(gs, HTE_TEPCV);
> >> +		cv = tegra_hte_readl(gs, HTE_TECCV);
> >> +		acv = pv ^ cv;
> >> +		while (acv) {
> >> +			bit_index = __builtin_ctz(acv);
> >> +			if ((pv >> bit_index) & BIT(0))
> >> +				dir = HTE_EVENT_RISING_EDGE;
> >> +			else
> >> +				dir = HTE_EVENT_FALLING_EDGE;
> >> +
> >> +			line_id = bit_index + (slice << 5);
> >> +			el.dir = dir;
> >> +			el.tsc = tsc << HTE_TS_NS_SHIFT;
> >> +			hte_push_ts_ns_atomic(gs->chip, line_id, &el,
> >> +					      sizeof(el));
> >> +			acv &= ~BIT(bit_index);
> >> +		}
> >> +		tegra_hte_writel(gs, HTE_TECMD, HTE_TECMD_CMD_POP);
> >> +	}
> >> +}
> > What happens when the hte_push_ts_ns_atomic() fails?
> > The timestamp will be quietly dropped?
> > What happens when the interrupt corresponding to that dropped timestamp
> > asks for it?  The irq handler thread will block until it can get a
> > timestamp from the subsequent interrupt?
> 
> Two things happen, 1) at the push, HTE core increments seq counter
> 
> 2) If the consumer has provided callback, it will either call that callback
> 
> with HTE_TS_DROPPED or HTE_TS_AVAIL. The seq counter gives indirect
> 
> view of dropped ts. However, I see the problem with the consumers not
> 
> providing callback, in that case, push_ts* API just wakes up process without
> 
> indicating why (assuming notify variable is true or else there is a chance for
> 
> the thread to block forever). One easy approach I can think of for now is to
> 
> make callback mandatory (which is optional right now), I will have to rethink
> 
> that scenario and will push corrected version next RFC version.
> 
> Thanks for pointing out.
> 

I'm not sure you understood my question, which was intended to
demonstrate how an overflow here would break your gpio integration, but I
am certain that I don't understand your answer.

Using the callback to signal fifo overflow to the consumer is crazy.
If the consumer is too busy to service the fifo then they probably wont
be prepared to deal with the callback either. And the primary purpose of
the fifo is to decouple the producer and consumer, so requiring a callback
defeats the whole purpose of having the fifo there in the first place.

> >
> > Which brings me back to the concern I have with the approach used in
> > the hte/gpiolib integration - how do you guarantee that the timestamp
> > returned by gpiod_get_hw_timestamp() corresponds to the irq interrupt
> > being handled, particularly in the face of errors such as:
> >  - overflows of the timestamp FIFO in the chip
> 
> I currently do not have any indication mechanism as the providers
> 
> I am dealing with right now does not have overflow hardware detection
> 
> support. If the chip supports, it should be easy to integrate that feature.
> 
> I will provide some hook function or change in push_* API to accommodate
> 
> this in next version of RFC.
> 
> >  - overflows of software FIFOs as here
> 
> HTE core records sequence counter as well it callsback the consumer with
> 
> HTE_TS_DROPPED.
> 
> >  - lost interupts (if the hw generates interrupts faster than the CPU
> >    can service them)
> 
> For this, I have no idea unless hardware supports some sort of mechanism
> 
> to catch that. For the current providers, as soon as it detects changes on lines
> 
> it captures TS in its hw fifo. Its interrupt gets generated based on threshold
> 
> set in that hw fifo. This interrupt is different than the lines of actual device
> 
> that is why I said I have no idea how we can tackle that. Let me know if there
> 
> is any idea or reference of the codes which does tackle this.
> 

As far as I am aware there is no solution, given your suggested
architecture.

Your architecture is inherently fragile, as you try to use one stream
of data (the timestamp fifo) to provide supplementary info for another
(the physical irq).  Guaranteeing that the two are synchronised is
impossible - even if you can get them synced at some point, they can
fall out of sync without any indication.
That is a recipe for Ingenuity flight 6.

My solution would be to use the hte timestamp fifo as the event source,
rather than the physical irq.  With only one event source the 
synchronisation problem disappears.  As to how to implement that,
gpiolib-cdev would request a line from the hte subsystem and register
and event handler for it, much as it does currently with the irq
subsystem. That event handler would translate the hte events into gpio
events.

You still have to deal with possible fifo overflows, but if the fifo
overflows result in discarding the oldest event, rather than the most
recent, then everything comes out in the wash.  If not then the final
event in a burst may not correspond to the actual state so you need
some additional mechanism to address that.
Either way the consumer needs to be aware that events may be lost - but
with the event seqno for consumers to detect those lost events we
already have that covered.

> 
> Regarding HTE/GPIOLIB integration comment:
> 
> You are right, currently, I have only tsc field returned from struct hte_ts_data
> 
> to gpiolib. If I can extend that to return hte_ts_data structure which has seq
> 
> counter, which I believe can be used to track the overflow situation. The
> 
> dropped scenario can be easily tracked if gpiolib can be notified with above
> 
> mentioned DROP event through callback. If that is the case, is it ok to have
> 
> some sort of callback per gpio in gpiolib?
> 

Even better if you can provide the whole struct hte_ts_data so we have
the direction as well (assuming all hte providers provide direction?).
Otherwise gpiolib-cdev may need to read the physical line state and that
may have changed since the hardware captured the event.
In the solution I outlined above, the hte_ts_data would be provided to
the event handler registered by gpiolib-cdev.
And in this case you could skip buffering the event in hte - it could be
passed to the event handler as soon as it is read from the hardware - 
gpiolib-cdev does its own buffering of gpio events.

> 
> Any idea how I can integrate callback notification with gpiolib if you do not agree on
> 
> above callback suggestion?
> 

See above.  But this is just my take, so I would get feedback from the
relevant maintainers or SMEs before you act on anything suggested above.

Cheers,
Kent.

