Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE1F8102CD1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 20:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbfKSTfb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 14:35:31 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36064 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfKSTfa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 14:35:30 -0500
Received: by mail-pj1-f67.google.com with SMTP id cq11so3020612pjb.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2019 11:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pjTYxIxtDU6Ze3qBE8rvS00ENOM8wZ4I/N4Ykn0qVII=;
        b=CiK+y+GTuRsRMXyk56WHfhnPEVdUXSDLW5RtNkYsanzB2ZQRCQM1WnhlhQsjiZH/9E
         CbR4H8TEHGiIT+nQ4Yyoq32nlAAQNV844/Qrqm+dn50XBdSd/PdvbW/YD3hzGJEAryXF
         GH9J5moX6NojobP+1yzqKtH0s0FEEF4Q0xGT4/Z+QUKNGCCQ98BmqBD2lQVbE2jBptKY
         +2MqgJL14bTvGeJ30FCeFbTP0lYWd1An2iHEDxXRROXbPUgNzsWmZi7LNnxdE4C9xCtJ
         b0GcyW35FXLUDGIQNvkvG2AyZiOh/KhNHm5UgBn/yDWjXmbXiYuswtjI4gHyi27BuUhF
         vR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pjTYxIxtDU6Ze3qBE8rvS00ENOM8wZ4I/N4Ykn0qVII=;
        b=rG0EOWV6rzlZK/bzJv7Bn4yQznB9ijgXY3/7O+d0xB+if0NObn2lEbArByl3U+Y2L1
         i+9Am6lnSkQ8X5LvR4Q6sY7d8/ULQjmJ262xI8IFm/B23TNJJNK74nh59+HmQPv9wQCk
         qeBUlIK1yJIyfB+bRU2uKBdqjPM22kPZlAtnJcQE2pfmyXTkG5bbcuOxObnaXLCo6yep
         04CciB/sm9q7rEFW2LhzgStn8Zj+ZWLsBQxDaZkmOaeHq4vH5mt6dE9+jryGNZYxHh0F
         z/iH+46NKOja9yZ2R888CB14+kKQwK7qECj/zzbpfkrliDSGXmSW11YxPqY1XR4VnLHw
         CJEA==
X-Gm-Message-State: APjAAAU83llcfkhIb/61LXIiF2wYHZLZzXYVFtrzTRxwtP1auUvKa2kP
        3Yp29t3OUwS79KbblKQZ6iSBzTHhMT4=
X-Google-Smtp-Source: APXvYqzI8OJV08C1RUD9pd/5rXrUsdxhkH+1+3qLDeaPCV1g0IJxT7ZPbQUD4D0lIMnXSJt1zGx06A==
X-Received: by 2002:a17:902:be07:: with SMTP id r7mr15230932pls.33.1574192129611;
        Tue, 19 Nov 2019 11:35:29 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x29sm27336728pfj.131.2019.11.19.11.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 11:35:28 -0800 (PST)
Date:   Tue, 19 Nov 2019 11:35:26 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        GPIO <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: Using a GPIO as an interrupt line
Message-ID: <20191119193526.GQ36595@minitux>
References: <f0d383f3-8efa-ae68-62af-68f69cd4143f@free.fr>
 <20191119095748.GX25745@shell.armlinux.org.uk>
 <07db59e7-ff16-0457-87f2-fba10dc182d6@free.fr>
 <20191119105814.GZ25745@shell.armlinux.org.uk>
 <9356da2a-2190-03fd-f5cc-6a0fd8c38e89@free.fr>
 <20191119191958.GP36595@minitux>
 <CAOCk7NoHnFA73GPsvG1=0TCkE9+Hmdm41FVnDyMsunWrVa5xZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NoHnFA73GPsvG1=0TCkE9+Hmdm41FVnDyMsunWrVa5xZg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 19 Nov 11:23 PST 2019, Jeffrey Hugo wrote:

> On Tue, Nov 19, 2019 at 12:20 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 19 Nov 03:46 PST 2019, Marc Gonzalez wrote:
> >
> > > On 19/11/2019 11:58, Russell King - ARM Linux admin wrote:
> > >
> > > > On Tue, Nov 19, 2019 at 11:46:21AM +0100, Marc Gonzalez wrote:
> > > >
> > > >> On 19/11/2019 10:57, Russell King - ARM Linux admin wrote:
> > > >>
> > > >>> On Tue, Nov 19, 2019 at 10:28:15AM +0100, Marc Gonzalez wrote:
> > > >>>
> > > >>>> The board I'm working on provides a TCA9539 I/O expander.
> > > >>>> Or, as the datasheet(*) calls it, a "Low Voltage 16-Bit I2C and
> > > >>>> SMBus Low-Power I/O Expander with Interrupt Output, Reset Pin,
> > > >>>> and Configuration Registers"
> > > >>>>
> > > >>>> (*) http://www.ti.com/lit/ds/symlink/tca9539.pdf
> > > >>>>
> > > >>>> The binding is documented in Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> > > >>>>
> > > >>>> I have some doubts about the interrupt output, described as:
> > > >>>>
> > > >>>> Optional properties:
> > > >>>>  - interrupts: interrupt specifier for the device's interrupt output.
> > > >>>>
> > > >>>> In my board's DT, the I/O expander is described as:
> > > >>>>
> > > >>>>  exp1: gpio@74 {
> > > >>>>          compatible = "ti,tca9539";
> > > >>>>          reg = <0x74>;
> > > >>>>          gpio-controller;
> > > >>>>          #gpio-cells = <2>;
> > > >>>>          reset-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
> > > >>>>          pinctrl-names = "default";
> > > >>>>          pinctrl-0 = <&top_exp_rst>;
> > > >>>>          interrupt-parent = <&tlmm>;
> > > >>>>          interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
> > > >>
> > > >> As pointed out by ukleinek on IRC, I might have (??) specified the wrong
> > > >> trigger type. The data-sheet states:
> > > >> "The TCA9539 open-drain interrupt (INTn) output is activated when any input state
> > > >> differs from its corresponding Input Port register state, and is used to indicate
> > > >> to the system master that an input state has changed."
> > > >> (The data sheet speaks of "INT with a line on top"; what is the typical way to
> > > >> write that in ASCII? I was told that adding a trailing 'n' or 'b' was common.)
> > > >
> > > > /INT or nINT are commonly used - I've never heard or seen 'b' (which is
> > > > commonly used as a suffix on binary numbers) or a trailing 'n'.
> > >
> > > Perhaps the 'b' suffix is only used in French...
> > > 'b' might stand for "barre" (i.e. the line above the symbol).
> > >
> > >
> > > > Is pin 42 something that can be muxed?  If so, it seems sane to specify
> > > > configuration for it.  Whether it needs to be a GPIO or whether it has
> > > > a specific "interrupt" function mux state depends on the SoC.
> > >
> > > According to drivers/pinctrl/qcom/pinctrl-msm8998.c
> > > PINGROUP(42, EAST, blsp_spi6, blsp_uart3_b, blsp_uim3_b, _, qdss, _, _, _, _)
> > >
> > > I don't think there is an explicit "interrupt" function in
> > > this pinctrl driver... except FUNCTION(ssc_irq).
> > >
> >
> > No there's no "interrupt" function, the function to be used is "gpio",
> > which will ensure that the irq logic is available. But in a modern
> > kernel we're implicitly selecting the "gpio" function if you're
> > requesting an interrupt. So you shouldn't need to specify this even.
> >
> > > static const char * const ssc_irq_groups[] = {
> > >       "gpio58", "gpio59", "gpio60", "gpio61", "gpio62", "gpio63", "gpio78",
> > >       "gpio79", "gpio80", "gpio117", "gpio118", "gpio119", "gpio120",
> > >       "gpio121", "gpio122", "gpio123", "gpio124", "gpio125",
> > > };
> > >
> > > @Bjorn, do you know what these are used for?
> > >
> >
> > The "ssc" would imply that it relates to the secure coprocessor somehow.
> 
> Are you sure?  "SSC" is the short hand for the sensor subsystem in the
> documentation I see.

No, you're right. I guess the last two abbreviations where getting
old...

Regards,
Bjorn
