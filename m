Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6BB43C675
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 11:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240958AbhJ0Jd0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Oct 2021 05:33:26 -0400
Received: from mga12.intel.com ([192.55.52.136]:26461 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230195AbhJ0JdZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Oct 2021 05:33:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="210203097"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; 
   d="scan'208";a="210203097"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 02:31:00 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; 
   d="scan'208";a="635661120"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 02:30:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mffGT-001QWu-IZ;
        Wed, 27 Oct 2021 12:30:33 +0300
Date:   Wed, 27 Oct 2021 12:30:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-serial@vger.kernel.org,
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
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
Message-ID: <YXkcOZnoGd96wjOU@smile.fi.intel.com>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-7-kernel@esmil.dk>
 <163527959276.15791.14765586510805526101@swboyd.mtv.corp.google.com>
 <CANBLGcyYb3yNit=GCy4w2zf2=CRtCJP7aCisR8=9n1f7okfCSg@mail.gmail.com>
 <163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 26, 2021 at 05:54:03PM -0700, Stephen Boyd wrote:
> Quoting Emil Renner Berthing (2021-10-26 15:35:36)
> > On Tue, 26 Oct 2021 at 22:20, Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Emil Renner Berthing (2021-10-21 10:42:13)

...

> > > > +static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
> > >
> > > Drop __init as this can be called after kernel init is over.
> > 
> > Oh interesting, I'd like to know when that can happen. The comment for
> > the builtin_platform_driver macro says it's just a wrapper for
> 
> I thought this was using module_platform_driver() macro?
> 
> > device_initcall.
> > 
> > Won't we then need to remove all the __initconst tags too since the
> > probe function walks through jh7100_clk_data which eventually
> > references all __initconst data?
> 
> Yes. If it's builtin_platform_driver() it can't be a module/tristate
> Kconfig, in which case all the init markings can stay.

What about bind/unbind attribute?

-- 
With Best Regards,
Andy Shevchenko


