Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907C53D9065
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 16:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236735AbhG1OZS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 10:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236711AbhG1OZN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 10:25:13 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17461C061757;
        Wed, 28 Jul 2021 07:25:06 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id a201so4179713ybg.12;
        Wed, 28 Jul 2021 07:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ePnN+OtKJkL4YSga85tPRB9eA7yVn2R5VVoOGu/iPn4=;
        b=QJawNYLGS+LkejlMcc+iO8GHPjaS0YTFEU85ytYOdHqqlSzjsdd8gNfjMOHaTtv6PZ
         S5lQ5eLCDahi3OYMp0zlWbME/vrXMSneZWu9PZ5SeQ95q04FyUEfBlU40Wscg1Tu3AbA
         MXULAuj+a3uT1YIx8Jk0HZgtHS4N29+mkAK+8ZW1iSqxrLebu4aY80E9newHzZLJ+ruY
         W+3oXDrYkqmZ+o6PaC7ugd6bqWfV4FwGquyL0AyAYmonEuL9ZMLJMVRJ5LZ8vD1AquJj
         nCWosFKZk8cT/B1BABmk0WTf+QKGPLEwI2nlE4Kcnnp/U3k0K1oZwn4tHxGRiigWmb0w
         BVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ePnN+OtKJkL4YSga85tPRB9eA7yVn2R5VVoOGu/iPn4=;
        b=PvQbOrI7+kEFA5RoYaigVygtHaB/r0Y5vEBH25takC9QlvOgw+36zd5AQuQKzKAjOD
         6G/QsYyKliNi7ZbA1kUmLDPT+u2w+QPWhTOQz1sG92VxynMW2zpkrCT7138OLnd0/Pqt
         5+fHiG7C6m5kHcl9yyT3dFFaoyu8nm9VI+YrpOnpFyCHwiEwbQhQQWT4ngbAr5O69cRU
         kEift8teZ+91MQNg1LQXBjGxGBxZLtsWGmmO8XpoWMorCbw8DPvmrFK1xYWMrTZbSCCK
         PJkwpc3El75fsBK3hRd8deUMB1iFsGCp4fpGyN9NcJnfRbRGpl82Poa0AtWRtwDkObeE
         fYzw==
X-Gm-Message-State: AOAM533b+PFJyOCAZ/l9Uzu03ivhTLx7gR7qNt1W+UqmVZAcEh1eR8G1
        f3DpnagqeLG2ZcKpjnO3UIl0arnJmYEZo8iwf94=
X-Google-Smtp-Source: ABdhPJxpNbQVTXN8VTyHHLkR0omthvWuLI1ddd5xIKEcDOnhwKOKPmkLi6o50NBt/TZP4M1hufqYonkrgkYWI/eCehU=
X-Received: by 2002:a25:d113:: with SMTP id i19mr15516799ybg.39.1627482305334;
 Wed, 28 Jul 2021 07:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210728135534.703028-1-pgwipeout@gmail.com> <20210728135534.703028-8-pgwipeout@gmail.com>
 <3555961.44csPzL39Z@diego>
In-Reply-To: <3555961.44csPzL39Z@diego>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 28 Jul 2021 10:24:53 -0400
Message-ID: <CAMdYzYruEKc8na4NPo6OkouDTAgGrSgDRbTA3fA-LMrQ6T4fYQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: rockchip: adjust rk3568 pll clocks
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

On Wed, Jul 28, 2021 at 10:09 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:
>
> Hi Peter,
>
> Am Mittwoch, 28. Juli 2021, 15:55:32 CEST schrieb Peter Geis:
> > The rk3568 gpll should run at 1200mhz and the ppll should run at 200mhz=
.
> > These are set incorrectly by the bootloader, so fix them here.
>
> Can you specify where the "should run at" comes from?
> Normally I'd assume setting desired PLL frequencies would be quite
> board-specific.

gpll boots at 1188mhz, but to get accurate dividers for all
gpll_dividers it needs to run
at 1200mhz, otherwise everyone downstream isn't quite right.

ppll feeds the combophys, which has a divide by 2 clock, so 200mhz is
required to reach a 100mhz clock input for them.
Downstream also makes this fix.

rk356x has a number of dividers that produce expected clock values for
various peripherals, so changing the defaults would mean reclocking a
number of child dividers.

>
> So if we're setting defaults for all boards, I'd like some reasoning
> behind that ;-) ... especially when the other option would be to
> fix the bootloader.

Currently we are forced to use downstream u-boot (mainline isn't ready yet)=
.
Downstream doesn't seem to want to assign clocks correctly, so the
simplest method right now is to have the kernel ensure they are
correct.

>
> Thanks
> Heiko
>
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk356x.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot=
/dts/rockchip/rk356x.dtsi
> > index 8ba0516eedd8..91ae3c541c1a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > @@ -230,6 +230,8 @@ cru: clock-controller@fdd20000 {
> >               rockchip,grf =3D <&grf>;
> >               #clock-cells =3D <1>;
> >               #reset-cells =3D <1>;
> > +             assigned-clocks =3D <&cru PLL_GPLL>, <&pmucru PLL_PPLL>;
> > +             assigned-clock-rates =3D <1200000000>, <200000000>;
> >       };
> >
> >       i2c0: i2c@fdd40000 {
> >
>
>
>
>
