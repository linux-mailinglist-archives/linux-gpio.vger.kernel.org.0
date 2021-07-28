Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0803C3D9198
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 17:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236945AbhG1POd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 11:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235546AbhG1POd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 11:14:33 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C307C061757;
        Wed, 28 Jul 2021 08:14:30 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id s48so4496132ybi.7;
        Wed, 28 Jul 2021 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aNJaSvCLJS8LRfH1odaYKJawpM7foPFlSCmEaIB73X4=;
        b=n5qAJsWWogmckjtkSecLoj9w8eM7tIpxJFEoPi7wPaM5O4DxmqZ2e4G0LZ+50WiFrm
         jzoXKfhVmtmcwEs8Wl6FngEpQKCLj5U4vj3L5Gogj9CXOWeki2HwlODpQDD1JZUG7UZU
         C6pOM13WSArpXTlISb67DQnPmxUfL+A6y6ql2Djma6H9HOXFnBX3QC42b3X2SkQ+KvdS
         6IxUowEuUM39JgT5eM/H9d+jJ8AQd224BjsexCP9TEaJyw3Ex/ZijnaIS+qmM5rL6wbb
         q01cFV2ygoV8gIMut/g9sjp2BxtVJGylwnvNM4DEKo5oLo5tWqXKdoa61VlFDaJSlQtS
         JAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aNJaSvCLJS8LRfH1odaYKJawpM7foPFlSCmEaIB73X4=;
        b=sksdfyLpr1h2Yj18Jke+mQvlT1OIMdkpfwkewVQb1v2vRegduKwv428IwJTxmqnU/Q
         UIIJg5CpMlbF+oJIHnWmXOUzGEtCqnANKQp0p5HCvvJ7fhRI+XdqdqDkaiMkvehwJ472
         REe6hYLulg9bJCsff0dGrC7jXuZzQnGfJoQu+a2x6QqUqbdahvLpFUcJdMqxmULaTMp7
         lujXVmTx4fGlOM8I8JoUwhaLbO8RNT7+bwCRtslEVdZNk0LFUALdsxi2d01Wh5wbhuos
         lKWFR56pkYjpJHKY4hksLzsjQysXszm6GNB12+1XVddTML6S/J3HB3RfqpwF4M1D2zR4
         gsXA==
X-Gm-Message-State: AOAM532hQ4cwILAnmX2GhkBsXoDSwJ4yXdT56yXQfcvxCzqSbUBGQ2ar
        YVzsMvpQQq9MiIG8CXp9MmYVb0ijBnxh4okzBkE=
X-Google-Smtp-Source: ABdhPJxwL3DFnznFL0C5cvSFIZ7qy7+whT77qOKaaaI4+XECfObogxJB4dcyE7gyRBToBPLd0fAfUy7MFS0YV21CeOA=
X-Received: by 2002:a25:2cf:: with SMTP id 198mr231773ybc.259.1627485269721;
 Wed, 28 Jul 2021 08:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210728135534.703028-1-pgwipeout@gmail.com> <20210728135534.703028-6-pgwipeout@gmail.com>
 <8410057.NyiUUSuA9g@diego>
In-Reply-To: <8410057.NyiUUSuA9g@diego>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 28 Jul 2021 11:14:17 -0400
Message-ID: <CAMdYzYoVYodBU_d+wxuJtSHLOvewAhV5LXwobTL+m4byocnJhg@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: rockchip: add rk3568 tsadc nodes
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

On Wed, Jul 28, 2021 at 10:46 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote=
:
>
> Am Mittwoch, 28. Juli 2021, 15:55:30 CEST schrieb Peter Geis:
> > Add the thermal and tsadc nodes to the rk3568 device tree.
> > There are two sensors, one for the cpu, one for the gpu.
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >  .../boot/dts/rockchip/rk3568-pinctrl.dtsi     |  6 ++
> >  arch/arm64/boot/dts/rockchip/rk356x.dtsi      | 71 +++++++++++++++++++
> >  2 files changed, 77 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> > index a588ca95ace2..b464c7bda1f7 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> > @@ -2420,6 +2420,12 @@ spi3m1_cs1: spi3m1-cs1 {
> >       };
> >
> >       tsadc {
> > +             /omit-if-no-ref/
> > +             tsadc_gpio: tsadc-gpio {
> > +                     rockchip,pins =3D
> > +                             <0 RK_PA1 0 &pcfg_pull_none>;
> > +             };
> > +
> >               /omit-if-no-ref/
> >               tsadcm0_shut: tsadcm0-shut {
> >                       rockchip,pins =3D
> > diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot=
/dts/rockchip/rk356x.dtsi
> > index 77c679304916..0905fac0726a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > @@ -51,6 +51,7 @@ cpu0: cpu@0 {
> >                       compatible =3D "arm,cortex-a55";
> >                       reg =3D <0x0 0x0>;
> >                       clocks =3D <&scmi_clk 0>;
> > +                     #cooling-cells =3D <2>;
> >                       enable-method =3D "psci";
> >                       operating-points-v2 =3D <&cpu0_opp_table>;
> >               };
> > @@ -59,6 +60,7 @@ cpu1: cpu@100 {
> >                       device_type =3D "cpu";
> >                       compatible =3D "arm,cortex-a55";
> >                       reg =3D <0x0 0x100>;
> > +                     #cooling-cells =3D <2>;
> >                       enable-method =3D "psci";
> >                       operating-points-v2 =3D <&cpu0_opp_table>;
> >               };
> > @@ -67,6 +69,7 @@ cpu2: cpu@200 {
> >                       device_type =3D "cpu";
> >                       compatible =3D "arm,cortex-a55";
> >                       reg =3D <0x0 0x200>;
> > +                     #cooling-cells =3D <2>;
> >                       enable-method =3D "psci";
> >                       operating-points-v2 =3D <&cpu0_opp_table>;
> >               };
> > @@ -75,6 +78,7 @@ cpu3: cpu@300 {
> >                       device_type =3D "cpu";
> >                       compatible =3D "arm,cortex-a55";
> >                       reg =3D <0x0 0x300>;
> > +                     #cooling-cells =3D <2>;
> >                       enable-method =3D "psci";
> >                       operating-points-v2 =3D <&cpu0_opp_table>;
> >               };
> > @@ -774,6 +778,73 @@ uart9: serial@fe6d0000 {
> >               status =3D "disabled";
> >       };
> >
> > +     thermal_zones: thermal-zones {
> > +             cpu_thermal: cpu-thermal {
> > +                     polling-delay-passive =3D <100>;
> > +                     polling-delay =3D <1000>;
> > +
> > +                     thermal-sensors =3D <&tsadc 0>;
> > +
> > +                     trips {
> > +                             cpu_alert0: cpu_alert0 {
> > +                                     temperature =3D <70000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> > +                             cpu_alert1: cpu_alert1 {
> > +                                     temperature =3D <75000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "passive";
> > +                             };
> > +                             cpu_crit: cpu_crit {
> > +                                     temperature =3D <95000>;
> > +                                     hysteresis =3D <2000>;
> > +                                     type =3D "critical";
> > +                             };
> > +                     };
> > +
> > +                     cooling-maps {
> > +                             map0 {
> > +                                     trip =3D <&cpu_alert0>;
> > +                                     cooling-device =3D
> > +                                             <&cpu0 THERMAL_NO_LIMIT T=
HERMAL_NO_LIMIT>,
> > +                                             <&cpu1 THERMAL_NO_LIMIT T=
HERMAL_NO_LIMIT>,
> > +                                             <&cpu2 THERMAL_NO_LIMIT T=
HERMAL_NO_LIMIT>,
> > +                                             <&cpu3 THERMAL_NO_LIMIT T=
HERMAL_NO_LIMIT>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             gpu_thermal: gpu-thermal {
> > +                     polling-delay-passive =3D <20>; /* milliseconds *=
/
> > +                     polling-delay =3D <1000>; /* milliseconds */
> > +
> > +                     thermal-sensors =3D <&tsadc 1>;
> > +             };
> > +     };
> > +
> > +     tsadc: tsadc@fe710000 {
> > +             compatible =3D "rockchip,rk3568-tsadc";
> > +             reg =3D <0x0 0xfe710000 0x0 0x100>;
> > +             interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> > +             assigned-clocks =3D <&cru CLK_TSADC_TSEN>, <&cru CLK_TSAD=
C>;
> > +             assigned-clock-rates =3D <17000000>, <700000>;
> > +             clocks =3D <&cru CLK_TSADC>, <&cru PCLK_TSADC>;
> > +             clock-names =3D "tsadc", "apb_pclk";
> > +             resets =3D <&cru SRST_TSADC>, <&cru SRST_P_TSADC>,
> > +                      <&cru SRST_TSADCPHY>;
> > +             reset-names =3D "tsadc", "tsadc-apb", "tsadc-phy";
> > +             rockchip,grf =3D <&grf>;
> > +             rockchip,hw-tshut-temp =3D <95000>;
> > +             rockchip,hw-tshut-mode =3D <1>; /* tshut mode 0:CRU 1:GPI=
O */
> > +             rockchip,hw-tshut-polarity =3D <0>; /* tshut polarity 0:L=
OW 1:HIGH */
> > +             pinctrl-names =3D "gpio", "otpout";
> > +             pinctrl-0 =3D <&tsadc_gpio>;
> > +             pinctrl-1 =3D <&tsadc_shutorg>;
>
> The mainline thermal driver doesn't specify these pinctrl states at all.
>
> Heiko

Oh, yes this seems to be the case.

Is this something that should get fixed?
In practice it likely won't ever cause problems, but in theory if
someone changed the pinmux mode it could break it.

>
> > +             #thermal-sensor-cells =3D <1>;
> > +             status =3D "disabled";
> > +     };
> > +
> >       saradc: saradc@fe720000 {
> >               compatible =3D "rockchip,rk3568-saradc", "rockchip,rk3399=
-saradc";
> >               reg =3D <0x0 0xfe720000 0x0 0x100>;
> >
>
>
>
>
