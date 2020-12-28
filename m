Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1AF72E36EF
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Dec 2020 13:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbgL1MJm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Dec 2020 07:09:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbgL1MJm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Dec 2020 07:09:42 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2252C061794
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:09:01 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o17so23440346lfg.4
        for <linux-gpio@vger.kernel.org>; Mon, 28 Dec 2020 04:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lLJY44+rNL4sTCjuBqSjehAVk1z1ZIUdx9iaTQmkEvA=;
        b=ERPqRI+iTiThYnp094jszxRlIdLpjmBNjNjjPiu5lctHZmExydKv7SMGuze84St4SP
         146wdAiTju8FndYeMs0fBLEXRBZp4fOb6nkrjukMrYz3pMlUyotVuiZEb13FpF/Uyv0O
         jGi8bcUzK9wRUnL70/5SNgLA5s9rBaBMgOLQLZtmJPrwTaWCCI+w0SoCfEDsRwKtPPrS
         q/aY0Oj7mE2LcbpJxi70nM2T8AxymvPciRb21ERew366RvGR47D7RZvGMDoHhB/ZF/yL
         /hDbCHRVjuOON47BNo4Ngyocl4QXlMIYvqfOmKcrHMWUtSerMnp6WAhSIAHaeGKO7O6r
         EFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lLJY44+rNL4sTCjuBqSjehAVk1z1ZIUdx9iaTQmkEvA=;
        b=jExjgpf+jxYUa/jeEGsV6j7ay6CMl4+dxPAL5/5VZq069S9ZNh++lzvzL4NefV9Mjk
         BN7S6JksKGzt9OQUMbOqcNehJsXpRKIMjw8Z9l+ex5V9FfFCgsJwUedvY9JrflqNIL+a
         tTnTosyEV1DAaqihwRH9QIV16lsaEG251FwV/9oR4d3BCgJNknYQEPOufhGCHMClRgig
         t3LklU7z8NbzEfo4DHzcvxD+e80ji4SxQ9XwifcK8r2j/iV8BgK+VhTZ8IqW3XDfmyjt
         MGvSQp0EwASHyHWKsaBiEbwG0sUehujUJSjovvkOMcbqwWevVT4dubxIY4uRczeAAxJ/
         +EIQ==
X-Gm-Message-State: AOAM531/VdgeBBBzknujLfM6wBoNf+wUXoF7iTnQHHWYmUWTkED7Mocv
        9lZlf3fHmQEmqGM9ivBZ+ERYxF/KhboiCc7emKMHCw==
X-Google-Smtp-Source: ABdhPJx/LSyjWObSqe3GkulMJn+2DY+mqlK9Zbbuf8g+dtPTwAhWLJ/r3+HLIcZlx+hvbZyo7JBjkEGnBCHnQaC0dnM=
X-Received: by 2002:a05:651c:22b:: with SMTP id z11mr21032004ljn.38.1609157340183;
 Mon, 28 Dec 2020 04:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com> <20201213135056.24446-19-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-19-damien.lemoal@wdc.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 28 Dec 2020 17:38:48 +0530
Message-ID: <CAAhSdy3xTZ46kjke4AgrERPYC+fcz0=hCNyCD=OfaqgF=j5ZnA@mail.gmail.com>
Subject: Re: [PATCH v10 18/23] riscv: Add SiPeed MAIX DOCK board device tree
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
> Add a device tree for the SiPeed MAIX DOCK m1 and m1w boards. This
> device tree enables LEDs, gpio, i2c and spi/mmc SD card devices.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/canaan/k210_maix_dock.dts | 229 ++++++++++++++++++
>  1 file changed, 229 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/canaan/k210_maix_dock.dts
>
> diff --git a/arch/riscv/boot/dts/canaan/k210_maix_dock.dts b/arch/riscv/boot/dts/canaan/k210_maix_dock.dts
> new file mode 100644
> index 000000000000..abeaa9bad761
> --- /dev/null
> +++ b/arch/riscv/boot/dts/canaan/k210_maix_dock.dts
> @@ -0,0 +1,229 @@
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
> +       model = "SiPeed MAIX Dock";
> +       compatible = "sipeed,maix-dock-m1wm", "sipeed,maix-dock-m1",
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
> +               /*
> +                * Note: the board specification document green on gpio #4,
> +                * red on gpio #5 and blue on gpio #6. However, the board
> +                * is actually wired differently as defined here.
> +                */
> +               blue {
> +                       gpios = <&gpio1_0 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               green {
> +                       gpios = <&gpio1_0 5 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               red {
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
> +               pinmux = <K210_FPIOA(9, K210_PCF_I2C1_SCLK)>,
> +                        <K210_FPIOA(10, K210_PCF_I2C1_SDA)>;
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
