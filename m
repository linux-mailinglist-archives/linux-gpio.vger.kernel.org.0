Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915202E36EC
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Dec 2020 13:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbgL1MJH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Dec 2020 07:09:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgL1MJG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2020 07:09:06 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B509C061798
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:08:26 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id l11so23478691lfg.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WhqKoO+umGTXXuylTbAzjBicNDeWmO2czcNroorgEMY=;
        b=lV7/qxaqxKrg2csnSmxnw6432rG307S2nAY4myvLh3X9PyZQ+dJQIs2NCfxBsuO0N6
         PTHmtia41414PD7Gdm8O6y1C4bu3ZP9dm43Hs3txocqXuvkikdbj4pVoX9pu0i/y2t74
         SFNrSBGrRC8mC2t/kMHwySEQGDbBu8U7n8wLGCaX20MawcwyFgF0Wqr2JKpDdIbtPtyR
         KF25/H4jUWIZ+1f3kVV7TnCWycGbxiLI3gKITzlbt0U2m3ScZ3wWBwkPNwMhaMtpj1Al
         FIolaSACvqGiykv5r+54X50qv3PRNBkBL5eCpAhlqYXiqDWHeuRUcz3tbhv84pbR+jgO
         JH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WhqKoO+umGTXXuylTbAzjBicNDeWmO2czcNroorgEMY=;
        b=kepTcymyQkmgoeai9xe0rfTXfu8IToarOHmSqLykXV+g6WCo8MZF/gCW0q92Y3v66z
         1Vx2auZgNE1AnNzfsVQa2TO4/GZMb3QfHyDVXnw9BVoiynWhzMS+yOsJ9wsyJpITSwkY
         mKgLAOUK2yskaXTERWKYkpJssg3JzXd2yijKsgqVr1vIXyvLnHpesqCr+DI6UBgDmkXE
         E5lQk3+c0W0Od0M6neuDbrTEv1gZGPclyk3xCY9GMxx83Fmz03O/1Djhxdv2erF7H1sj
         VRSYnXHqf3C6Q1xIFf355+x3JUkDE90hDC/fdi3sBZ4vDWRm5AjBsaUyFUctH3t9DmKZ
         IpLw==
X-Gm-Message-State: AOAM533lI/fZ6QBIQnhIXdaJJiC/uAhs+VFXEqT3MBaJL+Yti9s9KO4h
        zGJJkEErxsg1CPCMSkhVTu6l/0OupncMWQ2rp1ygCA==
X-Google-Smtp-Source: ABdhPJzyS2xyRmScL1EAvokA9u+p5Wdq2BV/HFBSmQJjf4wrPyDJESFguXfV78SXEnfFEQIAnbyyfXB+eJbDpoJnboo=
X-Received: by 2002:a2e:3312:: with SMTP id d18mr23148166ljc.284.1609157304736;
 Mon, 28 Dec 2020 04:08:24 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-18-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-18-damien.lemoal@wdc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 28 Dec 2020 17:38:13 +0530
Message-ID: <CAAhSdy057UT6otKNeHNet44xwxjZXDvDuq-WTD-UK41-BJ48Kg@mail.gmail.com>
Subject: Re: [PATCH v10 17/23] riscv: Add SiPeed MAIX BiT board device tree
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 13, 2020 at 7:21 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Add a device tree for the SiPeed MAIX BiT and MAIX BiTm boards. This
> device tree enables LEDs, gpio, i2c and spi/mmc SD card devices.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/canaan/k210_maix_bit.dts | 227 +++++++++++++++++++
>  1 file changed, 227 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_bit.dts
>
> diff --git a/arch/riscv/boot/dts/canaan/k210_maix_bit.dts b/arch/riscv/boot/dts/canaan/k210_maix_bit.dts
> new file mode 100644
> index 000000000000..a5a40f9cf812
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/k210_maix_bit.dts
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
> + * Copyright (C) 2020 Western Digital Corporation or its affiliates.
> + */
> +
> +/dts-v1/;
> +
> +#include "k210.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +       model = "SiPeed MAIX BiT";
> +       compatible = "sipeed,maix-bitm", "sipeed,maix-bit",
> +                    "canaan,kendryte-k210";
> +
> +       chosen {
> +               bootargs = "earlycon console=ttySIF0";
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       gpio-leds {
> +               compatible = "gpio-leds";
> +
> +               green {
> +                       gpios = <&gpio1_0 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               red {
> +                       gpios = <&gpio1_0 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               blue {
> +                       gpios = <&gpio1_0 6 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               boot {
> +                       label = "BOOT";
> +                       linux,code = <BTN_0>;
> +                       gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       sound {
> +               compatible = "simple-audio-card";
> +               simple-audio-card,format = "i2s";
> +               status = "disabled";
> +
> +               simple-audio-card,cpu {
> +                       sound-dai = <&i2s0 0>;
> +               };
> +
> +               simple-audio-card,codec {
> +                       sound-dai = <&mic>;
> +               };
> +       };
> +
> +       mic: mic {
> +               #sound-dai-cells = <0>;
> +               compatible = "memsensing,msm261s4030h0";
> +               status = "disabled";
> +       };
> +};
> +
> +&fpioa {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&jtag_pinctrl>;
> +       status = "okay";
> +
> +       jtag_pinctrl: jtag-pinmux {
> +               pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
> +                        <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
> +                        <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
> +                        <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
> +       };
> +
> +       uarths_pinctrl: uarths-pinmux {
> +               pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>,
> +                        <K210_FPIOA(5, K210_PCF_UARTHS_TX)>;
> +       };
> +
> +       gpio_pinctrl: gpio-pinmux {
> +               pinmux = <K210_FPIOA(8, K210_PCF_GPIO0)>,
> +                        <K210_FPIOA(9, K210_PCF_GPIO1)>,
> +                        <K210_FPIOA(10, K210_PCF_GPIO2)>,
> +                        <K210_FPIOA(11, K210_PCF_GPIO3)>,
> +                        <K210_FPIOA(12, K210_PCF_GPIO4)>,
> +                        <K210_FPIOA(13, K210_PCF_GPIO5)>,
> +                        <K210_FPIOA(14, K210_PCF_GPIO6)>,
> +                        <K210_FPIOA(15, K210_PCF_GPIO7)>;
> +       };
> +
> +       gpiohs_pinctrl: gpiohs-pinmux {
> +               pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,
> +                        <K210_FPIOA(17, K210_PCF_GPIOHS1)>,
> +                        <K210_FPIOA(21, K210_PCF_GPIOHS5)>,
> +                        <K210_FPIOA(22, K210_PCF_GPIOHS6)>,
> +                        <K210_FPIOA(23, K210_PCF_GPIOHS7)>,
> +                        <K210_FPIOA(24, K210_PCF_GPIOHS8)>,
> +                        <K210_FPIOA(25, K210_PCF_GPIOHS9)>,
> +                        <K210_FPIOA(32, K210_PCF_GPIOHS16)>,
> +                        <K210_FPIOA(33, K210_PCF_GPIOHS17)>,
> +                        <K210_FPIOA(34, K210_PCF_GPIOHS18)>,
> +                        <K210_FPIOA(35, K210_PCF_GPIOHS19)>;
> +       };
> +
> +       i2s0_pinctrl: i2s0-pinmux {
> +               pinmux = <K210_FPIOA(18, K210_PCF_I2S0_SCLK)>,
> +                        <K210_FPIOA(19, K210_PCF_I2S0_WS)>,
> +                        <K210_FPIOA(20, K210_PCF_I2S0_IN_D0)>;
> +       };
> +
> +       dvp_pinctrl: dvp-pinmux {
> +               pinmux = <K210_FPIOA(40, K210_PCF_SCCB_SDA)>,
> +                        <K210_FPIOA(41, K210_PCF_SCCB_SCLK)>,
> +                        <K210_FPIOA(42, K210_PCF_DVP_RST)>,
> +                        <K210_FPIOA(43, K210_PCF_DVP_VSYNC)>,
> +                        <K210_FPIOA(44, K210_PCF_DVP_PWDN)>,
> +                        <K210_FPIOA(45, K210_PCF_DVP_HSYNC)>,
> +                        <K210_FPIOA(46, K210_PCF_DVP_XCLK)>,
> +                        <K210_FPIOA(47, K210_PCF_DVP_PCLK)>;
> +       };
> +
> +       spi0_pinctrl: spi0-pinmux {
> +               pinmux = <K210_FPIOA(36, K210_PCF_GPIOHS20)>,  /* cs */
> +                        <K210_FPIOA(37, K210_PCF_GPIOHS21)>,  /* rst */
> +                        <K210_FPIOA(38, K210_PCF_GPIOHS22)>,  /* dc */
> +                        <K210_FPIOA(39, K210_PCF_SPI0_SCLK)>; /* wr */
> +       };
> +
> +       spi1_pinctrl: spi1-pinmux {
> +               pinmux = <K210_FPIOA(26, K210_PCF_SPI1_D1)>,
> +                        <K210_FPIOA(27, K210_PCF_SPI1_SCLK)>,
> +                        <K210_FPIOA(28, K210_PCF_SPI1_D0)>,
> +                        <K210_FPIOA(29, K210_PCF_GPIOHS13)>; /* cs */
> +       };
> +
> +       i2c1_pinctrl: i2c1-pinmux {
> +               pinmux = <K210_FPIOA(30, K210_PCF_I2C1_SCLK)>,
> +                        <K210_FPIOA(31, K210_PCF_I2C1_SDA)>;
> +       };
> +};
> +
> +&uarths0 {
> +       pinctrl-0 = <&uarths_pinctrl>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&gpio0 {
> +       pinctrl-0 = <&gpiohs_pinctrl>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&gpio1 {
> +       pinctrl-0 = <&gpio_pinctrl>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&i2s0 {
> +       #sound-dai-cells = <1>;
> +       pinctrl-0 = <&i2s0_pinctrl>;
> +       pinctrl-names = "default";
> +};
> +
> +&i2c1 {
> +       pinctrl-0 = <&i2c1_pinctrl>;
> +       pinctrl-names = "default";
> +       clock-frequency = <400000>;
> +       status = "okay";
> +};
> +
> +&dvp0 {
> +       pinctrl-0 = <&dvp_pinctrl>;
> +       pinctrl-names = "default";
> +};
> +
> +&spi0 {
> +       pinctrl-0 = <&spi0_pinctrl>;
> +       pinctrl-names = "default";
> +       num-cs = <1>;
> +       cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
> +
> +       panel@0 {
> +               compatible = "sitronix,st7789v";
> +               reg = <0>;
> +               reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
> +               dc-gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>;
> +               spi-max-frequency = <15000000>;
> +               spi-cs-high;
> +               status = "disabled";
> +       };
> +};
> +
> +&spi1 {
> +       pinctrl-0 = <&spi1_pinctrl>;
> +       pinctrl-names = "default";
> +       num-cs = <1>;
> +       cs-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
> +       status = "okay";
> +
> +       slot@0 {
> +               compatible = "mmc-spi-slot";
> +               reg = <0>;
> +               voltage-ranges = <3300 3300>;
> +               spi-max-frequency = <25000000>;
> +               broken-cd;
> +       };
> +};
> +
> +&spi3 {
> +       spi-flash@0 {
> +               compatible = "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <50000000>;
> +               m25p,fast-read;
> +               broken-flash-reset;
> +       };
> +};
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
