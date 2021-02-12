Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F84B319D71
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 12:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhBLLgO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 06:36:14 -0500
Received: from mga04.intel.com ([192.55.52.120]:19162 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229608AbhBLLgJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Feb 2021 06:36:09 -0500
IronPort-SDR: ujN2ft9JopBZ8gFUtD/WwCiEsaDgK7H2r1/gYMfsNhqzr0/k0zFmdPdmgLMqH5cr47/QrsFCoo
 MQlo7g8kHvLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="179839817"
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="179839817"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 03:35:28 -0800
IronPort-SDR: fKEZl5tW7/OgtMrdBFFTAyhyBIzGnvXuMoKgxRUWTCg48aGQRJQ57JNa3VNuVLgoQRsx/mtOcB
 rGAiEOwDjKXA==
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="579244453"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 03:35:25 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lAWjK-004TUA-I8; Fri, 12 Feb 2021 13:35:22 +0200
Date:   Fri, 12 Feb 2021 13:35:22 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        luojiaxing <luojiaxing@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linuxarm@openeuler.org" <linuxarm@openeuler.org>
Subject: Re: [Linuxarm] Re: [PATCH for next v1 1/2] gpio: omap: Replace
 raw_spin_lock_irqsave with raw_spin_lock in omap_gpio_irq_handler()
Message-ID: <YCZn+idf9A7OpKbb@smile.fi.intel.com>
References: <1612774577-55943-1-git-send-email-luojiaxing@huawei.com>
 <1612774577-55943-2-git-send-email-luojiaxing@huawei.com>
 <fab1e871-08e4-fc71-9dbf-9bcacf18e2e1@ti.com>
 <CAK8P3a0m4ocfLyJZ5wMxyKESYUJ5um5sb5MyAzC8ckCb6qAH5g@mail.gmail.com>
 <d5465b81-bb53-49ee-a556-40d208deb765@ti.com>
 <a61ef337fd1c4538a47fe855920f95d3@hisilicon.com>
 <CAK8P3a3SHQNjF5ZpqHQweG7BQ52Xi1hQKDiMVKq4aNK_7VDw6w@mail.gmail.com>
 <e34a4085-268f-1cd0-a5dc-a87a2e655fe2@ti.com>
 <2a12cf7a21f74a0c9e2552a467b77fae@hisilicon.com>
 <CAK8P3a0aNfF5D+y--5-reBYO2svykCJFxpZ=1dJoK5JDGHPqKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0aNfF5D+y--5-reBYO2svykCJFxpZ=1dJoK5JDGHPqKw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 12, 2021 at 11:59:28AM +0100, Arnd Bergmann wrote:
> On Fri, Feb 12, 2021 at 11:42 AM Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com> wrote:
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
> It seems that the other drivers just call handle_nested_irq() instead
> of generic_handle_irq().

And IIRC all of them request threaded IRQ explicitly.

-- 
With Best Regards,
Andy Shevchenko


