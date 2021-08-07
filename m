Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B49F3E32E3
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Aug 2021 05:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhHGDIN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 23:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhHGDIM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 23:08:12 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A290C0613CF;
        Fri,  6 Aug 2021 20:07:55 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so25438670pjr.1;
        Fri, 06 Aug 2021 20:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MZlf9MsGw0vgBBVidbLm2udtqHLPm2JBJD9JYT5CH8Y=;
        b=L2Vhdar9omNkPGcE2Cpfv4tO4IhB94jngdKSBK+kbsIKqTgJsqxloV4/vCx8cGQqTS
         jDYVPDsC8EXWx9EtFdXqFFxXRq/wZ4b2MsJFcVYwREnaqyeBdWc0anMviv9sMa3x5Bum
         HeD3ve7FcqbWHYSQyM8uopXIJKzD2SHNZfEfi8XaRMiY3dJbsPPp7ZsVD11iphG/dlF9
         KmVXs7aZ3+/Spw3sKJoPhoYEfFTRmzUvRGpm6eXN1dTBlYbbM2EPARwCKA6+KBp/F5D+
         kFmNS7hyvxyMgO4+PQ5/gj+8T0l2nPKMphMedKP5zO7At8Qut2z0c87LzluwqAeMYui3
         cPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MZlf9MsGw0vgBBVidbLm2udtqHLPm2JBJD9JYT5CH8Y=;
        b=iDN+5GfyvQy36VyI/9PTNi2qdzrEiKvkj60SZs3sNlhOS0eg6GhDjvOCnCEsO5RGWD
         CQd1JUXdBKKBgUC5fmvGWNBhnc1C0xSH5FiQM3HdbQMkvarYtS6WVqZ+SLi9WT5GL8uZ
         biYydeK7q8dajgYN8OEmclywk6PnWvb5jCWAunyBexjgZ9Iigp57D9RHWV81iS0lebHT
         7StHQYqzmxjWF4sXHYy5etogLaxviK3PhOCJ2hVHTIzYzzeLlv2Is32AFGcdafcxeNSs
         PY5gj0vEKNfROd77k+KN4CzyTHErG7SDdGTq/u+wh7Vx+jiOhoIwC9vL+MexjXaRkoCU
         2Wsw==
X-Gm-Message-State: AOAM532QejKRLfj3rM4Qr0ibZLte34Xdxly/84oG3FDntHdMRHmwzet5
        Bbx9U6uYmACnkEvl2nfJ3LA=
X-Google-Smtp-Source: ABdhPJz57kXIAITMSWdwSldWqE6y/pVuXvPV9v5ijV04shrn5Auulc5miCL9o7hn9yXW8h3K8PD4bA==
X-Received: by 2002:a17:90a:5889:: with SMTP id j9mr23837307pji.117.1628305673975;
        Fri, 06 Aug 2021 20:07:53 -0700 (PDT)
Received: from sol (106-69-178-229.dyn.iinet.net.au. [106.69.178.229])
        by smtp.gmail.com with ESMTPSA id r14sm4606258pff.106.2021.08.06.20.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 20:07:53 -0700 (PDT)
Date:   Sat, 7 Aug 2021 11:07:46 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC 03/11] hte: Add tegra194 HTE kernel provider
Message-ID: <20210807030746.GA9850@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-4-dipenp@nvidia.com>
 <20210701142156.GA34285@sol>
 <52768891-6c01-7588-e557-5c9eae5375b6@nvidia.com>
 <20210731154323.GA24906@sol>
 <1ff6df66-9895-bd42-322a-515327f30366@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ff6df66-9895-bd42-322a-515327f30366@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 06, 2021 at 07:41:09PM -0700, Dipen Patel wrote:
> 
> On 7/31/21 8:43 AM, Kent Gibson wrote:
> > On Wed, Jul 28, 2021 at 04:59:08PM -0700, Dipen Patel wrote:
> >> Thanks Kent for the review comment. My responses inline.
> >>
> >> On 7/1/21 7:21 AM, Kent Gibson wrote:
> >>> On Fri, Jun 25, 2021 at 04:55:24PM -0700, Dipen Patel wrote:
> >>>> Tegra194 device has multiple HTE instances also known as GTE
> >>>> (Generic hardware Timestamping Engine) which can timestamp subset of
> >>>> SoC lines/signals. This provider driver focuses on IRQ and GPIO lines
> >>>> and exposes timestamping ability on those lines to the consumers
> >>>> through HTE subsystem.
> >>>>
> >>>> Also, with this patch, added:
> >>>> - documentation about this provider and its capabilities at
> >>>> Documentation/hte.
> >>>> - Compilation support in Makefile and Kconfig
> >>>>
> >>>> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> >>>> ---
> >>>>  Documentation/hte/index.rst        |  21 ++
> >>>>  Documentation/hte/tegra194-hte.rst |  65 ++++
> >>>>  Documentation/index.rst            |   1 +
> >>>>  drivers/hte/Kconfig                |  12 +
> >>>>  drivers/hte/Makefile               |   1 +
> >>>>  drivers/hte/hte-tegra194.c         | 554 +++++++++++++++++++++++++++++
> >>>>  6 files changed, 654 insertions(+)
> >>>>  create mode 100644 Documentation/hte/index.rst
> >>>>  create mode 100644 Documentation/hte/tegra194-hte.rst
> >>>>  create mode 100644 drivers/hte/hte-tegra194.c
> >>>>
> >>>> diff --git a/Documentation/hte/index.rst b/Documentation/hte/index.rst
> >>>> new file mode 100644
> >>>> index 000000000000..f311ebec6b47
> >>>> --- /dev/null
> >>>> +++ b/Documentation/hte/index.rst
> >>>> @@ -0,0 +1,21 @@
> >>>> +.. SPDX-License-Identifier: GPL-2.0
> >>>> +
> >>>> +============================================
> >>>> +The Linux Hardware Timestamping Engine (HTE)
> >>>> +============================================
> >>>> +
> >>>> +The HTE Subsystem
> >>>> +=================
> >>>> +
> >>>> +.. toctree::
> >>>> +   :maxdepth: 1
> >>>> +
> >>>> +   hte
> >>>> +
> >>>> +HTE Tegra Provider
> >>>> +==================
> >>>> +
> >>>> +.. toctree::
> >>>> +   :maxdepth: 1
> >>>> +
> >>>> +   tegra194-hte
> >>>> \ No newline at end of file
> >>>> diff --git a/Documentation/hte/tegra194-hte.rst b/Documentation/hte/tegra194-hte.rst
> >>>> new file mode 100644
> >>>> index 000000000000..c23eaafcf080
> >>>> --- /dev/null
> >>>> +++ b/Documentation/hte/tegra194-hte.rst
> >>>> @@ -0,0 +1,65 @@
> >>>> +HTE Kernel provider driver
> >>>> +==========================
> >>>> +
> >>>> +Description
> >>>> +-----------
> >>>> +The Nvidia tegra194 chip has many hardware timestamping engine (HTE) instances
> >>>> +known as generic timestamping engine (GTE). This provider driver implements
> >>>> +two GTE instances 1) GPIO GTE and 2) IRQ GTE. The both GTEs instances get the
> >>>> +timestamp from the system counter TSC which has 31.25MHz clock rate, and the
> >>>> +driver converts clock tick rate to nano seconds before storing it as timestamp
> >>>> +value.
> >>>> +
> >>>> +GPIO GTE
> >>>> +--------
> >>>> +
> >>>> +This GTE instance help timestamps GPIO in real time, for that to happen GPIO
> >>>> +needs to be configured as input and IRQ needs to ba enabled as well. The only
> >>>> +always on (AON) gpio controller instance supports timestamping GPIOs in
> >>>> +realtime and it has 39 GPIO lines. There is also a dependency on AON GPIO
> >>>> +controller as it requires very specific bits to be set in GPIO config register.
> >>>> +It in a way creates cyclic dependency between GTE and GPIO controller. The GTE
> >>>> +GPIO functionality is accessed from the GPIOLIB. It can support both the in
> >>>> +kernel and userspace consumers. In the later case, requests go through GPIOLIB
> >>>> +CDEV framework. The below APIs are added in GPIOLIB framework to access HTE
> >>>> +subsystem and GPIO GTE for in kernel consumers.
> >>>> +
> >>>> +.. c:function:: int gpiod_hw_timestamp_control( struct gpio_desc *desc, bool enable )
> >>>> +
> >>>> +	To enable HTE on given GPIO line.
> >>>> +
> >>>> +.. c:function:: u64 gpiod_get_hw_timestamp( struct gpio_desc *desc, bool block )
> >>>> +
> >>>> +	To retrieve hardwre timestamp in nano seconds.
> >>>> +
> >>>> +.. c:function:: bool gpiod_is_hw_timestamp_enabled( const struct gpio_desc *desc )
> >>>> +
> >>>> +	To query if HTE is enabled on the given GPIO.
> >>>> +
> >>>> +There is hte-tegra194-gpio-test.c, located in ``drivers/hte/`` directory, test
> >>>> +driver which demonstrates above APIs for the Jetson AGX platform. For userspace
> >>>> +consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE flag must be specifed during
> >>>> +IOCTL calls, refer ``tools/gpio/gpio-event-mon.c``, which returns the timestamp
> >>>> +in nano second.
> >>>> +
> >>> <snip>
> >>>
> >>>> +
> >>>> +static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
> >>>> +{
> >>>> +	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
> >>>> +	u64 tsc;
> >>>> +	int dir;
> >>>> +	struct hte_ts_data el;
> >>>> +
> >>>> +	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
> >>>> +		HTE_TESTATUS_OCCUPANCY_SHIFT) &
> >>>> +		HTE_TESTATUS_OCCUPANCY_MASK) {
> >>>> +		tsh = tegra_hte_readl(gs, HTE_TETSCH);
> >>>> +		tsl = tegra_hte_readl(gs, HTE_TETSCL);
> >>>> +		tsc = (((u64)tsh << 32) | tsl);
> >>>> +
> >>>> +		src = tegra_hte_readl(gs, HTE_TESRC);
> >>>> +		slice = (src >> HTE_TESRC_SLICE_SHIFT) &
> >>>> +			    HTE_TESRC_SLICE_DEFAULT_MASK;
> >>>> +
> >>>> +		pv = tegra_hte_readl(gs, HTE_TEPCV);
> >>>> +		cv = tegra_hte_readl(gs, HTE_TECCV);
> >>>> +		acv = pv ^ cv;
> >>>> +		while (acv) {
> >>>> +			bit_index = __builtin_ctz(acv);
> >>>> +			if ((pv >> bit_index) & BIT(0))
> >>>> +				dir = HTE_EVENT_RISING_EDGE;
> >>>> +			else
> >>>> +				dir = HTE_EVENT_FALLING_EDGE;
> >>>> +
> >>>> +			line_id = bit_index + (slice << 5);
> >>>> +			el.dir = dir;
> >>>> +			el.tsc = tsc << HTE_TS_NS_SHIFT;
> >>>> +			hte_push_ts_ns_atomic(gs->chip, line_id, &el,
> >>>> +					      sizeof(el));
> >>>> +			acv &= ~BIT(bit_index);
> >>>> +		}
> >>>> +		tegra_hte_writel(gs, HTE_TECMD, HTE_TECMD_CMD_POP);
> >>>> +	}
> >>>> +}
> >>> What happens when the hte_push_ts_ns_atomic() fails?
> >>> The timestamp will be quietly dropped?
> >>> What happens when the interrupt corresponding to that dropped timestamp
> >>> asks for it?  The irq handler thread will block until it can get a
> >>> timestamp from the subsequent interrupt?
> >> Two things happen, 1) at the push, HTE core increments seq counter
> >>
> >> 2) If the consumer has provided callback, it will either call that callback
> >>
> >> with HTE_TS_DROPPED or HTE_TS_AVAIL. The seq counter gives indirect
> >>
> >> view of dropped ts. However, I see the problem with the consumers not
> >>
> >> providing callback, in that case, push_ts* API just wakes up process without
> >>
> >> indicating why (assuming notify variable is true or else there is a chance for
> >>
> >> the thread to block forever). One easy approach I can think of for now is to
> >>
> >> make callback mandatory (which is optional right now), I will have to rethink
> >>
> >> that scenario and will push corrected version next RFC version.
> >>
> >> Thanks for pointing out.
> >>
> > I'm not sure you understood my question, which was intended to
> > demonstrate how an overflow here would break your gpio integration, but I
> > am certain that I don't understand your answer.
> >
> > Using the callback to signal fifo overflow to the consumer is crazy.
> > If the consumer is too busy to service the fifo then they probably wont
> > be prepared to deal with the callback either. And the primary purpose of
> > the fifo is to decouple the producer and consumer, so requiring a callback
> > defeats the whole purpose of having the fifo there in the first place.
> >
> >>> Which brings me back to the concern I have with the approach used in
> >>> the hte/gpiolib integration - how do you guarantee that the timestamp
> >>> returned by gpiod_get_hw_timestamp() corresponds to the irq interrupt
> >>> being handled, particularly in the face of errors such as:
> >>>  - overflows of the timestamp FIFO in the chip
> >> I currently do not have any indication mechanism as the providers
> >>
> >> I am dealing with right now does not have overflow hardware detection
> >>
> >> support. If the chip supports, it should be easy to integrate that feature.
> >>
> >> I will provide some hook function or change in push_* API to accommodate
> >>
> >> this in next version of RFC.
> >>
> >>>  - overflows of software FIFOs as here
> >> HTE core records sequence counter as well it callsback the consumer with
> >>
> >> HTE_TS_DROPPED.
> >>
> >>>  - lost interupts (if the hw generates interrupts faster than the CPU
> >>>    can service them)
> >> For this, I have no idea unless hardware supports some sort of mechanism
> >>
> >> to catch that. For the current providers, as soon as it detects changes on lines
> >>
> >> it captures TS in its hw fifo. Its interrupt gets generated based on threshold
> >>
> >> set in that hw fifo. This interrupt is different than the lines of actual device
> >>
> >> that is why I said I have no idea how we can tackle that. Let me know if there
> >>
> >> is any idea or reference of the codes which does tackle this.
> >>
> > As far as I am aware there is no solution, given your suggested
> > architecture.
> >
> > Your architecture is inherently fragile, as you try to use one stream
> > of data (the timestamp fifo) to provide supplementary info for another
> > (the physical irq).  Guaranteeing that the two are synchronised is
> > impossible - even if you can get them synced at some point, they can
> > fall out of sync without any indication.
> > That is a recipe for Ingenuity flight 6.
> >
> > My solution would be to use the hte timestamp fifo as the event source,
> > rather than the physical irq.  With only one event source the 
> > synchronisation problem disappears.  As to how to implement that,
> > gpiolib-cdev would request a line from the hte subsystem and register
> > and event handler for it, much as it does currently with the irq
> > subsystem. That event handler would translate the hte events into gpio
> > events.
> 
> I have to circle back to here regarding the event handler thing. I
> 
> surely did not understand fifo as event source rather than physical irq
> 
> part? I believe you are suggesting to have somekind of buffer abstraction
> 
> layer for the hardware fifo similar to what I have with software buffer and
> 
> register handler to that buffer, right?
> 

No, what is the purpose of that buffering and watermarking in software?
Just pass the timestamped edge event direct to the consumer.
Let the consumer do any buffering if necessary, as Jonathon Cameron
also suggested in the 02/11 thread.

> 
> The current implementation I have (not with gpiolib/HTE integration)
> 
> is partially simlar to event handler mechanism except that it does not send data
> 
> with it. See hte-tegra194-irq-test.c in this patch.
> 
> 
> Coming back to gpiolib/hte integration part and your suggestion about
> 
> providing event handler during hte registration. I have below doubts:
> 
> 1. When HTE calls this provided hte_handler, will it store data into
> 
> hte->timestamp_ns directly, I am guessing yes.
> 

This is implementation detail of the hte/gpiolib interface that I leave
for you to suggest.  Work something out.

> 2. Does hte handler solution create race between two handlers? i.e. edge_irq_handler and
> 
> hte_handler, for the worst case scenario as below?
> 

No.  If hardware timestamp is selected then no irq is requested from the
irq subsystem for that line - only from the hte subsystem instead.
So there will be no edge_irq_handler call for that line, so no possible race.

> 2.a edge_irq_handler runs first, checks some kind of flag to see if
> 
> we are using hardware clock and if yes, directly accesses timestamp_ns
> 
> instead of calling line_event_timestamp.
> 
> 2.b finds timestamp_ns to be invalid since it ran first before hte event handler did.
> 
> 2.c returns and invokes edge_irq_thread.
> 
> 2.c.1 Here, should edge_irq_thread wait in cdev till hte handler to be called? If yes,
> 
> Doesn't it have case where it will wait forever till hte handler gets called, also not
> 
> to mention keeping irq line disabled since IRQF_ONESHOT is specified, could be possible
> 
> when provider has gone rogue?
> 
> 3. I am guessing there will not be dropped event in this suggestion since are
> 
> directly sending data without buffering in HTE, that is the good part I believe.
> 
> 
> >
> > You still have to deal with possible fifo overflows, but if the fifo
> > overflows result in discarding the oldest event, rather than the most
> > recent, then everything comes out in the wash.  If not then the final
> > event in a burst may not correspond to the actual state so you need
> > some additional mechanism to address that.
> > Either way the consumer needs to be aware that events may be lost - but
> > with the event seqno for consumers to detect those lost events we
> > already have that covered.
> 
> Correct (for the seqno part), you already have seqno, cdev does not need
> 
> struct hte_ts_data's u64 seq counter.
> 
> 
> On similar note, I was looking at the linereq_put_event
> 
> function and I have below doubts:
> 
> 1. IIUC, you are discarding oldest data when fifo is full, right?
> 

Correct.

> 2. There is no indication to waiting client if overflow is true beside pr_debug print.
> 
> 2.a Does this not block waiting client infinitely since there is no wake_up_poll call
> 
> in case of overflow == 1?
> 

No - there already was a wake_up_poll call for the entry discarded by
the kfifo_skip().

You dropped 2.b intentionally, right?  Buffer overflow perhaps??

> 2.c If I have missed, what current mechanism cdev provides to client beside seqno
> 
> to indicate there is a drop and if there is a drop, what it does to re-sync?
> 

Just seqno.  Overflows in the cdev event buffer discard the oldest
events, so the final event that the client reads will correspond to
current state. There is an event waiting for the client that, due to
the seqno jump, indicates the overflow.  What else do they need?
And what is there to resync?

Not sorry if I'm getting short with you here - I'm getting really tired
of this subject as we're clearly not communicating well and are repeatedly
covering the same ground.

Cheers,
Kent.
