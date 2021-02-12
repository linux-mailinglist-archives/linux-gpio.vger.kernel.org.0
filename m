Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B396E319CE9
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 11:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhBLK5z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 05:57:55 -0500
Received: from mga12.intel.com ([192.55.52.136]:3862 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230499AbhBLK5x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Feb 2021 05:57:53 -0500
IronPort-SDR: Msc0ne6Lli93QUSjLrdfc72tcHLuSbHjcEh5PmS3Rrv+NfDtBP6NeUI9F/JyJE6pLFEsIfSkSX
 EtNFov53YncQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="161537835"
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="161537835"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 02:57:13 -0800
IronPort-SDR: ds8EiGl430OaoxknE8C9zs40H3BgYQzYvPR/X7Z+E8ucm0P/b7n3OftSrChzWiUuBQk7Gq+365
 gVOawMkQrvNA==
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="376309979"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 02:57:11 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lAW8K-004SjL-14; Fri, 12 Feb 2021 12:57:08 +0200
Date:   Fri, 12 Feb 2021 12:57:08 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Arnd Bergmann <arnd@kernel.org>,
        luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: Re: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
Message-ID: <YCZfBMPwmzD2U/4c@smile.fi.intel.com>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <1612774577-55943-2-git-send-email-luojiaxing@huawei.com>
 <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
 <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
 <d5465b81-bb53-49ee-a556-40d208deb765@ti.com>
 <a61ef337fd1c4538a47fe855920f95d3@hisilicon.com>
 <CAK8P3a3SHQNjF5ZpqHQweG7BQ52Xi1hQKDiMVKq4aNK_7VDw6w@mail.gmail.com>
 <e34a4085-268f-1cd0-a5dc-a87a2e655fe2@ti.com>
 <2a12cf7a21f74a0c9e2552a467b77fae@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a12cf7a21f74a0c9e2552a467b77fae@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 12, 2021 at 10:42:19AM +0000, Song Bao Hua (Barry Song) wrote:
> > From: Grygorii Strashko [mailto:grygorii.strashko@ti.com]
> > Sent: Friday, February 12, 2021 11:28 PM
> > On 12/02/2021 11:45, Arnd Bergmann wrote:
> > > On Fri, Feb 12, 2021 at 6:05 AM Song Bao Hua (Barry Song)
> > > <song.bao.hua@hisilicon.com> wrote:

> > >>> Note. there is also generic_handle_irq() call inside.
> > >>
> > >> So generic_handle_irq() is not safe to run in thread thus requires
> > >> an interrupt-disabled environment to run? If so, I'd rather this
> > >> irqsave moved into generic_handle_irq() rather than asking everyone
> > >> calling it to do irqsave.
> > >
> > > In a preempt-rt kernel, interrupts are run in task context, so they clearly
> > > should not be called with interrupts disabled, that would defeat the
> > > purpose of making them preemptible.
> > >
> > > generic_handle_irq() does need to run with in_irq()==true though,
> > > but this should be set by the caller of the gpiochip's handler, and
> > > it is not set by raw_spin_lock_irqsave().
> > 
> > It will produce warning from __handle_irq_event_percpu(), as this is IRQ
> > dispatcher
> > and generic_handle_irq() will call one of handle_level_irq or handle_edge_irq.
> > 
> > The history behind this is commit 450fa54cfd66 ("gpio: omap: convert to use
> > generic irq handler").
> > 
> > The resent related discussion:
> > https://lkml.org/lkml/2020/12/5/208
> 
> Ok, second thought. irqsave before generic_handle_irq() won't defeat
> the purpose of preemption too much as the dispatched irq handlers by
> gpiochip will run in their own threads but not in the thread of
> gpiochip's handler.
> 
> so looks like this patch can improve by:
> * move other raw_spin_lock_irqsave to raw_spin_lock;
> * keep the raw_spin_lock_irqsave before generic_handle_irq() to mute
> the warning in genirq.

Isn't the idea of irqsave is to prevent dead lock from the process context when
we get interrupt on the *same* CPU?

-- 
With Best Regards,
Andy Shevchenko


