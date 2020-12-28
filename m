Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5612E36F2
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Dec 2020 13:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbgL1MKR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Dec 2020 07:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbgL1MKR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2020 07:10:17 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7843C061799
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:09:36 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b26so23386741lff.9
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P02uQyjOYUJEP7Y3SPVduzao2ynhVahUnEgVQMCDEUw=;
        b=Od5um3vP9jYr7f0X0GDU04GIOfyvGhO90GKyuaz1+3pOo8qNmMQIEYUgp+tpzj4+pf
         kGaLwdQsab+YQkz7ZQSTGQW62/8C42qR05bduMbEHYhl6g6TW6iU7SD0Y/tRDiA+cJWJ
         inqk7YHlKkykDvbsHn2qZhqM1BYPhZgxj5Qe7o8YHgIUDyBA33rJ3YpGKEGPQ4kCWVTh
         4l30bX4nHog00eyzD6EZs8I56GsEyVMSChehjs2K8cxmk+jpKsqSKNXDMXiB+8egZmUv
         Ry4drp3fKCLyonV/4mA0Wa6JfgjXBjSO802s18x5v9PSEwDdhQhJDJHfinYYiTYYwMU2
         YY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P02uQyjOYUJEP7Y3SPVduzao2ynhVahUnEgVQMCDEUw=;
        b=PAlC7lOqUSz3wTUPpeCXA0/VP4iYiWm4L1FflOSyUN9Wj+z4dkmtbYOgUOD5NPi5QG
         2oLUSAGs+e7qOf1d5mXycu/AOJZ5Nfobfi3+POuHq2WtbdhWEE8mQoHeNNvufkUD5WyA
         MGXupm6Evno7NkXJRnjK5j38vNzpmMSMU90JCgh4j1OA41+Sp2gswpfBA9SFk7KQqOvu
         9a97gDnNP55NYeGhBsbEgw8IOs+exv05B6zd3F0pE10aGxcXqV0PLUigHWCPUiFQXy9Y
         W1hsDplGvqcgwRd5ex91dR94CnKJxPuafi8zcgMHmZ2ai/DREebUX25l7JEhg0076Q7C
         Qd4Q==
X-Gm-Message-State: AOAM530doEQa3d9uftq8blCd7JbA0w06MCPSNeoPVvw2PreiHrAUa1gy
        V6AjqfHbUiZN4kX9XLjGTE33oGaU8ilS0lXvVdJQ0g==
X-Google-Smtp-Source: ABdhPJyN9dhlq72HmTDX0VxZ/iehtyRG2gwKNhJ3PwdzKCcNwhfAAjC9y6oMxlb5myDTrbmr1QZUrcqu2dY6wHbAMKA=
X-Received: by 2002:a05:6512:4d9:: with SMTP id w25mr17789796lfq.199.1609157375154;
 Mon, 28 Dec 2020 04:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-20-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-20-damien.lemoal@wdc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 28 Dec 2020 17:39:23 +0530
Message-ID: <CAAhSdy3u0s_bMyxfr59KLzbbU6kvyzk2UwuPM644w7HSfmVx7g@mail.gmail.com>
Subject: Re: [PATCH v10 19/23] riscv: Add SiPeed MAIX GO board device tree
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

On Sun, Dec 13, 2020 at 7:22 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Add a device tree for the SiPeed MAIX GO board. This device tree
> enables buttons, LEDs, gpio, i2c and spi/mmc SD card devices.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/canaan/k210_maix_go.dts | 237 ++++++++++++++++++++
>  1 file changed, 237 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_go.dts
>
> diff --git a/arch/riscv/boot/dts/canaan/k210_maix_go.dts b/arch/riscv/boot/dts/canaan/k210_maix_go.dts
> new file mode 100644
> index 000000000000..c3294dfaa3c6
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/k210_maix_go.dts
> @@ -0,0 +1,237 @@
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
> +       model = "SiPeed MAIX GO";
> +       compatible = "sipeed,maix-go", "canaan,kendryte-k210";
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
> +               up {
> +                       label = "UP";
> +                       linux,code = <BTN_1>;
> +                       gpios = <&gpio1_0 7 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               press {
> +                       label = "PRESS";
> +                       linux,code = <BTN_0>;
> +                       gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               down {
> +                       label = "DOWN";
> +                       linux,code = <BTN_2>;
> +                       gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
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
> +       pinctrl-0 = <&jtag_pinctrl>;
> +       pinctrl-names = "default";
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
