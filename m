Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B423B2D69
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jun 2021 13:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbhFXLPn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Jun 2021 07:15:43 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:37842 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232118AbhFXLPn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jun 2021 07:15:43 -0400
Received: by mail-vs1-f45.google.com with SMTP id x12so3225865vsp.4;
        Thu, 24 Jun 2021 04:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nu41oDwPqoOra5POcHkDZFZos8FE8RZ+rwyu8YCLFd8=;
        b=Ayab4vcuSkQfmRDXD+mb7z39LEQdj0VL8qaPv1VacabJuP8on9SnhNmqGP9DB/sqHx
         +LtGKqgbHlUSk+43LVQcrb1z6bVxneaWYh6yPQ+CSFmCoE4j8rj0mcFmROsn5UZRjs6o
         5NtblI3MfTTZN5ZEVh0LcoCmmi7hcOHTu4+yjZmzU1MaRFIf6rUvi146miK+iG8LWk6I
         2VpmTpNDckmUUNvBhV1EbrOkFLZnHPNKc1vOyS0YQnPOwh1FhSp8bloaCHtaWxps32Hx
         aKFefE2ozK8G/wXFV5U8nMKOZOSyq2gGF5omHizJyowFHAqAQvwZos52nq9XKZ2VTLBC
         EynA==
X-Gm-Message-State: AOAM5300TRX6LTcabUM+qVPFq88Cq8/V8sQzkIEeqm+OTzdbpidnsH8f
        eefBqBymN0aZ3O592RBU4iZaUt3kJMCoRj1Aw+g=
X-Google-Smtp-Source: ABdhPJwCequCoFGzWxgks/i5AyBMpLJCkXXKAPMOjIY9MzCt06Wa8zqmXgSjgdhYD0zU3/Bd7vOyYLX6rlMsO3mDBzU=
X-Received: by 2002:a05:6102:301c:: with SMTP id s28mr1310837vsa.18.1624533203443;
 Thu, 24 Jun 2021 04:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210616132641.29087-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210616132641.29087-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210616132641.29087-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Jun 2021 13:13:12 +0200
Message-ID: <CAMuHMdU4=dRZQKbAx0=zLWCjd7sPRjLtE3KEJP_-8qjjakCBXw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: renesas: Add RZ/G2L pin and gpio controller
 core wrapper
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Prabhakar,

On Wed, Jun 16, 2021 at 3:27 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add core support for pin and gpio controller.
>
> Based on a patch in the BSP by Hien Huynh <hien.huynh.px@renesas.com>.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/Kconfig         |  11 +
>  drivers/pinctrl/renesas/Makefile        |   1 +
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 530 ++++++++++++++++++++++++
>  drivers/pinctrl/renesas/pinctrl-rzg2l.h |  94 +++++
>  4 files changed, 636 insertions(+)
>  create mode 100644 drivers/pinctrl/renesas/pinctrl-rzg2l.c
>  create mode 100644 drivers/pinctrl/renesas/pinctrl-rzg2l.h
>
> diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
> index 4b84a744ae87..2b4ac226ce35 100644
> --- a/drivers/pinctrl/renesas/Kconfig
> +++ b/drivers/pinctrl/renesas/Kconfig
> @@ -176,6 +176,17 @@ config PINCTRL_RZA2
>         help
>           This selects GPIO and pinctrl driver for Renesas RZ/A2 platforms.
>
> +config PINCTRL_RZG2L
> +       bool "pin control support for RZ/G2L family"

As this is selected by PINCTRL_PFC_R9A07G044, it should probably be
invisible, i.e. add "if COMPILE_TEST"?

> +       depends on OF
> +       depends on ARCH_R9A07G044 || COMPILE_TEST

Hence no need for this dependency.

> +       select GPIOLIB
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF
> +       help
> +         This enables common pin control functionality for platforms based on RZ/G2L family.
> +
>  config PINCTRL_PFC_R8A77470
>         bool "pin control support for RZ/G1C" if COMPILE_TEST
>         select PINCTRL_SH_PFC
> diff --git a/drivers/pinctrl/renesas/Makefile b/drivers/pinctrl/renesas/Makefile
> index 353563228dc2..7d9238a9ef57 100644
> --- a/drivers/pinctrl/renesas/Makefile
> +++ b/drivers/pinctrl/renesas/Makefile
> @@ -46,6 +46,7 @@ obj-$(CONFIG_PINCTRL_PFC_SHX3)                += pfc-shx3.o
>
>  obj-$(CONFIG_PINCTRL_RZA1)     += pinctrl-rza1.o
>  obj-$(CONFIG_PINCTRL_RZA2)     += pinctrl-rza2.o
> +obj-$(CONFIG_PINCTRL_RZG2L)    += pinctrl-rzg2l.o
>  obj-$(CONFIG_PINCTRL_RZN1)     += pinctrl-rzn1.o
>
>  ifeq ($(CONFIG_COMPILE_TEST),y)
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> new file mode 100644
> index 000000000000..b9730b53fd85
> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -0,0 +1,530 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2L Pin Control and GPIO driver core
> + *
> + * Copyright (C) 2021 Renesas Electronics Corporation.
> + */
> +
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +
> +#include "pinctrl-rzg2l.h"
> +
> +#define DRV_NAME       "pinctrl-rzg2l"
> +
> +#define P(n)                   (0x0000 + 0x10 + (n))
> +#define PM(n)                  (0x0100 + 0x20 + (n) * 2)
> +#define PMC(n)                 (0x0200 + 0x10 + (n))
> +#define PFC(n)                 (0x0400 + 0x40 + (n) * 4)
> +#define PIN(n)                 (0x0800 + 0x10 + (n))
> +#define PWPR                   (0x3014)
> +
> +#define PWPR_B0WI              BIT(7)  /* Bit Write Disable */
> +#define PWPR_PFCWE             BIT(6)  /* PFC Register Write Enable */
> +
> +#define PM_MASK                        0x03
> +#define PFC_MASK               0x07
> +
> +#define PM_INPUT               0x1
> +#define PM_OUTPUT              0x2
> +#define PM_OUTPUT_INPUT                0x3
> +
> +#define GPIOF_OUTPUT                   0
> +#define GPIOF_INPUT                    1
> +#define GPIOF_BIDIRECTION              2
> +#define GPIOF_HI_Z                     3

Please drop these, and use GPIO_LINE_DIRECTION_{IN,OUT} instead.

> +
> +#define RZG2L_PIN_ID_TO_PORT(id)       ((id) / RZG2L_MAX_PINS_PER_PORT)
> +#define RZG2L_PIN_ID_TO_PIN(id)                ((id) % RZG2L_MAX_PINS_PER_PORT)
> +
> +struct rzg2l_pinctrl {
> +       struct pinctrl_dev              *pctrl_dev;
> +       struct pinctrl_desc             pctrl_desc;
> +
> +       void __iomem                    *base;
> +       struct device                   *dev;
> +       struct clk                      *clk;
> +
> +       struct gpio_chip                gpio_chip;
> +       struct pinctrl_gpio_range       gpio_range;
> +
> +       const struct rzg2l_pin_soc      *psoc;
> +
> +       spinlock_t                      lock;
> +       unsigned int                    nports;
> +};
> +
> +static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
> +                                      int pins, unsigned long pfc_mode)

unsigned int pfc_mode?

> +{
> +       u32 port = RZG2L_PIN_ID_TO_PORT(pins);
> +       u8 bit = RZG2L_PIN_ID_TO_PIN(pins);
> +       unsigned long flags;
> +       u32 reg32, mask32;
> +       u16 reg16, mask16;
> +       u8 reg8;
> +
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +
> +       /* Set pin to 'Non-use (Hi-Z input protection)'  */
> +       reg16 = readw(pctrl->base + PM(port));
> +       mask16 = PM_MASK << (bit * 2);
> +       reg16 = reg16 & ~mask16;

reg16 &= ...

Perhaps drop the mask16:

    reg16 &= ~(PM_MASK << (bit * 2));

> +       writew(reg16, pctrl->base + PM(port));
> +
> +       /* Temporarily switch to GPIO mode with PMC register */
> +       reg8 = readb(pctrl->base + PMC(port));
> +       writeb(reg8 & ~BIT(bit), pctrl->base + PMC(port));
> +
> +       /* Set the PWPR register to allow PFC register to write */
> +       writel(0x00, pctrl->base + PWPR);        /* B0WI=0, PFCWE=0 */
> +       writel(PWPR_PFCWE, pctrl->base + PWPR);  /* B0WI=0, PFCWE=1 */
> +
> +       /* Select Pin function mode with PFC register */
> +       reg32 = readl(pctrl->base + PFC(port));
> +       mask32 = PFC_MASK << (bit * 4);
> +       reg32 = reg32 & ~mask32;

reg32 &= ...

Perhaps drop the mask32, too?

> +       pfc_mode = pfc_mode << (bit * 4);

pfc_mode <<= ...

> +       writel(reg32 | pfc_mode, pctrl->base + PFC(port));

Or just drop the line before, and do:

    writel(reg32 | (pfc_mode << (bit * 4)), pctrl->base + PFC(port));

> +
> +       /* Set the PWPR register to be write-protected */
> +       writel(0x00, pctrl->base + PWPR);        /* B0WI=0, PFCWE=0 */
> +       writel(PWPR_B0WI, pctrl->base + PWPR);  /* B0WI=1, PFCWE=0 */
> +
> +       /* Switch to Peripheral pin function with PMC register */
> +       reg8 = readb(pctrl->base + PMC(port));
> +       writeb(reg8 | BIT(bit), pctrl->base + PMC(port));
> +
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +};
> +
> +static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
> +                                unsigned int func_selector,
> +                                unsigned int group_selector)
> +{
> +       struct rzg2l_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +       struct function_desc *func;
> +       struct group_desc *group;
> +       unsigned long data;
> +       int *pins;
> +       int i;

unsigned int i

> +
> +       func = pinmux_generic_get_function(pctldev, func_selector);
> +       if (!func)
> +               return -EINVAL;
> +       group = pinctrl_generic_get_group(pctldev, group_selector);
> +       if (!group)
> +               return -EINVAL;
> +
> +       pins = group->pins;
> +       data = (unsigned long)group->data;
> +
> +       dev_dbg(pctldev->dev, "enable function %s group %s\n",
> +               func->name, group->name);
> +
> +       for (i = 0; i < group->num_pins; i++)
> +               rzg2l_pinctrl_set_pfc_mode(pctrl, *(pins + i), data);

pins[i]

> +
> +       return 0;
> +};
> +
> +static const struct pinctrl_ops rzg2l_pinctrl_pctlops = {
> +       .get_groups_count = pinctrl_generic_get_group_count,
> +       .get_group_name = pinctrl_generic_get_group_name,
> +       .get_group_pins = pinctrl_generic_get_group_pins,
> +       .dt_node_to_map = pinconf_generic_dt_node_to_map_all,
> +       .dt_free_map = pinconf_generic_dt_free_map,
> +};
> +
> +static const struct pinmux_ops rzg2l_pinctrl_pmxops = {
> +       .get_functions_count = pinmux_generic_get_function_count,
> +       .get_function_name = pinmux_generic_get_function_name,
> +       .get_function_groups = pinmux_generic_get_function_groups,
> +       .set_mux = rzg2l_pinctrl_set_mux,
> +       .strict = true,
> +};
> +
> +static int rzg2l_pinctrl_add_groups(struct rzg2l_pinctrl *pctrl)
> +{
> +       int ret, i;

unsigned int i

> +
> +       for (i = 0; i < pctrl->psoc->ngroups; i++) {
> +               const struct group_desc *group = pctrl->psoc->groups + i;
> +
> +               ret = pinctrl_generic_add_group(pctrl->pctrl_dev, group->name,
> +                                               group->pins, group->num_pins,
> +                                               group->data);
> +               if (ret < 0) {
> +                       dev_err(pctrl->dev, "Failed to register group %s\n",
> +                               group->name);

This can really only fail in case of out-of-memory, or if group->name
is NULL, so I don't think there's a need to print an error message.

> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int rzg2l_pinctrl_add_functions(struct rzg2l_pinctrl *pctrl)
> +{
> +       int ret, i;

unsigned int i


> +
> +       for (i = 0; i < pctrl->psoc->nfuncs; i++) {
> +               const struct function_desc *func = pctrl->psoc->funcs + i;
> +
> +               ret = pinmux_generic_add_function(pctrl->pctrl_dev, func->name,
> +                                                 func->group_names,
> +                                                 func->num_group_names,
> +                                                 func->data);
> +               if (ret < 0) {
> +                       dev_err(pctrl->dev, "Failed to register function %s\n",
> +                               func->name);

This can really only fail in case of out-of-memory, or if func->name
is NULL, so I don't think there's a need to print an error message.

> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}

> +static void rzg2l_gpio_set_direction(struct rzg2l_pinctrl *pctrl, u32 port,
> +                                    u8 bit, bool output)
> +{
> +       unsigned long flags;
> +       u16 reg16;
> +
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +
> +       reg16 = readw(pctrl->base + PM(port));
> +       reg16 = reg16 & ~(PM_MASK << (bit * 2));

reg16 &= ...

or just combine with the line before?

> +
> +       if (output)
> +               writew(reg16 | (PM_OUTPUT << (bit * 2)),
> +                      pctrl->base + PM(port));
> +       else
> +               writew(reg16 | (PM_INPUT << (bit * 2)),
> +                      pctrl->base + PM(port));

This can be simplified to

        if (output)
                reg16 |= PM_OUTPUT << (bit * 2);
        else
                reg16 |= PM_INPUT << (bit * 2);
        writew(reg16, pctrl->base + PM(port));

or perhaps even shortened to:

        reg16 |= (output ? PM_OUTPUT : PM_INPUT) << (bit * 2);
        writew(reg16, pctrl->base + PM(port));


> +
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +}
> +
> +static int rzg2l_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
> +       u32 port = RZG2L_PIN_ID_TO_PORT(offset);
> +       u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
> +
> +       if (!(readb(pctrl->base + PMC(port)) & BIT(bit))) {
> +               u16 reg16;
> +
> +               reg16 = readw(pctrl->base + PM(port));
> +               reg16 = (reg16 >> (bit * 2)) & PM_MASK;
> +               if (reg16 == PM_OUTPUT)
> +                       return GPIOF_OUTPUT;
> +               else if (reg16 == PM_INPUT)
> +                       return GPIOF_INPUT;
> +               else if (reg16 == PM_OUTPUT_INPUT)
> +                       return GPIOF_BIDIRECTION;
> +               else
> +                       return GPIOF_HI_Z;

These should return either GPIO_LINE_DIRECTION_OUT or
GPIO_LINE_DIRECTION_IN. No other non-error values are defined for
the .get_direction() callback.

> +       } else {
> +               return -EINVAL;
> +       }
> +}

> +static int rzg2l_gpio_direction_output(struct gpio_chip *chip,
> +                                      unsigned int offset, int value)
> +{
> +       struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
> +       u32 port = RZG2L_PIN_ID_TO_PORT(offset);
> +       u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
> +
> +       rzg2l_gpio_set_direction(pctrl, port, bit, true);
> +       rzg2l_gpio_set(chip, offset, value);

Probably the order of these two operations should be reversed, to
avoid glitches.

> +
> +       return 0;
> +}
> +
> +static int rzg2l_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
> +       u32 port = RZG2L_PIN_ID_TO_PORT(offset);
> +       u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
> +       u16 reg16;
> +
> +       reg16 = readw(pctrl->base + PM(port));
> +       reg16 = (reg16 >> (bit * 2)) & PM_MASK;
> +
> +       if (reg16 == PM_INPUT || reg16 == PM_OUTPUT_INPUT)

BTW, how do you configure a pin for PM_OUTPUT_INPUT?

> +               return !!(readb(pctrl->base + PIN(port)) & BIT(bit));
> +       else if (reg16 == PM_OUTPUT)
> +               return !!(readb(pctrl->base + P(port)) & BIT(bit));
> +       else
> +               return -EINVAL;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
