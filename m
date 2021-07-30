Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3293DB3A2
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 08:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237464AbhG3GaW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 02:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237531AbhG3GaV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 02:30:21 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBD8C061796
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jul 2021 23:30:16 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x8so2376146lfe.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jul 2021 23:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y7ka3CwK7TI9xBzxluU3C/gLf4NvN2jIso8xOz25IfQ=;
        b=bl5XlwHkgEdHe6ZG+BwIVuRVbY90hfdaYiqr3kQi7LEBLR9twMNNuDwDSLGlAnHx+m
         jP794CGQaZf3Y4aWtZm4lEERRlMt4E07A5Kn7njp4s+StAkkpNoQT5iSt8G7DVIK7lT1
         iydIFnKHW4TKYoutXSDKX8jEI14MNMJiLXcZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y7ka3CwK7TI9xBzxluU3C/gLf4NvN2jIso8xOz25IfQ=;
        b=OW5eGc2thHgUhvxGHqoBChJkzmYNAu+ISsmD6vKzdndvvs2YeeUOa9T/IS4OtQYnY2
         EPggvN1pDdRQl02/rAw9yAAE7i59fpu9fc1YZ62spLiZVkRDOLcMSzvD2WnsZKOlOo+a
         tsScJ8FGOx8Xge2iMTGIVg4KFpqraHRsYzVfoakAFtZZjazmy/B9sdYnbKuWW4Gz9NIn
         /ZGXa6Ipbqdb/sD4Z/rzmcPFJlOtT7C4Zl8Vvpx55B3CT0TtfA/8bK78GtVUwx8ctPnj
         GKq8hGmJo60uxDTMS3u9SknXXTov7shtjBdTpc9LcIPPgfbh5CNIxtNLtipBYq5i4jDz
         kA8Q==
X-Gm-Message-State: AOAM532ltTLtzm3z06ob3l4dpj4dIvZ4spCGZVyqBfGuQrCEoIHMjjNC
        D6ceeBsEXmhTXGzIM8DXrKpYIQtTzyf4g6NLOQ5xFA==
X-Google-Smtp-Source: ABdhPJwYyuuPrj/8HBRX4lHGh/uO9ITWDrPX5cr8gtxMkE/Q26iTVdXYYA9O7+/O92/bJhVmSAmpGS9Rg1yB2O3Mjyg=
X-Received: by 2002:a05:6512:a89:: with SMTP id m9mr738473lfu.342.1627626614501;
 Thu, 29 Jul 2021 23:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210726071439.14248-1-sam.shih@mediatek.com> <20210726071439.14248-2-sam.shih@mediatek.com>
 <CAGXv+5GeEBAkXKfA=S7XGOLYtCRihP5ov6kSiw+eevPAi74GAQ@mail.gmail.com> <083a0e8fdd07c0f940285dce2dc26cb0f5e798a6.camel@mediatek.com>
In-Reply-To: <083a0e8fdd07c0f940285dce2dc26cb0f5e798a6.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Jul 2021 14:30:03 +0800
Message-ID: <CAGXv+5F1tPC8W6FcBqn4TdoOrSmFUr4GWpD3hQC9QsPi3o__=g@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: clock: mediatek: document clk bindings
 for mediatek mt7986 SoC
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-gpio@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
        John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 30, 2021 at 2:01 PM Sam Shih <sam.shih@mediatek.com> wrote:
>
> Hi,
>
> On Mon, 2021-07-26 at 17:20 +0800, Chen-Yu Tsai wrote:
> > Furthermore, based on the driver patch and the fact that they share
> > the
> > same compatible string, it seems you shouldn't need to have two
> > compatible
> > strings for two identical hardware blocks. The need for separate
> > entries
> > to have different clock names is an implementation detail. Please
> > consider
> > using and supporting clock-output-names.
> >
> > Also, please check out the MT8195 clock driver series [1]. I'm
> > guessing
> > a lot of the comments apply to this one as well.
> >
> > Regards
> > ChenYu
> >
> > [1]
> > https://urldefense.com/v3/__https://lore.kernel.org/linux-mediatek/2021=
0616224743.5109-1-chun-jie.chen@mediatek.com/T/*t__;Iw!!CTRNKA9wMg0ARbw!29p=
b4TJiGHLvLbYJgDB2Dhf8Mpw5VU8zV-W3NrMan_RPQrtWT2EdRTyyjWpu0nZE$
> >
> >
>
> I have organized your comments in "Mediatek MT8195 clock support"
> series into the following list, reply to your here:
>
> > dt-binding: Move the not-to-be-exposed clock to driver directory or
> > simply left out
> Okay, thanks for your comment, I will update this in the next patch set

See the following file for an example:

    https://elixir.bootlin.com/linux/latest/source/drivers/clk/sunxi-ng/ccu=
-sun50i-a64.h

I think this is definitely optional, but it makes it safer in that other
drivers would not be able to use the non-exported intermediate clocks.

> > describe some of the clock relations between the various clock
> > controllers
> I have checked the files in
> "Documentation/devicetree/bindings/arm/mediatek", It seems that all
> MediaTek SoC clocks are simply described by each controller, like
> "mediatek,infracfg.txt" and "mediatek,topckgen.txt", and those document
> only include compatible strings information and examples.
> Can we insert the clock relationship of MT7986 directlly in common
> documents?

What I meant was that since each clock controller hardware block has
one or many clock inputs, these should be described in the binding
as required "clocks" and "clock-names" properties.

So it's not about describing the actual relationship or clock tree,
but just having the inputs accurately described.

> Or we should add a new "mediatek,mt7986-clock.yaml" and move compatible
> strings information and example to this file, and insert clock
> relationship descriptions to this file? Wouldn=E2=80=99t it be strange to=
 skip
> existing files and create a new one?

I think that is a question for the device tree binding maintainer, Rob.
At least for Mediatek stuff, there seem to be many separate files.

> > external oscillator's case, the oscillator is described in the device
> > tree
> Yes, we have "clkxtal" in the DT, which stands for external oscillator,
> All clocks in apmixedsys use "clkxtal" as the parent clock

So for the apmixedsys device node, it would at least have something like:

    clocks =3D <&clkxtal>;
    clock-names =3D "xtal";

For topckgen, since it has xtal and some PLLs from apmixedsys as inputs:

    clocks =3D <&clkxtal>, <&apmixedsys CLK_ID_PLLXXX>, <&apmixedsys
CLK_ID_PLLYYY>;
    clock-names =3D "xtal", "pllXXX", "pllYYY"

The above is just an example. You should adapt it to fit your hardware
description. And the bindings should describe what is required. Note
that the clock names used here are local to this device node. They do
not need to match what the clock driver uses for the global name. So
just go with something descriptive.

The point is, cross hardware block dependencies should be clearly described
in the device tree, instead of implicitly buried in the clock drivers.

> > Dual license please (and the dts files).
> Okay, thanks for your comment, I will update this in the next patch set
>
> > Why are this and other 1:1 factor clks needed? They look like
> > placeholders. Please remove them.
> Okay, thanks for your comment, I will update this in the next patch set

Ideally the clock driver would use the device tree to get local references
for this, but that is going to require some rework to Mediatek's common
clock code.

> > Merge duplicate parent instances
> We have considered this in the MT7986 basic clock driver, but I will
> check again. If corrections are needed, I will make changes in the next
> patch set.
>
> > Leaking clk_data if some function return fail
> Okay, thanks for your comment, I will update this in the next patch set
>
> > This file contains four drivers. They do not have depend on each
> > other, and do not need to be in the same file. Please split them into
> > differen files and preferably different patches
> Okay, thanks for your comment, I will separate those clock drivers in
> the next patch set
>
> > Is there any particular reason for arch_initcall
> We have considered this in MT7986 basic clock driver, and use
> CLK_OF_DECLARE instead of arch_initcall.

Having to sequence clock registration manually is likely a symptom of
inadequate clock dependency handling. So if the drivers are only using
global clock names to describe parents, what happens is that even if
the parent isn't in the system yet, the registration is allowed to
succeed. However since the parent clock isn't available yet, any
calculations involving it, such as calculating clock rates, will
yield invalid results, such as 0 clock rate.

> Another question:
> Should the clock patches in "Add basic SoC support for MediaTek mt7986"
> need to be separated into another patch series, such as MT8195
> "Mediatek MT8195 clock support" ?

Nope. The MT8195 team seems to be splitting things up by module, with
the device tree being its own separate module. Ideally you want to send
drivers along with the related device tree changes, so people reviewing
can get a sense of how things work. And if the hardware is publicly
available, people can actually test the changes. We can't do that if the
device tree changes aren't bundled together.


Regards
ChenYu
