Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949E0443697
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 20:44:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhKBTqe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 15:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbhKBTqd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 15:46:33 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD90EC061714;
        Tue,  2 Nov 2021 12:43:57 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id g10so1464201edj.1;
        Tue, 02 Nov 2021 12:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j8WJaFxirfc1PrKhwVJvvwd4TB0mfpPSF5YmSuTnI7k=;
        b=DIOqc+tprJby3eCoHyt88c5f9qm6fm7zYZF00wSd8uByzXnmtb36T6EekSdyRyA/Qd
         XvWIgia/LES9yWUtJ4sPc29sqf0siPmFLsIYeIZxNeWmN8Sao2V/frjKeSs5RP52H5cH
         ixhu3CXMpvKFpoAOgvdlddWZ+BuvYVLfDVC9K8Veso6xmvqA9JjFfPBb5MJRLWxxspxN
         x1GCTYxRspcMDB8ZVSz06taCFDqId4sy95K+6CGtpcTvJrtV7SVaPf1t1GUzPCMZsNqg
         HBZBt9MB6b/QWj2XLosgdAciwLwPx1nCA39sT2yPS+pqDW5ohKheInLhNhHVdeHMfOgx
         9isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j8WJaFxirfc1PrKhwVJvvwd4TB0mfpPSF5YmSuTnI7k=;
        b=6UkCBnBpEys3kV8NP2nd91vJmTliJYuTtfYBpKj0Rw9uARTQOszcfRRDeIOBTIXl7K
         RY/BTz4XVNhIv2WLnwyqc9EDbPqZjKsyaoe+8Juru7h6PiPkQOtodscyvdpRO2Njq1em
         PLfOto3Duiope0tbsQ6YU3ppaGE/90p2IcLPuHG3Dpd4L19F3S78BKie9iuGVgLB2tqJ
         Ew5MIGS2m9raxeXNFLilQTJwsuXAvrtbw1bcpc7qrpGCD4Wcaz5ci0waKBmc/A3b1gss
         rrDm01/zt/KJW8IfcCPXHx/XLlTIYEkbNxHaHHzFNF+EhlFUuoJL5zPJdl3tOPhHIzHf
         3PXQ==
X-Gm-Message-State: AOAM532HjVuiGJyiMJ/1RY4kKcrJ52uymCzXR4NB1gCKXjSZ06SBzYfP
        AkZiS0V/WOViaM2x+iax8ZdLeF+tZfPLYehCjcU=
X-Google-Smtp-Source: ABdhPJzCBPaEFqamttaBZLai+EJXEHXrj2OYYyBRQJ82j+Ne6V/vLfrP6h5tug1cih+N/qsJsMf0RE54sQecQ5uwcBA=
X-Received: by 2002:a17:906:d553:: with SMTP id cr19mr46327224ejc.128.1635882236311;
 Tue, 02 Nov 2021 12:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-7-kernel@esmil.dk>
In-Reply-To: <20211102161125.1144023-7-kernel@esmil.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 21:43:07 +0200
Message-ID: <CAHp75VeqXS=21xosQzJEJQ9=HPNOyMXyMOB-sDQ3FU+Y6YQakA@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] clk: starfive: Add JH7100 clock generator driver
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 2, 2021 at 6:45 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> From: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Add a driver for the StarFive JH7100 clock generator.

FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  MAINTAINERS                                |   7 +
>  drivers/clk/Kconfig                        |   1 +
>  drivers/clk/Makefile                       |   1 +
>  drivers/clk/starfive/Kconfig               |   9 +
>  drivers/clk/starfive/Makefile              |   3 +
>  drivers/clk/starfive/clk-starfive-jh7100.c | 689 +++++++++++++++++++++
>  6 files changed, 710 insertions(+)
>  create mode 100644 drivers/clk/starfive/Kconfig
>  create mode 100644 drivers/clk/starfive/Makefile
>  create mode 100644 drivers/clk/starfive/clk-starfive-jh7100.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b79fd441dde..ed49827dfb29 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17859,6 +17859,13 @@ M:     Ion Badulescu <ionut@badula.org>
>  S:     Odd Fixes
>  F:     drivers/net/ethernet/adaptec/starfire*
>
> +STARFIVE JH7100 CLOCK DRIVER
> +M:     Emil Renner Berthing <kernel@esmil.dk>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
> +F:     drivers/clk/starfive/clk-starfive-jh7100.c
> +F:     include/dt-bindings/clock/starfive-jh7100.h
> +
>  STATIC BRANCH/CALL
>  M:     Peter Zijlstra <peterz@infradead.org>
>  M:     Josh Poimboeuf <jpoimboe@redhat.com>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c5b3dc97396a..c91931c94888 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -412,6 +412,7 @@ source "drivers/clk/samsung/Kconfig"
>  source "drivers/clk/sifive/Kconfig"
>  source "drivers/clk/socfpga/Kconfig"
>  source "drivers/clk/sprd/Kconfig"
> +source "drivers/clk/starfive/Kconfig"
>  source "drivers/clk/sunxi/Kconfig"
>  source "drivers/clk/sunxi-ng/Kconfig"
>  source "drivers/clk/tegra/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index e42312121e51..a9bb2478fbdd 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -109,6 +109,7 @@ obj-y                                       += socfpga/
>  obj-$(CONFIG_PLAT_SPEAR)               += spear/
>  obj-y                                  += sprd/
>  obj-$(CONFIG_ARCH_STI)                 += st/
> +obj-$(CONFIG_SOC_STARFIVE)             += starfive/
>  obj-$(CONFIG_ARCH_SUNXI)               += sunxi/
>  obj-$(CONFIG_SUNXI_CCU)                        += sunxi-ng/
>  obj-$(CONFIG_ARCH_TEGRA)               += tegra/
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> new file mode 100644
> index 000000000000..c0fa9d5e641f
> --- /dev/null
> +++ b/drivers/clk/starfive/Kconfig
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config CLK_STARFIVE_JH7100
> +       bool "StarFive JH7100 clock support"
> +       depends on SOC_STARFIVE || COMPILE_TEST
> +       default SOC_STARFIVE
> +       help
> +         Say yes here to support the clock controller on the StarFive JH7100
> +         SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> new file mode 100644
> index 000000000000..09759cc73530
> --- /dev/null
> +++ b/drivers/clk/starfive/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# StarFive Clock
> +obj-$(CONFIG_CLK_STARFIVE_JH7100)      += clk-starfive-jh7100.o
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/starfive/clk-starfive-jh7100.c
> new file mode 100644
> index 000000000000..f3d430d8c2a8
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> @@ -0,0 +1,689 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7100 Clock Generator Driver
> + *
> + * Copyright 2021 Ahmad Fatoum, Pengutronix
> + * Copyright (C) 2021 Glider bv
> + * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/starfive-jh7100.h>
> +
> +/* external clocks */
> +#define JH7100_CLK_OSC_SYS             (JH7100_CLK_END + 0)
> +#define JH7100_CLK_OSC_AUD             (JH7100_CLK_END + 1)
> +#define JH7100_CLK_GMAC_RMII_REF       (JH7100_CLK_END + 2)
> +#define JH7100_CLK_GMAC_GR_MII_RX      (JH7100_CLK_END + 3)
> +
> +/* register fields */
> +#define JH7100_CLK_ENABLE      BIT(31)
> +#define JH7100_CLK_INVERT      BIT(30)
> +#define JH7100_CLK_MUX_MASK    GENMASK(27, 24)
> +#define JH7100_CLK_MUX_SHIFT   24
> +#define JH7100_CLK_DIV_MASK    GENMASK(23, 0)
> +
> +/* clock data */
> +#define JH7100_GATE(_idx, _name, _flags, _parent) [_idx] = {           \
> +       .name = _name,                                                  \
> +       .flags = CLK_SET_RATE_PARENT | (_flags),                        \
> +       .max = JH7100_CLK_ENABLE,                                       \
> +       .parents = { [0] = _parent },                                   \
> +}
> +
> +#define JH7100__DIV(_idx, _name, _max, _parent) [_idx] = {             \
> +       .name = _name,                                                  \
> +       .flags = 0,                                                     \
> +       .max = _max,                                                    \
> +       .parents = { [0] = _parent },                                   \
> +}
> +
> +#define JH7100_GDIV(_idx, _name, _flags, _max, _parent) [_idx] = {     \
> +       .name = _name,                                                  \
> +       .flags = _flags,                                                \
> +       .max = JH7100_CLK_ENABLE | (_max),                              \
> +       .parents = { [0] = _parent },                                   \
> +}
> +
> +#define JH7100__MUX(_idx, _name, _nparents, ...) [_idx] = {            \
> +       .name = _name,                                                  \
> +       .flags = 0,                                                     \
> +       .max = ((_nparents) - 1) << JH7100_CLK_MUX_SHIFT,               \
> +       .parents = { __VA_ARGS__ },                                     \
> +}
> +
> +#define JH7100_GMUX(_idx, _name, _flags, _nparents, ...) [_idx] = {    \
> +       .name = _name,                                                  \
> +       .flags = _flags,                                                \
> +       .max = JH7100_CLK_ENABLE |                                      \
> +               (((_nparents) - 1) << JH7100_CLK_MUX_SHIFT),            \
> +       .parents = { __VA_ARGS__ },                                     \
> +}
> +
> +#define JH7100__INV(_idx, _name, _parent) [_idx] = {                   \
> +       .name = _name,                                                  \
> +       .flags = CLK_SET_RATE_PARENT,                                   \
> +       .max = JH7100_CLK_INVERT,                                       \
> +       .parents = { [0] = _parent },                                   \
> +}
> +
> +static const struct {
> +       const char *name;
> +       unsigned long flags;
> +       u32 max;
> +       u8 parents[4];
> +} jh7100_clk_data[] __initconst = {
> +       JH7100__MUX(JH7100_CLK_CPUNDBUS_ROOT, "cpundbus_root", 4,
> +                   JH7100_CLK_OSC_SYS,
> +                   JH7100_CLK_PLL0_OUT,
> +                   JH7100_CLK_PLL1_OUT,
> +                   JH7100_CLK_PLL2_OUT),
> +       JH7100__MUX(JH7100_CLK_DLA_ROOT, "dla_root", 3,
> +                   JH7100_CLK_OSC_SYS,
> +                   JH7100_CLK_PLL1_OUT,
> +                   JH7100_CLK_PLL2_OUT),
> +       JH7100__MUX(JH7100_CLK_DSP_ROOT, "dsp_root", 4,
> +                   JH7100_CLK_OSC_SYS,
> +                   JH7100_CLK_PLL0_OUT,
> +                   JH7100_CLK_PLL1_OUT,
> +                   JH7100_CLK_PLL2_OUT),
> +       JH7100__MUX(JH7100_CLK_GMACUSB_ROOT, "gmacusb_root", 3,
> +                   JH7100_CLK_OSC_SYS,
> +                   JH7100_CLK_PLL0_OUT,
> +                   JH7100_CLK_PLL2_OUT),
> +       JH7100__MUX(JH7100_CLK_PERH0_ROOT, "perh0_root", 2,
> +                   JH7100_CLK_OSC_SYS,
> +                   JH7100_CLK_PLL0_OUT),
> +       JH7100__MUX(JH7100_CLK_PERH1_ROOT, "perh1_root", 2,
> +                   JH7100_CLK_OSC_SYS,
> +                   JH7100_CLK_PLL2_OUT),
> +       JH7100__MUX(JH7100_CLK_VIN_ROOT, "vin_root", 3,
> +                   JH7100_CLK_OSC_SYS,
> +                   JH7100_CLK_PLL1_OUT,
> +                   JH7100_CLK_PLL2_OUT),
> +       JH7100__MUX(JH7100_CLK_VOUT_ROOT, "vout_root", 3,
> +                   JH7100_CLK_OSC_AUD,
> +                   JH7100_CLK_PLL0_OUT,
> +                   JH7100_CLK_PLL2_OUT),
> +       JH7100_GDIV(JH7100_CLK_AUDIO_ROOT, "audio_root", 0, 8, JH7100_CLK_PLL0_OUT),
> +       JH7100__MUX(JH7100_CLK_CDECHIFI4_ROOT, "cdechifi4_root", 3,
> +                   JH7100_CLK_OSC_SYS,
> +                   JH7100_CLK_PLL1_OUT,
> +                   JH7100_CLK_PLL2_OUT),
> +       JH7100__MUX(JH7100_CLK_CDEC_ROOT, "cdec_root", 3,
> +                   JH7100_CLK_OSC_SYS,
> +                   JH7100_CLK_PLL0_OUT,
> +                   JH7100_CLK_PLL1_OUT),
> +       JH7100__MUX(JH7100_CLK_VOUTBUS_ROOT, "voutbus_root", 3,
> +                   JH7100_CLK_OSC_AUD,
> +                   JH7100_CLK_PLL0_OUT,
> +                   JH7100_CLK_PLL2_OUT),
> +       JH7100__DIV(JH7100_CLK_CPUNBUS_ROOT_DIV, "cpunbus_root_div", 2, JH7100_CLK_CPUNDBUS_ROOT),
> +       JH7100__DIV(JH7100_CLK_DSP_ROOT_DIV, "dsp_root_div", 4, JH7100_CLK_DSP_ROOT),
> +       JH7100__DIV(JH7100_CLK_PERH0_SRC, "perh0_src", 4, JH7100_CLK_PERH0_ROOT),
> +       JH7100__DIV(JH7100_CLK_PERH1_SRC, "perh1_src", 4, JH7100_CLK_PERH1_ROOT),
> +       JH7100_GDIV(JH7100_CLK_PLL0_TESTOUT, "pll0_testout", 0, 31, JH7100_CLK_PERH0_SRC),
> +       JH7100_GDIV(JH7100_CLK_PLL1_TESTOUT, "pll1_testout", 0, 31, JH7100_CLK_DLA_ROOT),
> +       JH7100_GDIV(JH7100_CLK_PLL2_TESTOUT, "pll2_testout", 0, 31, JH7100_CLK_PERH1_SRC),
> +       JH7100__MUX(JH7100_CLK_PLL2_REF, "pll2_refclk", 2,
> +                   JH7100_CLK_OSC_SYS,
> +                   JH7100_CLK_OSC_AUD),
> +       JH7100__DIV(JH7100_CLK_CPU_CORE, "cpu_core", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH7100__DIV(JH7100_CLK_CPU_AXI, "cpu_axi", 8, JH7100_CLK_CPU_CORE),
> +       JH7100__DIV(JH7100_CLK_AHB_BUS, "ahb_bus", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH7100__DIV(JH7100_CLK_APB1_BUS, "apb1_bus", 8, JH7100_CLK_AHB_BUS),
> +       JH7100__DIV(JH7100_CLK_APB2_BUS, "apb2_bus", 8, JH7100_CLK_AHB_BUS),
> +       JH7100_GATE(JH7100_CLK_DOM3AHB_BUS, "dom3ahb_bus", CLK_IS_CRITICAL, JH7100_CLK_AHB_BUS),
> +       JH7100_GATE(JH7100_CLK_DOM7AHB_BUS, "dom7ahb_bus", CLK_IS_CRITICAL, JH7100_CLK_AHB_BUS),
> +       JH7100_GATE(JH7100_CLK_U74_CORE0, "u74_core0", CLK_IS_CRITICAL, JH7100_CLK_CPU_CORE),
> +       JH7100_GDIV(JH7100_CLK_U74_CORE1, "u74_core1", CLK_IS_CRITICAL, 8, JH7100_CLK_CPU_CORE),
> +       JH7100_GATE(JH7100_CLK_U74_AXI, "u74_axi", CLK_IS_CRITICAL, JH7100_CLK_CPU_AXI),
> +       JH7100_GATE(JH7100_CLK_U74RTC_TOGGLE, "u74rtc_toggle", CLK_IS_CRITICAL, JH7100_CLK_OSC_SYS),
> +       JH7100_GATE(JH7100_CLK_SGDMA2P_AXI, "sgdma2p_axi", 0, JH7100_CLK_CPU_AXI),
> +       JH7100_GATE(JH7100_CLK_DMA2PNOC_AXI, "dma2pnoc_axi", 0, JH7100_CLK_CPU_AXI),
> +       JH7100_GATE(JH7100_CLK_SGDMA2P_AHB, "sgdma2p_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH7100__DIV(JH7100_CLK_DLA_BUS, "dla_bus", 4, JH7100_CLK_DLA_ROOT),
> +       JH7100_GATE(JH7100_CLK_DLA_AXI, "dla_axi", 0, JH7100_CLK_DLA_BUS),
> +       JH7100_GATE(JH7100_CLK_DLANOC_AXI, "dlanoc_axi", 0, JH7100_CLK_DLA_BUS),
> +       JH7100_GATE(JH7100_CLK_DLA_APB, "dla_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GDIV(JH7100_CLK_VP6_CORE, "vp6_core", 0, 4, JH7100_CLK_DSP_ROOT_DIV),
> +       JH7100__DIV(JH7100_CLK_VP6BUS_SRC, "vp6bus_src", 4, JH7100_CLK_DSP_ROOT),
> +       JH7100_GDIV(JH7100_CLK_VP6_AXI, "vp6_axi", 0, 4, JH7100_CLK_VP6BUS_SRC),
> +       JH7100__DIV(JH7100_CLK_VCDECBUS_SRC, "vcdecbus_src", 4, JH7100_CLK_CDECHIFI4_ROOT),
> +       JH7100__DIV(JH7100_CLK_VDEC_BUS, "vdec_bus", 8, JH7100_CLK_VCDECBUS_SRC),
> +       JH7100_GATE(JH7100_CLK_VDEC_AXI, "vdec_axi", 0, JH7100_CLK_VDEC_BUS),
> +       JH7100_GATE(JH7100_CLK_VDECBRG_MAIN, "vdecbrg_mainclk", 0, JH7100_CLK_VDEC_BUS),
> +       JH7100_GDIV(JH7100_CLK_VDEC_BCLK, "vdec_bclk", 0, 8, JH7100_CLK_VCDECBUS_SRC),
> +       JH7100_GDIV(JH7100_CLK_VDEC_CCLK, "vdec_cclk", 0, 8, JH7100_CLK_CDEC_ROOT),
> +       JH7100_GATE(JH7100_CLK_VDEC_APB, "vdec_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GDIV(JH7100_CLK_JPEG_AXI, "jpeg_axi", 0, 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH7100_GDIV(JH7100_CLK_JPEG_CCLK, "jpeg_cclk", 0, 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH7100_GATE(JH7100_CLK_JPEG_APB, "jpeg_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GDIV(JH7100_CLK_GC300_2X, "gc300_2x", 0, 8, JH7100_CLK_CDECHIFI4_ROOT),
> +       JH7100_GATE(JH7100_CLK_GC300_AHB, "gc300_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH7100__DIV(JH7100_CLK_JPCGC300_AXIBUS, "jpcgc300_axibus", 8, JH7100_CLK_VCDECBUS_SRC),
> +       JH7100_GATE(JH7100_CLK_GC300_AXI, "gc300_axi", 0, JH7100_CLK_JPCGC300_AXIBUS),
> +       JH7100_GATE(JH7100_CLK_JPCGC300_MAIN, "jpcgc300_mainclk", 0, JH7100_CLK_JPCGC300_AXIBUS),
> +       JH7100__DIV(JH7100_CLK_VENC_BUS, "venc_bus", 8, JH7100_CLK_VCDECBUS_SRC),
> +       JH7100_GATE(JH7100_CLK_VENC_AXI, "venc_axi", 0, JH7100_CLK_VENC_BUS),
> +       JH7100_GATE(JH7100_CLK_VENCBRG_MAIN, "vencbrg_mainclk", 0, JH7100_CLK_VENC_BUS),
> +       JH7100_GDIV(JH7100_CLK_VENC_BCLK, "venc_bclk", 0, 8, JH7100_CLK_VCDECBUS_SRC),
> +       JH7100_GDIV(JH7100_CLK_VENC_CCLK, "venc_cclk", 0, 8, JH7100_CLK_CDEC_ROOT),
> +       JH7100_GATE(JH7100_CLK_VENC_APB, "venc_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV2, "ddrpll_div2", CLK_IS_CRITICAL, 2, JH7100_CLK_PLL1_OUT),
> +       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV4, "ddrpll_div4", CLK_IS_CRITICAL, 2, JH7100_CLK_DDRPLL_DIV2),
> +       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV8, "ddrpll_div8", CLK_IS_CRITICAL, 2, JH7100_CLK_DDRPLL_DIV4),
> +       JH7100_GDIV(JH7100_CLK_DDROSC_DIV2, "ddrosc_div2", CLK_IS_CRITICAL, 2, JH7100_CLK_OSC_SYS),
> +       JH7100_GMUX(JH7100_CLK_DDRC0, "ddrc0", CLK_IS_CRITICAL, 4,
> +                   JH7100_CLK_DDROSC_DIV2,
> +                   JH7100_CLK_DDRPLL_DIV2,
> +                   JH7100_CLK_DDRPLL_DIV4,
> +                   JH7100_CLK_DDRPLL_DIV8),
> +       JH7100_GMUX(JH7100_CLK_DDRC1, "ddrc1", CLK_IS_CRITICAL, 4,
> +                   JH7100_CLK_DDROSC_DIV2,
> +                   JH7100_CLK_DDRPLL_DIV2,
> +                   JH7100_CLK_DDRPLL_DIV4,
> +                   JH7100_CLK_DDRPLL_DIV8),
> +       JH7100_GATE(JH7100_CLK_DDRPHY_APB, "ddrphy_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100__DIV(JH7100_CLK_NOC_ROB, "noc_rob", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH7100__DIV(JH7100_CLK_NOC_COG, "noc_cog", 8, JH7100_CLK_DLA_ROOT),
> +       JH7100_GATE(JH7100_CLK_NNE_AHB, "nne_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH7100__DIV(JH7100_CLK_NNEBUS_SRC1, "nnebus_src1", 4, JH7100_CLK_DSP_ROOT),
> +       JH7100__MUX(JH7100_CLK_NNE_BUS, "nne_bus", 2,
> +                   JH7100_CLK_CPU_AXI,
> +                   JH7100_CLK_NNEBUS_SRC1),
> +       JH7100_GATE(JH7100_CLK_NNE_AXI, "nne_axi", 0, JH7100_CLK_NNE_BUS),
> +       JH7100_GATE(JH7100_CLK_NNENOC_AXI, "nnenoc_axi", 0, JH7100_CLK_NNE_BUS),
> +       JH7100_GATE(JH7100_CLK_DLASLV_AXI, "dlaslv_axi", 0, JH7100_CLK_NNE_BUS),
> +       JH7100_GATE(JH7100_CLK_DSPX2C_AXI, "dspx2c_axi", CLK_IS_CRITICAL, JH7100_CLK_NNE_BUS),
> +       JH7100__DIV(JH7100_CLK_HIFI4_SRC, "hifi4_src", 4, JH7100_CLK_CDECHIFI4_ROOT),
> +       JH7100__DIV(JH7100_CLK_HIFI4_COREFREE, "hifi4_corefree", 8, JH7100_CLK_HIFI4_SRC),
> +       JH7100_GATE(JH7100_CLK_HIFI4_CORE, "hifi4_core", 0, JH7100_CLK_HIFI4_COREFREE),
> +       JH7100__DIV(JH7100_CLK_HIFI4_BUS, "hifi4_bus", 8, JH7100_CLK_HIFI4_COREFREE),
> +       JH7100_GATE(JH7100_CLK_HIFI4_AXI, "hifi4_axi", 0, JH7100_CLK_HIFI4_BUS),
> +       JH7100_GATE(JH7100_CLK_HIFI4NOC_AXI, "hifi4noc_axi", 0, JH7100_CLK_HIFI4_BUS),
> +       JH7100__DIV(JH7100_CLK_SGDMA1P_BUS, "sgdma1p_bus", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH7100_GATE(JH7100_CLK_SGDMA1P_AXI, "sgdma1p_axi", 0, JH7100_CLK_SGDMA1P_BUS),
> +       JH7100_GATE(JH7100_CLK_DMA1P_AXI, "dma1p_axi", 0, JH7100_CLK_SGDMA1P_BUS),
> +       JH7100_GDIV(JH7100_CLK_X2C_AXI, "x2c_axi", CLK_IS_CRITICAL, 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH7100__DIV(JH7100_CLK_USB_BUS, "usb_bus", 8, JH7100_CLK_CPUNBUS_ROOT_DIV),
> +       JH7100_GATE(JH7100_CLK_USB_AXI, "usb_axi", 0, JH7100_CLK_USB_BUS),
> +       JH7100_GATE(JH7100_CLK_USBNOC_AXI, "usbnoc_axi", 0, JH7100_CLK_USB_BUS),
> +       JH7100__DIV(JH7100_CLK_USBPHY_ROOTDIV, "usbphy_rootdiv", 4, JH7100_CLK_GMACUSB_ROOT),
> +       JH7100_GDIV(JH7100_CLK_USBPHY_125M, "usbphy_125m", 0, 8, JH7100_CLK_USBPHY_ROOTDIV),
> +       JH7100_GDIV(JH7100_CLK_USBPHY_PLLDIV25M, "usbphy_plldiv25m", 0, 32, JH7100_CLK_USBPHY_ROOTDIV),
> +       JH7100__MUX(JH7100_CLK_USBPHY_25M, "usbphy_25m", 2,
> +                   JH7100_CLK_OSC_SYS,
> +                   JH7100_CLK_USBPHY_PLLDIV25M),
> +       JH7100__DIV(JH7100_CLK_AUDIO_DIV, "audio_div", 131072, JH7100_CLK_AUDIO_ROOT),
> +       JH7100_GATE(JH7100_CLK_AUDIO_SRC, "audio_src", 0, JH7100_CLK_AUDIO_DIV),
> +       JH7100_GATE(JH7100_CLK_AUDIO_12288, "audio_12288", 0, JH7100_CLK_OSC_AUD),
> +       JH7100_GDIV(JH7100_CLK_VIN_SRC, "vin_src", 0, 4, JH7100_CLK_VIN_ROOT),
> +       JH7100__DIV(JH7100_CLK_ISP0_BUS, "isp0_bus", 8, JH7100_CLK_VIN_SRC),
> +       JH7100_GATE(JH7100_CLK_ISP0_AXI, "isp0_axi", 0, JH7100_CLK_ISP0_BUS),
> +       JH7100_GATE(JH7100_CLK_ISP0NOC_AXI, "isp0noc_axi", 0, JH7100_CLK_ISP0_BUS),
> +       JH7100_GATE(JH7100_CLK_ISPSLV_AXI, "ispslv_axi", 0, JH7100_CLK_ISP0_BUS),
> +       JH7100__DIV(JH7100_CLK_ISP1_BUS, "isp1_bus", 8, JH7100_CLK_VIN_SRC),
> +       JH7100_GATE(JH7100_CLK_ISP1_AXI, "isp1_axi", 0, JH7100_CLK_ISP1_BUS),
> +       JH7100_GATE(JH7100_CLK_ISP1NOC_AXI, "isp1noc_axi", 0, JH7100_CLK_ISP1_BUS),
> +       JH7100__DIV(JH7100_CLK_VIN_BUS, "vin_bus", 8, JH7100_CLK_VIN_SRC),
> +       JH7100_GATE(JH7100_CLK_VIN_AXI, "vin_axi", 0, JH7100_CLK_VIN_BUS),
> +       JH7100_GATE(JH7100_CLK_VINNOC_AXI, "vinnoc_axi", 0, JH7100_CLK_VIN_BUS),
> +       JH7100_GDIV(JH7100_CLK_VOUT_SRC, "vout_src", 0, 4, JH7100_CLK_VOUT_ROOT),
> +       JH7100__DIV(JH7100_CLK_DISPBUS_SRC, "dispbus_src", 4, JH7100_CLK_VOUTBUS_ROOT),
> +       JH7100__DIV(JH7100_CLK_DISP_BUS, "disp_bus", 4, JH7100_CLK_DISPBUS_SRC),
> +       JH7100_GATE(JH7100_CLK_DISP_AXI, "disp_axi", 0, JH7100_CLK_DISP_BUS),
> +       JH7100_GATE(JH7100_CLK_DISPNOC_AXI, "dispnoc_axi", 0, JH7100_CLK_DISP_BUS),
> +       JH7100_GATE(JH7100_CLK_SDIO0_AHB, "sdio0_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH7100_GDIV(JH7100_CLK_SDIO0_CCLKINT, "sdio0_cclkint", 0, 24, JH7100_CLK_PERH0_SRC),
> +       JH7100__INV(JH7100_CLK_SDIO0_CCLKINT_INV, "sdio0_cclkint_inv", JH7100_CLK_SDIO0_CCLKINT),
> +       JH7100_GATE(JH7100_CLK_SDIO1_AHB, "sdio1_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH7100_GDIV(JH7100_CLK_SDIO1_CCLKINT, "sdio1_cclkint", 0, 24, JH7100_CLK_PERH1_SRC),
> +       JH7100__INV(JH7100_CLK_SDIO1_CCLKINT_INV, "sdio1_cclkint_inv", JH7100_CLK_SDIO1_CCLKINT),
> +       JH7100_GATE(JH7100_CLK_GMAC_AHB, "gmac_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH7100__DIV(JH7100_CLK_GMAC_ROOT_DIV, "gmac_root_div", 8, JH7100_CLK_GMACUSB_ROOT),
> +       JH7100_GDIV(JH7100_CLK_GMAC_PTP_REF, "gmac_ptp_refclk", 0, 31, JH7100_CLK_GMAC_ROOT_DIV),
> +       JH7100_GDIV(JH7100_CLK_GMAC_GTX, "gmac_gtxclk", 0, 255, JH7100_CLK_GMAC_ROOT_DIV),
> +       JH7100_GDIV(JH7100_CLK_GMAC_RMII_TX, "gmac_rmii_txclk", 0, 8, JH7100_CLK_GMAC_RMII_REF),
> +       JH7100_GDIV(JH7100_CLK_GMAC_RMII_RX, "gmac_rmii_rxclk", 0, 8, JH7100_CLK_GMAC_RMII_REF),
> +       JH7100__MUX(JH7100_CLK_GMAC_TX, "gmac_tx", 3,
> +                   JH7100_CLK_GMAC_GTX,
> +                   JH7100_CLK_GMAC_TX_INV,
> +                   JH7100_CLK_GMAC_RMII_TX),
> +       JH7100__INV(JH7100_CLK_GMAC_TX_INV, "gmac_tx_inv", JH7100_CLK_GMAC_TX),
> +       JH7100__MUX(JH7100_CLK_GMAC_RX_PRE, "gmac_rx_pre", 2,
> +                   JH7100_CLK_GMAC_GR_MII_RX,
> +                   JH7100_CLK_GMAC_RMII_RX),
> +       JH7100__INV(JH7100_CLK_GMAC_RX_INV, "gmac_rx_inv", JH7100_CLK_GMAC_RX_PRE),
> +       JH7100_GATE(JH7100_CLK_GMAC_RMII, "gmac_rmii", 0, JH7100_CLK_GMAC_RMII_REF),
> +       JH7100_GDIV(JH7100_CLK_GMAC_TOPHYREF, "gmac_tophyref", 0, 127, JH7100_CLK_GMAC_ROOT_DIV),
> +       JH7100_GATE(JH7100_CLK_SPI2AHB_AHB, "spi2ahb_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH7100_GDIV(JH7100_CLK_SPI2AHB_CORE, "spi2ahb_core", 0, 31, JH7100_CLK_PERH0_SRC),
> +       JH7100_GATE(JH7100_CLK_EZMASTER_AHB, "ezmaster_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH7100_GATE(JH7100_CLK_E24_AHB, "e24_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH7100_GATE(JH7100_CLK_E24RTC_TOGGLE, "e24rtc_toggle", 0, JH7100_CLK_OSC_SYS),
> +       JH7100_GATE(JH7100_CLK_QSPI_AHB, "qspi_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH7100_GATE(JH7100_CLK_QSPI_APB, "qspi_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GDIV(JH7100_CLK_QSPI_REF, "qspi_refclk", 0, 31, JH7100_CLK_PERH0_SRC),
> +       JH7100_GATE(JH7100_CLK_SEC_AHB, "sec_ahb", 0, JH7100_CLK_AHB_BUS),
> +       JH7100_GATE(JH7100_CLK_AES, "aes_clk", 0, JH7100_CLK_SEC_AHB),
> +       JH7100_GATE(JH7100_CLK_SHA, "sha_clk", 0, JH7100_CLK_SEC_AHB),
> +       JH7100_GATE(JH7100_CLK_PKA, "pka_clk", 0, JH7100_CLK_SEC_AHB),
> +       JH7100_GATE(JH7100_CLK_TRNG_APB, "trng_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GATE(JH7100_CLK_OTP_APB, "otp_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GATE(JH7100_CLK_UART0_APB, "uart0_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GDIV(JH7100_CLK_UART0_CORE, "uart0_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH7100_GATE(JH7100_CLK_UART1_APB, "uart1_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GDIV(JH7100_CLK_UART1_CORE, "uart1_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH7100_GATE(JH7100_CLK_SPI0_APB, "spi0_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GDIV(JH7100_CLK_SPI0_CORE, "spi0_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH7100_GATE(JH7100_CLK_SPI1_APB, "spi1_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GDIV(JH7100_CLK_SPI1_CORE, "spi1_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH7100_GATE(JH7100_CLK_I2C0_APB, "i2c0_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GDIV(JH7100_CLK_I2C0_CORE, "i2c0_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH7100_GATE(JH7100_CLK_I2C1_APB, "i2c1_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GDIV(JH7100_CLK_I2C1_CORE, "i2c1_core", 0, 63, JH7100_CLK_PERH1_SRC),
> +       JH7100_GATE(JH7100_CLK_GPIO_APB, "gpio_apb", 0, JH7100_CLK_APB1_BUS),
> +       JH7100_GATE(JH7100_CLK_UART2_APB, "uart2_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH7100_GDIV(JH7100_CLK_UART2_CORE, "uart2_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GATE(JH7100_CLK_UART3_APB, "uart3_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH7100_GDIV(JH7100_CLK_UART3_CORE, "uart3_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GATE(JH7100_CLK_SPI2_APB, "spi2_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH7100_GDIV(JH7100_CLK_SPI2_CORE, "spi2_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GATE(JH7100_CLK_SPI3_APB, "spi3_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH7100_GDIV(JH7100_CLK_SPI3_CORE, "spi3_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GATE(JH7100_CLK_I2C2_APB, "i2c2_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH7100_GDIV(JH7100_CLK_I2C2_CORE, "i2c2_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GATE(JH7100_CLK_I2C3_APB, "i2c3_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH7100_GDIV(JH7100_CLK_I2C3_CORE, "i2c3_core", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GATE(JH7100_CLK_WDTIMER_APB, "wdtimer_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH7100_GDIV(JH7100_CLK_WDT_CORE, "wdt_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GDIV(JH7100_CLK_TIMER0_CORE, "timer0_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GDIV(JH7100_CLK_TIMER1_CORE, "timer1_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GDIV(JH7100_CLK_TIMER2_CORE, "timer2_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GDIV(JH7100_CLK_TIMER3_CORE, "timer3_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GDIV(JH7100_CLK_TIMER4_CORE, "timer4_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GDIV(JH7100_CLK_TIMER5_CORE, "timer5_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GDIV(JH7100_CLK_TIMER6_CORE, "timer6_coreclk", 0, 63, JH7100_CLK_PERH0_SRC),
> +       JH7100_GATE(JH7100_CLK_VP6INTC_APB, "vp6intc_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH7100_GATE(JH7100_CLK_PWM_APB, "pwm_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH7100_GATE(JH7100_CLK_MSI_APB, "msi_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH7100_GATE(JH7100_CLK_TEMP_APB, "temp_apb", 0, JH7100_CLK_APB2_BUS),
> +       JH7100_GDIV(JH7100_CLK_TEMP_SENSE, "temp_sense", 0, 31, JH7100_CLK_OSC_SYS),
> +       JH7100_GATE(JH7100_CLK_SYSERR_APB, "syserr_apb", 0, JH7100_CLK_APB2_BUS),
> +};
> +
> +struct jh7100_clk {
> +       struct clk_hw hw;
> +       unsigned int idx;
> +       unsigned int max_div;
> +};
> +
> +struct clk_starfive_jh7100_priv {
> +       /* protect clk enable and set rate/parent from happening at the same time */
> +       spinlock_t rmw_lock;
> +       struct device *dev;
> +       void __iomem *base;
> +       struct clk_hw *pll[3];
> +       struct jh7100_clk reg[JH7100_CLK_PLL0_OUT];
> +};
> +
> +static struct jh7100_clk *jh7100_clk_from(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct jh7100_clk, hw);
> +}
> +
> +static struct clk_starfive_jh7100_priv *jh7100_priv_from(struct jh7100_clk *clk)
> +{
> +       return container_of(clk, struct clk_starfive_jh7100_priv, reg[clk->idx]);
> +}
> +
> +static u32 jh7100_clk_reg_get(struct jh7100_clk *clk)
> +{
> +       struct clk_starfive_jh7100_priv *priv = jh7100_priv_from(clk);
> +       void __iomem *reg = priv->base + 4 * clk->idx;
> +
> +       return readl_relaxed(reg);
> +}
> +
> +static void jh7100_clk_reg_rmw(struct jh7100_clk *clk, u32 mask, u32 value)
> +{
> +       struct clk_starfive_jh7100_priv *priv = jh7100_priv_from(clk);
> +       void __iomem *reg = priv->base + 4 * clk->idx;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&priv->rmw_lock, flags);
> +       value |= readl_relaxed(reg) & ~mask;
> +       writel_relaxed(value, reg);
> +       spin_unlock_irqrestore(&priv->rmw_lock, flags);
> +}
> +
> +static int jh7100_clk_enable(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, JH7100_CLK_ENABLE);
> +       return 0;
> +}
> +
> +static void jh7100_clk_disable(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, 0);
> +}
> +
> +static int jh7100_clk_is_enabled(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +
> +       return !!(jh7100_clk_reg_get(clk) & JH7100_CLK_ENABLE);
> +}
> +
> +static unsigned long jh7100_clk_recalc_rate(struct clk_hw *hw,
> +                                           unsigned long parent_rate)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       u32 div = jh7100_clk_reg_get(clk) & JH7100_CLK_DIV_MASK;
> +
> +       return div ? parent_rate / div : 0;
> +}
> +
> +static unsigned long jh7100_clk_bestdiv(struct jh7100_clk *clk,
> +                                       unsigned long rate, unsigned long parent)
> +{
> +       unsigned long max = clk->max_div;
> +       unsigned long div = DIV_ROUND_UP(parent, rate);
> +
> +       return min(div, max);
> +}
> +
> +static int jh7100_clk_determine_rate(struct clk_hw *hw,
> +                                    struct clk_rate_request *req)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       unsigned long parent = req->best_parent_rate;
> +       unsigned long rate = clamp(req->rate, req->min_rate, req->max_rate);
> +       unsigned long div = jh7100_clk_bestdiv(clk, rate, parent);
> +       unsigned long result = parent / div;
> +
> +       /*
> +        * we want the result clamped by min_rate and max_rate if possible:
> +        * case 1: div hits the max divider value, which means it's less than
> +        * parent / rate, so the result is greater than rate and min_rate in
> +        * particular. we can't do anything about result > max_rate because the
> +        * divider doesn't go any further.
> +        * case 2: div = DIV_ROUND_UP(parent, rate) which means the result is
> +        * always lower or equal to rate and max_rate. however the result may
> +        * turn out lower than min_rate, but then the next higher rate is fine:
> +        *   div - 1 = ceil(parent / rate) - 1 < parent / rate
> +        * and thus
> +        *   min_rate <= rate < parent / (div - 1)
> +        */
> +       if (result < req->min_rate && div > 1)
> +               result = parent / (div - 1);
> +
> +       req->rate = result;
> +       return 0;
> +}
> +
> +static int jh7100_clk_set_rate(struct clk_hw *hw,
> +                              unsigned long rate,
> +                              unsigned long parent_rate)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       unsigned long div = jh7100_clk_bestdiv(clk, rate, parent_rate);
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, div);
> +       return 0;
> +}
> +
> +static u8 jh7100_clk_get_parent(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       u32 value = jh7100_clk_reg_get(clk);
> +
> +       return (value & JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT;
> +}
> +
> +static int jh7100_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       u32 value = (u32)index << JH7100_CLK_MUX_SHIFT;
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_MUX_MASK, value);
> +       return 0;
> +}
> +
> +static int jh7100_clk_mux_determine_rate(struct clk_hw *hw,
> +                                        struct clk_rate_request *req)
> +{
> +       return clk_mux_determine_rate_flags(hw, req, 0);
> +}
> +
> +static int jh7100_clk_get_phase(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       u32 value = jh7100_clk_reg_get(clk);
> +
> +       return (value & JH7100_CLK_INVERT) ? 180 : 0;
> +}
> +
> +static int jh7100_clk_set_phase(struct clk_hw *hw, int degrees)
> +{
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       u32 value;
> +
> +       if (degrees == 0)
> +               value = 0;
> +       else if (degrees == 180)
> +               value = JH7100_CLK_INVERT;
> +       else
> +               return -EINVAL;
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_INVERT, value);
> +       return 0;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static void jh7100_clk_debug_init(struct clk_hw *hw, struct dentry *dentry)
> +{
> +       static const struct debugfs_reg32 jh7100_clk_reg = {
> +               .name = "CTRL",
> +               .offset = 0,
> +       };
> +       struct jh7100_clk *clk = jh7100_clk_from(hw);
> +       struct clk_starfive_jh7100_priv *priv = jh7100_priv_from(clk);
> +       struct debugfs_regset32 *regset;
> +
> +       regset = devm_kzalloc(priv->dev, sizeof(*regset), GFP_KERNEL);
> +       if (!regset)
> +               return;
> +
> +       regset->regs = &jh7100_clk_reg;
> +       regset->nregs = 1;
> +       regset->base = priv->base + 4 * clk->idx;
> +
> +       debugfs_create_regset32("registers", 0400, dentry, regset);
> +}
> +#else
> +#define jh7100_clk_debug_init NULL
> +#endif
> +
> +static const struct clk_ops jh7100_clk_gate_ops = {
> +       .enable = jh7100_clk_enable,
> +       .disable = jh7100_clk_disable,
> +       .is_enabled = jh7100_clk_is_enabled,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_div_ops = {
> +       .recalc_rate = jh7100_clk_recalc_rate,
> +       .determine_rate = jh7100_clk_determine_rate,
> +       .set_rate = jh7100_clk_set_rate,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_gdiv_ops = {
> +       .enable = jh7100_clk_enable,
> +       .disable = jh7100_clk_disable,
> +       .is_enabled = jh7100_clk_is_enabled,
> +       .recalc_rate = jh7100_clk_recalc_rate,
> +       .determine_rate = jh7100_clk_determine_rate,
> +       .set_rate = jh7100_clk_set_rate,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_mux_ops = {
> +       .get_parent = jh7100_clk_get_parent,
> +       .set_parent = jh7100_clk_set_parent,
> +       .determine_rate = jh7100_clk_mux_determine_rate,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_gmux_ops = {
> +       .enable = jh7100_clk_enable,
> +       .disable = jh7100_clk_disable,
> +       .is_enabled = jh7100_clk_is_enabled,
> +       .get_parent = jh7100_clk_get_parent,
> +       .set_parent = jh7100_clk_set_parent,
> +       .determine_rate = jh7100_clk_mux_determine_rate,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_inv_ops = {
> +       .get_phase = jh7100_clk_get_phase,
> +       .set_phase = jh7100_clk_set_phase,
> +       .debug_init = jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops *__init jh7100_clk_ops(u32 max)
> +{
> +       if (max & JH7100_CLK_DIV_MASK) {
> +               if (max & JH7100_CLK_ENABLE)
> +                       return &jh7100_clk_gdiv_ops;
> +               return &jh7100_clk_div_ops;
> +       }
> +
> +       if (max & JH7100_CLK_MUX_MASK) {
> +               if (max & JH7100_CLK_ENABLE)
> +                       return &jh7100_clk_gmux_ops;
> +               return &jh7100_clk_mux_ops;
> +       }
> +
> +       if (max & JH7100_CLK_ENABLE)
> +               return &jh7100_clk_gate_ops;
> +
> +       return &jh7100_clk_inv_ops;
> +}
> +
> +static struct clk_hw *clk_starfive_jh7100_get(struct of_phandle_args *clkspec, void *data)
> +{
> +       struct clk_starfive_jh7100_priv *priv = data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       if (idx < JH7100_CLK_PLL0_OUT)
> +               return &priv->reg[idx].hw;
> +
> +       if (idx < JH7100_CLK_END)
> +               return priv->pll[idx - JH7100_CLK_PLL0_OUT];
> +
> +       return ERR_PTR(-EINVAL);
> +}
> +
> +static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
> +{
> +       struct clk_starfive_jh7100_priv *priv;
> +       unsigned int idx;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&priv->rmw_lock);
> +       priv->dev = &pdev->dev;
> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       priv->pll[0] = devm_clk_hw_register_fixed_factor(priv->dev, "pll0_out",
> +                                                        "osc_sys", 0, 40, 1);
> +       if (IS_ERR(priv->pll[0]))
> +               return PTR_ERR(priv->pll[0]);
> +
> +       priv->pll[1] = devm_clk_hw_register_fixed_factor(priv->dev, "pll1_out",
> +                                                        "osc_sys", 0, 64, 1);
> +       if (IS_ERR(priv->pll[1]))
> +               return PTR_ERR(priv->pll[1]);
> +
> +       priv->pll[2] = devm_clk_hw_register_fixed_factor(priv->dev, "pll2_out",
> +                                                        "pll2_refclk", 0, 55, 1);
> +       if (IS_ERR(priv->pll[2]))
> +               return PTR_ERR(priv->pll[2]);
> +
> +       for (idx = 0; idx < JH7100_CLK_PLL0_OUT; idx++) {
> +               u32 max = jh7100_clk_data[idx].max;
> +               struct clk_parent_data parents[4] = {};
> +               struct clk_init_data init = {
> +                       .name = jh7100_clk_data[idx].name,
> +                       .ops = jh7100_clk_ops(max),
> +                       .parent_data = parents,
> +                       .num_parents = ((max & JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT) + 1,
> +                       .flags = jh7100_clk_data[idx].flags,
> +               };
> +               struct jh7100_clk *clk = &priv->reg[idx];
> +               unsigned int i;
> +
> +               for (i = 0; i < init.num_parents; i++) {
> +                       unsigned int pidx = jh7100_clk_data[idx].parents[i];
> +
> +                       if (pidx < JH7100_CLK_PLL0_OUT)
> +                               parents[i].hw = &priv->reg[pidx].hw;
> +                       else if (pidx < JH7100_CLK_END)
> +                               parents[i].hw = priv->pll[pidx - JH7100_CLK_PLL0_OUT];
> +                       else if (pidx == JH7100_CLK_OSC_SYS)
> +                               parents[i].fw_name = "osc_sys";
> +                       else if (pidx == JH7100_CLK_OSC_AUD)
> +                               parents[i].fw_name = "osc_aud";
> +                       else if (pidx == JH7100_CLK_GMAC_RMII_REF)
> +                               parents[i].fw_name = "gmac_rmii_ref";
> +                       else if (pidx == JH7100_CLK_GMAC_GR_MII_RX)
> +                               parents[i].fw_name = "gmac_gr_mii_rxclk";
> +               }
> +
> +               clk->hw.init = &init;
> +               clk->idx = idx;
> +               clk->max_div = max & JH7100_CLK_DIV_MASK;
> +
> +               ret = devm_clk_hw_register(priv->dev, &clk->hw);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return devm_of_clk_add_hw_provider(priv->dev, clk_starfive_jh7100_get, priv);
> +}
> +
> +static const struct of_device_id clk_starfive_jh7100_match[] = {
> +       { .compatible = "starfive,jh7100-clkgen" },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver clk_starfive_jh7100_driver = {
> +       .driver = {
> +               .name = "clk-starfive-jh7100",
> +               .of_match_table = clk_starfive_jh7100_match,
> +               .suppress_bind_attrs = true,
> +       },
> +};
> +builtin_platform_driver_probe(clk_starfive_jh7100_driver, clk_starfive_jh7100_probe);
> --
> 2.33.1
>


-- 
With Best Regards,
Andy Shevchenko
