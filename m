Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4373D9393
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 18:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhG1QuE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 12:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhG1QuD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 12:50:03 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF02C061757;
        Wed, 28 Jul 2021 09:50:01 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id a93so5063819ybi.1;
        Wed, 28 Jul 2021 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=otNTlDwa87Ct7KnwMnmWEklfb8eXN/ybU6dmwmB/y4k=;
        b=Hz1c+rC6UucgzDlm5ZjYdqfckks0A1P9uuWsr0puCpQLwdw5cahcJNSxTYc99NBr/N
         u+tW+C8g2d6CK7OT5A0pPor1ZXJJMo6VvHMSmYeyyYmfv2y5L7cseFltdcWLDv/BpP2S
         iNS0Sd+jp2XBZVH98iLn4WdYtSdrEkq4WcCWNv9EEC95pleo3vI3QDgsBMZCHS3MsAKr
         pD4rxKYfzjZuxwKGaxoskZLB58c7NIsVw6OmCXllHGZ62oTcRNtcGIpgqBlB7avcmp6/
         aXu9YiOvi82wkh651hshpX5nrd0wVp8YXLSg3ITLV7qR/9OW2YqsVfdaFXDM974hZfK7
         PkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=otNTlDwa87Ct7KnwMnmWEklfb8eXN/ybU6dmwmB/y4k=;
        b=rE44zhC2MQP4hiPrLgc2lFj2zOX/wCrSm3/UxkQ3QEFVi81T9zY197AJPnHT3yBAD/
         6v4TKSPjp5mX4TdpDOBaM5lsNfV46HEFlx7dFmiAg5oj1yfNXiSvYCID60FncZ0uV8Ju
         TfVWdL3s5l/kpk8vXVEK1VcDUDQ/MLJwQ+Q0StgziIRvWwfpl5b29Pm9cwO46mQklqBx
         uH+uUo6jLQVo2WXdhrfuVjlAPIxSl7yBXSUi7eIy8JUm+QPuSlEPkJbIB3Uv28ytG6E2
         +B8E4lXD28/rqvPIInie8ScqbG2X+X+Ss8uWK70YrojjSToF3dD8nC4f6d8WnxcePwPF
         yxqQ==
X-Gm-Message-State: AOAM532T3Av8/koXFPjvpy2p00Zsb0AFEoICruad23C1tyu9tIQ34Bec
        IpLScUtf5ZIbsuG8YfjrLf5csIYpjcvds2puXK8=
X-Google-Smtp-Source: ABdhPJw1TruNXS+01KTW3gp+Fe37RtD+n7CfbVJq7xUSj403ji3R82e0709hZow8OpZrbJQoYJR41H7iUFiOiVkK5UM=
X-Received: by 2002:a25:3c5:: with SMTP id 188mr701558ybd.437.1627491000573;
 Wed, 28 Jul 2021 09:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210728135534.703028-1-pgwipeout@gmail.com> <13247009.uLZWGnKmhe@diego>
 <CAMdYzYqR+ocrXQi8TOHY0Yd2oULXuPgE_QnbcuQSw=BoaumBKA@mail.gmail.com>
 <6063626.MhkbZ0Pkbq@diego> <CAMdYzYqz-i1X2oORi6SjSqi6_KwRcbt2u04+cVxcSonX9gxOew@mail.gmail.com>
In-Reply-To: <CAMdYzYqz-i1X2oORi6SjSqi6_KwRcbt2u04+cVxcSonX9gxOew@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 28 Jul 2021 12:49:47 -0400
Message-ID: <CAMdYzYrj7PdvmfvSNV5B3=aDrAx1VUO2=w8vgVprBE1qiEZP3A@mail.gmail.com>
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

On Wed, Jul 28, 2021 at 11:16 AM Peter Geis <pgwipeout@gmail.com> wrote:
>
> On Wed, Jul 28, 2021 at 10:41 AM Heiko St=C3=BCbner <heiko@sntech.de> wro=
te:
> >
> > Am Mittwoch, 28. Juli 2021, 16:18:49 CEST schrieb Peter Geis:
> > > On Wed, Jul 28, 2021 at 10:06 AM Heiko St=C3=BCbner <heiko@sntech.de>=
 wrote:
> > > >
> > > > Hi Peter,
> > > >
> > > > Am Mittwoch, 28. Juli 2021, 15:55:31 CEST schrieb Peter Geis:
> > > > > The grf and pmugrf phandles are necessary for the pmucru and cru =
to
> > > > > modify clocks. Add these phandles to permit adjusting the clock r=
ates
> > > > > and muxes.
> > > > >
> > > > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm6=
4/boot/dts/rockchip/rk356x.dtsi
> > > > > index 0905fac0726a..8ba0516eedd8 100644
> > > > > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > > > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > > > @@ -218,6 +218,8 @@ grf: syscon@fdc60000 {
> > > > >       pmucru: clock-controller@fdd00000 {
> > > > >               compatible =3D "rockchip,rk3568-pmucru";
> > > > >               reg =3D <0x0 0xfdd00000 0x0 0x1000>;
> > > > > +             rockchip,grf =3D <&grf>;
> > > > > +             rockchip,pmugrf =3D <&pmugrf>;
> > > >
> > > > I don't think the pmucru needs both and in fact the mainline
> > > > clock driver should just reference its specific grf at all, i.e.
> > > >         pmucru -> pmugrf (via the rockchip,grf handle)
> > > >         cru -> grf
> > > >
> > > > I've not seen anything breaking this scope so far.
> > >
> > > I thought the same thing as well, but for some reason the driver
> > > refuses to apply assigned-clocks to the plls unless these are all
> > > present.
> > > If the driver can get these assignments automatically eventually,
> > > perhaps it's a loading order issue?
> > >
> > > Thinking about it, it's probably the grf and pmugrf haven't probed
> > > when the driver is attempting to assign these, and tying them togethe=
r
> > > forces the probe to happen first.
> >
> > though nothing references the regular grf from the pmucru I think.
> >
> > I.e. the pmucru PLL read their lock state from RK3568_PMU_MODE_CON
> >
> > The rk3568 reuses the pll_rk3328-type which in turn is a modified pll_r=
k3036
> > and uses their ops. Which in turn means the pll shouldn't access the GR=
F at
> > all, as it uses the pll's own register to check the locked state.
> >
> > Can you try to change clk-pll.c from
> >
> >         switch (pll_type) {
> >         case pll_rk3036:
> >         case pll_rk3328:
> >                 if (!pll->rate_table || IS_ERR(ctx->grf))
> >                         init.ops =3D &rockchip_rk3036_pll_clk_norate_op=
s;
> > ...
> > to
> >         switch (pll_type) {
> >         case pll_rk3036:
> >         case pll_rk3328:
> >                 if (!pll->rate_table)
> >                         init.ops =3D &rockchip_rk3036_pll_clk_norate_op=
s;
> >
> > similar to rk3399?
>
> Thanks, I'll test this!

Confirmed this fixed the issue for the rk3566, so as long as it
doesn't break rk3328 this works.
I'll include the patch in the next series.

>
> >
> > Heiko
> >
> > > > >               #clock-cells =3D <1>;
> > > > >               #reset-cells =3D <1>;
> > > > >       };
> > > > > @@ -225,6 +227,7 @@ pmucru: clock-controller@fdd00000 {
> > > > >       cru: clock-controller@fdd20000 {
> > > > >               compatible =3D "rockchip,rk3568-cru";
> > > > >               reg =3D <0x0 0xfdd20000 0x0 0x1000>;
> > > > > +             rockchip,grf =3D <&grf>;
> > > > >               #clock-cells =3D <1>;
> > > > >               #reset-cells =3D <1>;
> > > > >       };
> > > > >
> > > >
> > > >
> > > >
> > > >
> > >
> >
> >
> >
> >
