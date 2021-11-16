Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45F9A4529CB
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 06:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234270AbhKPFes (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 00:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbhKPFec (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 00:34:32 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DFDC2D8F3E;
        Mon, 15 Nov 2021 18:44:14 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id 193so19062208qkh.10;
        Mon, 15 Nov 2021 18:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+IsQBHoFAXBIkB1Kw8WNji5f2haXZUreOBVyURuDYXY=;
        b=l72T4yHHjmckvxjl/bthixU/FwFfghPSs3EadNJjMWX37Etlj/vn2pNjYgjl+dEV+4
         YQKDwq6Hl/65E3gKuGjHyRmWm6bE9SYztKS+bGWD5trEp4yVqmVWGia7jT1x2rSCG9Va
         bAsV/ONCMORPfMlrW4T9/C4ya+OhPhV3+JRxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+IsQBHoFAXBIkB1Kw8WNji5f2haXZUreOBVyURuDYXY=;
        b=PcKjITc5DykR3RtiYctr+5CHbuTg8Pck2/VmBlJFnQbT9ZBf82cEi1XqlH4OLIPfog
         dRI3nldwUrAHToh//wDfOcnXPgSB4IlIa2RtSQCUstmphkMPka8SbN65KIzuOWen1iBA
         VZlm2Eh3MvSDO3Sg0MjeKwoec0hnJju3MyZprl/OiS/U2kbV3vY9KgEE0OVDKCpD/Kk7
         sHcYar9EJayUGsHZ++PsdUJW+1YckvYw2IUENnO97KWD9cscgOfpHbxx+1VYo+80/jgz
         ZjsQKb1Ujs8WZDwqinep1fa0dz2LJhdNSiXzTNym3cPku4hYCrf3mtUifwSQ0Dm5/S9A
         hITw==
X-Gm-Message-State: AOAM532kc7bN7fa/MkeUesvmWdCUIiT6g21qjVtkwrfbLZOPZ/OlYqV2
        Obfsmjr9po0ayT+qunrUvXTDsb9Ba1PZ+QJbgRQ=
X-Google-Smtp-Source: ABdhPJwFg2x8AJ1R5syQ8XsYLcOycKjHQkw7M4LD3hkby3taUtS6CF+5GtXIucrImQ59MMWh5GgdKa+ymtIJF4dYXg8=
X-Received: by 2002:a05:620a:38f:: with SMTP id q15mr3429838qkm.291.1637030653516;
 Mon, 15 Nov 2021 18:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20210921043936.468001-1-andrew@aj.id.au> <20210921043936.468001-2-andrew@aj.id.au>
 <CACRpkdZRWzq_j_UsU+eZurv1wT7muB1V4ktui1-Q0mHV3xw58A@mail.gmail.com>
In-Reply-To: <CACRpkdZRWzq_j_UsU+eZurv1wT7muB1V4ktui1-Q0mHV3xw58A@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 16 Nov 2021 02:44:00 +0000
Message-ID: <CACPK8Xef1hVFFAJS-tHa+fjR0SgNZ7d5W04KwOYi-CvQdpnJww@mail.gmail.com>
Subject: Re: [PATCH 1/2] leds: pca955x: Make the gpiochip always expose all pins
To:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-leds@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Pavel and Arnd,

This one has slipped through the cracks. Andrew asked for a follow up
and Linus sent a review, but we haven't heard from Pavel at all.

We've merged device tree changes through the soc tree in v5.16 that
depend on this patch. Ideally I would like to see it applied to fix
those device trees, instead of sending reverts for the device trees.

Additionally, I'm now reviewing changes for v5.17 and want to decide
which direction we should take.

Pavel, are you happy with the change?

If so, would you consider merging it as a fix for v5.16?

Cheers,

Joel

On Tue, 9 Nov 2021 at 11:03, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Sep 21, 2021 at 6:40 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> > The devicetree binding allows specifying which pins are GPIO vs LED.
> > Limiting the instantiated gpiochip to just these pins as the driver
> > currently does requires an arbitrary mapping between pins and GPIOs, but
> > such a mapping is not implemented by the driver. As a result,
> > specifying GPIOs in such a way that they don't map 1-to-1 to pin indexes
> > does not function as expected.
> >
> > Establishing such a mapping is more complex than not and even if we did,
> > doing so leads to a slightly hairy userspace experience as the behaviour
> > of the PCA955x gpiochip would depend on how the pins are assigned in the
> > devicetree. Instead, always expose all pins via the gpiochip to provide
> > a stable interface and track which pins are in use.
> >
> > Specifying a pin as `type = <PCA955X_TYPE_GPIO>;` in the devicetree
> > becomes a no-op.
> >
> > I've assessed the impact of this change by looking through all of the
> > affected devicetrees as of the tag leds-5.15-rc1:
> >
> > ```
> > $ git grep -l 'pca955[0123]' $(find . -name dts -type d)
> > arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> > arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> > arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> > arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts
> > arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> > arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
> > arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> > ```
> >
> > These are all IBM-associated platforms. I've analysed both the
> > devicetrees and schematics where necessary to determine whether any
> > systems hit the hazard of the current broken behaviour. For the most
> > part, the systems specify the pins as either all LEDs or all GPIOs, or
> > at least do so in a way such that the broken behaviour isn't exposed.
> >
> > The main counter-point to this observation is the Everest system whose
> > devicetree describes a large number of PCA955x devices and in some cases
> > has pin assignments that hit the hazard. However, there does not seem to
> > be any use of the affected GPIOs in the userspace associated with
> > Everest.
> >
> > Regardless, any use of the hazardous GPIOs in Everest is already broken,
> > so let's fix the interface and then fix any already broken userspace
> > with it.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij
