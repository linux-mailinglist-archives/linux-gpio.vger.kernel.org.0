Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8083D9450
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 19:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhG1R2V convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 28 Jul 2021 13:28:21 -0400
Received: from gloria.sntech.de ([185.11.138.130]:51958 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229537AbhG1R2V (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 13:28:21 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m8nLs-00071K-62; Wed, 28 Jul 2021 19:28:16 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Peter Geis <pgwipeout@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/9] arm64: dts: rockchip: add missing rk3568 cru phandles
Date:   Wed, 28 Jul 2021 19:28:15 +0200
Message-ID: <2510732.Icojqenx9y@diego>
In-Reply-To: <CAMdYzYrj7PdvmfvSNV5B3=aDrAx1VUO2=w8vgVprBE1qiEZP3A@mail.gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com> <CAMdYzYqz-i1X2oORi6SjSqi6_KwRcbt2u04+cVxcSonX9gxOew@mail.gmail.com> <CAMdYzYrj7PdvmfvSNV5B3=aDrAx1VUO2=w8vgVprBE1qiEZP3A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Mittwoch, 28. Juli 2021, 18:49:47 CEST schrieb Peter Geis:
> On Wed, Jul 28, 2021 at 11:16 AM Peter Geis <pgwipeout@gmail.com> wrote:
> >
> > On Wed, Jul 28, 2021 at 10:41 AM Heiko Stübner <heiko@sntech.de> wrote:
> > >
> > > Am Mittwoch, 28. Juli 2021, 16:18:49 CEST schrieb Peter Geis:
> > > > On Wed, Jul 28, 2021 at 10:06 AM Heiko Stübner <heiko@sntech.de> wrote:
> > > > >
> > > > > Hi Peter,
> > > > >
> > > > > Am Mittwoch, 28. Juli 2021, 15:55:31 CEST schrieb Peter Geis:
> > > > > > The grf and pmugrf phandles are necessary for the pmucru and cru to
> > > > > > modify clocks. Add these phandles to permit adjusting the clock rates
> > > > > > and muxes.
> > > > > >
> > > > > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 3 +++
> > > > > >  1 file changed, 3 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > > > > index 0905fac0726a..8ba0516eedd8 100644
> > > > > > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > > > > @@ -218,6 +218,8 @@ grf: syscon@fdc60000 {
> > > > > >       pmucru: clock-controller@fdd00000 {
> > > > > >               compatible = "rockchip,rk3568-pmucru";
> > > > > >               reg = <0x0 0xfdd00000 0x0 0x1000>;
> > > > > > +             rockchip,grf = <&grf>;
> > > > > > +             rockchip,pmugrf = <&pmugrf>;
> > > > >
> > > > > I don't think the pmucru needs both and in fact the mainline
> > > > > clock driver should just reference its specific grf at all, i.e.
> > > > >         pmucru -> pmugrf (via the rockchip,grf handle)
> > > > >         cru -> grf
> > > > >
> > > > > I've not seen anything breaking this scope so far.
> > > >
> > > > I thought the same thing as well, but for some reason the driver
> > > > refuses to apply assigned-clocks to the plls unless these are all
> > > > present.
> > > > If the driver can get these assignments automatically eventually,
> > > > perhaps it's a loading order issue?
> > > >
> > > > Thinking about it, it's probably the grf and pmugrf haven't probed
> > > > when the driver is attempting to assign these, and tying them together
> > > > forces the probe to happen first.
> > >
> > > though nothing references the regular grf from the pmucru I think.
> > >
> > > I.e. the pmucru PLL read their lock state from RK3568_PMU_MODE_CON
> > >
> > > The rk3568 reuses the pll_rk3328-type which in turn is a modified pll_rk3036
> > > and uses their ops. Which in turn means the pll shouldn't access the GRF at
> > > all, as it uses the pll's own register to check the locked state.
> > >
> > > Can you try to change clk-pll.c from
> > >
> > >         switch (pll_type) {
> > >         case pll_rk3036:
> > >         case pll_rk3328:
> > >                 if (!pll->rate_table || IS_ERR(ctx->grf))
> > >                         init.ops = &rockchip_rk3036_pll_clk_norate_ops;
> > > ...
> > > to
> > >         switch (pll_type) {
> > >         case pll_rk3036:
> > >         case pll_rk3328:
> > >                 if (!pll->rate_table)
> > >                         init.ops = &rockchip_rk3036_pll_clk_norate_ops;
> > >
> > > similar to rk3399?
> >
> > Thanks, I'll test this!
> 
> Confirmed this fixed the issue for the rk3566, so as long as it
> doesn't break rk3328 this works.

It doesn't break anything ... i.e. the change for rk3328/rk3036 plls
from using the grf register to using the pll-internal lock status is in
the kernel for quite a while now - januar 2020 to be exact, and nobody
complained - including me when testing in my boardfarm ;-)

> I'll include the patch in the next series.
> 
> >
> > >
> > > Heiko
> > >
> > > > > >               #clock-cells = <1>;
> > > > > >               #reset-cells = <1>;
> > > > > >       };
> > > > > > @@ -225,6 +227,7 @@ pmucru: clock-controller@fdd00000 {
> > > > > >       cru: clock-controller@fdd20000 {
> > > > > >               compatible = "rockchip,rk3568-cru";
> > > > > >               reg = <0x0 0xfdd20000 0x0 0x1000>;
> > > > > > +             rockchip,grf = <&grf>;
> > > > > >               #clock-cells = <1>;
> > > > > >               #reset-cells = <1>;
> > > > > >       };
> > > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > >
> > >
> > >
> > >
> 




