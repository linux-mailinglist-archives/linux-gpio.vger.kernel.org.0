Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28323D9202
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jul 2021 17:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbhG1Pb4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 28 Jul 2021 11:31:56 -0400
Received: from gloria.sntech.de ([185.11.138.130]:51024 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235648AbhG1Pb4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Jul 2021 11:31:56 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m8lXB-0006QM-KG; Wed, 28 Jul 2021 17:31:49 +0200
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
Subject: Re: [PATCH 5/9] arm64: dts: rockchip: add rk3568 tsadc nodes
Date:   Wed, 28 Jul 2021 17:31:48 +0200
Message-ID: <22726529.6Emhk5qWAg@diego>
In-Reply-To: <CAMdYzYoVYodBU_d+wxuJtSHLOvewAhV5LXwobTL+m4byocnJhg@mail.gmail.com>
References: <20210728135534.703028-1-pgwipeout@gmail.com> <8410057.NyiUUSuA9g@diego> <CAMdYzYoVYodBU_d+wxuJtSHLOvewAhV5LXwobTL+m4byocnJhg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Mittwoch, 28. Juli 2021, 17:14:17 CEST schrieb Peter Geis:
> On Wed, Jul 28, 2021 at 10:46 AM Heiko Stübner <heiko@sntech.de> wrote:
> >
> > Am Mittwoch, 28. Juli 2021, 15:55:30 CEST schrieb Peter Geis:
> > > Add the thermal and tsadc nodes to the rk3568 device tree.
> > > There are two sensors, one for the cpu, one for the gpu.
> > >
> > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > > ---
> > >  .../boot/dts/rockchip/rk3568-pinctrl.dtsi     |  6 ++
> > >  arch/arm64/boot/dts/rockchip/rk356x.dtsi      | 71 +++++++++++++++++++
> > >  2 files changed, 77 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> > > index a588ca95ace2..b464c7bda1f7 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi
> > > @@ -2420,6 +2420,12 @@ spi3m1_cs1: spi3m1-cs1 {
> > >       };
> > >
> > >       tsadc {
> > > +             /omit-if-no-ref/
> > > +             tsadc_gpio: tsadc-gpio {
> > > +                     rockchip,pins =
> > > +                             <0 RK_PA1 0 &pcfg_pull_none>;
> > > +             };
> > > +
> > >               /omit-if-no-ref/
> > >               tsadcm0_shut: tsadcm0-shut {
> > >                       rockchip,pins =
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > index 77c679304916..0905fac0726a 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
> > > @@ -51,6 +51,7 @@ cpu0: cpu@0 {
> > >                       compatible = "arm,cortex-a55";
> > >                       reg = <0x0 0x0>;
> > >                       clocks = <&scmi_clk 0>;
> > > +                     #cooling-cells = <2>;
> > >                       enable-method = "psci";
> > >                       operating-points-v2 = <&cpu0_opp_table>;
> > >               };
> > > @@ -59,6 +60,7 @@ cpu1: cpu@100 {
> > >                       device_type = "cpu";
> > >                       compatible = "arm,cortex-a55";
> > >                       reg = <0x0 0x100>;
> > > +                     #cooling-cells = <2>;
> > >                       enable-method = "psci";
> > >                       operating-points-v2 = <&cpu0_opp_table>;
> > >               };
> > > @@ -67,6 +69,7 @@ cpu2: cpu@200 {
> > >                       device_type = "cpu";
> > >                       compatible = "arm,cortex-a55";
> > >                       reg = <0x0 0x200>;
> > > +                     #cooling-cells = <2>;
> > >                       enable-method = "psci";
> > >                       operating-points-v2 = <&cpu0_opp_table>;
> > >               };
> > > @@ -75,6 +78,7 @@ cpu3: cpu@300 {
> > >                       device_type = "cpu";
> > >                       compatible = "arm,cortex-a55";
> > >                       reg = <0x0 0x300>;
> > > +                     #cooling-cells = <2>;
> > >                       enable-method = "psci";
> > >                       operating-points-v2 = <&cpu0_opp_table>;
> > >               };
> > > @@ -774,6 +778,73 @@ uart9: serial@fe6d0000 {
> > >               status = "disabled";
> > >       };
> > >
> > > +     thermal_zones: thermal-zones {
> > > +             cpu_thermal: cpu-thermal {
> > > +                     polling-delay-passive = <100>;
> > > +                     polling-delay = <1000>;
> > > +
> > > +                     thermal-sensors = <&tsadc 0>;
> > > +
> > > +                     trips {
> > > +                             cpu_alert0: cpu_alert0 {
> > > +                                     temperature = <70000>;
> > > +                                     hysteresis = <2000>;
> > > +                                     type = "passive";
> > > +                             };
> > > +                             cpu_alert1: cpu_alert1 {
> > > +                                     temperature = <75000>;
> > > +                                     hysteresis = <2000>;
> > > +                                     type = "passive";
> > > +                             };
> > > +                             cpu_crit: cpu_crit {
> > > +                                     temperature = <95000>;
> > > +                                     hysteresis = <2000>;
> > > +                                     type = "critical";
> > > +                             };
> > > +                     };
> > > +
> > > +                     cooling-maps {
> > > +                             map0 {
> > > +                                     trip = <&cpu_alert0>;
> > > +                                     cooling-device =
> > > +                                             <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > +                                             <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > +                                             <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > +                                             <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > > +                             };
> > > +                     };
> > > +             };
> > > +
> > > +             gpu_thermal: gpu-thermal {
> > > +                     polling-delay-passive = <20>; /* milliseconds */
> > > +                     polling-delay = <1000>; /* milliseconds */
> > > +
> > > +                     thermal-sensors = <&tsadc 1>;
> > > +             };
> > > +     };
> > > +
> > > +     tsadc: tsadc@fe710000 {
> > > +             compatible = "rockchip,rk3568-tsadc";
> > > +             reg = <0x0 0xfe710000 0x0 0x100>;
> > > +             interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> > > +             assigned-clocks = <&cru CLK_TSADC_TSEN>, <&cru CLK_TSADC>;
> > > +             assigned-clock-rates = <17000000>, <700000>;
> > > +             clocks = <&cru CLK_TSADC>, <&cru PCLK_TSADC>;
> > > +             clock-names = "tsadc", "apb_pclk";
> > > +             resets = <&cru SRST_TSADC>, <&cru SRST_P_TSADC>,
> > > +                      <&cru SRST_TSADCPHY>;
> > > +             reset-names = "tsadc", "tsadc-apb", "tsadc-phy";
> > > +             rockchip,grf = <&grf>;
> > > +             rockchip,hw-tshut-temp = <95000>;
> > > +             rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
> > > +             rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
> > > +             pinctrl-names = "gpio", "otpout";
> > > +             pinctrl-0 = <&tsadc_gpio>;
> > > +             pinctrl-1 = <&tsadc_shutorg>;
> >
> > The mainline thermal driver doesn't specify these pinctrl states at all.
> >
> > Heiko
> 
> Oh, yes this seems to be the case.
> 
> Is this something that should get fixed?
> In practice it likely won't ever cause problems, but in theory if
> someone changed the pinmux mode it could break it.

take a look at for example the rk3399.dtsi where the tsadc uses
the generic pinctrl names of "init" (before-probe), "default" (after probe)
and "sleep"


Heiko

> 
> >
> > > +             #thermal-sensor-cells = <1>;
> > > +             status = "disabled";
> > > +     };
> > > +
> > >       saradc: saradc@fe720000 {
> > >               compatible = "rockchip,rk3568-saradc", "rockchip,rk3399-saradc";
> > >               reg = <0x0 0xfe720000 0x0 0x100>;
> > >
> >
> >
> >
> >
> 




