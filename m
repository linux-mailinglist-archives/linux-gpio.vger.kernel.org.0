Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6288D102C76
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 20:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfKSTUC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 14:20:02 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:44450 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfKSTUC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 14:20:02 -0500
Received: by mail-pg1-f173.google.com with SMTP id e6so3863057pgi.11
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2019 11:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Qio7ElcX4cvHV7fnYSvJfkUTKXZs/DnMfuV15j1rnnU=;
        b=zlnSLEE4zmxTmCw6K6/aKxUPsFgv7wkpksrcjnlWPh8xHEbq/zRspg7xYvb0/rVXa4
         7CcVtsE7z5p+UililVIO7SAUz7KGu71FXaD+cFTpVtOIyxRh9UfTkI8NatrSyvmW6vX4
         Zzn5g9ycKeDK+UhsNhmRi5Fxiahh1cbpDDPhviJlZi3qc09zCFeNIQo3btb6NOQqyPVt
         xFCT/bEJL7mX5rtYAEBW/fQeF0phkFHjD9XQ6nLMFT9b1cp45dmIfSC5mxgfEkHaWzxC
         HBODSodQs/XmYDNAWUfhoDIzqushEJEpLvcUyel2a3mMkGbVZO22nIe1QJ42Shc9bLgc
         3j3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qio7ElcX4cvHV7fnYSvJfkUTKXZs/DnMfuV15j1rnnU=;
        b=hWNrAckZgML7AaadwLlycbAcD0aboI6TGAKy3JomNZq4bZqRejMTI5C/JBOjMWzhjq
         oqeuyR6cmN980BHiuDEWSfK0KWkmhdPGZKPj7aRCRQI9sS90UXq5pUFO5eOepfUZ5YuJ
         FmuPLCqcsoWMo/kYa5BkPzYqJe4Y7U4l98+o0ioVTkyKjHRsM8RVa6FRf+XGXMJ29MMD
         g3Wu2v/xUKbmDHRZPqYbAkU17CiEu92L8sKbCLWGQnpVZTGODKCF38WO3E2Wjc5p6kyp
         A0+Eh0pqP+C3v01Fcc+KN4I2OhfwIi5fphQmt857v6T49V2lbIBzGqn2gBxV+hnyLNNY
         REMQ==
X-Gm-Message-State: APjAAAWCZFBmmz7U7Lc7Jq2ktobyI7yhlZxzo2kGEAncjk1Zx8Ld9lEC
        3ar0Y5YAjv3gNBntV5zJebn3/A==
X-Google-Smtp-Source: APXvYqy6RoYSL7e0rnhUW+FCU/i+gbbrS4kSfOqX07jXxqCNNdlcu2vwWXYReY6VxGC4PnWjXseE0A==
X-Received: by 2002:a63:1303:: with SMTP id i3mr7366420pgl.430.1574191201144;
        Tue, 19 Nov 2019 11:20:01 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d23sm26930886pfo.140.2019.11.19.11.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 11:20:00 -0800 (PST)
Date:   Tue, 19 Nov 2019 11:19:58 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        GPIO <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Subject: Re: Using a GPIO as an interrupt line
Message-ID: <20191119191958.GP36595@minitux>
References: <f0d383f3-8efa-ae68-62af-68f69cd4143f@free.fr>
 <20191119095748.GX25745@shell.armlinux.org.uk>
 <07db59e7-ff16-0457-87f2-fba10dc182d6@free.fr>
 <20191119105814.GZ25745@shell.armlinux.org.uk>
 <9356da2a-2190-03fd-f5cc-6a0fd8c38e89@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9356da2a-2190-03fd-f5cc-6a0fd8c38e89@free.fr>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 19 Nov 03:46 PST 2019, Marc Gonzalez wrote:

> On 19/11/2019 11:58, Russell King - ARM Linux admin wrote:
> 
> > On Tue, Nov 19, 2019 at 11:46:21AM +0100, Marc Gonzalez wrote:
> >
> >> On 19/11/2019 10:57, Russell King - ARM Linux admin wrote:
> >>
> >>> On Tue, Nov 19, 2019 at 10:28:15AM +0100, Marc Gonzalez wrote:
> >>>
> >>>> The board I'm working on provides a TCA9539 I/O expander.
> >>>> Or, as the datasheet(*) calls it, a "Low Voltage 16-Bit I2C and
> >>>> SMBus Low-Power I/O Expander with Interrupt Output, Reset Pin,
> >>>> and Configuration Registers"
> >>>>
> >>>> (*) http://www.ti.com/lit/ds/symlink/tca9539.pdf
> >>>>
> >>>> The binding is documented in Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> >>>>
> >>>> I have some doubts about the interrupt output, described as:
> >>>>
> >>>> Optional properties:
> >>>>  - interrupts: interrupt specifier for the device's interrupt output.
> >>>>
> >>>> In my board's DT, the I/O expander is described as:
> >>>>
> >>>> 	exp1: gpio@74 {
> >>>> 		compatible = "ti,tca9539";
> >>>> 		reg = <0x74>;
> >>>> 		gpio-controller;
> >>>> 		#gpio-cells = <2>;
> >>>> 		reset-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
> >>>> 		pinctrl-names = "default";
> >>>> 		pinctrl-0 = <&top_exp_rst>;
> >>>> 		interrupt-parent = <&tlmm>;
> >>>> 		interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
> >>
> >> As pointed out by ukleinek on IRC, I might have (??) specified the wrong
> >> trigger type. The data-sheet states:
> >> "The TCA9539 open-drain interrupt (INTn) output is activated when any input state
> >> differs from its corresponding Input Port register state, and is used to indicate
> >> to the system master that an input state has changed."
> >> (The data sheet speaks of "INT with a line on top"; what is the typical way to
> >> write that in ASCII? I was told that adding a trailing 'n' or 'b' was common.)
> > 
> > /INT or nINT are commonly used - I've never heard or seen 'b' (which is
> > commonly used as a suffix on binary numbers) or a trailing 'n'.
> 
> Perhaps the 'b' suffix is only used in French...
> 'b' might stand for "barre" (i.e. the line above the symbol).
> 
> 
> > Is pin 42 something that can be muxed?  If so, it seems sane to specify
> > configuration for it.  Whether it needs to be a GPIO or whether it has
> > a specific "interrupt" function mux state depends on the SoC.
> 
> According to drivers/pinctrl/qcom/pinctrl-msm8998.c
> PINGROUP(42, EAST, blsp_spi6, blsp_uart3_b, blsp_uim3_b, _, qdss, _, _, _, _)
> 
> I don't think there is an explicit "interrupt" function in
> this pinctrl driver... except FUNCTION(ssc_irq).
> 

No there's no "interrupt" function, the function to be used is "gpio",
which will ensure that the irq logic is available. But in a modern
kernel we're implicitly selecting the "gpio" function if you're
requesting an interrupt. So you shouldn't need to specify this even.

> static const char * const ssc_irq_groups[] = {
> 	"gpio58", "gpio59", "gpio60", "gpio61", "gpio62", "gpio63", "gpio78",
> 	"gpio79", "gpio80", "gpio117", "gpio118", "gpio119", "gpio120",
> 	"gpio121", "gpio122", "gpio123", "gpio124", "gpio125",
> };
> 
> @Bjorn, do you know what these are used for?
> 

The "ssc" would imply that it relates to the secure coprocessor somehow.

Regards,
Bjorn
