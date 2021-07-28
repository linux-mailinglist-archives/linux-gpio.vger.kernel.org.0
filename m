Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20A23D903A
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 16:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236626AbhG1OTF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 10:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236619AbhG1OTE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 10:19:04 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E478C061764;
        Wed, 28 Jul 2021 07:19:03 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id g76so4231550ybf.4;
        Wed, 28 Jul 2021 07:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ejXULwDzPXwJ/LTVaK86AHBcOGDiYvQDKdZvKfGyr+E=;
        b=izLih9JXIZe8uv9f2Y5f/dBmFONzdLNBX3NwBX8w15sMRi8/cSqjpYVpa7WPKvKmb0
         YVeN4seCnkjHpYV1oC6tmJDU3mZiehtap5QguPxcxHLBLD8Ki993awTH38hIi9mFB9Yc
         cbOL/VtgQCEQsKgtMylpl+gZftgiDw8jaEMXp463BpIbSnFURa+wj8OatcJMBWMvqo3K
         vb7rXPy9/j+oseSpdi1cxsRVIHyZNLJPkpTm58hwkgdJpl+7x7FjkwEzcbEiH/5Fdb+B
         sqmxgMRqluJgNLeHvg4ueTvoxpNW6YpitOnPKeA7gpKu12Vb0YjPZRKK6iEIstxIHpCN
         P4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ejXULwDzPXwJ/LTVaK86AHBcOGDiYvQDKdZvKfGyr+E=;
        b=WtX8zBESWKjXiMLLsGI3TbmqPYq7Bewardxk6hGDTUnhknMEEAsWNOKyZlQoZ3OMNq
         3xh+UZsv99s5GTqJcgGj8GCVZ/ZwX93C1S9EloON2b3WspT5fm0+6Hs1hvUn9tKKEuqZ
         +N4HAQ9drv9sWH3xZXDQDCnx42HcUlk9ZIki8ZicTQb28obHiZF7ZmR/nEAub8Fn1JoM
         NiZ2X6zbt8XDsCjMknC2Cw+ocClVhU4MWbW8PQUC3KTdJZ7fFV0bKyp0ugE7dkiglwcc
         /dEYgsjFeueOQJ7qf6/O//muQDADtfkji7SOWelbe29FGLbVsLKEodbOxMYuGpXDuc8W
         fGeQ==
X-Gm-Message-State: AOAM531mvJIHe4yvoZOCMPqii/BlF1bQF+F/n8K6oZCK88fyOpbhGEui
        ddF+9RXVUN/F0ms+6AYGz/AnAsYN6UBRBBahkzw=
X-Google-Smtp-Source: ABdhPJxuR9VjMFM8xLFvjAI/XQvLoRT9mV8kY/kO1BcownGU4fjyQoi5dCN6U0Vxw4ND7H9kfs1D+MrhHXnhCNLzZ1o=
X-Received: by 2002:a25:3c5:: with SMTP id 188mr8800245ybd.437.1627481942356;
 Wed, 28 Jul 2021 07:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210728135534.703028-1-pgwipeout@gmail.com> <20210728135534.703028-7-pgwipeout@gmail.com>
 <13247009.uLZWGnKmhe@diego>
In-Reply-To: <13247009.uLZWGnKmhe@diego>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 28 Jul 2021 10:18:49 -0400
Message-ID: <CAMdYzYqR+ocrXQi8TOHY0Yd2oULXuPgE_QnbcuQSw=BoaumBKA@mail.gmail.com>
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

On Wed, Jul 28, 2021 at 10:06 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:
>
> Hi Peter,
>
> Am Mittwoch, 28. Juli 2021, 15:55:31 CEST schrieb Peter Geis:
> > The grf and pmugrf phandles are necessary for the pmucru and cru to
> > modify clocks. Add these phandles to permit adjusting the clock rates
> > and muxes.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot=
/dts/rockchip/rk356x.dtsi
> > index 0905fac0726a..8ba0516eedd8 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > @@ -218,6 +218,8 @@ grf: syscon@fdc60000 {
> >       pmucru: clock-controller@fdd00000 {
> >               compatible =3D "rockchip,rk3568-pmucru";
> >               reg =3D <0x0 0xfdd00000 0x0 0x1000>;
> > +             rockchip,grf =3D <&grf>;
> > +             rockchip,pmugrf =3D <&pmugrf>;
>
> I don't think the pmucru needs both and in fact the mainline
> clock driver should just reference its specific grf at all, i.e.
>         pmucru -> pmugrf (via the rockchip,grf handle)
>         cru -> grf
>
> I've not seen anything breaking this scope so far.

I thought the same thing as well, but for some reason the driver
refuses to apply assigned-clocks to the plls unless these are all
present.
If the driver can get these assignments automatically eventually,
perhaps it's a loading order issue?

Thinking about it, it's probably the grf and pmugrf haven't probed
when the driver is attempting to assign these, and tying them together
forces the probe to happen first.

>
>
> Heiko
>
> >               #clock-cells =3D <1>;
> >               #reset-cells =3D <1>;
> >       };
> > @@ -225,6 +227,7 @@ pmucru: clock-controller@fdd00000 {
> >       cru: clock-controller@fdd20000 {
> >               compatible =3D "rockchip,rk3568-cru";
> >               reg =3D <0x0 0xfdd20000 0x0 0x1000>;
> > +             rockchip,grf =3D <&grf>;
> >               #clock-cells =3D <1>;
> >               #reset-cells =3D <1>;
> >       };
> >
>
>
>
>
