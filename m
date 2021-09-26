Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F69418A29
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Sep 2021 18:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbhIZQax (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Sep 2021 12:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbhIZQax (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Sep 2021 12:30:53 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C65C061570
        for <linux-gpio@vger.kernel.org>; Sun, 26 Sep 2021 09:29:16 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id x7so43811763edd.6
        for <linux-gpio@vger.kernel.org>; Sun, 26 Sep 2021 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mrpqEGXkdRVATTwfs964+o2v7wQC/o4cyKIoWs2zCco=;
        b=UYz+3UUunArRb8CTdy7VUokteTDtp+YPHQ6Vh9ZHamFIBIDTPUgL9s3lVzKw/OiSap
         k5wdX7l9/bjd4QOPXEEYWWm32m2sVX6ZhEcIWGZe6L4JZi5HWSxU1SgsVUmTr8R4Lu+U
         Z08Rgb/z32hIBvjyfTHMARo83ImZZrKuGTjly65egRpnwfPgOVVLeOw8mpy1phEmXFOm
         N2h2w1TlsyDbba7f+QpW5bIl2eCC5cZJ1R6OYlIigRVJXFL7jRcmvqNfwgMlqRIT8l+1
         M49OT+IKgib6kIWTIVN7xPrPIM521LnbB4aC1VWveg921OEwcUODDabu/faO5zjKTyJE
         vkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mrpqEGXkdRVATTwfs964+o2v7wQC/o4cyKIoWs2zCco=;
        b=39cv30CEnT0NwR+GekNJrDKTGPFsuUP+/tPmC8XYA2vxfpUjuzGSCsNZniPR2889So
         sTo2bI3ueRmf0NcKNHMMy4Z/dhvKntn2rAQo+SvgTDFPCRxfEv3dlFNN7mj/CKDxAwwk
         9B9vXQ/KFY6CA/jLUJED0BkFIgmjKpZGPCn8o0f9r+EEKm0H6n1SgZCdyJ8RmTJQ5pKs
         gbh7pBwdiARAAT3HWrqJDjfTmB5Xb67ei4wsVOrEvrtcqclWOsJG+O9KMCCQ6ctjp7/9
         YPMKMZuShGDn2evX9545Z2uDhV6Wx3EJOoWCr58IhPN+EIjb6Be849YGYoTpZBBysk1s
         3J8Q==
X-Gm-Message-State: AOAM5328NFbbUecKPgF+thay+awET6vSUNkr0b7tP3aTAYmpjoU43Fmk
        hPe+OWSK+Gjzmhd+rdUTjjMmrtWLH5STjswtq5Y=
X-Google-Smtp-Source: ABdhPJwrVkzNS44q2pbudOstVHyjCxQKWfGT7DAg5CmsJqOS+yJgLKmRFRw/Uvi8qKKdfLvpB14v2sYYzhwvDg+uuQ0=
X-Received: by 2002:a05:6402:358a:: with SMTP id y10mr17687230edc.238.1632673755309;
 Sun, 26 Sep 2021 09:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210921222956.40719-1-joey.gouly@arm.com> <20210921222956.40719-2-joey.gouly@arm.com>
 <YUrZR/Tl7obfehXP@smile.fi.intel.com> <20210925134425.GA4681@e124191.cambridge.arm.com>
 <CAHp75VecEoUnNLx_tw3Fa=9jaDQaXbaaN=gGfFSXPkvpUOihoQ@mail.gmail.com>
 <CACRpkdY01KsAo1OP=MF0LKWt1r5UDXDW=U0Bce1ZMPQGcXmrjg@mail.gmail.com>
 <50d6a8f0-c515-43dc-af06-b31bf8f863df@www.fastmail.com> <CACRpkdb-TZfjyonddfHjOFqZXuLSGi7ER3_onnom-5VYm5GsgQ@mail.gmail.com>
 <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com>
In-Reply-To: <9e7842b6-eff5-440d-b97a-175bd8e37fa6@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 26 Sep 2021 19:28:36 +0300
Message-ID: <CAHp75Vc0CyhuqbVhpO-2xnjM5ZR2px5psZTVsKGdhx++OFB-kg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        nd <nd@arm.com>, Stan Skowronek <stan@corellium.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 26, 2021 at 5:36 PM Sven Peter <sven@svenpeter.dev> wrote:
> On Sun, Sep 26, 2021, at 15:10, Linus Walleij wrote:
> > On Sun, Sep 26, 2021 at 2:56 PM Sven Peter <sven@svenpeter.dev> wrote:
> >> On Sun, Sep 26, 2021, at 14:48, Linus Walleij wrote:
> >
> >> > I think npins should be known from the compatible (we know that
> >> > this version of the SoC has so and so many pins) and the base
> >> > should always be 0? It's not like we have several pin controllers
> >> > of this type in the SoC is it?
> >>
> >> I've just checked: Looks like there are four different pin controllers of
> >> this type with a different number of pins each in Apple's device tree for
> >> the M1.
> >
> > So we need to understand this hardware: is this something like
> > south/north/east/west, so the pins are oriented around the chip?
> >
> > I would suspect they should then be compatibles:
> > apple,t8103-pinctrl-north, apple,t8103-pinctrl
> > apple,t8103-pinctrl-south, apple,t8103-pinctrl
> > apple,t8103-pinctrl-west, apple,t8103-pinctrl
> > apple,t8103-pinctrl-east, apple,t8103-pinctrl
> >
> > going from specific to general signifying that we know which one
> > we are dealing with and then we know the npins etc.
>
> Apple calls those four controllers "gpio", "nub-gpio", "smc-gpio"
> and "aop-gpio". SMC is their system management controller and AOP
> is their "always-on processor". No idea what "nub-gpio" is.

It's similar to what we have in Baytrail/Cherrytrail.
AOP -> SUS
SMC -> ...

nub is probably related to some type of hub (or maybe simple typo, or
typo on purpose?).

> > This also gives a normal grouping of functions associated with
> > pins and the portion of the SoC, see for
> > example drivers/pinctrl/intel/pinctrl-broxton.c.
> >
> > This shows that it might have been a bad idea to define the
> > pins as opaque, because now that is hiding the fact that
> > these pins are grouped in four distinct sets.
> > APPLE_PINMUX(pin, func)
> >
> > Should rather have been APPLE_PINMUX(cardinal, pin, func)
> > where cardinal would be 0..3 for north, south, west, east.
> >
> > This is a bit of guessing actually, but we should definitely
> > try to make the driver reflect the reality and not over-generalize.
> > If these four blocks in the SoC are different, they should have
> > different compatible strings, because they are not, by
> > definition, compatible.
>
> I'd prefer to have a single compatible and get the npins from some
> property and I don't think that's necessarily over-generalizing.
> AFAICT Apple has been using the exact same MMIO interface for years
> and I'd expect them to continue using it in the future. The only thing
> that seems to change is the number of pins available and their assignment.
> If we just have a single compatible we can likely support the M1X/2 or
> however Apple calls the next SoCs with just a simple DTB change without
> touching any driver code.

Hmm... Dunno the details, but at least AOP GPIO is definitely ca[able
of waking a system from a deep sleep (that's what SUS == suspend do on
Intel). Haven't checked if you implemented ->irq_set_wake() callbacks,
though.

And I don't know if the pin's in the rest of the GPIO blocks have the
wake-source capable pins. Also I don't know if it's fine to have one
compatible string if you really know that the difference is the amount
of pins and nothing else (like crucial properties being changed).

-- 
With Best Regards,
Andy Shevchenko
