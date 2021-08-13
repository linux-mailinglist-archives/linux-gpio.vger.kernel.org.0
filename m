Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C9D3EAFE8
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 08:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238807AbhHMGQa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 02:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234716AbhHMGQ3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 02:16:29 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38DCDC061756
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 23:16:03 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id c24so18013683lfi.11
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 23:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q0CBFd9na84lmP7bza9GpqeUSzKKwzK3eea6qsR8An0=;
        b=TqBJY1/tDDnKmlj97+w2EME2WmiN/lseRVzecoq/BSCI1mo/CQN5jLCRS0Q5TeRo/I
         trzBn6hM6pgqbsf3N8jOTGu94NyJGFeDVAQiiuUe9D3JD38ziORQPnPKyD/6qGKVJEEs
         YSJIvwrEuhWc2TD38LJ5QBwlr/3up3mgeWKyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q0CBFd9na84lmP7bza9GpqeUSzKKwzK3eea6qsR8An0=;
        b=lL/hzCEa4FE9m4IhiYjL1c3disoOoguH5uDwBU7pHsXwaPKPCRVGPDgLdL0BdkBPgX
         /GWwb8wayNJwZW68XBcJtOTq0kJ74+QYiKiSFJZtDOkb/60de5+0cS2YDwsqo8JN8/SW
         cIZAR11vg1MREC6WLlUI+OeqULuw0Gjj6kK0Qjeypc/JJAJpeOtRRTwn/uH6cHJcaDoM
         bjNiRnWMRYNeD3V7mGOGotma7lA0gbJtbyI/Ir848wL0KID1TthGbH550Ml4kjdlZqps
         wfsylYNDsOj7PedwmKv+rFDjd5CEKMl5i4O8x5qn9bOJmXOLIVh4kkGofh0L6ddIxqkZ
         WNGA==
X-Gm-Message-State: AOAM533fuIHS4PzE41dV3zOYUtvS7Pvfx6TCsY5bPWHnI3K3xIYIG5+R
        s4nH8W5J6vmx4dW2R8HIPJtOjQpXOybidsg1PIcV7Q==
X-Google-Smtp-Source: ABdhPJw15zivG+yR6ZcBLt5nO2U9oRqjjzDBH6fbCvCXTIgd8Z6+4IjcNE8CoXocpYt8itRHCLhZzPj/6lPgNLxoJd0=
X-Received: by 2002:a19:c202:: with SMTP id l2mr569137lfc.276.1628835361384;
 Thu, 12 Aug 2021 23:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210726071439.14248-1-sam.shih@mediatek.com> <20210726071439.14248-2-sam.shih@mediatek.com>
 <CAGXv+5GeEBAkXKfA=S7XGOLYtCRihP5ov6kSiw+eevPAi74GAQ@mail.gmail.com>
 <083a0e8fdd07c0f940285dce2dc26cb0f5e798a6.camel@mediatek.com>
 <CAGXv+5F1tPC8W6FcBqn4TdoOrSmFUr4GWpD3hQC9QsPi3o__=g@mail.gmail.com> <8b14d7a730bd787a9d162d368a2d3aae64256ca6.camel@mediatek.com>
In-Reply-To: <8b14d7a730bd787a9d162d368a2d3aae64256ca6.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 13 Aug 2021 14:15:50 +0800
Message-ID: <CAGXv+5GxXRqJqZURagNc4z=am0jhqP05eq0i64+kf457yfRoAw@mail.gmail.com>
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

On Fri, Aug 13, 2021 at 1:22 PM Sam Shih <sam.shih@mediatek.com> wrote:
>
> Hi,
>
> Sorry for the late reply,I have prepared v2 patches, but for some of your=
 suggestions, I think
> it is a bit difficult to apply to our drivers.
>
>
> On Fri, 2021-07-30 at 14:30 +0800, Chen-Yu Tsai wrote:
> > On Fri, Jul 30, 2021 at 2:01 PM Sam Shih <sam.shih@mediatek.com>
> > wrote:
> > >
> > > Hi,
> > >
> > > On Mon, 2021-07-26 at 17:20 +0800, Chen-Yu Tsai wrote:
> > > > Furthermore, based on the driver patch and the fact that they
> > > > share
> > > > the
> > > > same compatible string, it seems you shouldn't need to have two
> > > > compatible
> > > > strings for two identical hardware blocks. The need for separate
> > > > entries
> > > > to have different clock names is an implementation detail. Please
> > > > consider
> > > > using and supporting clock-output-names.
> > > >
> > > > Also, please check out the MT8195 clock driver series [1]. I'm
> > > > guessing
> > > > a lot of the comments apply to this one as well.
> > > >
> > > > Regards
> > > > ChenYu
> > > >
> > > > [1]
> > > >
> https://urldefense.com/v3/__https://lore.kernel.org/linux-mediatek/202106=
16224743.5109-1-chun-jie.chen@mediatek.com/T/*t__;Iw!!CTRNKA9wMg0ARbw!29pb4=
TJiGHLvLbYJgDB2Dhf8Mpw5VU8zV-W3NrMan_RPQrtWT2EdRTyyjWpu0nZE$
> > > >
> > > >
> > >
> > > I have organized your comments in "Mediatek MT8195 clock support"
> > > series into the following list, reply to your here:
> > >
> > > > dt-binding: Move the not-to-be-exposed clock to driver directory
> > > > or
> > > > simply left out
> > >
> > > Okay, thanks for your comment, I will update this in the next patch
> > > set
> >
> > See the following file for an example:
> >
> >
>
> > https://urldefense.com/v3/__https://elixir.bootlin.com/linux/latest/sou=
rce/drivers/clk/sunxi-ng/ccu-sun50i-a64.h__;!!CTRNKA9wMg0ARbw!3--UEpFFGeZ_W=
TCaWsj_9vbbb4SSE1vPCILFleThzpa1nq7mveFfQMDqbacdT5I6$
> >
> > drivers would not be able to use the non-exported intermediate
> > clocks.
> >
> Thanks, I well delete some clocks that are not expected to be use in
> device tree.
>
> > > > describe some of the clock relations between the various clock
> > > > controllers
> > >
> > > I have checked the files in
> > > "Documentation/devicetree/bindings/arm/mediatek", It seems that all
> > > MediaTek SoC clocks are simply described by each controller, like
> > > "mediatek,infracfg.txt" and "mediatek,topckgen.txt", and those
> > > document
> > > only include compatible strings information and examples.
> > > Can we insert the clock relationship of MT7986 directlly in common
> > > documents?
> >
> > What I meant was that since each clock controller hardware block has
> > one or many clock inputs, these should be described in the binding
> > as required "clocks" and "clock-names" properties.
> >
> > So it's not about describing the actual relationship or clock tree,
> > but just having the inputs accurately described.
> >
> > > Or we should add a new "mediatek,mt7986-clock.yaml" and move
> > > compatible
> > > strings information and example to this file, and insert clock
> > > relationship descriptions to this file? Wouldn=E2=80=99t it be strang=
e to
> > > skip
> > > existing files and create a new one?
> >
> > I think that is a question for the device tree binding maintainer,
> > Rob.
> > At least for Mediatek stuff, there seem to be many separate files.
> >
> > > > external oscillator's case, the oscillator is described in the
> > > > device
> > > > tree
> > >
> > > Yes, we have "clkxtal" in the DT, which stands for external
> > > oscillator,
> > > All clocks in apmixedsys use "clkxtal" as the parent clock
> >
> > So for the apmixedsys device node, it would at least have something
> > like:
> >
> >     clocks =3D <&clkxtal>;
> >     clock-names =3D "xtal";
> >
> > For topckgen, since it has xtal and some PLLs from apmixedsys as
> > inputs:
> >
> >     clocks =3D <&clkxtal>, <&apmixedsys CLK_ID_PLLXXX>, <&apmixedsys
> > CLK_ID_PLLYYY>;
> >     clock-names =3D "xtal", "pllXXX", "pllYYY"
> >
> > The above is just an example. You should adapt it to fit your
> > hardware
> > description. And the bindings should describe what is required. Note
> > that the clock names used here are local to this device node. They do
> > not need to match what the clock driver uses for the global name. So
> > just go with something descriptive.
> >
> > The point is, cross hardware block dependencies should be clearly
> > described
> > in the device tree, instead of implicitly buried in the clock
> > drivers.
> >
>
> Make cross hardware block dependencies clearly described in the device
> tree seems unsuitable between "topck" and "infra" block of mt7986.
>
> In your example, passing "clkxtal" from the device tree seems ok. Even
> for topckgen, passing "clkxtal", "pllXXX", "pllYYY" from the device
> tree and using these clocks as the parent clock of topckgen also seems
> to work. It is feasible because it is not much clock between these two
> hardware blocks.
>
> But for the clock releationship between "topckg" and "infra", they are
> very complicated in hardware design. There are dozens of clocks and
> interact with each other. If we want to describe these relationships in
> the device tree, we need to use a big array inside the device tree and
> make device tree looks very messy. Therefore, our previous method of
> writing a clock driver is to use the global clock and descripbe the
> clock releationship inside the clock driver.
>
>                ______   ________    ________
>     clkxtal --|      |  |       |.x.|       |
>               |apmix.|--| topck |.x.| infra |
>               |      |--|       |.x.|_______|
>               |      |  |       |   ________
>               |______|  |       |--|        |
>                         |       |--| ethsys |
>                         |_______|  |________|
>
> Maybe we should keep the clock relationship in our clock driver like
> the previous mediatek clock drivers.

Are you saying that some clocks in topck have inputs from infra?
If so, then that's a nasty circular dependency to deal with.

And to be fair, many Mediatek device tree bindings already take a large
number of clocks, so I think adding a few more isn't too bad.

> > > > Dual license please (and the dts files).
> > >
> > > Okay, thanks for your comment, I will update this in the next patch
> > > set
> > >
> > > > Why are this and other 1:1 factor clks needed? They look like
> > > > placeholders. Please remove them.
> > >
> > > Okay, thanks for your comment, I will update this in the next patch
> > > set
> >
> > Ideally the clock driver would use the device tree to get local
> > references
> > for this, but that is going to require some rework to Mediatek's
> > common
> > clock code.
> >
>
> To transfer the clock relationship through the device tree, it is
> necessary to make modifications to the common part of the mtk clock
> driver that has been merged, and may also modify other mediatek clock
> drivers.
>
> Let's move to the source code:
>
> apmixedsys {
>     ...
> }
>
> topckgen {
>     ...
>     clocks =3D ... , <&apmixedsys NET2PLL> , ... ;
>     clock-names =3D ... , "net2pll" , ... ;
> }
>
> char *parent_name;
>     for each clk in <device_tree_node>:
>         parent_name =3D __clk_get_name(of_clk_get(np, i))
>
> (armada-37xx-tbg.c use this method to get global name of parent clock)
>
> Ideally, we should use the parent_name variable above to create a
> clock, But mtk_fixed_factor expects input const strings
>
> void mtk_clk_register_factors(const struct mtk_fixed_factor *clks, ...)
>
> struct mtk_fixed_factor {
>     ...
>     const char *name;
>     const char *parent;
>     ...
> };
>
> So we still need to use pre-defined clock name in static const clock
> table even we can get clock name as variable from device tree.
>
>
> static const struct mtk_fixed_factor top_divs[] __initconst =3D {
>     ...
>     FACTOR(CK_TOP_NET2_D4_D2, "net2_d4_d2", "net2pll", 1, 8),
>     FACTOR(CK_TOP_NET2_D3_D2, "net2_d3_d2", "net2pll", 1, 2),
>     ...
> }

Right. I'm not asking you to do this right away. This will end up being
a long migration over multiple releases. But it makes sense to get the
device tree bindings sorted out first.

I believe the solution is to move to `struct clk_parent_data` to replace
the pure strings. New internal APIs for the Mediatek clock driver would
need to be added, and all the drivers slowly migrated over. Probably also
a good time to migrate to clk_hw_*_register.


ChenYu




> > > > Merge duplicate parent instances
> > >
> > > We have considered this in the MT7986 basic clock driver, but I
> > > will
> > > check again. If corrections are needed, I will make changes in the
> > > next
> > > patch set.
> > >
> > > > Leaking clk_data if some function return fail
> > >
> > > Okay, thanks for your comment, I will update this in the next patch
> > > set
> > >
> > > > This file contains four drivers. They do not have depend on each
> > > > other, and do not need to be in the same file. Please split them
> > > > into
> > > > differen files and preferably different patches
> > >
> > > Okay, thanks for your comment, I will separate those clock drivers
> > > in
> > > the next patch set
> > >
> > > > Is there any particular reason for arch_initcall
> > >
> > > We have considered this in MT7986 basic clock driver, and use
> > > CLK_OF_DECLARE instead of arch_initcall.
> >
> > Having to sequence clock registration manually is likely a symptom of
> > inadequate clock dependency handling. So if the drivers are only
> > using
> > global clock names to describe parents, what happens is that even if
> > the parent isn't in the system yet, the registration is allowed to
> > succeed. However since the parent clock isn't available yet, any
> > calculations involving it, such as calculating clock rates, will
> > yield invalid results, such as 0 clock rate.
> >
> > > Another question:
> > > Should the clock patches in "Add basic SoC support for MediaTek
> > > mt7986"
> > > need to be separated into another patch series, such as MT8195
> > > "Mediatek MT8195 clock support" ?
> >
> > Nope. The MT8195 team seems to be splitting things up by module, with
> > the device tree being its own separate module. Ideally you want to
> > send
> > drivers along with the related device tree changes, so people
> > reviewing
> > can get a sense of how things work. And if the hardware is publicly
> > available, people can actually test the changes. We can't do that if
> > the
> > device tree changes aren't bundled together.
> >
> OK, I will keep clock patches and basic part patches in the same series
> (patches v2)
>
>
> Regards,
> Sam
> Thanks, I will delete some clocks that are not expected to b
