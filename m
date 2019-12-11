Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 103EB11ABFC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 14:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbfLKNWL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 08:22:11 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:41382 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729567AbfLKNWL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 08:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IH1s0cjqyMsMpDY0+X+5G2W/GuMaf647MqSabKEwRKo=; b=bQRr4DxFM0gt0AuX9H05e77AW
        xgPpIGWbqfMS4ylNcIEq+CMuRYAaDbAgSuxEOTzGDjBNtvFqDmSZHKr9TW3aBVZh6kjrjOQR3dYKE
        VDe6mTh10Gs0IO7KCuGTjqKnYC2g5hgKQhl0RqC2mI0dal0xeLLSEPXPDf8M2yfDcMVWQ3uPjCGar
        c0dh28JYhvwJ44PfqRMoMq6jrEPItwvjZ3SLGfiJUmyjDAt5zEqswbRBW/aW7mcYQL7JZIE2yPF7x
        QDWYcJh6BBorRBrlz1/b62nCMJ56zU9naKqHhGr/3FwQkMXIxbPfBM+uUGOO7M5pkxHW6NYQxhP5p
        Tp3bxfHnQ==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:47408)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1if1wM-00009W-6l; Wed, 11 Dec 2019 13:22:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1if1wJ-0005sr-ND; Wed, 11 Dec 2019 13:22:03 +0000
Date:   Wed, 11 Dec 2019 13:22:03 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Subject: Re: Trying to understand basic concepts about GPIO reset pin
Message-ID: <20191211132203.GD25745@shell.armlinux.org.uk>
References: <e8b645da-9921-0436-ccfa-9abf4ae5b9d6@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8b645da-9921-0436-ccfa-9abf4ae5b9d6@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 02:05:45PM +0100, Marc Gonzalez wrote:
> Hello,
> 
> I've asked linusw a few times on IRC, and every time, I /think/ I understand,
> then I get confused again later. So I'm trying to understand once and for all.
> 
> Please do not hesitate to correct any mistake/misconception below.
> 
> I want to discuss a "simple" GPIO reset pin.
> 
> 1) When a reset pin is ACTIVE, the corresponding circuit is "held" in reset.
> In other words, when a reset pin is ACTIVE, the circuit is DISABLED / does not
> receive power, clocks don't tick, nothing changes state.

Not necessarily.  Whether a circuit is powered or clocked has nothing
really to do with whether it is in reset or not.  Many devices specify
that power and clocks must be applied prior to reset being released,
which is sensible because it allows the reset to set the initial state
of the circuitry.

> 2a) If a signal is ACTIVE HIGH, that means the signal is ACTIVE when the voltage
> on the line is HIGH (e.g. 3.3V or 5V)

Correct.

> 2b) If a signal is ACTIVE LOW, that means the signal is ACTIVE when the voltage
> on the line is LOW (e.g. 0V, connected to ground)

Correct.

> 3) Usually(?) a reset signal is ACTIVE LOW. That way, when the SoC is coming up,
> and current has not propagated everywhere, LOW voltage on the reset pin means
> the circuit is "held" in reset, until we are ready to set voltage HIGH on the
> reset pin to disable the reset, and enable the circuit.

I don't think there's a "usually" about it.  Some devices take an
active high reset, others take an active low reset.

> Suppose a circuit's HW description states:
> 
> RESET_N:
> External Reset.
> Active LOW reset signal to the device.
> See Figure 4.6 on page 21 for reset timing requirements.
> Figure 4.6 shows the minimum timing interval for RESET_N.
> RESET_N must be driven LOW for at least the period of 200 µs before accessing registers.
> 
> 
> 4) The DT node for this device should describe the reset pin as GPIO_ACTIVE_LOW:
> 
> 	reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;

I would say so - the reset is active low, so specifying it as active low
in DT seems entirely sensible.

> OK, now we're getting into the parts of the GPIO API I don't understand well.
> 
> If I just call
> 
> 	devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> 
> then I am able to interact with the device. How can that be?

This is where things get complicated.  GPIOD_OUT_LOW is
GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT without
GPIOD_FLAGS_BIT_DIR_VAL.  The above will therefore call:

	gpiod_direction_output(gpiod, !!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));

which will be zero.  gpiod_direction_output() respects the inversion
that GPIO_ACTIVE_LOW specified in DT.  So, GPIOD_OUT_LOW will set
the reset signal _high_.

I don't blame you for thinking this is confusing - the terminology
adopted in the kernel certainly is.

Thnk of whatever you give to the non-raw functions as "low means
inactive, high means active".

> 
> Is GPIOD_OUT_LOW a /logical/ low?
> In other words, does the call above really set the line HIGH
> => RESET INACTIVE => CIRCUIT ENABLED ?

Correct.

> The problem is that it does not guarantee that the line was LOW for 200 µs
> before being set HIGH, right?

Correct.

> It would appear that the correct sequence of calls for my circuit should be:
> 
> a)	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> b)	usleep_range(200, 300);
> c)	gpiod_set_value_cansleep(reset, 0);

Correct.

> If I understand correctly:
> a) configures the pin as an output, and sets it to LOGICAL HIGH, i.e. PHYSICAL LOW
> b) keeps the RESET_N signal at PHYSICAL LOW for 200-300 µs
> c) sets the pin to LOGICAL 0/LOW = PHYSICAL HIGH

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
