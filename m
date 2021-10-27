Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA8E43C7BA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 12:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235094AbhJ0Kfy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Oct 2021 06:35:54 -0400
Received: from mga02.intel.com ([134.134.136.20]:39239 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232538AbhJ0Kfx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Oct 2021 06:35:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217302551"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; 
   d="scan'208";a="217302551"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 03:33:28 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; 
   d="scan'208";a="494749377"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 03:33:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mfgEu-001R9N-7R;
        Wed, 27 Oct 2021 13:33:00 +0300
Date:   Wed, 27 Oct 2021 13:32:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
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
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
Message-ID: <YXkq27y50bVTcwhF@smile.fi.intel.com>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-7-kernel@esmil.dk>
 <163527959276.15791.14765586510805526101@swboyd.mtv.corp.google.com>
 <CANBLGcyYb3yNit=GCy4w2zf2=CRtCJP7aCisR8=9n1f7okfCSg@mail.gmail.com>
 <163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com>
 <CANBLGcx0Udhaa3S+uSffFcB_KFHXQiMOvn8Fd7ogj+RFxQNAfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBLGcx0Udhaa3S+uSffFcB_KFHXQiMOvn8Fd7ogj+RFxQNAfQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 27, 2021 at 12:24:07PM +0200, Emil Renner Berthing wrote:
> On Wed, 27 Oct 2021 at 02:54, Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Emil Renner Berthing (2021-10-26 15:35:36)
> > > On Tue, 26 Oct 2021 at 22:20, Stephen Boyd <sboyd@kernel.org> wrote:
> > > > Quoting Emil Renner Berthing (2021-10-21 10:42:13)

...

> > > > > +static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
> > > >
> > > > Drop __init as this can be called after kernel init is over.
> > >
> > > Oh interesting, I'd like to know when that can happen. The comment for
> > > the builtin_platform_driver macro says it's just a wrapper for
> >
> > I thought this was using module_platform_driver() macro?
> >
> > > device_initcall.
> > >
> > > Won't we then need to remove all the __initconst tags too since the
> > > probe function walks through jh7100_clk_data which eventually
> > > references all __initconst data?
> >
> > Yes. If it's builtin_platform_driver() it can't be a module/tristate
> > Kconfig, in which case all the init markings can stay.
> 
> Yes, it's already bool in the Kconfig file. After looking into this I
> think it's better to do like the rockchip drivers and use
> builtin_platform_driver_probe to make sure the probe function only
> called at kernel init time:
> 
> static struct platform_driver clk_starfive_jh7100_driver = {
>         .driver = {
>                 .name = "clk-starfive-jh7100",
>                 .of_match_table = clk_starfive_jh7100_match,
>                 .suppress_bind_attrs = true,
>         },
> };
> builtin_platform_driver_probe(clk_starfive_jh7100_driver,
> clk_starfive_jh7100_probe);
> 
> @Andy: is the supress_bind_attrs what you were asking about?

Clever chap! :-)
Yes, that's what I have in mind.

...

> > If it's never going to be a module then don't add any module_* things.
> 
> So does that just mean no MODULE_DEVICE_TABLE or should I also remove
> MODULE_DESCRIPTION, MODULE_AUTHOR and MODULE_LICENSE? I'm just double
> checking because the rockchip drivers seem to have MODULE_DESCRIPTION
> and MODULE_LICENSE lines.

You may comment them out. Convert them to comments or so.
But in general yes, they are no-ops in such case.

-- 
With Best Regards,
Andy Shevchenko


