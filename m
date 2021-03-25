Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4388B3490DC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 12:41:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhCYLkS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 07:40:18 -0400
Received: from mga03.intel.com ([134.134.136.65]:60381 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231636AbhCYLit (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Mar 2021 07:38:49 -0400
IronPort-SDR: X0q+9dqjm5A5FdU4eM9tqoYXuxOyTeRDXfM5Ydzm2vxFx+mYSNs2NzSCEBO+AhoF5M8R5Jvoun
 4YQCf8D9qNBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="190936665"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="190936665"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 04:33:09 -0700
IronPort-SDR: eLMdjmGZ172nWUnoqly9ZhCsQoTv+M6+yM9bp3kzkPfHuTW890qD5wcu0X14ZptIkYxHlF98O4
 yIb3JfV2M07w==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="409332136"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 04:33:07 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lPOEa-00G1lh-TT; Thu, 25 Mar 2021 13:33:04 +0200
Date:   Thu, 25 Mar 2021 13:33:04 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [PATCH v5 1/2] gpio: sch: Add edge event support
Message-ID: <YFx08OhkBbyXBdZo@smile.fi.intel.com>
References: <20210317151928.41544-1-andriy.shevchenko@linux.intel.com>
 <20210317151928.41544-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdaZwAg4X9QT4QMR2GSH6Cekc7Xuk+-pqhCyON-Y3cnCrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaZwAg4X9QT4QMR2GSH6Cekc7Xuk+-pqhCyON-Y3cnCrA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 25, 2021 at 09:13:51AM +0100, Linus Walleij wrote:
> On Wed, Mar 17, 2021 at 4:19 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > From: Jan Kiszka <jan.kiszka@siemens.com>
> >
> > Add the required infrastructure to enable and report edge events
> > of the pins to the GPIO core. The actual hook-up of the event interrupt
> > will happen separately.
> >
> > Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> > Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I can't believe it that nobody added irq support to this driver for 10
> years given how widely deployed it is! (Good work.)
> 
> Don't you need to add
> 
> select GPIOLIB_IRQCHIP
> 
> to Kconfig? So the gpio_chip contains the .irq member you're using.

Seems legit, thanks!

> > +       sch->irqchip.name = "sch_gpio";
> > +       sch->irqchip.irq_ack = sch_irq_ack;
> > +       sch->irqchip.irq_mask = sch_irq_mask;
> > +       sch->irqchip.irq_unmask = sch_irq_unmask;
> > +       sch->irqchip.irq_set_type = sch_irq_type;
> > +
> > +       sch->chip.irq.chip = &sch->irqchip;
> > +       sch->chip.irq.num_parents = 0;
> > +       sch->chip.irq.parents = NULL;
> > +       sch->chip.irq.parent_handler = NULL;
> > +       sch->chip.irq.default_type = IRQ_TYPE_NONE;
> > +       sch->chip.irq.handler = handle_bad_irq;
> 
> I always add a local variable like:
> 
> struct gpio_irq_chip *girq;
> 
> And assign with the arrow, so as to make it easier to read:
> 
> girq->parent_handler = NULL
> 
> etc.

OK!

> +/- the above:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


