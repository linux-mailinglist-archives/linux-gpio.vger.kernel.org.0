Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09BDE11AC56
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 14:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729029AbfLKNpe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 08:45:34 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38789 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729590AbfLKNpe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 08:45:34 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1if2J2-0002j6-Sx; Wed, 11 Dec 2019 14:45:32 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1if2J1-0004pK-A8; Wed, 11 Dec 2019 14:45:31 +0100
Date:   Wed, 11 Dec 2019 14:45:31 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: Trying to understand basic concepts about GPIO reset pin
Message-ID: <20191211134531.4olcqep5ork5h4fn@pengutronix.de>
References: <e8b645da-9921-0436-ccfa-9abf4ae5b9d6@free.fr>
 <20191211132203.GD25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191211132203.GD25745@shell.armlinux.org.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 01:22:03PM +0000, Russell King - ARM Linux admin wrote:
> On Wed, Dec 11, 2019 at 02:05:45PM +0100, Marc Gonzalez wrote:
> > Hello,
> > 
> > I've asked linusw a few times on IRC, and every time, I /think/ I understand,
> > then I get confused again later. So I'm trying to understand once and for all.
> > 
> > Please do not hesitate to correct any mistake/misconception below.
> > 
> > I want to discuss a "simple" GPIO reset pin.
> > 
> > 1) When a reset pin is ACTIVE, the corresponding circuit is "held" in reset.
> > In other words, when a reset pin is ACTIVE, the circuit is DISABLED / does not
> > receive power, clocks don't tick, nothing changes state.
> 
> Not necessarily.  Whether a circuit is powered or clocked has nothing
> really to do with whether it is in reset or not.  Many devices specify
> that power and clocks must be applied prior to reset being released,
> which is sensible because it allows the reset to set the initial state
> of the circuitry.
> 
> > 2a) If a signal is ACTIVE HIGH, that means the signal is ACTIVE when the voltage
> > on the line is HIGH (e.g. 3.3V or 5V)
> 
> Correct.
> 
> > 2b) If a signal is ACTIVE LOW, that means the signal is ACTIVE when the voltage
> > on the line is LOW (e.g. 0V, connected to ground)
> 
> Correct.
> 
> > 3) Usually(?) a reset signal is ACTIVE LOW. That way, when the SoC is coming up,
> > and current has not propagated everywhere, LOW voltage on the reset pin means
> > the circuit is "held" in reset, until we are ready to set voltage HIGH on the
> > reset pin to disable the reset, and enable the circuit.
> 
> I don't think there's a "usually" about it.  Some devices take an
> active high reset, others take an active low reset.
> 
> > Suppose a circuit's HW description states:
> > 
> > RESET_N:
> > External Reset.
> > Active LOW reset signal to the device.
> > See Figure 4.6 on page 21 for reset timing requirements.
> > Figure 4.6 shows the minimum timing interval for RESET_N.
> > RESET_N must be driven LOW for at least the period of 200 µs before accessing registers.
> > 
> > 
> > 4) The DT node for this device should describe the reset pin as GPIO_ACTIVE_LOW:
> > 
> > 	reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
> 
> I would say so - the reset is active low, so specifying it as active low
> in DT seems entirely sensible.
> 
> > OK, now we're getting into the parts of the GPIO API I don't understand well.
> > 
> > If I just call
> > 
> > 	devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> > 
> > then I am able to interact with the device. How can that be?
> 
> This is where things get complicated.  GPIOD_OUT_LOW is
> GPIOD_FLAGS_BIT_DIR_SET | GPIOD_FLAGS_BIT_DIR_OUT without
> GPIOD_FLAGS_BIT_DIR_VAL.  The above will therefore call:
> 
> 	gpiod_direction_output(gpiod, !!(dflags & GPIOD_FLAGS_BIT_DIR_VAL));
> 
> which will be zero.  gpiod_direction_output() respects the inversion
> that GPIO_ACTIVE_LOW specified in DT.  So, GPIOD_OUT_LOW will set
> the reset signal _high_.
> 
> I don't blame you for thinking this is confusing - the terminology
> adopted in the kernel certainly is.
> 
> Thnk of whatever you give to the non-raw functions as "low means
> inactive, high means active".

I think it would be good to not pass GPIOD_OUT_LOW to
devm_gpiod_get_optional (et al). Something like

	devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_ACTIVE);

would be much less confusing. Not sure this exists, but it would make a
good alias for GPIOD_OUT_HIGH.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
