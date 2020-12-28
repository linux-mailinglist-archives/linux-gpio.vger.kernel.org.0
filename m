Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A66DD2E36F7
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Dec 2020 13:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbgL1MLG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Dec 2020 07:11:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727319AbgL1MLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2020 07:11:05 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73C5C061796
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:10:24 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id h205so23407939lfd.5
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/CNl1Zloh38hdZAZsu4K+FQB/bznGk06X5Zsg3eIrkw=;
        b=b3NQbMhT5B2DqPa8IiUyzriJvp6Wax4e6vSaXiGNGGcMlEOb0FOIQd5dVbC7f1s8iz
         xHTGjA5ZJYKMeI9BAKtMOeBIdqjelbJdAWYHVapSz2o10TLEh7d91t7AcjETdi5mE2zb
         YCn6JQao1Mb6yk4qyeUM7ix/nQ+mYqiUrf8q1pAo/O3ixRu3M4p6vHmoRJ1GnvCu6gUG
         3QUpI2ZlqiywDblEYjNS9VM23T2y4H8rGdyRdFWMm2cAFEGhRyMJ6j7GApZkgUupeiil
         OXaMc89ObpweSC8AL5JyyI9nqT8HZ5L8OrcKP7j3Hf+hH9nyZ6lmma0SnFSQ37f0hr3i
         CrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/CNl1Zloh38hdZAZsu4K+FQB/bznGk06X5Zsg3eIrkw=;
        b=MLAix4iag2sZVEhL6ydzJylYKcQR2KEakwkGxptmgnk3H+27AfC4R6rW6ZdujU+VDg
         cPZnpRnEEuaWaEYOafs9dj0aa6zVonZU8a3GW26J6D42Da0HrqFuuZhwl/lzJiYTst+o
         lbXeZE3Af6yUQ6Pms8bqPdfhuQ5ieVwtsdxl881v8UpCPAApS3XMNWer+2lzPhwnyBBC
         nKzyFYANWB+8PzqhdNmyjzp8eF/USMlJIvnH+JjUrlKwC7tB8pdnsLv75D5oHLYnaxa0
         GxnQeolJvlC3bEPhaU90G2YRL7t6dqOoKdS2xlLdCY9of7u352eBpwYOirw2quGCD0FF
         OXrw==
X-Gm-Message-State: AOAM532YY56+gmJhD7QHLiM2bcaCLIHp84atGfr2wnZjTWrJDrq4czo0
        1YfZ9GJnrJMtAQdvzhOU3VJjXZ+fdey3Y28rVF0u6Q==
X-Google-Smtp-Source: ABdhPJyKS1A8DXKYOXudCYpU2iKtW+BNmUm+PZIhDBtu/MgYlQbInb3rKQBrmobX6NG7s7rIFNcdIEojX7zmcO/FnA4=
X-Received: by 2002:a19:c5:: with SMTP id 188mr17884245lfa.511.1609157423381;
 Mon, 28 Dec 2020 04:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-21-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-21-damien.lemoal@wdc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 28 Dec 2020 17:40:11 +0530
Message-ID: <CAAhSdy1F4vrCL72UrYiPyYi5ecD2JGcVu9fPvvYK4wUy_1_OqA@mail.gmail.com>
Subject: Re: [PATCH v10 20/23] riscv: Add SiPeed MAIXDUINO board device tree
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
> Add a device tree for the SiPeed MAIXDUINO board. This device tree
> enables LEDs and spi/mmc SD card device. Additionally, gpios and i2c
> are also enabled and mapped to the board header pins as indicated on
> the board itself.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/canaan/k210_maixduino.dts | 201 ++++++++++++++++++
>  1 file changed, 201 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maixduino.dts
>
> diff --git a/arch/riscv/boot/dts/canaan/k210_maixduino.dts b/arch/riscv/boot/dts/canaan/k210_maixduino.dts
> new file mode 100644
> index 000000000000..681f12b46894
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/k210_maixduino.dts
> @@ -0,0 +1,201 @@
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
> +       model = "SiPeed MAIXDUINO";
> +       compatible = "sipeed,maixduino", "canaan,kendryte-k210";
> +
> +       chosen {
> +               bootargs = "earlycon console=ttySIF0";
> +               stdout-path = "serial0:115200n8";
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
> +       status = "okay";
> +
> +       uarths_pinctrl: uarths-pinmux {
> +               pinmux = <K210_FPIOA(4, K210_PCF_UARTHS_RX)>, /* Header "0" */
> +                        <K210_FPIOA(5, K210_PCF_UARTHS_TX)>; /* Header "1" */
> +       };
> +
> +       gpio_pinctrl: gpio-pinmux {
> +               pinmux = <K210_FPIOA(8, K210_PCF_GPIO0)>,
> +                        <K210_FPIOA(9, K210_PCF_GPIO1)>;
> +       };
> +
> +       gpiohs_pinctrl: gpiohs-pinmux {
> +               pinmux = <K210_FPIOA(16, K210_PCF_GPIOHS0)>,  /* BOOT */
> +                        <K210_FPIOA(21, K210_PCF_GPIOHS2)>,  /* Header "2" */
> +                        <K210_FPIOA(22, K210_PCF_GPIOHS3)>,  /* Header "3" */
> +                        <K210_FPIOA(23, K210_PCF_GPIOHS4)>,  /* Header "4" */
> +                        <K210_FPIOA(24, K210_PCF_GPIOHS5)>,  /* Header "5" */
> +                        <K210_FPIOA(32, K210_PCF_GPIOHS6)>,  /* Header "6" */
> +                        <K210_FPIOA(15, K210_PCF_GPIOHS7)>,  /* Header "7" */
> +                        <K210_FPIOA(14, K210_PCF_GPIOHS8)>,  /* Header "8" */
> +                        <K210_FPIOA(13, K210_PCF_GPIOHS9)>,  /* Header "9" */
> +                        <K210_FPIOA(12, K210_PCF_GPIOHS10)>, /* Header "10" */
> +                        <K210_FPIOA(11, K210_PCF_GPIOHS11)>, /* Header "11" */
> +                        <K210_FPIOA(10, K210_PCF_GPIOHS12)>, /* Header "12" */
> +                        <K210_FPIOA(3,  K210_PCF_GPIOHS13)>; /* Header "13" */
> +       };
> +
> +       i2s0_pinctrl: i2s0-pinmux {
> +               pinmux = <K210_FPIOA(18, K210_PCF_I2S0_SCLK)>,
> +                        <K210_FPIOA(19, K210_PCF_I2S0_WS)>,
> +                        <K210_FPIOA(20, K210_PCF_I2S0_IN_D0)>;
> +       };
> +
> +       spi1_pinctrl: spi1-pinmux {
> +               pinmux = <K210_FPIOA(26, K210_PCF_SPI1_D1)>,
> +                        <K210_FPIOA(27, K210_PCF_SPI1_SCLK)>,
> +                        <K210_FPIOA(28, K210_PCF_SPI1_D0)>,
> +                        <K210_FPIOA(29, K210_PCF_GPIO2)>; /* cs */
> +       };
> +
> +       i2c1_pinctrl: i2c1-pinmux {
> +               pinmux = <K210_FPIOA(30, K210_PCF_I2C1_SCLK)>, /* Header "scl" */
> +                        <K210_FPIOA(31, K210_PCF_I2C1_SDA)>;  /* Header "sda" */
> +       };
> +
> +       i2s1_pinctrl: i2s1-pinmux {
> +               pinmux = <K210_FPIOA(33, K210_PCF_I2S1_WS)>,
> +                        <K210_FPIOA(34, K210_PCF_I2S1_IN_D0)>,
> +                        <K210_FPIOA(35, K210_PCF_I2S1_SCLK)>;
> +       };
> +
> +       spi0_pinctrl: spi0-pinmux {
> +               pinmux = <K210_FPIOA(36, K210_PCF_GPIOHS20)>,  /* cs */
> +                        <K210_FPIOA(37, K210_PCF_GPIOHS21)>,  /* rst */
> +                        <K210_FPIOA(38, K210_PCF_GPIOHS22)>,  /* dc */
> +                        <K210_FPIOA(39, K210_PCF_SPI0_SCLK)>; /* wr */
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
> +               dc-gpios = <&gpio0 22 0>;
> +               spi-max-frequency = <15000000>;
> +       };
> +};
> +
> +&spi1 {
> +       pinctrl-0 = <&spi1_pinctrl>;
> +       pinctrl-names = "default";
> +       num-cs = <1>;
> +       cs-gpios = <&gpio1_0 2 GPIO_ACTIVE_LOW>;
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
