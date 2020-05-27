Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F068F1E4585
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 16:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388666AbgE0OP7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 10:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387800AbgE0OP6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 10:15:58 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A0BC08C5C1;
        Wed, 27 May 2020 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fUYUrCCcdXTrWp6s+3Qr43SGxV6xtJ+mBKuUSmw/8tU=; b=q+g9yyYAWMSo5KjyCTA+fX2BV
        VbpeDnNqtwQNuGc+J/edYitpsmOhhrI6ZFJvFC1YTQMEnE6bfwqAj6MRPOy3jQdNoekctvTYTUtxy
        L7w+3HbfWqNVgMyMz+42psOBq1+/FILaCfv3L+SPBZeSvXqk9kntukva7sRKZ62sjS/8MTEnoIlDC
        1DumXhlScBDYkYsG5U+lQYaLZK/RTWpz5joDWoTxms/60VXsDsVs7RAxhTWS45D+pG/CJtIBmoqNG
        Ct8K48x4JJs/KpD3r7DWWgx+nzIAaa8uiGOIv++BaWbZGY9/Z7+hHgvvLDye2OivL5IZjB+5w6jZF
        +FImMoRnQ==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:45760)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jdwqO-0002gO-AM; Wed, 27 May 2020 15:15:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jdwqM-0006V2-BY; Wed, 27 May 2020 15:15:42 +0100
Date:   Wed, 27 May 2020 15:15:42 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Subject: Re: [PATCH v2 1/4] gpio: gpiolib: Allow GPIO IRQs to lazy disable
Message-ID: <20200527141542.GP1551@shell.armlinux.org.uk>
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
 <1590253873-11556-2-git-send-email-mkshah@codeaurora.org>
 <CACRpkdba9j4EdCkD5OeL=3A4Zeb57vO78FAXA9fo0SOgBE57ag@mail.gmail.com>
 <3efa1f69-1e1d-f919-d47e-b4c5c73532b7@xs4all.nl>
 <CACRpkdY3pJVvAi_a=pVVQQbQyA3_b=o2pJqb5W8Wivp-SSy+tA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY3pJVvAi_a=pVVQQbQyA3_b=o2pJqb5W8Wivp-SSy+tA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 27, 2020 at 03:56:16PM +0200, Linus Walleij wrote:
> On Wed, May 27, 2020 at 12:38 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> 
> > However, I discovered that patch 256efaea1fdc ("gpiolib: fix up emulated
> > open drain outputs") broke the cec-gpio driver on the Raspberry Pi starting
> > with kernel v5.5.
> >
> > The CEC pin is an open drain pin that is used in both input and output
> > directions and has an interrupt (which is of course disabled while in
> > output mode).
> >
> > With this patch the interrupt can no longer be requested:
> >
> > [    4.157806] gpio gpiochip0: (pinctrl-bcm2835): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
> >
> > [    4.168086] gpio gpiochip0: (pinctrl-bcm2835): unable to lock HW IRQ 7 for IRQ
> > [    4.175425] genirq: Failed to request resources for cec-gpio@7 (irq 79) on irqchip pinctrl-bcm2835
> > [    4.184597] cec-gpio: probe of cec-gpio@7 failed with error -5
> 
> There is nothing conceptually wrong with that patch so I think we
> need to have the irqchip code check if it is input *OR* open drain.

Right - because, before this patch:

- if you have hardware that is capable of open-drain outputs, gpiolib
  will report that the GPIO is in *output* mode.
- if you have hardware that is not capable of open-drain outputs, and
  gpiolib emulates the open-drain nature by switching the GPIO
  direction, then gpiolib will report that the GPIO is in input mode.

What my patch does is provide consistent behaviour across all cases
by making open-drain outputs consistently report output mode
irrespective of the underlying hardware.

Whether an open-drain GPIO should be viewed as an input or as an output
is an interesting question, but the important thing as far as this
subsystem goes is to have consistent behaviour, otherwise having a
subsystem is utterly pointless.  However, consider whether it is sane
to request a change of state via gpiod_set_value() of a gpio that
reports itself as input, and have that request honoured and cause a
change of state of the "input" - clearly that is not sane.

In any case:

        cec->cec_gpio = devm_gpiod_get(dev, "cec", GPIOD_OUT_HIGH_OPEN_DRAIN);
        if (IS_ERR(cec->cec_gpio))
                return PTR_ERR(cec->cec_gpio);
        cec->cec_irq = gpiod_to_irq(cec->cec_gpio);
...
        ret = devm_request_irq(dev, cec->cec_irq, cec_gpio_irq_handler,
                               IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
                               cec->adap->name, cec);

So, the GPIO is requested in an _output_ mode, so it would be weird if
it were subsequently to be reported as an input just because it ended
up being an emulated open-drain output.

Hence, the above code would have failed if cec-gpio were used with
hardware that had open-drain semantics without needing the gpiolib
emulation for the same reason that's now triggering; such hardware
would report that the pin is in output mode, and the interrupt
allocation would fail.

While it's regrettable that fixing the inconsistency has caused a
regression, I think that has found another place where the semantics
aren't entirely sane, and as Linus says, _that_ needs fixing.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC for 0.8m (est. 1762m) line in suburbia: sync at 13.1Mbps down 424kbps up
