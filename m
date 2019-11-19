Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AAF910225D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 11:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfKSK4X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 05:56:23 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35209 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbfKSK4X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 05:56:23 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iX1BF-0003lq-Jv; Tue, 19 Nov 2019 11:56:21 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iX1BD-0005UN-W8; Tue, 19 Nov 2019 11:56:19 +0100
Date:   Tue, 19 Nov 2019 11:56:19 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        GPIO <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Using a GPIO as an interrupt line
Message-ID: <20191119105619.4osmin7m5ryqfwih@pengutronix.de>
References: <f0d383f3-8efa-ae68-62af-68f69cd4143f@free.fr>
 <20191119095748.GX25745@shell.armlinux.org.uk>
 <07db59e7-ff16-0457-87f2-fba10dc182d6@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07db59e7-ff16-0457-87f2-fba10dc182d6@free.fr>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Marc,

On Tue, Nov 19, 2019 at 11:46:21AM +0100, Marc Gonzalez wrote:
> On 19/11/2019 10:57, Russell King - ARM Linux admin wrote:
> 
> > On Tue, Nov 19, 2019 at 10:28:15AM +0100, Marc Gonzalez wrote:
> > 
> >> The board I'm working on provides a TCA9539 I/O expander.
> >> Or, as the datasheet(*) calls it, a "Low Voltage 16-Bit I2C and
> >> SMBus Low-Power I/O Expander with Interrupt Output, Reset Pin,
> >> and Configuration Registers"
> >>
> >> (*) http://www.ti.com/lit/ds/symlink/tca9539.pdf
> >>
> >> The binding is documented in Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> >>
> >> I have some doubts about the interrupt output, described as:
> >>
> >> Optional properties:
> >>  - interrupts: interrupt specifier for the device's interrupt output.
> >>
> >> In my board's DT, the I/O expander is described as:
> >>
> >> 	exp1: gpio@74 {
> >> 		compatible = "ti,tca9539";
> >> 		reg = <0x74>;
> >> 		gpio-controller;
> >> 		#gpio-cells = <2>;
> >> 		reset-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
> >> 		pinctrl-names = "default";
> >> 		pinctrl-0 = <&top_exp_rst>;
> >> 		interrupt-parent = <&tlmm>;
> >> 		interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
> 
> As pointed out by ukleinek on IRC, I might have (??) specified the wrong
> trigger type. The data-sheet states:
> "The TCA9539 open-drain interrupt (INTn) output is activated when any input state
> differs from its corresponding Input Port register state, and is used to indicate
> to the system master that an input state has changed."
> (The data sheet speaks of "INT with a line on top"; what is the typical way to
> write that in ASCII? I was told that adding a trailing 'n' or 'b' was common.)

Or a # as pre- or suffix ... (Didn't know about 'b')

> According to that description, it looks like IRQ_TYPE_LEVEL_LOW?
> (Weird, because it worked well with IRQ_TYPE_LEVEL_HIGH.)
> 
> > This specifies an interrupt signal, number 42, on the tlmm interrupt
> > controller. It isn't a GPIO specification. Not every interrupt is a
> > GPIO, and some SoCs can have dedicated interrupt pins that are
> > exactly that.
> > 
> > Hence, needlessly limiting an external device to requiring a GPIO for
> > its interrupt is detrimental.
> 
> That makes complete sense.
> 
> IIUC, what is missing in my DT spec is defining pin 42 as a GPIO pin.
> Looking more closely at top_exp_rst:
> 
> 	top_exp_rst: top_exp_rst {
> 		mux {
> 			pins = "gpio96";
> 			function = "gpio";
> 		};
> 
> 		config {
> 			pins = "gpio96";
> 			drive-strength = <2>;
> 			bias-pull-down;
> 		};
> 	};
> 
> IIUC, this defines pin 96 as a GPIO pin (as well as defining some low-level
> properties of the pin). Likely I need something similar for pin 42?

Having a pin configured as GPIO is the boot default setting for many
SoCs/pins. So you might get away with not specifying a setting for pin
42, but that's not as robust as configuring that explicitly.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
