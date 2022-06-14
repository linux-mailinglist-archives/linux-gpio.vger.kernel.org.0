Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0914E54B179
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 14:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244156AbiFNMpZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 08:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356949AbiFNMn0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 08:43:26 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6C938D86;
        Tue, 14 Jun 2022 05:43:06 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id hf10so5951921qtb.7;
        Tue, 14 Jun 2022 05:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UlHzJqDQVCFkJdgMmf2/8POq1e28CbVcI8O36R8k1ys=;
        b=3iOLTqyWgJUY5GXj8sYyQ6jMtuMOOSsnuw8Zqi6ng3UkxV4Dc8LZ5B8M0H52m53ZbA
         gH31zRxFgLOqw1Ca++iwIMRB9r+6y8Ecs2KhfdRqeg3hD1NNNlL0r7ROPkH8KK4+Qd92
         4Qac21tBmIel3PY3aSl6JX1MhDmfwWx3dMlHYaatZqzv3UqdbNWtklFB/tWYUPkN6brK
         okjkKOdEKPKyofs7HGIDc7GcOw92vsEiFrQ1WrMVaOtrgXPuhhSlklK0pk/jxhDje8ep
         GPsIJNebF3/gPD6MpHSZRcObd9058OMOyW1d29GQJWRFzOQRTCpaMkn6LZNiK6J1KOmF
         XDvA==
X-Gm-Message-State: AOAM533olVpTyxXMzba64buV6kaH3mW5VY4GdXQX0bJM0vJRrTG8x5Pv
        ktwBVPneRO9m1hiWq8DGOGBVMMQYVtgemg==
X-Google-Smtp-Source: ABdhPJzjYwLKT0P2YzwRUb2D7Sll7kzxLtUCjVLzIVj7LW04NZUY2dfD+Fad02M3tsnLb1MCY7MhqQ==
X-Received: by 2002:a05:622a:1484:b0:305:2c76:b401 with SMTP id t4-20020a05622a148400b003052c76b401mr3741420qtx.678.1655210585521;
        Tue, 14 Jun 2022 05:43:05 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a24c400b006a098381abcsm9328174qkn.114.2022.06.14.05.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 05:43:05 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-30ce6492a60so28026457b3.8;
        Tue, 14 Jun 2022 05:43:05 -0700 (PDT)
X-Received: by 2002:a81:f41:0:b0:313:4d6c:49db with SMTP id
 62-20020a810f41000000b003134d6c49dbmr5354767ywp.384.1655210584857; Tue, 14
 Jun 2022 05:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220520154051.29088-1-phil.edworthy@renesas.com> <20220520154051.29088-3-phil.edworthy@renesas.com>
In-Reply-To: <20220520154051.29088-3-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Jun 2022 14:42:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiqUUN_A+a2hcVpdx56NKHSBPMiYyHeS0SAVwdZSbZZA@mail.gmail.com>
Message-ID: <CAMuHMdUiqUUN_A+a2hcVpdx56NKHSBPMiYyHeS0SAVwdZSbZZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: Add RZ/V2M pin and gpio controller driver
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Phil,

Thanks for your patch!

On Fri, May 20, 2022 at 5:41 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> Add support for pin and gpio controller driver for RZ/V2M SoC.
> Based on the RZ/G2L driver.
>
> Note that the DETDO and DETMS dedicated pins are currently not
> documented in the HW manual as to which pin group they are in.
> HW team have since said that the output level of V1.8V I/O group 4
> (for MD0-7, and debugger) is the same as the 1.8V IO group 3.

Thank you, I rediscovered this explanation just before pressing send ;-)

>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/drivers/pinctrl/renesas/Kconfig
> +++ b/drivers/pinctrl/renesas/Kconfig
> @@ -193,6 +194,18 @@ config PINCTRL_RZG2L
>           This selects GPIO and pinctrl driver for Renesas RZ/{G2L,G2UL,V2L}
>           platforms.
>
> +config PINCTRL_RZV2M
> +       bool "pin control support for RZ/V2M"
> +       depends on OF
> +       depends on ARCH_R9A09G011 || COMPILE_TEST
> +       select GPIOLIB
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF
> +       help
> +         This selects GPIO and pinctrl driver for Renesas RZ/V2M
> +         platforms.
> +

Please preserve sort order.

>  config PINCTRL_PFC_R8A77470
>         bool "pin control support for RZ/G1C" if COMPILE_TEST
>         select PINCTRL_SH_PFC
> diff --git a/drivers/pinctrl/renesas/Makefile b/drivers/pinctrl/renesas/Makefile
> index 5d936c154a6f..cfa966125c4e 100644
> --- a/drivers/pinctrl/renesas/Makefile
> +++ b/drivers/pinctrl/renesas/Makefile
> @@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_PFC_SHX3)                += pfc-shx3.o
>  obj-$(CONFIG_PINCTRL_RZA1)     += pinctrl-rza1.o
>  obj-$(CONFIG_PINCTRL_RZA2)     += pinctrl-rza2.o
>  obj-$(CONFIG_PINCTRL_RZG2L)    += pinctrl-rzg2l.o
> +obj-$(CONFIG_PINCTRL_RZV2M)    += pinctrl-rzv2m.o

Please preserve sort order.

>  obj-$(CONFIG_PINCTRL_RZN1)     += pinctrl-rzn1.o
>
>  ifeq ($(CONFIG_COMPILE_TEST),y)
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
> new file mode 100644
> index 000000000000..610fc6b05e15
> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
> @@ -0,0 +1,1149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2M Pin Control and GPIO driver core
> + *
> + * Based on:
> + *   Renesas RZ/G2L Pin Control and GPIO driver core
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/spinlock.h>
> +
> +#include <dt-bindings/pinctrl/rzv2m-pinctrl.h>
> +
> +#include "../core.h"
> +#include "../pinconf.h"
> +#include "../pinmux.h"
> +
> +#define DRV_NAME       "pinctrl-rzv2m"
> +
> +/*
> + * Use 16 lower bits [15:0] for pin identifier
> + * Use 16 higher bits [31:16] for pin mux function
> + */
> +#define MUX_PIN_ID_MASK                GENMASK(15, 0)
> +#define MUX_FUNC_MASK          GENMASK(31, 16)
> +#define MUX_FUNC_OFFS          16
> +#define MUX_FUNC(pinconf)      (((pinconf) & MUX_FUNC_MASK) >> MUX_FUNC_OFFS)

FIELD_GET(MUX_FUNC_MASK, (pinconf))?
After that you can remove MUX_FUNC_OFFS.

> +
> +/* PIN capabilities */
> +#define PIN_CFG_1_8V_GRP2              1
> +#define PIN_CFG_1_8V_GRP3              2
> +#define PIN_CFG_SWIO_GRP1              3
> +#define PIN_CFG_SWIO_GRP2              4
> +#define PIN_CFG_3_3V_GRP               5

PIN_CFG_GRP_*, and move the definition of PIN_CFG_GRP_MASK here, to
make it clear they use the same number space as the PIN_CFG_* below?

> +#define PIN_CFG_IE                     BIT(3)
> +#define PIN_CFG_BIAS                   BIT(4)
> +#define PIN_CFG_DRV                    BIT(5)
> +#define PIN_CFG_SLEW                   BIT(6)
> +
> +#define RZV2M_MPXED_PIN_FUNCS          (PIN_CFG_IE | \
> +                                        PIN_CFG_BIAS | \
> +                                        PIN_CFG_DRV | \
> +                                        PIN_CFG_SLEW)
> +
> +#define PIN_CFG_GRP_MASK               7

GENMASK(2, 0)

> +
> +/*
> + * n indicates number of pins in the port, a is the register index
> + * and f is pin configuration capabilities supported.
> + */
> +#define RZV2M_GPIO_PORT_PACK(n, a, f)  (((n) << 24) | ((a) << 16) | (f))
> +#define RZV2M_GPIO_PORT_GET_PINCNT(x)  (((x) & GENMASK(31, 24)) >> 24)

FIELD_GET(GENMASK(31, 24), (x)) etc?

> +#define RZV2M_GPIO_PORT_GET_INDEX(x)   (((x) & GENMASK(23, 16)) >> 16)
> +#define RZV2M_GPIO_PORT_GET_CFGS(x)    ((x) & GENMASK(15, 0))
> +
> +#define RZV2M_DEDICATED_PORT_IDX       22
> +
> +/*
> + * BIT(31) indicates dedicated pin, b is the register bits (b * 16)
> + * and f is the pin configuration capabilities supported.
> + */
> +#define RZV2M_SINGLE_PIN               BIT(31)
> +#define RZV2M_SINGLE_PIN_PACK(b, f)    (RZV2M_SINGLE_PIN | \
> +                                        ((RZV2M_DEDICATED_PORT_IDX) << 24) | \
> +                                        ((b) << 16) | (f))
> +#define RZV2M_SINGLE_PIN_GET_PORT_OFFSET(x)    (((x) & GENMASK(30, 24)) >> 24)
> +#define RZV2M_SINGLE_PIN_GET_BIT(x)    (((x) & GENMASK(23, 16)) >> 16)
> +#define RZV2M_SINGLE_PIN_GET_CFGS(x)   ((x) & GENMASK(15, 0))
> +
> +#define RZV2M_PIN_ID_TO_PORT(id)       ((id) / RZV2M_PINS_PER_PORT)
> +#define RZV2M_PIN_ID_TO_PORT_OFFSET(id)        RZV2M_PIN_ID_TO_PORT(id)

Unlike on RZ/G2L, there is no need to distinguish between port and
port_offset on RZ/V2M, so you can drop RZV2M_PIN_ID_TO_PORT_OFFSET(),
and always use RZV2M_PIN_ID_TO_PORT().

> +#define RZV2M_PIN_ID_TO_PIN(id)                ((id) % RZV2M_PINS_PER_PORT)
> +
> +#define DO(n)                  (0x00 + (n) * 0x40)
> +#define OE(n)                  (0x04 + (n) * 0x40)
> +#define IE(n)                  (0x08 + (n) * 0x40)
> +#define PFC(n)                 (0x10 + (n) * 0x40)

PFSEL, to match the documentation?

> +#define DI(n)                  (0x20 + (n) * 0x40)
> +#define PUPD(n)                        (0x24 + (n) * 0x40)
> +#define DRV(n)                 (0x28 + (n) * 0x40)
> +#define SR(n)                  (0x2c + (n) * 0x40)
> +#define DI_MSK(n)              (0x30 + (n) * 0x40)
> +#define EN_MSK(n)              (0x34 + (n) * 0x40)
> +#define DRV_DEDICATED          0x590
> +#define SR_DEDICATED           0x594
> +
> +#define IE_MASK                        0x01
> +#define PFC_MASK               0x07
> +#define PUPD_MASK              0x03
> +#define DRV_MASK               0x03
> +#define SR_MASK                        0x01

Do you need IE_MASK and SR_MASK, for single-bit fields?
You don't have DO_MASK(), OE_MASK(), and IE_MASK().

> +static const unsigned int drv_1_8V_group2_uA[] = { 1800, 3800, 7800, 11000 };
> +static const unsigned int drv_1_8V_group3_uA[] = { 1600, 3200, 6400, 9600 };
> +static const unsigned int drv_SWIO_group1_3_3V_uA[] = { 2000, 4000, 8000, 12000 };
> +static const unsigned int drv_SWIO_group2_3_3V_uA[] = { 9000, 11000, 13000, 18000 };
> +static const unsigned int drv_3_3V_group_uA[] = { 2000, 4000, 8000, 12000 };

Can drv_SWIO_group1_3_3V_uA[] and drv_3_3V_group_uA[] be shared,
as they contain the same values?
Note that for the SWIO groups, the actual values are dependent on
the I/O voltage, too.  But I guess it becomes too complicated to
handle that (i.e. where to get the I/O voltage from)?

> +
> +/* Helper for registers that have a write enable bit in the upper word */
> +static void rzv2m_writel_we(void __iomem *addr, u8 bit, u8 value)

s/bit/shift/

> +{
> +       writel((BIT(16) | value) << bit, addr);
> +}

> +static void rzv2m_rmw_pin_config(struct rzv2m_pinctrl *pctrl, u32 offset,
> +                                u8 bit, u32 mask, u32 val)

s/bit/shift/

> +{
> +       void __iomem *addr = pctrl->base + offset;
> +       unsigned long flags;
> +       u32 reg;
> +
> +       spin_lock_irqsave(&pctrl->lock, flags);
> +       reg = readl(addr) & ~(mask << bit);
> +       writel(reg | (val << bit), addr);
> +       spin_unlock_irqrestore(&pctrl->lock, flags);
> +}
> +
> +static int rzv2m_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
> +                                    unsigned int _pin,
> +                                    unsigned long *config)
> +{
> +       struct rzv2m_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +       enum pin_config_param param = pinconf_to_config_param(*config);
> +       const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
> +       unsigned int *pin_data = pin->drv_data;
> +       unsigned int arg = 0;
> +       u32 port_offset;

port?

> +       u32 cfg = 0;
> +       u8 bit = 0;

No need to pre-initialize cfg and bit to zero.

> +       u32 val;
> +
> +       if (!pin_data)
> +               return -EINVAL;
> +
> +       if (*pin_data & RZV2M_SINGLE_PIN) {
> +               port_offset = RZV2M_SINGLE_PIN_GET_PORT_OFFSET(*pin_data);
> +               cfg = RZV2M_SINGLE_PIN_GET_CFGS(*pin_data);
> +               bit = RZV2M_SINGLE_PIN_GET_BIT(*pin_data);
> +       } else {
> +               cfg = RZV2M_GPIO_PORT_GET_CFGS(*pin_data);
> +               port_offset = RZV2M_PIN_ID_TO_PORT_OFFSET(_pin);
> +               bit = RZV2M_PIN_ID_TO_PIN(_pin);
> +
> +               if (rzv2m_validate_gpio_pin(pctrl, *pin_data, RZV2M_PIN_ID_TO_PORT(_pin), bit))
> +                       return -EINVAL;
> +       }
> +
> +       switch (param) {
> +       case PIN_CONFIG_BIAS_DISABLE:
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +       case PIN_CONFIG_BIAS_PULL_DOWN: {
> +               enum pin_config_param bias;
> +
> +               if (!(cfg & PIN_CFG_BIAS))
> +                       return -EINVAL;
> +
> +               /* PUPD uses 2-bits per pin */
> +               bit <<= 1;

So bit is actually a shift...
"*= 2" may be easier to read.

> +
> +               val = (readl(pctrl->base + PUPD(port_offset)) >> bit) & PUPD_MASK;
> +               if (val == 0)
> +                       bias = PIN_CONFIG_BIAS_PULL_DOWN;
> +               else if (val == 2)
> +                       bias = PIN_CONFIG_BIAS_PULL_UP;
> +               else
> +                       bias = PIN_CONFIG_BIAS_DISABLE;

switch (readl(pctrl->base + PUPD(port_offset)) >> bit) & PUPD_MASK) { ... }

> +               if (bias != param)
> +                       return -EINVAL;
> +               break;
> +       }
> +
> +       case PIN_CONFIG_INPUT_ENABLE:
> +               if (!(cfg & PIN_CFG_IE))
> +                       return -EINVAL;
> +
> +               val = (readl(pctrl->base + IE(port_offset)) >> bit) & IE_MASK;

"& BIT(bit)", or do you want to preserve symmetry with the other cases?

> +               if (!val)
> +                       return -EINVAL;
> +               break;
> +
> +       case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +               if (!(cfg & PIN_CFG_DRV))
> +                       return -EINVAL;
> +
> +               /* DRV uses 2-bits per pin */
> +               bit <<= 1;
> +
> +               /* Dedicated port is irregularly located to the others */
> +               if (port_offset == RZV2M_DEDICATED_PORT_IDX)
> +                       val = (readl(pctrl->base + DRV_DEDICATED) >> bit) & DRV_MASK;
> +               else
> +                       val = (readl(pctrl->base + DRV(port_offset)) >> bit) & DRV_MASK;

You can simplify this, by handling the dedicated port offset in the
definition of the DRV() macro.  Same for SR().

> +
> +               if ((cfg & PIN_CFG_GRP_MASK) == PIN_CFG_1_8V_GRP2)
> +                       arg = drv_1_8V_group2_uA[val];
> +               else if ((cfg & PIN_CFG_GRP_MASK) == PIN_CFG_1_8V_GRP3)
> +                       arg = drv_1_8V_group3_uA[val];
> +               else if ((cfg & PIN_CFG_GRP_MASK) == PIN_CFG_SWIO_GRP1)
> +                       arg = drv_SWIO_group1_3_3V_uA[val];
> +               else if ((cfg & PIN_CFG_GRP_MASK) == PIN_CFG_SWIO_GRP2)
> +                       arg = drv_SWIO_group2_3_3V_uA[val];
> +               else if ((cfg & PIN_CFG_GRP_MASK) == PIN_CFG_3_3V_GRP)
> +                       arg = drv_3_3V_group_uA[val];
> +               else
> +                       return -EINVAL;

switch (cfg & PIN_CFG_GRP_MASK) { ... }

> +
> +               break;
> +
> +       case PIN_CONFIG_SLEW_RATE:
> +               if (!(cfg & PIN_CFG_SLEW))
> +                       return -EINVAL;
> +
> +               /* Dedicated port is irregularly located to the others */
> +               if (port_offset == RZV2M_DEDICATED_PORT_IDX)
> +                       arg = (readl(pctrl->base + SR_DEDICATED) >> bit) & SR_MASK;

"& BIT(bit)", or do you want to preserve symmetry with the other cases?

> +               else
> +                       arg = (readl(pctrl->base + SR(port_offset)) >> bit) & SR_MASK;
> +               break;
> +
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       *config = pinconf_to_config_packed(param, arg);
> +
> +       return 0;
> +};
> +
> +static int rzv2m_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
> +                                    unsigned int _pin,
> +                                    unsigned long *_configs,
> +                                    unsigned int num_configs)
> +{
> +       struct rzv2m_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +       const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
> +       unsigned int *pin_data = pin->drv_data;
> +       enum pin_config_param param;
> +       u32 port_offset;

port?

> +       unsigned int i;
> +       u32 cfg = 0;
> +       u8 bit = 0;

No need to pre-initialize cfg and bit to zero.

> +       u32 val;
> +
> +       if (!pin_data)
> +               return -EINVAL;
> +
> +       if (*pin_data & RZV2M_SINGLE_PIN) {
> +               port_offset = RZV2M_SINGLE_PIN_GET_PORT_OFFSET(*pin_data);
> +               cfg = RZV2M_SINGLE_PIN_GET_CFGS(*pin_data);
> +               bit = RZV2M_SINGLE_PIN_GET_BIT(*pin_data);
> +       } else {
> +               cfg = RZV2M_GPIO_PORT_GET_CFGS(*pin_data);
> +               port_offset = RZV2M_PIN_ID_TO_PORT_OFFSET(_pin);
> +               bit = RZV2M_PIN_ID_TO_PIN(_pin);
> +
> +               if (rzv2m_validate_gpio_pin(pctrl, *pin_data, RZV2M_PIN_ID_TO_PORT(_pin), bit))
> +                       return -EINVAL;
> +       }
> +
> +       for (i = 0; i < num_configs; i++) {
> +               param = pinconf_to_config_param(_configs[i]);
> +               switch (param) {
> +               case PIN_CONFIG_BIAS_DISABLE:
> +               case PIN_CONFIG_BIAS_PULL_UP:
> +               case PIN_CONFIG_BIAS_PULL_DOWN:
> +                       if (!(cfg & PIN_CFG_BIAS))
> +                               return -EINVAL;
> +
> +                       /* PUPD uses 2-bits per pin */
> +                       bit <<= 1;

So bit is actually a shift...
"*= 2" may be easier to read.

> +
> +                       if (param == PIN_CONFIG_BIAS_PULL_DOWN)
> +                               val = 0;
> +                       else if (param == PIN_CONFIG_BIAS_PULL_UP)
> +                               val = 2;
> +                       else
> +                               val = 1;
 i
switch (param) { ... }

> +
> +                       rzv2m_rmw_pin_config(pctrl, PUPD(port_offset), bit, PUPD_MASK, val);
> +                       break;
> +
> +               case PIN_CONFIG_INPUT_ENABLE: {
> +                       unsigned int arg = pinconf_to_config_argument(_configs[i]);
> +
> +                       if (!(cfg & PIN_CFG_IE))
> +                               return -EINVAL;
> +
> +                       rzv2m_writel_we(pctrl->base + OE(port_offset), bit, !arg);

Should OE be controlled through PIN_CONFIG_OUTPUT_ENABLE instead?

> +                       rzv2m_writel_we(pctrl->base + IE(port_offset), bit, !!arg);
> +                       break;
> +               }
> +
> +               case PIN_CONFIG_DRIVE_STRENGTH_UA: {
> +                       unsigned int arg = pinconf_to_config_argument(_configs[i]);
> +                       const unsigned int *drv_strengths;
> +                       unsigned int index;
> +
> +                       if (!(cfg & PIN_CFG_DRV))
> +                               return -EINVAL;
> +
> +                       if ((cfg & PIN_CFG_GRP_MASK) == PIN_CFG_1_8V_GRP2)
> +                               drv_strengths = drv_1_8V_group2_uA;
> +                       else if ((cfg & PIN_CFG_GRP_MASK) == PIN_CFG_1_8V_GRP3)
> +                               drv_strengths = drv_1_8V_group3_uA;
> +                       else if ((cfg & PIN_CFG_GRP_MASK) == PIN_CFG_SWIO_GRP1)
> +                               drv_strengths = drv_SWIO_group1_3_3V_uA;
> +                       else if ((cfg & PIN_CFG_GRP_MASK) == PIN_CFG_SWIO_GRP2)
> +                               drv_strengths = drv_SWIO_group2_3_3V_uA;
> +                       else if ((cfg & PIN_CFG_GRP_MASK) == PIN_CFG_3_3V_GRP)
> +                               drv_strengths = drv_3_3V_group_uA;
> +                       else
> +                               return -EINVAL;

switch (cfg & PIN_CFG_GRP_MASK) { ... }

> +
> +                       for (index = 0; index < 4; index++) {
> +                               if (arg == drv_strengths[index])
> +                                       break;
> +                       }
> +                       if (index >= 4)
> +                               return -EINVAL;
> +
> +                       /* DRV uses 2-bits per pin */
> +                       bit <<= 1;
> +
> +                       /* Dedicated port is irregularly located to the others */
> +                       if (port_offset == RZV2M_DEDICATED_PORT_IDX)
> +                               rzv2m_rmw_pin_config(pctrl, DRV_DEDICATED, bit, DRV_MASK, index);
> +                       else
> +                               rzv2m_rmw_pin_config(pctrl, DRV(port_offset), bit, DRV_MASK, index);
> +                       break;
> +               }
> +
> +               case PIN_CONFIG_SLEW_RATE: {
> +                       unsigned int arg = pinconf_to_config_argument(_configs[i]);
> +
> +                       if (!(cfg & PIN_CFG_SLEW))
> +                               return -EINVAL;
> +
> +                       /* Dedicated port is irregularly located to the others */
> +                       if (port_offset == RZV2M_DEDICATED_PORT_IDX)
> +                               rzv2m_writel_we(pctrl->base + SR_DEDICATED, bit, !arg);
> +                       else
> +                               rzv2m_writel_we(pctrl->base + SR(port_offset), bit, !arg);
> +                       break;
> +               }
> +
> +               default:
> +                       return -EOPNOTSUPP;
> +               }
> +       }
> +
> +       return 0;
> +}

> +static void rzv2m_gpio_set_direction(struct rzv2m_pinctrl *pctrl, u32 port,
> +                                    u8 bit, bool output)
> +{
> +       if (output == true) {

"if (output)", as output is already a boolean value.

But perhaps just get rid of the if/else, and write "output" resp. "!output"
to the OE resp. IE bits?

> +               rzv2m_writel_we(pctrl->base + IE(port), bit, 0);
> +               rzv2m_writel_we(pctrl->base + OE(port), bit, 1);
> +       } else {
> +               rzv2m_writel_we(pctrl->base + OE(port), bit, 0);
> +               rzv2m_writel_we(pctrl->base + IE(port), bit, 1);
> +       }
> +}

> +static void rzv2m_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +                          int value)
> +{
> +       struct rzv2m_pinctrl *pctrl = gpiochip_get_data(chip);
> +       u32 port = RZV2M_PIN_ID_TO_PORT(offset);
> +       u8 bit = RZV2M_PIN_ID_TO_PIN(offset);
> +
> +       rzv2m_writel_we(pctrl->base + DO(port), bit, value);

While gpiod_direction_output_raw_commit() already does this,
I guess it doesn't hurt to use "!!value", just in case someone ever
passes a non-0/1 value?

> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
