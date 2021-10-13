Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18FD42C710
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 18:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbhJMRAg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 13:00:36 -0400
Received: from mga12.intel.com ([192.55.52.136]:20038 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230415AbhJMRAf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Oct 2021 13:00:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="207594565"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="207594565"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 09:58:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="547986866"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.159])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 09:58:23 -0700
Received: from andy by smile with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1makM2-0001gg-8h;
        Wed, 13 Oct 2021 22:55:58 +0300
Date:   Wed, 13 Oct 2021 22:55:58 +0300
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
Message-ID: <YWc5zq0Moz3asWEa@smile.fi.intel.com>
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGczDZh+kLWM017mPenY8WO5OovH2DFUSS-shRD-aZVKa0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBLGczDZh+kLWM017mPenY8WO5OovH2DFUSS-shRD-aZVKa0A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 13, 2021 at 06:38:14PM +0200, Emil Renner Berthing wrote:
> On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +free_pinmux:
> > > +       devm_kfree(dev, pinmux);
> > > +free_pins:
> > > +       devm_kfree(dev, pins);
> > > +free_grpname:
> > > +       devm_kfree(dev, grpname);
> >
> > What the heck?!
> 
> Just to be clear. You mean we don't need to explicitly free them
> because they're tied to the device right? I don't think the device
> will go away just because a single device tree entry can't be parsed,
> so on such errors this garbage would be left behind. You can still
> argue we shouldn't optimize for broken device trees, I just want to
> make it at conscious decision.

If you are using devm_kfree() it is quite likely shows either of the following
issues:

* you mustn't use devm_*() in the first place due to object lifetime;
* you shouldn't use devm_kfree() since this is the whole point of devm.

> > > +free_pgnames:
> > > +       devm_kfree(dev, pgnames);
> >
> > Ditto.

...

> > > +out:
> >
> > Useless label.
> 
> Hmm.. my compiler disagrees.

The comment implies that you return directly instead of using `goto out;`.

> > > +       return ret;

...

> > > +               v = pinmux[i];
> > > +               dout = ((v & BIT(7)) << (31 - 7)) | ((v >> 24) & 0xffU);
> > > +               doen = ((v & BIT(6)) << (31 - 6)) | ((v >> 16) & 0xffU);
> > > +               din  = (v >> 8) & 0xffU;
> >
> > What is this voodoo for?
> 
> In order to do pinmux we need the following pieces of information from
> the device tree for each pin ("GPIO" they call it):
> 
> output signal: 0-133 + 1bit reverse flag
> output enable signal: 0-133 + 1bit reverse flag
> optional input signal: 0-74 + special "none" value, right now 0xff
> gpio number: 0-63
> 
> As the code is now all that info is packed into a u32 for each pin
> using the GPIOMUX macro defined in the dt-binding header added in
> patch 10. There is also a diagram for how this packing is done. The
> above voodoo is for unpacking that.
> 
> I'd very much like to hear if you have a better solution for how to
> convey that information from the device tree to here.

At very least this code should have something like above in the comment.

...

> > > +               if (din != 0xff)
> > > +                       reg_din = sfp->base + GPIO_IN_OFFSET + 4 * din;
> > > +               else
> > > +                       reg_din = NULL;
> >
> > This looks like you maybe use gpio-regmap instead?
> 
> This was discussed at length when Drew sent in the GPIO part of this code:
> https://lore.kernel.org/linux-riscv/20210701002037.912625-1-drew@beagleboard.org/
> The conclusion was that because pinmux and controlling the pins from
> software in GPIO mode uses the same registers it is better to do a
> combined driver like this that can share the lock among other things.

And what does prevent exactly to base the GPIO part on gpio-regmap?

...

> > > +static const unsigned char starfive_drive_strength[] = {
> > > +       14, 21, 28, 35, 42, 49, 56, 63,
> >
> > Why table? Can you simply use the formula?!
> 
> Heh, yeah. So these are rounded values from a table and I never
> noticed that after rounding they follow a nice arithmetic progression.
> It'll probably still be nice to have an explanation in the comments
> about the formula then.

Yup!

> > > +};

...

> > > +               irq_set_handler_locked(d, handle_bad_irq);
> >
> > Why is this here? Move it to ->probe().
> 
> My thinking was that if something tries to set a an unsupported irq
> type, we should make sure the caller doesn't get spurious interrupts
> because we left the handler at its old value.

You already assigned to this handler in the ->probe(), what's this then?

...

> > > +               if (value <= 6)
> > > +                       writel(value, sfp->padctl + IO_PADSHARE_SEL);
> > > +               else
> >
> > > +                       dev_err(dev, "invalid signal group %u\n", value);
> >
> > Why _err if you not bail out here?
> 
> My thinking was that if the device tree specifies an invalid signal
> group we should just leave the setting alone and not break booting,
> but still be loud about it. Maybe that's too lenient and it's better
> to crash and burn immediately if someone does that.

Here is inconsistency between level of the message and following action.
There are (rare!) cases when it's justified, but I believe it's not the
case here. You have two choices or justify why you have to use error
level without stopping process.

...

All uncommented stuff you agreed on, correct?

-- 
With Best Regards,
Andy Shevchenko


