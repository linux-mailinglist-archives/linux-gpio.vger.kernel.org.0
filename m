Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC60D44432E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 15:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbhKCORE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 10:17:04 -0400
Received: from mga14.intel.com ([192.55.52.115]:58047 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231925AbhKCORD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Nov 2021 10:17:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231752916"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; 
   d="scan'208";a="231752916"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2021 07:14:21 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; 
   d="scan'208";a="497603969"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2021 07:14:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1miH1a-003HPW-Km;
        Wed, 03 Nov 2021 16:13:58 +0200
Date:   Wed, 3 Nov 2021 16:13:58 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
Message-ID: <YYKZJiv4SMQxrx7R@smile.fi.intel.com>
References: <20211102161125.1144023-1-kernel@esmil.dk>
 <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CANBLGczn8+po09wF_uEvvU8tLCn0ahY+Gkj9JJLxOcj1LC1aLA@mail.gmail.com>
 <CAHp75VetDHt9G+PT77_py8N4Z06j7oytnXgQq8zss_xZBBeEng@mail.gmail.com>
 <CANBLGczTnf1UrRt=d-czaG-CE=Rwb1x6MV4c97ia+P3u5Mt8Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBLGczTnf1UrRt=d-czaG-CE=Rwb1x6MV4c97ia+P3u5Mt8Jg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 03, 2021 at 01:35:23PM +0100, Emil Renner Berthing wrote:
> On Wed, 3 Nov 2021 at 10:13, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Nov 2, 2021 at 10:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Tue, 2 Nov 2021 at 21:02, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > > +               irq_set_handler_locked(d, handle_bad_irq);
> > > >
> > > > Why? You have it already in ->probe(), what's the point?
> > >
> > > So last time you asked about this, I explained a situation where
> > > userspace first grabs a GPIO, set the interrupt to edge triggered, and
> > > then later loads a driver that requests an unsupported IRQ type.
> >
> > I didn't get this scenario. Is it real?
> 
> No, it's totally made up, but I mean we even have tools like fuzzing
> to help us find bugs that would never happen in real use cases.
> 
> > > Then
> > > I'd like to set the handler back to handle_bad_irq so we don't get
> > > weird interrupts, but maybe now you know a reason why that doesn't
> > > matter or can't happen?
> >
> > In ->probe() you set _default_ handler to bad(), what do you mean by
> > 'set the handler back to bad()'? How is it otherwise if you free an
> > interrupt?
> 
> It might not be, but when not sure I thought it better to error on the
> safe side.

With a dead code?

I do not believe there is an issue since. like I said, there are plenty drivers
that don't do what you are suggesting here --> 99.99% you added a dead code.

> > So, please elaborate with call traces what the scenario / use case you
> > are talking about. If it's true what you are saying, we have a
> > situation (plenty of GPIO drivers don't do what you are suggesting
> > here).

-- 
With Best Regards,
Andy Shevchenko


