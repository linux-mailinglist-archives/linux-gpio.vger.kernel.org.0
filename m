Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2DD10226A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 11:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfKSK6Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 05:58:24 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:49720 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfKSK6Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 05:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=pBNFAmR97FBBaDRon/x0r4cncQGaBYrVkV812xH4WiQ=; b=eRv+9ikfmnAvDgsavYtbZsQq7
        Ufx+ZmJ/BmlQ5PH5rnF1HMUQC+4ryuRA6pQDX/jKa9UIva+X0w3qwgHCGJsazt813Hlo1Kefl4WfN
        TWf4eDTQB0DbpiZEODulp/mu9Kz3lnsBFa3j5DQ2DMOen15/cPzNXuEskQ7eJqPNHq/aupMZrxqrL
        P5O4bcNPi5u/+Zf7Gg4jatl404+rXk1w5mTjBfQJ4g9JGAwg+o+l/EJVRwUUZVUvZJ4ouVlmRMosb
        ZpGPVinQBf5+kHIL1QYUnz2XN6ACV/3oVBI943mhW660MD1c+SVIb9aiNtVbcehCpCQaljc0GZ+jM
        dZ5qqn6XQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41676)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iX1D8-0000me-4N; Tue, 19 Nov 2019 10:58:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iX1D4-0000f2-UF; Tue, 19 Nov 2019 10:58:14 +0000
Date:   Tue, 19 Nov 2019 10:58:14 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     GPIO <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Subject: Re: Using a GPIO as an interrupt line
Message-ID: <20191119105814.GZ25745@shell.armlinux.org.uk>
References: <f0d383f3-8efa-ae68-62af-68f69cd4143f@free.fr>
 <20191119095748.GX25745@shell.armlinux.org.uk>
 <07db59e7-ff16-0457-87f2-fba10dc182d6@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07db59e7-ff16-0457-87f2-fba10dc182d6@free.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

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

/INT or nINT are commonly used - I've never heard or seen 'b' (which is
commonly used as a suffix on binary numbers) or a trailing 'n'.

> According to that description, it looks like IRQ_TYPE_LEVEL_LOW?

Yes.

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

Is pin 42 something that can be muxed?  If so, it seems sane to specify
configuration for it.  Whether it needs to be a GPIO or whether it has
a specific "interrupt" function mux state depends on the SoC.

For example, on the LX2160A, there are a bunch of pins that can be muxed
as one of:
- gpio
- interrupt
- something else

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
