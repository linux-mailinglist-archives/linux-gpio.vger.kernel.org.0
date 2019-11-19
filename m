Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9D8F102C80
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 20:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfKSTX7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 14:23:59 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:42057 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfKSTX7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 14:23:59 -0500
Received: by mail-il1-f193.google.com with SMTP id n18so20769180ilt.9;
        Tue, 19 Nov 2019 11:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RGKgQse+2zUETzuSKeTXkxYveXEDP29hamdnsp7R+og=;
        b=askECuY0sKnY6JfRE4vAAnKLB2f4sNcJJn4qK56kpboEru7RyEaznULE/diumVBWf3
         94BAfH9cxodgWl5SPs/UXCDOv20oKK103kT3eT5bgrrw3ez6FwYaavgpPI/vc6TjC4OG
         FO5dHcrurVAPNrA08y5CAigbpJZWyEjl9/8RseoXSvG5SlWxOLlDvRdvK85gVsq8+DiE
         /r5179jawy5FyTTIHuVgVJ1N6RfDA8eHiio8F6cl2L8hpapw9FIPQ/TMKS/zBDfOUR1V
         siZkNYQFRqIH3IpLLedEcWIWNP86hSbMBQv82yLpAqBUEIJuzpmCvcSWrFSnvbTbLR5A
         GVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGKgQse+2zUETzuSKeTXkxYveXEDP29hamdnsp7R+og=;
        b=PRAvqjAcqkofp6qUZZA9yf4a6eJtdYH2DmYBDBixNc+UL+YeKyjzqXFKaPcCNsg32C
         NxR1pkSSjfaxfL7bw8fzeabBpE4HOw2uow8Yg60982ntJE+zQgZ0KiKUxGXebIHyezfu
         L/AUACFScF88Drco5xuZUcd04W5Ccz2xebqENOpFSEYIS5JJz2NmGIcG0I5QFM+Kn7lt
         VZvfEzXzPQckG4jp+8NJABBTrPgJCP/yMRpEGvAeaVVgGQb437o63VVS/aWplLegBhPa
         L/sH0dmYk34ClLMboDLoeHDuQSHYXF2MiPXzW9HDTQxm1DvHgXB73xQaqG3LTBm2HSTh
         UZOQ==
X-Gm-Message-State: APjAAAXgTyBV/QJvEu33Y/NmO/gRySRDoo/wIJ0OmfSgXUuMtMt9naHo
        8BA4/97LDYnDJNiWs7FUdbSSJpXizt/XogO3+mQ=
X-Google-Smtp-Source: APXvYqzMsNLsNuLKQmGz5QLYw9GktP5TMss2pRqr/nZWt/EJC32YhROao6A0Ug/SVqayHkUIopAAcYKVM52leyBae88=
X-Received: by 2002:a92:b60e:: with SMTP id s14mr23833543ili.178.1574191438270;
 Tue, 19 Nov 2019 11:23:58 -0800 (PST)
MIME-Version: 1.0
References: <f0d383f3-8efa-ae68-62af-68f69cd4143f@free.fr> <20191119095748.GX25745@shell.armlinux.org.uk>
 <07db59e7-ff16-0457-87f2-fba10dc182d6@free.fr> <20191119105814.GZ25745@shell.armlinux.org.uk>
 <9356da2a-2190-03fd-f5cc-6a0fd8c38e89@free.fr> <20191119191958.GP36595@minitux>
In-Reply-To: <20191119191958.GP36595@minitux>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 19 Nov 2019 12:23:47 -0700
Message-ID: <CAOCk7NoHnFA73GPsvG1=0TCkE9+Hmdm41FVnDyMsunWrVa5xZg@mail.gmail.com>
Subject: Re: Using a GPIO as an interrupt line
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        GPIO <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 19, 2019 at 12:20 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 19 Nov 03:46 PST 2019, Marc Gonzalez wrote:
>
> > On 19/11/2019 11:58, Russell King - ARM Linux admin wrote:
> >
> > > On Tue, Nov 19, 2019 at 11:46:21AM +0100, Marc Gonzalez wrote:
> > >
> > >> On 19/11/2019 10:57, Russell King - ARM Linux admin wrote:
> > >>
> > >>> On Tue, Nov 19, 2019 at 10:28:15AM +0100, Marc Gonzalez wrote:
> > >>>
> > >>>> The board I'm working on provides a TCA9539 I/O expander.
> > >>>> Or, as the datasheet(*) calls it, a "Low Voltage 16-Bit I2C and
> > >>>> SMBus Low-Power I/O Expander with Interrupt Output, Reset Pin,
> > >>>> and Configuration Registers"
> > >>>>
> > >>>> (*) http://www.ti.com/lit/ds/symlink/tca9539.pdf
> > >>>>
> > >>>> The binding is documented in Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> > >>>>
> > >>>> I have some doubts about the interrupt output, described as:
> > >>>>
> > >>>> Optional properties:
> > >>>>  - interrupts: interrupt specifier for the device's interrupt output.
> > >>>>
> > >>>> In my board's DT, the I/O expander is described as:
> > >>>>
> > >>>>  exp1: gpio@74 {
> > >>>>          compatible = "ti,tca9539";
> > >>>>          reg = <0x74>;
> > >>>>          gpio-controller;
> > >>>>          #gpio-cells = <2>;
> > >>>>          reset-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
> > >>>>          pinctrl-names = "default";
> > >>>>          pinctrl-0 = <&top_exp_rst>;
> > >>>>          interrupt-parent = <&tlmm>;
> > >>>>          interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
> > >>
> > >> As pointed out by ukleinek on IRC, I might have (??) specified the wrong
> > >> trigger type. The data-sheet states:
> > >> "The TCA9539 open-drain interrupt (INTn) output is activated when any input state
> > >> differs from its corresponding Input Port register state, and is used to indicate
> > >> to the system master that an input state has changed."
> > >> (The data sheet speaks of "INT with a line on top"; what is the typical way to
> > >> write that in ASCII? I was told that adding a trailing 'n' or 'b' was common.)
> > >
> > > /INT or nINT are commonly used - I've never heard or seen 'b' (which is
> > > commonly used as a suffix on binary numbers) or a trailing 'n'.
> >
> > Perhaps the 'b' suffix is only used in French...
> > 'b' might stand for "barre" (i.e. the line above the symbol).
> >
> >
> > > Is pin 42 something that can be muxed?  If so, it seems sane to specify
> > > configuration for it.  Whether it needs to be a GPIO or whether it has
> > > a specific "interrupt" function mux state depends on the SoC.
> >
> > According to drivers/pinctrl/qcom/pinctrl-msm8998.c
> > PINGROUP(42, EAST, blsp_spi6, blsp_uart3_b, blsp_uim3_b, _, qdss, _, _, _, _)
> >
> > I don't think there is an explicit "interrupt" function in
> > this pinctrl driver... except FUNCTION(ssc_irq).
> >
>
> No there's no "interrupt" function, the function to be used is "gpio",
> which will ensure that the irq logic is available. But in a modern
> kernel we're implicitly selecting the "gpio" function if you're
> requesting an interrupt. So you shouldn't need to specify this even.
>
> > static const char * const ssc_irq_groups[] = {
> >       "gpio58", "gpio59", "gpio60", "gpio61", "gpio62", "gpio63", "gpio78",
> >       "gpio79", "gpio80", "gpio117", "gpio118", "gpio119", "gpio120",
> >       "gpio121", "gpio122", "gpio123", "gpio124", "gpio125",
> > };
> >
> > @Bjorn, do you know what these are used for?
> >
>
> The "ssc" would imply that it relates to the secure coprocessor somehow.

Are you sure?  "SSC" is the short hand for the sensor subsystem in the
documentation I see.
