Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53523D91A0
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 17:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235574AbhG1PRK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 11:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235546AbhG1PRJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 11:17:09 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75430C061757;
        Wed, 28 Jul 2021 08:17:07 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id j77so2567724ybj.3;
        Wed, 28 Jul 2021 08:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ESrezXcwKkqa6xx20d3Rb22HD68EBnHXQ0zjk4sO7Sk=;
        b=XJZLSfz498/PpYdOyshbjuXRO586ZzyWYWVLc01A2rkLHglPeh5q0WZC1seQeA2hSL
         NC13pCwL7i1Myc6lwlvK/jlZ6EAe6+TAa4rHwXDcwD6w9azITNt6z0qT7IkUeoZTvULk
         PcdnI/Jc7BKmKvS/YieMitzuvDRII0DtmwR39uQjdK1Q3rpn/usFnZbFT+SJYwMvJTOa
         IJP+MTrNs8B/QqjyBYal0hiYq2sxJQJhIcQKxZg/Z4LGRVuiTGpXjAKNfFTjJCjjhTFY
         qDtYyvYCL83aVv+mreQkKUHzv4eZMY96HqAxf6/QSJ8QOfo6vFwRGQpru8QBVlJ83O+m
         xekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ESrezXcwKkqa6xx20d3Rb22HD68EBnHXQ0zjk4sO7Sk=;
        b=YGqStpL2dXJGxPDF6pANUhmON5kMwBQ8M/djC+2tgAGswDMjD30HC3Pl/xHbiMXVox
         LXY+Oh37MZD34smyurwBtXQHphMOZmwQ3g/AXPGYdCKfQAiFdNWe+BJ0+gwBXTtI6CHj
         E2xEm81+AJdW1BUhLC7CAUHx1Xi+7Z8j63t8pGOOOZ0Jyz/LLVXNYdy1wp70xhlg5T6X
         QjalWbSRw4npqflkw/gF1Vsdd/bI1tZd0LbxsY08IQOldAdjYdMlOrD4/gWAIVZ2b9e/
         58OT5hHZU8zGdUUcTSFzbFUgUOrv046CVOIXfTLjrus2UlwovAvN+kaWD9GMBRjqPjWQ
         wQ3g==
X-Gm-Message-State: AOAM533nyVlJafLj1f5d35HiCl1DardbHKXTCkFPVi8mYR5EqvNyK/EX
        Z6vbWsTangai1HiuqIuVIXEUlSva+9EQdqnwQiE=
X-Google-Smtp-Source: ABdhPJw66uV4pmVHCu4cBfxtOOl41cuXnbEcQs0rCshQ8A82EetArMTQgWhBjTyHiepjqSDensKvqgi0F2KfvBRwC+g=
X-Received: by 2002:a25:808b:: with SMTP id n11mr272052ybk.141.1627485426763;
 Wed, 28 Jul 2021 08:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210728135534.703028-1-pgwipeout@gmail.com> <13247009.uLZWGnKmhe@diego>
 <CAMdYzYqR+ocrXQi8TOHY0Yd2oULXuPgE_QnbcuQSw=BoaumBKA@mail.gmail.com> <6063626.MhkbZ0Pkbq@diego>
In-Reply-To: <6063626.MhkbZ0Pkbq@diego>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 28 Jul 2021 11:16:54 -0400
Message-ID: <CAMdYzYqz-i1X2oORi6SjSqi6_KwRcbt2u04+cVxcSonX9gxOew@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: rockchip: add missing rk3568 cru phandles
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 28, 2021 at 10:41 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:
>
> Am Mittwoch, 28. Juli 2021, 16:18:49 CEST schrieb Peter Geis:
> > On Wed, Jul 28, 2021 at 10:06 AM Heiko St=C3=BCbner <heiko@sntech.de> w=
rote:
> > >
> > > Hi Peter,
> > >
> > > Am Mittwoch, 28. Juli 2021, 15:55:31 CEST schrieb Peter Geis:
> > > > The grf and pmugrf phandles are necessary for the pmucru and cru to
> > > > modify clocks. Add these phandles to permit adjusting the clock rat=
es
> > > > and muxes.
> > > >
> > > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/=
boot/dts/rockchip/rk356x.dtsi
> > > > index 0905fac0726a..8ba0516eedd8 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > > @@ -218,6 +218,8 @@ grf: syscon@fdc60000 {
> > > >       pmucru: clock-controller@fdd00000 {
> > > >               compatible =3D "rockchip,rk3568-pmucru";
> > > >               reg =3D <0x0 0xfdd00000 0x0 0x1000>;
> > > > +             rockchip,grf =3D <&grf>;
> > > > +             rockchip,pmugrf =3D <&pmugrf>;
> > >
> > > I don't think the pmucru needs both and in fact the mainline
> > > clock driver should just reference its specific grf at all, i.e.
> > >         pmucru -> pmugrf (via the rockchip,grf handle)
> > >         cru -> grf
> > >
> > > I've not seen anything breaking this scope so far.
> >
> > I thought the same thing as well, but for some reason the driver
> > refuses to apply assigned-clocks to the plls unless these are all
> > present.
> > If the driver can get these assignments automatically eventually,
> > perhaps it's a loading order issue?
> >
> > Thinking about it, it's probably the grf and pmugrf haven't probed
> > when the driver is attempting to assign these, and tying them together
> > forces the probe to happen first.
>
> though nothing references the regular grf from the pmucru I think.
>
> I.e. the pmucru PLL read their lock state from RK3568_PMU_MODE_CON
>
> The rk3568 reuses the pll_rk3328-type which in turn is a modified pll_rk3=
036
> and uses their ops. Which in turn means the pll shouldn't access the GRF =
at
> all, as it uses the pll's own register to check the locked state.
>
> Can you try to change clk-pll.c from
>
>         switch (pll_type) {
>         case pll_rk3036:
>         case pll_rk3328:
>                 if (!pll->rate_table || IS_ERR(ctx->grf))
>                         init.ops =3D &rockchip_rk3036_pll_clk_norate_ops;
> ...
> to
>         switch (pll_type) {
>         case pll_rk3036:
>         case pll_rk3328:
>                 if (!pll->rate_table)
>                         init.ops =3D &rockchip_rk3036_pll_clk_norate_ops;
>
> similar to rk3399?

Thanks, I'll test this!

>
> Heiko
>
> > > >               #clock-cells =3D <1>;
> > > >               #reset-cells =3D <1>;
> > > >       };
> > > > @@ -225,6 +227,7 @@ pmucru: clock-controller@fdd00000 {
> > > >       cru: clock-controller@fdd20000 {
> > > >               compatible =3D "rockchip,rk3568-cru";
> > > >               reg =3D <0x0 0xfdd20000 0x0 0x1000>;
> > > > +             rockchip,grf =3D <&grf>;
> > > >               #clock-cells =3D <1>;
> > > >               #reset-cells =3D <1>;
> > > >       };
> > > >
> > >
> > >
> > >
> > >
> >
>
>
>
>
