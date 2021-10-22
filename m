Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60197437A67
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 17:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbhJVP4x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 11:56:53 -0400
Received: from mga14.intel.com ([192.55.52.115]:50470 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233328AbhJVP4w (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Oct 2021 11:56:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10145"; a="229597260"
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; 
   d="scan'208";a="229597260"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2021 08:54:34 -0700
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; 
   d="scan'208";a="534971271"
Received: from smile.fi.intel.com ([10.237.72.184])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2021 08:54:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1mdwrs-00099C-P1;
        Fri, 22 Oct 2021 18:54:04 +0300
Date:   Fri, 22 Oct 2021 18:54:04 +0300
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
Message-ID: <YXLenBb21jTZlGu0@smile.fi.intel.com>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
 <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
 <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com>
 <CAHp75VfwmSfeUPvUXT3TTf0ZYGMfBZ0qaPoB0_SCzyR=Fb_Emw@mail.gmail.com>
 <CANBLGcwz7s5OJer-37mQC2r_H0trec04S69ovYdU2_LbiVrtYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBLGcwz7s5OJer-37mQC2r_H0trec04S69ovYdU2_LbiVrtYw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 22, 2021 at 05:36:21PM +0200, Emil Renner Berthing wrote:
> On Fri, 22 Oct 2021 at 17:25, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Oct 22, 2021 at 5:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Fri, 22 Oct 2021 at 16:50, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > AFAICS they are sequential 4 32-bit registers.
> > >
> > > That's right, but we're on a 64bit machine, so DECLARE_BITMAP will
> > > give us an unsigned long array that doesn't match that.
> >
> > I didn't get it, sorry.
> > You will have a bitmap array which you will split to 32-bit values.
> > What you will probably need is to move  xgpio_get_value32() and void
> > xgpio_set_value32() to the one of bitmap related headers (look for
> > bitmap_get_value8() and friends).
> >
> > > > So bitmap is exactly what is suitable here, you are right!
> > > > See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.
> > >
> > > None of them has a pre-initialized const DECLARE_BITMAP, so they don't
> > > have to deal with the 4 vs. 2 commas problem.
> >
> > I believe it's well possible to refactor this to look much better with
> > bitmaps (as it represents the hardware very well).
> 
> Right, but how exactly? This works on on 64bit, but not with 32bit COMPILE_TEST:
> 
> static const DECLARE_BITMAP(jh7100_reset_asserted, JH7100_RSTN_END) = {
>         /* STATUS0 register */
>         BIT_MASK(JH7100_RST_U74) |
>         BIT_MASK(JH7100_RST_VP6_DRESET) |
>         BIT_MASK(JH7100_RST_VP6_BRESET) |
>         /* STATUS1 register */
>         BIT_MASK(JH7100_RST_HIFI4_DRESET) |
>         BIT_MASK(JH7100_RST_HIFI4_BRESET),
>         /* STATUS2 register */
>         BIT_MASK(JH7100_RST_E24) |
>         /* STATUS3 register */
>         0,
> };

BITMAP_FROM_U64() ?

> > > > > Also is there a macro for handling that we'd then need 4 commas on
> > > > > 32bit COMPILE_TEST and 2 commas on 64bit?
> > > > > If you have some other way in mind you'll have to be a lot more explicit again.
> > > > >
> > > > > The point of the jh7100_reset_asserted array is that it exactly
> > > > > mirrors the values of the status registers when the lines are
> > > > > asserted.

-- 
With Best Regards,
Andy Shevchenko


