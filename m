Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7332CF9FB
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 07:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgLEGUl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 01:20:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:35178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726735AbgLEGUl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 5 Dec 2020 01:20:41 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607149198;
        bh=LvfcAgAsNgDSaeGsDhD+21mLH4R5BQtDLlbgu2VICTs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Ti5Us9SGMHwcXcaP2JsAlw9gYAMo+xsqbtILqgSOFLPCVkxnU0cyvLa3h+cOxfDnl
         orXBQCG5puHoCCoP0O/KL2OFnNnb+XNL4VFJMuuJsTfX7k8XCZOtfMEt2+pRqW0gBg
         uaV4BnC+vHPqnuJGAffuXfvyjXFtze/FpgJKx9LUnQdr0HhgmdXR3cDmPmHYvgZRAb
         UVY9fufJwBFj4NsMUDSdtVU8YyZ0EgzqtTB7gUvjsyDBUmaY28MQeILpQwY1HY9OU+
         zxE+cMHTWNhUDCECZMiXBeR3L/wF7wPf9NNiI8EcWK8c+Lsz4yR2/5WPrDvRbqf79H
         M6IvK4GdXidpQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201202032500.206346-12-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com> <20201202032500.206346-12-damien.lemoal@wdc.com>
Subject: Re: [PATCH v4 11/21] riscv: Add Canaan Kendryte K210 clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sean Anderson <seanga2@gmail.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date:   Fri, 04 Dec 2020 22:19:56 -0800
Message-ID: <160714919628.1580929.1456162330322523777@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Damien Le Moal (2020-12-01 19:24:50)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2daa6ee673f7..3da9a7a02f61 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3822,6 +3822,22 @@ W:       https://github.com/Cascoda/ca8210-linux.g=
it
>  F:     Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
>  F:     drivers/net/ieee802154/ca8210.c
> =20
> +CANAAN/KENDRYTE K210 SOC CLOCK DRIVER
> +M:     Damien Le Moal <damien.lemoal@wdc.com>
> +L:     linux-riscv@lists.infradead.org
> +L:     linux-clk@vger.kernel.org (clock driver)

Is this needed? I think we cover all of drivers/clk/ and bindings/clock
already.

> +S:     Maintained
> +F:     Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
> +F:     drivers/clk/clk-k210.c
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 88ac0d1a5da4..f2f9633087d1 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -29,6 +29,8 @@ config SOC_CANAAN
>         select SERIAL_SIFIVE if TTY
>         select SERIAL_SIFIVE_CONSOLE if TTY
>         select SIFIVE_PLIC
> +       select SOC_K210_SYSCTL
> +       select CLK_K210

Any reason to do this vs. just make it the default?

>         help
>           This enables support for Canaan Kendryte K210 SoC platform hard=
ware.
> =20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index c715d4681a0b..6f10f1ecc8d6 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -359,6 +359,15 @@ config COMMON_CLK_FIXED_MMIO
>         help
>           Support for Memory Mapped IO Fixed clocks
> =20
> +config CLK_K210

Every one else is using COMMON_CLK_ prefix so probably should follow
suit and then sort alphabetically.

> +       bool "Clock driver for the Canaan Kendryte K210 SoC"
> +       depends on RISCV && SOC_CANAAN
> +       depends on COMMON_CLK && OF

i.e. default SOC_CANAAN here

> +       help
> +         Support for the Kendryte K210 RISC-V SoC clocks. This option
> +         is automatically selected when the SOC_KENDRYTE option is selec=
ted
> +         in the "SOC selection" menu.
> +
>  source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/baikal-t1/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index da8fcf147eb1..ccac89e0fdfe 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_ARCH_VT8500)             +=3D clk-vt8500.o
>  obj-$(CONFIG_COMMON_CLK_VC5)           +=3D clk-versaclock5.o
>  obj-$(CONFIG_COMMON_CLK_WM831X)                +=3D clk-wm831x.o
>  obj-$(CONFIG_COMMON_CLK_XGENE)         +=3D clk-xgene.o
> +obj-$(CONFIG_CLK_K210)                 +=3D clk-k210.o

Same sort order please.

> =20
>  # please keep this section sorted lexicographically by directory path na=
me
>  obj-y                                  +=3D actions/
> diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> new file mode 100644
> index 000000000000..95d830a38911
> --- /dev/null
> +++ b/drivers/clk/clk-k210.c
> @@ -0,0 +1,959 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + */
> +#define pr_fmt(fmt)     "k210-clk: " fmt
> +
> +#include <linux/io.h>
> +#include <linux/spinlock.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/clk.h>

Preferably this include is dropped.

> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>

Is this used? Hopefully no.

> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <asm/soc.h>
> +#include <soc/canaan/k210-sysctl.h>
> +
> +#include <dt-bindings/clock/k210-clk.h>
> +
> +/*
> + * in0: fixed-rate 26MHz oscillator base clock.
> + */
> +#define K210_IN0_RATE          26000000UL
> +
> +/*
> + * Clocks parameters.
> + */
> +struct k210_clk_cfg {
> +       u8 gate_reg;
> +       u8 gate_bit;
> +       u8 div_reg;
> +       u8 div_shift;
> +       u8 div_width;
> +       u8 div_type;
> +       u8 mux_reg;
> +       u8 mux_bit;
> +};
> +
> +enum k210_clk_div_type {
> +       DIV_NONE,
> +       DIV_ONE_BASED,
> +       DIV_DOUBLE_ONE_BASED,
> +       DIV_POWER_OF_TWO,
> +};
> +
> +#define GATE(_reg, _bit)       \
> +       .gate_reg =3D (_reg),     \
> +       .gate_bit =3D (_bit)
> +#define DIV(_reg, _shift, _width, _type)       \
> +       .div_reg =3D (_reg),                      \
> +       .div_shift =3D (_shift),                  \
> +       .div_width =3D (_width),                  \
> +       .div_type =3D (_type)
> +#define MUX(_reg, _bit)                \
> +       .mux_reg =3D (_reg),      \
> +       .mux_bit =3D (_bit)
> +
> +static struct k210_clk_cfg k210_clks[K210_NUM_CLKS] =3D {
> +
> +       /* Gated clocks, no mux, no divider */
> +       [K210_CLK_CPU] =3D { GATE(K210_SYSCTL_EN_CENT, 0) },
> +       [K210_CLK_DMA] =3D { GATE(K210_SYSCTL_EN_PERI, 1) },
> +       [K210_CLK_FFT] =3D { GATE(K210_SYSCTL_EN_PERI, 4) },
> +       [K210_CLK_GPIO] =3D { GATE(K210_SYSCTL_EN_PERI, 5) },
> +       [K210_CLK_UART1] =3D { GATE(K210_SYSCTL_EN_PERI, 16) },
> +       [K210_CLK_UART2] =3D { GATE(K210_SYSCTL_EN_PERI, 17) },
> +       [K210_CLK_UART3] =3D { GATE(K210_SYSCTL_EN_PERI, 18) },
> +       [K210_CLK_FPIOA] =3D { GATE(K210_SYSCTL_EN_PERI, 20) },
> +       [K210_CLK_SHA] =3D { GATE(K210_SYSCTL_EN_PERI, 26) },
> +       [K210_CLK_AES] =3D { GATE(K210_SYSCTL_EN_PERI, 19) },
> +       [K210_CLK_OTP] =3D { GATE(K210_SYSCTL_EN_PERI, 27) },
> +       [K210_CLK_RTC] =3D { GATE(K210_SYSCTL_EN_PERI, 29) },
> +
> +       /* Gated divider clocks */
> +       [K210_CLK_SRAM0] =3D {
> +               GATE(K210_SYSCTL_EN_CENT, 1),
> +               DIV(K210_SYSCTL_THR0, 0, 4, DIV_ONE_BASED)
> +       },
> +       [K210_CLK_SRAM1] =3D {
> +               GATE(K210_SYSCTL_EN_CENT, 2),
> +               DIV(K210_SYSCTL_THR0, 4, 4, DIV_ONE_BASED)
> +       },
> +       [K210_CLK_ROM] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 0),
> +               DIV(K210_SYSCTL_THR0, 16, 4, DIV_ONE_BASED)
> +       },
> +       [K210_CLK_DVP] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 3),
> +               DIV(K210_SYSCTL_THR0, 12, 4, DIV_ONE_BASED)
> +       },
> +       [K210_CLK_APB0] =3D {
> +               GATE(K210_SYSCTL_EN_CENT, 3),
> +               DIV(K210_SYSCTL_SEL0, 3, 3, DIV_ONE_BASED)
> +       },
> +       [K210_CLK_APB1] =3D {
> +               GATE(K210_SYSCTL_EN_CENT, 4),
> +               DIV(K210_SYSCTL_SEL0, 6, 3, DIV_ONE_BASED)
> +       },
> +       [K210_CLK_APB2] =3D {
> +               GATE(K210_SYSCTL_EN_CENT, 5),
> +               DIV(K210_SYSCTL_SEL0, 9, 3, DIV_ONE_BASED)
> +       },
> +       [K210_CLK_AI] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 2),
> +               DIV(K210_SYSCTL_THR0, 8, 4, DIV_ONE_BASED)
> +       },
> +       [K210_CLK_SPI0] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 6),
> +               DIV(K210_SYSCTL_THR1, 0, 8, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_SPI1] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 7),
> +               DIV(K210_SYSCTL_THR1, 8, 8, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_SPI2] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 8),
> +               DIV(K210_SYSCTL_THR1, 16, 8, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2C0] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 13),
> +               DIV(K210_SYSCTL_THR5, 8, 8, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2C1] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 14),
> +               DIV(K210_SYSCTL_THR5, 16, 8, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2C2] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 15),
> +               DIV(K210_SYSCTL_THR5, 24, 8, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_WDT0] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 24),
> +               DIV(K210_SYSCTL_THR6, 0, 8, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_WDT1] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 25),
> +               DIV(K210_SYSCTL_THR6, 8, 8, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2S0] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 10),
> +               DIV(K210_SYSCTL_THR3, 0, 16, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2S1] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 11),
> +               DIV(K210_SYSCTL_THR3, 16, 16, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2S2] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 12),
> +               DIV(K210_SYSCTL_THR4, 0, 16, DIV_DOUBLE_ONE_BASED)
> +       },
> +
> +       /* Divider clocks, no gate, no mux */
> +       [K210_CLK_I2S0_M] =3D {
> +               DIV(K210_SYSCTL_THR4, 16, 8, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2S1_M] =3D {
> +               DIV(K210_SYSCTL_THR4, 24, 8, DIV_DOUBLE_ONE_BASED)
> +       },
> +       [K210_CLK_I2S2_M] =3D {
> +               DIV(K210_SYSCTL_THR4, 0, 8, DIV_DOUBLE_ONE_BASED)
> +       },
> +
> +       /* Muxed gated divider clocks */
> +       [K210_CLK_SPI3] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 9),
> +               DIV(K210_SYSCTL_THR1, 24, 8, DIV_DOUBLE_ONE_BASED),
> +               MUX(K210_SYSCTL_SEL0, 12)
> +       },
> +       [K210_CLK_TIMER0] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 21),
> +               DIV(K210_SYSCTL_THR2,  0, 8, DIV_DOUBLE_ONE_BASED),
> +               MUX(K210_SYSCTL_SEL0, 13)
> +       },
> +       [K210_CLK_TIMER1] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 22),
> +               DIV(K210_SYSCTL_THR2, 8, 8, DIV_DOUBLE_ONE_BASED),
> +               MUX(K210_SYSCTL_SEL0, 14)
> +       },
> +       [K210_CLK_TIMER2] =3D {
> +               GATE(K210_SYSCTL_EN_PERI, 23),
> +               DIV(K210_SYSCTL_THR2, 16, 8, DIV_DOUBLE_ONE_BASED),
> +               MUX(K210_SYSCTL_SEL0, 15)
> +       },
> +};
> +
> +/*
> + * PLL control register bits.
> + */
> +#define K210_PLL_CLKR          GENMASK(3, 0)
> +#define K210_PLL_CLKF          GENMASK(9, 4)
> +#define K210_PLL_CLKOD         GENMASK(13, 10)
> +#define K210_PLL_BWADJ         GENMASK(19, 14)
> +#define K210_PLL_RESET         (1 << 20)
> +#define K210_PLL_PWRD          (1 << 21)
> +#define K210_PLL_INTFB         (1 << 22)
> +#define K210_PLL_BYPASS                (1 << 23)
> +#define K210_PLL_TEST          (1 << 24)
> +#define K210_PLL_EN            (1 << 25)
> +#define K210_PLL_SEL           GENMASK(27, 26) /* PLL2 only */
> +
> +/*
> + * PLL lock register bits.
> + */
> +#define K210_PLL_LOCK          0
> +#define K210_PLL_CLEAR_SLIP    2
> +#define K210_PLL_TEST_OUT      3
> +
> +/*
> + * Clock selector register bits.
> + */
> +#define K210_ACLK_SEL          BIT(0)
> +#define K210_ACLK_DIV          GENMASK(2, 1)
> +
> +/*
> + * PLLs.
> + */
> +enum k210_pll_id {
> +       K210_PLL0, K210_PLL1, K210_PLL2, K210_PLL_NUM
> +};
> +
> +struct k210_pll {
> +enum k210_pll_id id;

Not sure what happened here but it's not tabbed.

> +       /* PLL setup register */
> +       void __iomem *reg;
> +
> +       /* Common lock register */
> +       void __iomem *lock;
> +
> +       /* Offset and width of lock bits */
> +       u8 lock_shift;
> +       u8 lock_width;
> +
> +       struct clk_hw hw;
> +};
> +#define to_k210_pll(hw)        container_of(hw, struct k210_pll, hw)
> +
> +struct k210_pll_cfg {
> +       /* PLL setup register offset */
> +       u32 reg;
> +
> +       /* Offset and width fo the lock bits */
> +       u8 lock_shift;
> +       u8 lock_width;
> +
> +       /* PLL setup initial factors */
> +       u32 r, f, od, bwadj;

Please have one line per struct member. I guess our kernel style is to
do that so we can quickly see how many members there are.

> +};
> +
> +/*
> + * PLL factors:
> + * By default, PLL0 runs at 780 MHz and PLL1 at 299 MHz.
> + * The first 2 sram banks depend on ACLK/CPU clock which is by default
> + * PLL0 rate divided by 2. Set PLL1 to 390 MHz so that the third sram
> + * bank has the same clock.
> + */
> +static struct k210_pll_cfg k210_plls_cfg[] =3D {
> +       { K210_SYSCTL_PLL0,  0, 2, 0, 59, 1, 59 }, /* 780 MHz */
> +       { K210_SYSCTL_PLL1,  8, 1, 0, 59, 3, 59 }, /* 390 MHz */
> +       { K210_SYSCTL_PLL2, 16, 1, 0, 22, 1, 22 }, /* 299 MHz */
> +};
> +
> +/*
> + * Clocks data.

This comment could be kernel-doc and be more helpful.

> + */
> +struct k210_clk {
> +       void __iomem                    *regs;
> +       spinlock_t                      clk_lock;
> +       struct k210_pll                 plls[K210_PLL_NUM];
> +       struct clk_hw                   aclk;
> +       struct clk_hw                   clks[K210_NUM_CLKS];
> +       struct clk_hw_onecell_data      *clk_data;
> +};
> +
> +static struct k210_clk *kcl;
> +
> +/*
> + * Set ACLK parent selector: 0 for IN0, 1 for PLL0.
> + */
> +static void k210_aclk_set_selector(u8 sel)
> +{
> +       u32 reg =3D readl(kcl->regs + K210_SYSCTL_SEL0);
> +
> +       if (sel)
> +               reg |=3D K210_ACLK_SEL;
> +       else
> +               reg &=3D K210_ACLK_SEL;
> +       writel(reg, kcl->regs + K210_SYSCTL_SEL0);
> +}
> +
> +static void k210_init_pll(struct k210_pll *pll, enum k210_pll_id id,
> +                         void __iomem *base)
> +{
> +       pll->id =3D id;
> +       pll->lock =3D base + K210_SYSCTL_PLL_LOCK;
> +       pll->reg =3D base + k210_plls_cfg[id].reg;
> +       pll->lock_shift =3D k210_plls_cfg[id].lock_shift;
> +       pll->lock_width =3D k210_plls_cfg[id].lock_width;
> +}
> +
> +static void k210_pll_wait_for_lock(struct k210_pll *pll)
> +{
> +       u32 reg, mask =3D GENMASK(pll->lock_width - 1, 0) << pll->lock_sh=
ift;

GENMASK should take the pll->lock_shift instead of shifting it after the
fact. That way we don't have to think about overflow.

> +
> +       while (true) {
> +               reg =3D readl(pll->lock);
> +               if ((reg & mask) =3D=3D mask)
> +                       break;
> +
> +               reg |=3D BIT(pll->lock_shift + K210_PLL_CLEAR_SLIP);
> +               writel(reg, pll->lock);

Is this readl_poll_timeout?

> +       }
> +}
> +
> +static bool k210_pll_hw_is_enabled(struct k210_pll *pll)
> +{
> +       u32 reg =3D readl(pll->reg);
> +       u32 mask =3D K210_PLL_PWRD | K210_PLL_EN;
> +
> +       if (reg & K210_PLL_RESET)
> +               return false;
> +
> +       return (reg & mask) =3D=3D mask;
> +}
> +
> +static void k210_pll_enable_hw(struct k210_pll *pll)
> +{
> +       struct k210_pll_cfg *pll_cfg =3D &k210_plls_cfg[pll->id];
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +
> +       if (k210_pll_hw_is_enabled(pll))
> +               goto unlock;
> +
> +       if (pll->id =3D=3D K210_PLL0) {
> +               /* Re-parent aclk to IN0 to keep the CPUs running */
> +               k210_aclk_set_selector(0);
> +       }
> +
> +       /* Set factors */
> +       reg =3D readl(pll->reg);
> +       reg &=3D ~GENMASK(19, 0);
> +       reg |=3D FIELD_PREP(K210_PLL_CLKR, pll_cfg->r);
> +       reg |=3D FIELD_PREP(K210_PLL_CLKF, pll_cfg->f);
> +       reg |=3D FIELD_PREP(K210_PLL_CLKOD, pll_cfg->od);
> +       reg |=3D FIELD_PREP(K210_PLL_BWADJ, pll_cfg->bwadj);
> +       reg |=3D K210_PLL_PWRD;
> +       writel(reg, pll->reg);
> +
> +       /* Ensure reset is low before asserting it */
> +       reg &=3D ~K210_PLL_RESET;
> +       writel(reg, pll->reg);
> +       reg |=3D K210_PLL_RESET;
> +       writel(reg, pll->reg);
> +       nop();
> +       nop();

Are these nops needed for some reason? Any comment to add here? It's
basically non-portable code and hopefully nothing is inserted into that
writel function that shouldn't be there.

> +       reg &=3D ~K210_PLL_RESET;
> +       writel(reg, pll->reg);
> +
> +       k210_pll_wait_for_lock(pll);
> +
> +       reg &=3D ~K210_PLL_BYPASS;
> +       reg |=3D K210_PLL_EN;
> +       writel(reg, pll->reg);
> +
> +       if (pll->id =3D=3D K210_PLL0) {
> +               /* Re-parent aclk back to PLL0 */
> +               k210_aclk_set_selector(1);
> +       }
> +unlock:
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +}
> +
> +static void k210_pll_disable_hw(struct k210_pll *pll)
> +{
> +       unsigned long flags;
> +       u32 reg;
> +
> +       /*
> +        * Bypassing before powering off is important so child clocks don=
't stop
> +        * working. This is especially important for pll0, the indirect p=
arent
> +        * of the cpu clock.
> +        */
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg =3D readl(pll->reg);
> +       reg |=3D K210_PLL_BYPASS;
> +       writel(reg, pll->reg);
> +
> +       reg &=3D ~K210_PLL_PWRD;
> +       reg &=3D ~K210_PLL_EN;
> +       writel(reg, pll->reg);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +}
> +
> +static int k210_pll_enable(struct clk_hw *hw)
> +{
> +       k210_pll_enable_hw(to_k210_pll(hw));
> +
> +       return 0;
> +}
> +
> +static void k210_pll_disable(struct clk_hw *hw)
> +{
> +       k210_pll_disable_hw(to_k210_pll(hw));
> +}
> +
> +static int k210_pll_is_enabled(struct clk_hw *hw)
> +{
> +       return k210_pll_hw_is_enabled(to_k210_pll(hw));
> +}
> +
> +static int k210_pll_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct k210_pll *pll =3D to_k210_pll(hw);
> +       unsigned long flags;
> +       int ret =3D 0;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +
> +       switch (pll->id) {
> +       case K210_PLL0:
> +       case K210_PLL1:
> +               if (WARN_ON(index !=3D 0))
> +                       ret =3D -EINVAL;
> +               break;
> +       case K210_PLL2:

Instead of a pll->id can we have two different clk ops?

> +               if (WARN_ON(index > 2)) {
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
> +               reg =3D readl(pll->reg);
> +               reg &=3D ~K210_PLL_SEL;
> +               reg |=3D FIELD_PREP(K210_PLL_SEL, index);
> +               writel(reg, pll->reg);
> +               break;
> +       default:
> +               ret =3D -EINVAL;
> +               break;
> +       }
> +
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return ret;
> +}
> +
> +static u8 k210_pll_get_parent(struct clk_hw *hw)
> +{
> +       struct k210_pll *pll =3D to_k210_pll(hw);
> +       u32 reg;
> +
> +       switch (pll->id) {
> +       case K210_PLL0:
> +       case K210_PLL1:
> +               return 0;
> +       case K210_PLL2:
> +               reg =3D readl(pll->reg);
> +               return FIELD_GET(K210_PLL_SEL, reg);
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static unsigned long k210_pll_get_rate(struct clk_hw *hw,
> +                                      unsigned long parent_rate)
> +{
> +       struct k210_pll *pll =3D to_k210_pll(hw);
> +       u32 reg =3D readl(pll->reg);
> +       u32 r, f, od;
> +
> +       if (reg & K210_PLL_BYPASS)
> +               return parent_rate;
> +
> +       if (!(reg & K210_PLL_PWRD))
> +               return 0;
> +
> +       r =3D FIELD_GET(K210_PLL_CLKR, reg) + 1;
> +       f =3D FIELD_GET(K210_PLL_CLKF, reg) + 1;
> +       od =3D FIELD_GET(K210_PLL_CLKOD, reg) + 1;
> +
> +       return (u64)parent_rate * f / (r * od);
> +}
> +
> +static const struct clk_ops k210_pll_ops =3D {
> +       .enable         =3D k210_pll_enable,
> +       .disable        =3D k210_pll_disable,
> +       .is_enabled     =3D k210_pll_is_enabled,
> +       .set_parent     =3D k210_pll_set_parent,
> +       .get_parent     =3D k210_pll_get_parent,
> +       .recalc_rate    =3D k210_pll_get_rate,
> +};
> +
> +static const char *pll_parents[] =3D { NULL, "pll0", "pll1" };

This should get a k210 prefix as to not pollute the global namespace of
kernel symbols (of which there are so many!).

> +
> +static struct clk_hw *k210_register_pll(enum k210_pll_id id, const char =
*name,
> +                               const char **parent_names, int num_parent=
s,
> +                               unsigned long flags)
> +{
> +       struct k210_pll *pll =3D &kcl->plls[id];
> +       struct clk_init_data init =3D {};
> +       int ret;
> +
> +       init.name =3D name;
> +       init.parent_names =3D parent_names;
> +       init.num_parents =3D num_parents;
> +       init.flags =3D flags;
> +       init.ops =3D &k210_pll_ops;
> +       pll->hw.init =3D &init;
> +
> +       ret =3D clk_hw_register(NULL, &pll->hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &pll->hw;
> +}
> +
> +static int k210_aclk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       if (WARN_ON(index > 1))

Is this possible? What am I going to do as a user if this happens?

> +               return -EINVAL;
> +
> +       k210_aclk_set_selector(index);
> +
> +       return 0;
> +}
> +
> +static u8 k210_aclk_get_parent(struct clk_hw *hw)
> +{
> +       u32 sel =3D readl(kcl->regs + K210_SYSCTL_SEL0);
> +
> +       return (sel & K210_ACLK_SEL) ? 1 : 0;

Preferably write as

	u32 sel;

	sel =3D readl(kclk->regs + K210_SYSCTL_SEL0);
	sel &=3D K210_ACLK_SEL;

	return sel ? 1 : 0;=20

> +}
> +
> +static unsigned long k210_aclk_get_rate(struct clk_hw *hw,
> +                                       unsigned long parent_rate)
> +{
> +       u32 reg =3D readl(kcl->regs + K210_SYSCTL_SEL0);
> +       unsigned int shift;
> +
> +       if (!(reg & 0x1))
> +               return parent_rate;
> +
> +       shift =3D FIELD_GET(K210_ACLK_DIV, reg);
> +
> +       return parent_rate / (2UL << shift);
> +}
> +
> +static const struct clk_ops k210_aclk_ops =3D {
> +       .set_parent     =3D k210_aclk_set_parent,
> +       .get_parent     =3D k210_aclk_get_parent,
> +       .recalc_rate    =3D k210_aclk_get_rate,
> +};
> +
> +static const char *aclk_parents[] =3D { NULL, "pll0" };
> +
> +static struct clk_hw *k210_register_aclk(void)
> +{
> +       struct clk_init_data init =3D {};
> +       int ret;
> +
> +       init.name =3D "aclk";
> +       init.parent_names =3D aclk_parents;
> +       init.num_parents =3D 2;
> +       init.flags =3D 0;

Remove? It's the default now that init =3D {}.

> +       init.ops =3D &k210_aclk_ops;
> +       kcl->aclk.init =3D &init;
> +
> +       ret =3D clk_hw_register(NULL, &kcl->aclk);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &kcl->aclk;
> +}
> +
> +#define to_k210_clk_id(hw)     ((unsigned int)((hw) - &kcl->clks[0]))
> +#define to_k210_clk_cfg(hw)    (&k210_clks[to_k210_clk_id(hw)])
> +
> +static u32 k210_clk_get_div_val(struct k210_clk_cfg *kclk)
> +{
> +       u32 reg =3D readl(kcl->regs + kclk->div_reg);
> +
> +       return (reg >> kclk->div_shift) & GENMASK(kclk->div_width - 1, 0);

Use FIELD_GET()?

> +}
> +
> +static unsigned long k210_clk_divider(struct k210_clk_cfg *kclk,
> +                                     u32 div_val)
> +{
> +       switch (kclk->div_type) {
> +       case DIV_ONE_BASED:
> +               return div_val + 1;
> +       case DIV_DOUBLE_ONE_BASED:
> +               return (div_val + 1) * 2;
> +       case DIV_POWER_OF_TWO:
> +               return 2UL << div_val;
> +       case DIV_NONE:
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static int k210_clk_enable(struct clk_hw *hw)
> +{
> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!kclk->gate_reg)
> +               return 0;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg =3D readl(kcl->regs + kclk->gate_reg);
> +       reg |=3D BIT(kclk->gate_bit);
> +       writel(reg, kcl->regs + kclk->gate_reg);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static void k210_clk_disable(struct clk_hw *hw)
> +{
> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!kclk->gate_reg)
> +               return;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg =3D readl(kcl->regs + kclk->gate_reg);
> +       reg &=3D ~BIT(kclk->gate_bit);
> +       writel(reg, kcl->regs + kclk->gate_reg);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +}
> +
> +static int k210_clk_is_enabled(struct clk_hw *hw)
> +{
> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);
> +
> +       if (!kclk->gate_reg)
> +               return 1;
> +
> +       return readl(kcl->regs + kclk->gate_reg) & BIT(kclk->gate_bit);
> +}
> +
> +static int k210_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg;
> +
> +       if (!kclk->mux_reg) {
> +               if (WARN_ON(index !=3D 0))
> +                       return -EINVAL;
> +               return 0;
> +       }
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg =3D readl(kcl->regs + kclk->mux_reg);
> +       if (index)
> +               reg |=3D BIT(kclk->mux_bit);
> +       else
> +               reg &=3D ~BIT(kclk->mux_bit);
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return 0;
> +}
> +
> +static u8 k210_clk_get_parent(struct clk_hw *hw)
> +{
> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);
> +       unsigned long flags;
> +       u32 reg, idx;
> +
> +       if (!kclk->mux_reg)
> +               return 0;
> +
> +       spin_lock_irqsave(&kcl->clk_lock, flags);
> +       reg =3D readl(kcl->regs + kclk->mux_reg);
> +       idx =3D (reg & BIT(kclk->mux_bit)) ? 1 : 0;
> +       spin_unlock_irqrestore(&kcl->clk_lock, flags);
> +
> +       return idx;
> +}
> +
> +static unsigned long k210_clk_get_rate(struct clk_hw *hw,
> +                                      unsigned long parent_rate)
> +{
> +       struct k210_clk_cfg *kclk =3D to_k210_clk_cfg(hw);
> +       unsigned long divider;
> +
> +       if (!kclk->div_reg)
> +               return parent_rate;
> +
> +       divider =3D k210_clk_divider(kclk, k210_clk_get_div_val(kclk));
> +       if (WARN_ON(!divider))
> +               return 0;
> +
> +       return parent_rate / divider;
> +}
> +
> +static const struct clk_ops k210_clk_ops =3D {
> +       .enable         =3D k210_clk_enable,
> +       .is_enabled     =3D k210_clk_is_enabled,
> +       .disable        =3D k210_clk_disable,
> +       .set_parent     =3D k210_clk_set_parent,
> +       .get_parent     =3D k210_clk_get_parent,
> +       .recalc_rate    =3D k210_clk_get_rate,
> +};
> +
> +static const char *mux_parents[] =3D { NULL, "pll0" };
> +
> +static struct clk_hw *k210_register_clk(int id, const char *name,
> +                                       const char *parent, unsigned long=
 flags)
> +{
> +       struct clk_init_data init =3D {};
> +       int ret;
> +
> +       init.name =3D name;
> +       if (parent) {
> +               init.parent_names =3D &parent;
> +               init.num_parents =3D 1;
> +       } else {
> +               init.parent_names =3D mux_parents;
> +               init.num_parents =3D 2;
> +       }
> +       init.flags =3D flags;
> +       init.ops =3D &k210_clk_ops;
> +       kcl->clks[id].init =3D &init;
> +
> +       ret =3D clk_hw_register(NULL, &kcl->clks[id]);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &kcl->clks[id];
> +}
> +
> +static void __init k210_clk_init(struct device_node *np)
> +{
> +       struct device_node *sysctl_np;
> +       struct clk *in0_clk;
> +       const char *in0;
> +       struct clk_hw **hws;
> +       int i, ret;
> +
> +       kcl =3D kzalloc(sizeof(*kcl), GFP_KERNEL);
> +       if (!kcl)
> +               return;
> +
> +       sysctl_np =3D of_find_compatible_node(NULL, NULL, "canaan,k210-sy=
sctl");
> +       if (!sysctl_np || sysctl_np !=3D np->parent)
> +               goto err;
> +
> +       kcl->regs =3D of_iomap(sysctl_np, 0);
> +       if (!kcl->regs)
> +               goto err;
> +
> +       kcl->clk_data =3D kzalloc(struct_size(kcl->clk_data, hws, K210_NU=
M_CLKS),
> +                               GFP_KERNEL);
> +       if (!kcl->clk_data)
> +               goto err;
> +
> +       for (i =3D 0; i < K210_PLL_NUM; i++)
> +               k210_init_pll(&kcl->plls[i], i, kcl->regs);
> +       spin_lock_init(&kcl->clk_lock);
> +       kcl->clk_data->num =3D K210_NUM_CLKS;
> +       hws =3D kcl->clk_data->hws;
> +       for (i =3D 1; i < K210_NUM_CLKS; i++)
> +               hws[i] =3D ERR_PTR(-EPROBE_DEFER);
> +
> +       /*
> +        * in0 is the system base fixed-rate 26MHz oscillator which
> +        * should already be defined by the device tree. If it is not,
> +        * create it here.

Are there old DTBs that don't have this? Sadface.

> +        */
> +       in0_clk =3D of_clk_get(np, 0);
> +       if (IS_ERR(in0_clk)) {
> +               pr_warn("%pOFP: in0 oscillator not found\n", np);
> +               hws[K210_CLK_IN0] =3D
> +                       clk_hw_register_fixed_rate(NULL, "in0", NULL,
> +                                                  0, K210_IN0_RATE);
> +       } else {
> +               hws[K210_CLK_IN0] =3D __clk_get_hw(in0_clk);
> +       }
> +       if (IS_ERR(hws[K210_CLK_IN0])) {
> +               pr_err("%pOFP: failed to get base oscillator\n", np);
> +               goto err;
> +       }
> +
> +       in0 =3D clk_hw_get_name(hws[K210_CLK_IN0]);
> +       aclk_parents[0] =3D in0;
> +       pll_parents[0] =3D in0;
> +       mux_parents[0] =3D in0;

Can we use the new way of specifying clk parents so that we don't have
to use __clk_get_hw(), of_clk_get(), and clk_hw_get_name()? Hopefully
the core can handl that all instead of this driver.

> +
> +       /* PLLs */
> +       hws[K210_CLK_PLL0] =3D
> +               k210_register_pll(K210_PLL0, "pll0", pll_parents, 1, 0);
> +       hws[K210_CLK_PLL1] =3D
> +               k210_register_pll(K210_PLL1, "pll1", pll_parents, 1, 0);
> +       hws[K210_CLK_PLL2] =3D
> +               k210_register_pll(K210_PLL2, "pll2", pll_parents, 3, 0);
> +
> +       /* aclk: muxed of in0 and pll0_d, no gate */
> +       hws[K210_CLK_ACLK] =3D k210_register_aclk();
> +
> +       /*
> +        * Clocks with aclk as source: the CPU clock is obviously critica=
l.
> +        * So is the CLINT clock as the scheduler clocksource.
> +        */
> +       hws[K210_CLK_CPU] =3D
> +               k210_register_clk(K210_CLK_CPU, "cpu", "aclk", CLK_IS_CRI=
TICAL);
> +       hws[K210_CLK_CLINT] =3D
> +               clk_hw_register_fixed_factor(NULL, "clint", "aclk",
> +                                            CLK_IS_CRITICAL, 1, 50);

Is anyone getting these clks? It's nice and all to model things in the
clk framework but if they never have a consumer then it is sort of
useless and just wastes memory and causes more overhead.

> +       hws[K210_CLK_DMA] =3D
> +               k210_register_clk(K210_CLK_DMA, "dma", "aclk", 0);
> +       hws[K210_CLK_FFT] =3D
> +               k210_register_clk(K210_CLK_FFT, "fft", "aclk", 0);
> +       hws[K210_CLK_ROM] =3D
> +               k210_register_clk(K210_CLK_ROM, "rom", "aclk", 0);
> +       hws[K210_CLK_DVP] =3D
> +               k210_register_clk(K210_CLK_DVP, "dvp", "aclk", 0);
> +       hws[K210_CLK_APB0] =3D
> +               k210_register_clk(K210_CLK_APB0, "apb0", "aclk", 0);
> +       hws[K210_CLK_APB1] =3D
> +               k210_register_clk(K210_CLK_APB1, "apb1", "aclk", 0);
> +       hws[K210_CLK_APB2] =3D
> +               k210_register_clk(K210_CLK_APB2, "apb2", "aclk", 0);
> +
> +       /*
> +        * There is no sram driver taking a ref on the sram banks clocks.
> +        * So make them critical so they are not disabled due to being un=
used
> +        * as seen by the clock infrastructure.
> +        */
> +       hws[K210_CLK_SRAM0] =3D
> +               k210_register_clk(K210_CLK_SRAM0,
> +                                 "sram0", "aclk", CLK_IS_CRITICAL);
> +       hws[K210_CLK_SRAM1] =3D
> +               k210_register_clk(K210_CLK_SRAM1,
> +                                 "sram1", "aclk", CLK_IS_CRITICAL);
> +
> +       /* Clocks with PLL0 as source */
> +       hws[K210_CLK_SPI0] =3D
> +               k210_register_clk(K210_CLK_SPI0, "spi0", "pll0", 0);
> +       hws[K210_CLK_SPI1] =3D
> +                k210_register_clk(K210_CLK_SPI1, "spi1", "pll0", 0);
> +       hws[K210_CLK_SPI2] =3D
> +                k210_register_clk(K210_CLK_SPI2, "spi2", "pll0", 0);
> +       hws[K210_CLK_I2C0] =3D
> +                k210_register_clk(K210_CLK_I2C0, "i2c0", "pll0", 0);
> +       hws[K210_CLK_I2C1] =3D
> +                k210_register_clk(K210_CLK_I2C1, "i2c1", "pll0", 0);
> +       hws[K210_CLK_I2C2] =3D
> +                k210_register_clk(K210_CLK_I2C2, "i2c2", "pll0", 0);
> +
> +       /*
> +        * Clocks with PLL1 as source: there is only the AI clock for the
> +        * (unused) KPU device. As this clock also drives the aisram bank
> +        * which is used as general memory, make it critical.
> +        */
> +        hws[K210_CLK_AI] =3D
> +                k210_register_clk(K210_CLK_AI, "ai", "pll1", CLK_IS_CRIT=
ICAL);
> +
> +       /* Clocks with PLL2 as source */
> +       hws[K210_CLK_I2S0] =3D
> +                k210_register_clk(K210_CLK_I2S0, "i2s0", "pll2", 0);
> +       hws[K210_CLK_I2S1] =3D
> +                k210_register_clk(K210_CLK_I2S1, "i2s1", "pll2", 0);
> +       hws[K210_CLK_I2S2] =3D
> +               k210_register_clk(K210_CLK_I2S2, "i2s2", "pll2", 0);
> +       hws[K210_CLK_I2S0_M] =3D
> +               k210_register_clk(K210_CLK_I2S0_M, "i2s0_m", "pll2", 0);
> +       hws[K210_CLK_I2S1_M] =3D
> +               k210_register_clk(K210_CLK_I2S1_M, "i2s1_m", "pll2", 0);
> +       hws[K210_CLK_I2S2_M] =3D
> +               k210_register_clk(K210_CLK_I2S2_M, "i2s2_m", "pll2", 0);
> +
> +       /* Clocks with IN0 as source */
> +       hws[K210_CLK_WDT0] =3D
> +               k210_register_clk(K210_CLK_WDT0, "wdt0", in0, 0);
> +       hws[K210_CLK_WDT1] =3D
> +                k210_register_clk(K210_CLK_WDT1, "wdt1", in0, 0);
> +       hws[K210_CLK_RTC] =3D
> +                k210_register_clk(K210_CLK_RTC, "rtc", in0, 0);
> +
> +       /* Clocks with APB0 as source */
> +       hws[K210_CLK_GPIO] =3D
> +               k210_register_clk(K210_CLK_GPIO, "gpio", "apb0", 0);
> +       hws[K210_CLK_UART1] =3D
> +               k210_register_clk(K210_CLK_UART1, "uart1", "apb0", 0);
> +       hws[K210_CLK_UART2] =3D
> +               k210_register_clk(K210_CLK_UART2, "uart2", "apb0", 0);
> +       hws[K210_CLK_UART3] =3D
> +               k210_register_clk(K210_CLK_UART3, "uart3", "apb0", 0);
> +       hws[K210_CLK_FPIOA] =3D
> +               k210_register_clk(K210_CLK_FPIOA, "fpioa", "apb0", 0);
> +       hws[K210_CLK_SHA] =3D
> +               k210_register_clk(K210_CLK_SHA, "sha", "apb0", 0);
> +
> +       /* Clocks with APB1 as source */
> +       hws[K210_CLK_AES] =3D
> +                k210_register_clk(K210_CLK_AES, "aes", "apb1", 0);
> +       hws[K210_CLK_OTP] =3D
> +                k210_register_clk(K210_CLK_OTP, "otp", "apb1", 0);
> +
> +       /* Muxed clocks with in0/pll0 as source */
> +       hws[K210_CLK_SPI3] =3D
> +               k210_register_clk(K210_CLK_SPI3, "spi3", NULL, 0);
> +       hws[K210_CLK_TIMER0] =3D
> +               k210_register_clk(K210_CLK_TIMER0, "timer0", NULL, 0);
> +       hws[K210_CLK_TIMER1] =3D
> +               k210_register_clk(K210_CLK_TIMER1, "timer1", NULL, 0);
> +       hws[K210_CLK_TIMER2] =3D
> +               k210_register_clk(K210_CLK_TIMER2, "timer2", NULL, 0);
> +
> +       for (i =3D 0; i < K210_NUM_CLKS; i++) {
> +               if (IS_ERR(hws[i])) {
> +                       pr_err("%pOFP: register clock %d failed %ld\n",
> +                              np, i, PTR_ERR(hws[i]));
> +                       goto err;
> +               }
> +       }
> +
> +       ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, kcl->cl=
k_data);
> +       if (ret)
> +               pr_err("%pOFP: add clock provider failed %d\n", np, ret);
> +       else
> +               pr_info("%pOFP: CPU running at %lu MHz\n",

Is this important? Is there a CPUfreq driver that runs and tells us the
boot CPU frequency instead? Doesn't feel like we care in the clk driver
about this.

> +                       np, clk_hw_get_rate(hws[K210_CLK_CPU]) / 1000000);
> +
> +       return;
> +err:
> +       pr_err("%pOFP: clock initialization failed\n", np);
> +       iounmap(kcl->regs);
> +       kfree(kcl->clk_data);
> +       kfree(kcl);
> +       kcl =3D NULL;

Why?

> +}
> +
> +CLK_OF_DECLARE_DRIVER(k210_clk, "canaan,k210-clk", k210_clk_init);

Is this needed or can this just be a plain platform driver? If something
is needed early for a clocksource or clockevent then the driver can be
split to register those few clks early from this hook and then register
the rest later when the platform device probes. That's what
CLK_OF_DECLARE_DRIVER is for. A DECLARE_DRIVER without a platform driver
is incorrect.

> +
> +/*
> + * Enable PLL1 to be able to use the AI SRAM.
> + */
> +void __init k210_clk_early_init(void __iomem *regs)
> +{
> +       struct k210_pll pll1;
> +
> +       /* Make sure aclk selector is set to PLL0 */
> +       k210_aclk_set_selector(1);
> +
> +       /* Startup PLL1 to enable the aisram bank for general memory use =
*/
> +       k210_init_pll(&pll1, K210_PLL1, regs);
> +       k210_pll_enable_hw(&pll1);
> +}
> diff --git a/include/soc/canaan/k210-sysctl.h b/include/soc/canaan/k210-s=
ysctl.h
> new file mode 100644
> index 000000000000..50b21484f7c7
> --- /dev/null
> +++ b/include/soc/canaan/k210-sysctl.h
[...]
> +#define K210_SYSCTL_DMA_SEL0   0x64 /* DMA handshake selector 0 */
> +#define K210_SYSCTL_DMA_SEL1   0x68 /* DMA handshake selector 1 */
> +#define K210_SYSCTL_POWER_SEL  0x6C /* IO Power Mode Select controller */
> +
> +void __init k210_clk_early_init(void __iomem *regs);

We don't need __init in header files. Please remove the marking.
