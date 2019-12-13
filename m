Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8BEB11DB10
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 01:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731395AbfLMAUP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 19:20:15 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:38202 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731360AbfLMAUP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 19:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LqxUPL3Y4cuUH/Zy0P7G5Mo/xf7O+6Q0H0QIj59ubzk=; b=dUJuHNdqzI6cdDeW8wLQqYrtv
        nRNBfK4nAcqE2vDxPUZugGiY2ltVvDB55ttppJrFjX2OhSLnTxTVXOoMjz15D3WF0Py7DHMl1co97
        pf0+pkLnF3ujJiiaoGhUrZBL+Zh2QSkVz7j72vQI4lb2/SNJYRph+fLr1SVn14FmrTFb7o88VYi9N
        AsUS3tbcCNh0IHyZ4rO8QOt15nwnge8TV1KpZ+lipgfi539PfqWy+BYLATmYxCflMOYC9m11jFaQf
        ikPCPM/VNJs1arceK196oO1KHIIrfyKSD89f0YSkHpXzo4H1s2AeOskp45tYlyVJStowjsguGQxNg
        Sa7oODncA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52214)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ifYgl-0001Vk-Ed; Fri, 13 Dec 2019 00:20:11 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ifYgk-0007Ke-68; Fri, 13 Dec 2019 00:20:10 +0000
Date:   Fri, 13 Dec 2019 00:20:10 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: pinctrl states vs pinmux vs gpio (i2c bus recovery)
Message-ID: <20191213002010.GO25745@shell.armlinux.org.uk>
References: <20191206173343.GX25745@shell.armlinux.org.uk>
 <CACRpkdZv2rzA8AbFZKq0XVBaXNJR8c5tsb+1KTZ7fNuWjm5cbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZv2rzA8AbFZKq0XVBaXNJR8c5tsb+1KTZ7fNuWjm5cbQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 09, 2019 at 01:20:15AM +0100, Linus Walleij wrote:
> Hi Russell,
> 
> very nice description of this dual-mode problem.
> 
> I wish I had a simple and elegant way we could make it
> unambiguous and simple to use ... but it beats me right
> now.
> 
> On Fri, Dec 6, 2019 at 6:33 PM Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> 
> > One may expect:
> >
> >         pinctrl_select_state(i2c_imx->pinctrl, i2c_imx->pinctrl_pins_default);
> >
> > to change them back to the default state, but that would be incorrect.
> > The first thing that pinctrl_select_state() does is check whether
> >
> >         p->state == state
> >
> > which it will do, as the pinctrl layer hasn't been informed of the
> > change that has happened behind its back at the pinmux level.
> 
> Some pin controllers have the .strict property set
> in their struct pinmux_ops:
> 
> * @strict: do not allow simultaneous use of the same pin for GPIO and another
> *      function. Check both gpio_owner and mux_owner strictly before approving
> *      the pin request.
> 
> The non-strict pin controllers are those that actually allow GPIO
> and device functions to be used on the same physical line at the
> same time. In this case there is not special GPIO mode for the
> line in some muxing registers, they are just physically connected
> somehow.
> 
> One usecase is sort of like how tcpdump work for
> ethernet interfaces: a GPIO register can "snoop" on a pin while
> in used by another device.
> 
> But it would notably also allow you to drive the line and interfere
> with the device. Which is exactly what this I2C recovery mechanism
> does, just that its pin controller is actually strict, will not allow
> the same line to be used for GPIO and some other function at the
> same time, so I suppose i.MX should probably explore the
> strict mode.
> 
> Enabling that will sadly make the problem MORE complex
> for this I2C recovery, requiring a cycle of
> gpiod_put()/gpiod_get() to get it released from GPIO mode, i.e.
> we would need to just get the GPIO when this is strictly needed.
> Using devm_gpiod_get() and keeping a reference descriptor
> around would not work all of a sudden.
> 
> I am thinking whether we can handle the non-strict controllers
> in a more elegant way, or add some API to explicitly hand over
> between device function and GPIO function. But I can't really
> see some obvious solution.

What I'm currently trying is (error handling removed for brevity):

	struct i2c_bus_recovery_info *bri = &i2c->recovery;

        i2c->pinctrl = devm_pinctrl_get(dev);
        i2c->pinctrl_default = pinctrl_lookup_state(i2c->pinctrl,
                                                    PINCTRL_STATE_DEFAULT);
        i2c->pinctrl_recovery = pinctrl_lookup_state(i2c->pinctrl,
						     "recovery");
        bri->sda_gpiod = devm_gpiod_get(dev, "sda", GPIOD_OUT_HIGH_OPEN_DRAIN);
        bri->scl_gpiod = devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);

	pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_recovery);
	return pinctrl_select_state(i2c->pinctrl, i2c->pinctrl_default);

which seems good enough to get the pins back into i2c mode after the
gpios are obtained.  Then we switch the pinctrl state between
pinctrl_recovery and pinctrl_default as we have need to.

The problem is, the generic i2c bus recovery code wants the gpiod
descriptors to be setup and inplace by the time i2c_init_recovery()
is called (which is called when the adapter is registered) so
holding off until we need to do recovery doesn't work.

This seems to work for this SoC I'm currently working with, but I
think there's more on the horizon - I'm having the same problems
on another SoC which also needs bus recovery implemented, and as
the problem device is behind an I2C bus mux, when it locks the I2C
bus, it kills all I2C buses rooted at that particular SoC I2C
controller.  However, there's a problem - the pinctrls for that SoC
are set by ROM firmware at boot time by reading a table from the
boot media.  *Unprintables about firmware being too way limiting*. :p

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
