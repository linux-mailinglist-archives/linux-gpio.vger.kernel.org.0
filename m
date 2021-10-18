Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F03432691
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 20:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbhJRSke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 14:40:34 -0400
Received: from mga05.intel.com ([192.55.52.43]:29303 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229924AbhJRSkd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Oct 2021 14:40:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="314535751"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="314535751"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 11:38:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="444203257"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 11:38:15 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mcXWF-000Ide-QR;
        Mon, 18 Oct 2021 21:37:55 +0300
Date:   Mon, 18 Oct 2021 21:37:55 +0300
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
Message-ID: <YW2/A4ZQwbFX0uPB@smile.fi.intel.com>
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
 <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
 <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
 <CANBLGcw1qMB7r7TbuQEevOPHq94wAtZNs=yFQ3UP_DEREvGz6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBLGcw1qMB7r7TbuQEevOPHq94wAtZNs=yFQ3UP_DEREvGz6g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 18, 2021 at 06:35:10PM +0200, Emil Renner Berthing wrote:
> On Mon, 18 Oct 2021 at 18:24, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Mon, Oct 18, 2021 at 6:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Mon, 18 Oct 2021 at 17:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > > > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > > > >
> > > > > > > +                       mask |= PAD_BIAS_MASK;
> > > > > >
> > > > > > Use it...
> > > > > >
> > > > > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > > > > >
> > > > > > ...here. Ditto for the similar cases in this function and elsewhere.
> > > > >
> > > > > I don't follow. How do you want me to use mask? If I did value =
> > > > > (value & ~mask) | PAD_BIAS_DISABLE; then I'd wipe the previous
> > > > > configuration. Eg. suppose the first config is the drive strength and
> > > > > second disables bias. Then on the 2nd loop mask =
> > > > > PAD_DRIVE_STRENGTH_MASK | PAD_BIAS_MASK and the drive strength value
> > > > > would be wiped.
> > > >
> > > > Collect masks and new values in temporary variables and apply them
> > > > once after the loop is done, no?
> > >
> > > But that's exactly what the code does. It merges all the config
> > > options into a single mask and value so we only need to do rmw on the
> > > register once.
> >
> > Then masking the value makes no sense.
> > What you should have is simply as
> >
> >   mask |= FOO;
> >   value |= BAR;
> 
> Yeah, but then we could get into weird states if the device tree
> specifies both bias-disable and bias-pull-up by mistake. This code is
> written so that only the last valid state is chosen.

But shouldn't it be disallowed by:
 1) DTC validator (Rob?)
 2) GPIO / pin control (Linus, Bart?)
?

...

> > > > > > > +       ret = clk_prepare_enable(clk);
> > > > > > > +       if (ret) {
> > > > > >
> > > > > > > +               reset_control_deassert(rst);
> > > > > >
> > > > > > Use devm_add_action_or_reset().
> > > > >
> > > > > I don't see how that is better.
> > > >
> > > > Pity. The rule of thumb is to either try to use devm_*() everywhere in
> > > > the probe, or don't use it at all. Above is the more-or-less standard
> > > > pattern where devn_add_action_or_reset() is being used in the entire
> > > > kernel.
> > > >
> > > > > Then I'd first need to call that and
> > > > > check for errors, but just on the line below enabling the clock the
> > > > > reset line is deasserted anyway, so then the action isn't needed any
> > > > > longer. So that 3 lines of code for devm_add_action_or_reset +
> > > > > lingering unneeded action or code to remove it again vs. just the line
> > > > > above.
> > > >
> > > > Then don't use devm_*() at all. What's the point?
> > >
> > > I'm confused. So you wan't an unneeded action to linger because the
> > > probe function temporarily asserts reset for 3 lines of code?
> >
> > I;m talking about clk_prepare_enable().
> 
> Ok, you wrote your comment under the reset_control_deassert call. How
> would devm_add_action_or_reset for clk_prepare_enable work?

It seems both are needed to be converted, otherwise _everything_ after
reset_assert() should not be devm_*().

TL;DR: the rule is
  Allowed:	devm_*() followed by non-devm_*()
  NOT allowed:	devm_*() followed by non-devm_*() followed by devm_*()

Of course, you may try to work the latter one, but it diminishes the whole
idea behind it, that's why I told that may be not using devm_*() is the
correct approach here and that what you meant (?).

The example how to use above mentioned API, just grep for it.

# See [1] for the sources of the used script
$ gl4func.sh devm_add_action_or_reset clk_prepare_enable | wc -l
101


[1]: https://github.com/andy-shev/home-bin-tools/blob/master/gl4func.sh

-- 
With Best Regards,
Andy Shevchenko


