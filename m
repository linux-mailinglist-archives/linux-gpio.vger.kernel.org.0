Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1834F4B0F33
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 14:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242275AbiBJNum (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 08:50:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238801AbiBJNul (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 08:50:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CB5137;
        Thu, 10 Feb 2022 05:50:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD863615AB;
        Thu, 10 Feb 2022 13:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DF1C340E5;
        Thu, 10 Feb 2022 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644501040;
        bh=yelTkvjXmm2LzgSetjjvCkMLsl1bQryxvo4T42bzOXs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Dqa3BCRghpOb8+8ZqoPR8tJsh4xP6yAN/+5llwO4mRDHTR+rYD1fRRN8OU/fcgCnQ
         ZnXHgCkr/JgJitbXkZf9Xx+2nXe7w3RfJ/zNKHtY9YNSnt073QSGdCVrAD7aLbea2k
         JGwyi2BkWWktfvtHZwtsFdTOCh2insLdTsJsh6D01ykS6tG5L0EiKTYnQ2zKeyS9a+
         1QpvfaNo5liiPvhLtWDUCrkQxoZASIsLVa3AtTe56vSVHJDKh0EPoPfHfWShoGbcv2
         v7wajeuwySYzPiOZbglf9FgoX3pCX7cM41kXAjdyk+pa/tQn/0pEM/78Vte2tYkfV2
         jzIAR5n8u/0OQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1nI9qH-006utO-SM; Thu, 10 Feb 2022 13:50:38 +0000
Date:   Thu, 10 Feb 2022 13:50:37 +0000
Message-ID: <87tud64yqa.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        kernel-team@android.com
Subject: Re: [PATCH 10/10] pinctrl: starfive: Switch to dynamic chip name output
In-Reply-To: <CANBLGcyvMVdTnndMSWDFnN6207Nareps=AdzVvt0OaMdeAXEHg@mail.gmail.com>
References: <20220209162607.1118325-1-maz@kernel.org>
        <20220209162607.1118325-11-maz@kernel.org>
        <CANBLGcwKeLn7Q1Ra8pCw=cXy=kJeEFRmBjOxjds10+k70LvzXA@mail.gmail.com>
        <87zgmz3xbf.wl-maz@kernel.org>
        <CANBLGcwwrqkYS2cxX5dYAaoWdj5pRp9c+qBDAMb3=0D5oBD+Zg@mail.gmail.com>
        <87v8xm4zkm.wl-maz@kernel.org>
        <CANBLGcyvMVdTnndMSWDFnN6207Nareps=AdzVvt0OaMdeAXEHg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kernel@esmil.dk, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, matthias.bgg@gmail.com, grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org, tony@atomide.com, tglx@linutronix.de, vz@mleia.com, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 10 Feb 2022 13:44:12 +0000,
Emil Renner Berthing <kernel@esmil.dk> wrote:
> 
> On Thu, 10 Feb 2022 at 14:32, Marc Zyngier <maz@kernel.org> wrote:
> > On Thu, 10 Feb 2022 12:59:59 +0000,
> > Emil Renner Berthing <kernel@esmil.dk> wrote:
> > >
> > > On Thu, 10 Feb 2022 at 10:06, Marc Zyngier <maz@kernel.org> wrote:
> > > > On Wed, 09 Feb 2022 23:30:55 +0000,
> > > > Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > >
> > > > > On Wed, 9 Feb 2022 at 17:49, Marc Zyngier <maz@kernel.org> wrote:
> > > > > >
> > > > > > Instead of overloading the name field, use the relevant callback to
> > > > > > output the device name.
> > > > > >
> > > > > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > > > > ---
> > > > > >  drivers/pinctrl/pinctrl-starfive.c | 11 +++++++++--
> > > > > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/pinctrl/pinctrl-starfive.c b/drivers/pinctrl/pinctrl-starfive.c
> > > > > > index 5be9866c2b3c..f29d9ccf858b 100644
> > > > > > --- a/drivers/pinctrl/pinctrl-starfive.c
> > > > > > +++ b/drivers/pinctrl/pinctrl-starfive.c
> > > > > > @@ -15,6 +15,7 @@
> > > > > >  #include <linux/of.h>
> > > > > >  #include <linux/platform_device.h>
> > > > > >  #include <linux/reset.h>
> > > > > > +#include <linux/seq_file.h>
> > > > > >  #include <linux/spinlock.h>
> > > > > >
> > > > > >  #include <linux/pinctrl/pinctrl.h>
> > > > > > @@ -1163,12 +1164,20 @@ static int starfive_irq_set_type(struct irq_data *d, unsigned int trigger)
> > > > > >         return 0;
> > > > > >  }
> > > > > >
> > > > > > +static void starfive_irq_print_chip(struct irq_data *d, struct seq_file *p)
> > > > > > +{
> > > > > > +       struct starfive_pinctrl *sfp = starfive_from_irq_data(d);
> > > > > > +
> > > > > > +       seq_printf(p, sfp->gc.label);
> > > > > > +}
> > > > > > +
> > > > > >  static struct irq_chip starfive_irq_chip = {
> > > > > >         .irq_ack = starfive_irq_ack,
> > > > > >         .irq_mask = starfive_irq_mask,
> > > > > >         .irq_mask_ack = starfive_irq_mask_ack,
> > > > > >         .irq_unmask = starfive_irq_unmask,
> > > > > >         .irq_set_type = starfive_irq_set_type,
> > > > > > +       .irq_print_chip = starfive_irq_print_chip,
> > > > > >         .flags = IRQCHIP_SET_TYPE_MASKED,
> > > > > >  };
> > > > >
> > > > > The parent interrupt doesn't show up in /proc/interrupts anyway, so if
> > > > > setting the name is considered abuse we can just drop the addition
> > > > > above and just delete the two lines below.
> > > >
> > > > Are you sure this never appears? Is there a another irqchip stacked on
> > > > top of this one? Could you please dump /sys/kernel/debug/irq/irqs/XX,
> > > > where XX is an interrupt number using one of these GPIO pins? Please
> > > > run it without this patch, as I just noticed that debugfs blindly
> > > > uses the name.
> > >
> > > Yes, the old gpio driver this derives from used to set
> > >     sfp->gc.irq.parent_handler = NULL
> > > and then register its own irq handler, then the parent would show up
> > > in /proc/interrupts. But after switching to letting the gpio framework
> > > register the handler it stopped showing up.
> >
> > But this patch does not deal with the parent interrupt. It deals with
> > the irqchip that is used for the 'children interrupt'. Output
> > interrupts for a chained handler are never shown, as they don't really
> > make much sense on their own (you'd only see the sum of the input
> > interrupts).
> 
> I see. Sorry for the confusion.
> 
> > >
> > > root@visionfive~# cat /proc/interrupts
> > >            CPU0       CPU1
> > >   5:       5035       4907  RISC-V INTC   5 Edge      riscv-timer
> > >   6:        960          0  SiFive PLIC   4 Edge      dw-mci
> > >   7:       4384          0  SiFive PLIC   5 Edge      dw-mci
> > >   8:        562          0  SiFive PLIC   6 Edge      eth0
> > >  10:          1          0  SiFive PLIC   7 Edge      eth0
> > >  11:          0          0  SiFive PLIC   2 Edge      dw_axi_dmac_platform
> > >  15:       2690          0  SiFive PLIC  44 Edge      xhci-hcd:usb1
> > >  17:          0          0  SiFive PLIC  43 Edge      104c0000.usb
> > >  18:          0          0  SiFive PLIC   1 Edge      dw_axi_dmac_platform
> > >  20:        234          0  SiFive PLIC  96 Edge      118b0000.i2c
> > >  21:          0          0  SiFive PLIC  97 Edge      118c0000.i2c
> > >  22:          7          0  SiFive PLIC  98 Edge      118d0000.trng
> > >  28:          0          0  SiFive PLIC 101 Edge      sf_lcdc
> > >  29:          0          0  SiFive PLIC 103 Edge      sf_vpp1
> > >  30:          0          0  SiFive PLIC  70 Edge      12410000.spi
> > >  31:        205          0  SiFive PLIC  73 Edge      ttyS0
> > >  32:          0          0  SiFive PLIC  74 Edge      12450000.i2c
> > >  33:          0          0  SiFive PLIC  80 Edge      12480000.watchdog
> > >  34:         28          0  SiFive PLIC 122 Edge      124a0000.tmon
> > >  37:          0          0  11910000.pinctrl  35 Edge      gpiomon
> >                               ^^^^^^^^^^^^^^^^
> > This is what this patch deals with. Going with your suggestion of
> > dropping this output (or to hardcode it to something else) would be a
> > userspace visible change, and we can't do that.
> 
> Gotcha. The SoC has been out in very few numbers for less than a year
> and the driver only entered mainline in 5.17-rc1, so I doubt anyone
> has had time to write scripts that check for this, but I'll let it be
> up to you.

Ah, I should have checked that. In which case, would you be OK if I
simply pushed the removal of this label as a fix for 5.17, and just
have it to say "Star5 GPIO", for example, without any indication of
the device (which appears in debugfs anyway as part of the irqdomain)?

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
