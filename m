Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD93319D5F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 12:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbhBLL3v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 12 Feb 2021 06:29:51 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3022 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhBLL3p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 06:29:45 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DcWSc3gBJzRCD4;
        Fri, 12 Feb 2021 19:27:44 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Fri, 12 Feb 2021 19:29:02 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi761-chm.china.huawei.com (10.1.198.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 12 Feb 2021 19:29:02 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Fri, 12 Feb 2021 19:29:02 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Arnd Bergmann <arnd@kernel.org>,
        luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "Kevin Hilman" <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: RE: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
Thread-Topic: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
Thread-Index: AQHXASPSlQt84o9SE0i+o14ylEf4e6pTywWAgACGpJD//4GQAIAAiAmg
Date:   Fri, 12 Feb 2021 11:29:02 +0000
Message-ID: <c4a07bef5dd24fd2af0aa7fe4c78b903@hisilicon.com>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <1612774577-55943-2-git-send-email-luojiaxing@huawei.com>
 <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
 <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
 <d5465b81-bb53-49ee-a556-40d208deb765@ti.com>
 <a61ef337fd1c4538a47fe855920f95d3@hisilicon.com>
 <CAK8P3a3SHQNjF5ZpqHQweG7BQ52Xi1hQKDiMVKq4aNK_7VDw6w@mail.gmail.com>
 <e34a4085-268f-1cd0-a5dc-a87a2e655fe2@ti.com>
 <2a12cf7a21f74a0c9e2552a467b77fae@hisilicon.com>
 <YCZfBMPwmzD2U/4c@smile.fi.intel.com>
In-Reply-To: <YCZfBMPwmzD2U/4c@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.31]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> Sent: Friday, February 12, 2021 11:57 PM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>; Arnd Bergmann
> <arnd@kernel.org>; luojiaxing <luojiaxing@huawei.com>; Linus Walleij
> <linus.walleij@linaro.org>; Santosh Shilimkar <ssantosh@kernel.org>; Kevin
> Hilman <khilman@kernel.org>; open list:GPIO SUBSYSTEM
> <linux-gpio@vger.kernel.org>; linux-kernel@vger.kernel.org;
> linuxarm@openeuler.org
> Subject: Re: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
> raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
> 
> On Fri, Feb 12, 2021 at 10:42:19AM +0000, Song Bao Hua (Barry Song) wrote:
> > > From: Grygorii Strashko [mailto:grygorii.strashko@ti.com]
> > > Sent: Friday, February 12, 2021 11:28 PM
> > > On 12/02/2021 11:45, Arnd Bergmann wrote:
> > > > On Fri, Feb 12, 2021 at 6:05 AM Song Bao Hua (Barry Song)
> > > > <song.bao.hua@hisilicon.com> wrote:
> 
> > > >>> Note. there is also generic_handle_irq() call inside.
> > > >>
> > > >> So generic_handle_irq() is not safe to run in thread thus requires
> > > >> an interrupt-disabled environment to run? If so, I'd rather this
> > > >> irqsave moved into generic_handle_irq() rather than asking everyone
> > > >> calling it to do irqsave.
> > > >
> > > > In a preempt-rt kernel, interrupts are run in task context, so they clearly
> > > > should not be called with interrupts disabled, that would defeat the
> > > > purpose of making them preemptible.
> > > >
> > > > generic_handle_irq() does need to run with in_irq()==true though,
> > > > but this should be set by the caller of the gpiochip's handler, and
> > > > it is not set by raw_spin_lock_irqsave().
> > >
> > > It will produce warning from __handle_irq_event_percpu(), as this is IRQ
> > > dispatcher
> > > and generic_handle_irq() will call one of handle_level_irq or
> handle_edge_irq.
> > >
> > > The history behind this is commit 450fa54cfd66 ("gpio: omap: convert to
> use
> > > generic irq handler").
> > >
> > > The resent related discussion:
> > > https://lkml.org/lkml/2020/12/5/208
> >
> > Ok, second thought. irqsave before generic_handle_irq() won't defeat
> > the purpose of preemption too much as the dispatched irq handlers by
> > gpiochip will run in their own threads but not in the thread of
> > gpiochip's handler.
> >
> > so looks like this patch can improve by:
> > * move other raw_spin_lock_irqsave to raw_spin_lock;
> > * keep the raw_spin_lock_irqsave before generic_handle_irq() to mute
> > the warning in genirq.
> 
> Isn't the idea of irqsave is to prevent dead lock from the process context when
> we get interrupt on the *same* CPU?

Anyway, gpiochip is more tricky as it is also a irq dispatcher. Moving
spin_lock_irq to spin_lock in the irq handler of non-irq dispatcher
driver is almost always correct.

But for gpiochip, would the below be true though it is almost alway true
for non-irq dispatcher?

1. While gpiochip's handler runs in hardIRQ, interrupts are disabled, so no more
interrupt on the same cpu -> No deadleak.

2. While gpiochip's handler runs in threads
* other non-threaded interrupts such as timer tick might come on same cpu,
but they are an irrelevant driver and thus they are not going to get the
lock gpiochip's handler has held. -> no deadlock.
* other devices attached to this gpiochip might get interrupts, since 
gpiochip's handler is running in threads, raw_spin_lock can help avoid
messing up the critical data by two threads -> still no deadlock.

> 
> --
> With Best Regards,
> Andy Shevchenko
> 

Thanks
Barry

