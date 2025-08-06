Return-Path: <linux-gpio+bounces-24037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38824B1C7E0
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 16:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FAB93AFBB8
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 14:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B8925DD0B;
	Wed,  6 Aug 2025 14:48:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521151D7995;
	Wed,  6 Aug 2025 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754491686; cv=none; b=XJoD1zIe5ObUs04DI7c7LcFm6+C3i5DVBTjdr68J4R4sdvoM82Jhw+N++4Fzw1rogCio/FYUsRxowrXMAsEJQcx5meYzA5uRpGix8DBxl/4DA89a1oLp/ji2ke82VOHkmTa7KgbJaFHhdX5qliyCln6ktswvg6CXhCr3/8rkzws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754491686; c=relaxed/simple;
	bh=vyWa69z+sJzDQ+TdwHNMtNnrGZNW8qjNnPSndCOtWlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AY/DdIXKwkcbcDO6m3DSXvq3oedvzeqt36eLFKmsWoS7NaY+TlDV98Vjqb+SSk2h6r3d7rdd2iOKG3eDS3ySc2lI68LrtxrTUER+ZeICsaDqIrGmxwSL4yur7qpLtWVEYbB7MV/o3qmC33Tr4JnCkuJtv2F55yq0Ve4yk+VvxGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-88c61c2843aso1391860241.2;
        Wed, 06 Aug 2025 07:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754491683; x=1755096483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewIXJjQUmiEQh0L3XDGnFBhJg4VA1jPsjxIit/17xDY=;
        b=Amqq5Q6TeRZGAy3jwsL5nmiljNQenMDOwBXR0rUSwPjBs5bpGb/K8yo+wv9PasuBAJ
         9SmaHQpZjwRpkhWlWaPTrPqynS+a4dmKxe+f+ioet/g69t1EDl9oE2nkWTJHbOaDVprT
         N8d4GwmZe3vRNmW5wVjxVIYZxBbY+88xyiEMKPPPofzxSfGKLkAS6P4rSS3tWziVn+7Y
         ExCbI+BgXoCI6PUqvyYP0t3jdgG2Nk9lCTvZlEJGvJWqZZ0WZNSoJMcTuWI0nBip0T/T
         kzpLkuc7gWcwEZTVLrM+2zKgZIq7cA53/sZGASp9TBmwnMqjUoS8/LvwbV7qAW6owZQY
         Yf9A==
X-Forwarded-Encrypted: i=1; AJvYcCUCukmQ+K2aZN3Prplm1cM3EZjzvk6KJj7W8Eptxn+AsUnigqWIxDm4ZdhtdcUE3j7YViDukijSi7AZoA==@vger.kernel.org, AJvYcCVIUNPdScgpN9l2HREzVkC4bhH70itqsdvtCDOof8l54rDq0+FOsYYdI+NwlZsLac1/SglVw8DnR9ULlqce@vger.kernel.org, AJvYcCWC3WrTUlnhzb+1ER1aMxcIcsn020ZaYr0qUW8DBv2Y6gyFV4hniMRoN7AxzB3veFZ6Ht9vdin1yMgC@vger.kernel.org, AJvYcCXMKS2su6U5FsdIpa84yr9k/w4JLx/nvNdz7YJ61qsd3+p+6RQ8xSvib/098VB9kh4XALsYsMF5hpLVfJbooSoPCng=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMTNUlZb+hakHVefWnLFEh6Zkf8DPlOU6w8bUPOqex6Hy58EDe
	ihE/FHULqinAVE6pmFasnMTd3wgYQdUocxa4bFXAe3zhJMZVfFW2/l0peB1uWpiXYiw=
X-Gm-Gg: ASbGncuF7lUCLPhaQ06ehekqzd6Kon9MC0kYNUSOJRmVcrH7Psx9Jk65zQM0g4+Kid4
	becMpw+CXMW8cE9Cxu9a3SCfMniAHHO78v11eSytB0IzGXWyIPrCz+Jw/gMJ7Jzd5qs4KrVFVKk
	hZxbeUMRrZjwfc+nZjTwPVlLCaiFj3/BjmcpyEO2lZGvKZtQo1n3HTjLas5/0Fw/bHInJsPgod2
	s0unMAiPGpA9iVX7/eRTpWTE/S39Dcb+a2vO6nx0l9LkZFOx4Y9l+t0NcW8xsolY85of9lmu8mg
	NDqirSRujcV7FMl2UbQpgJN6A5Sa4+Ubxb5uGF03bSpENhgpqbNCGogLsAH4hQ5O13vsPoL5zGq
	DxfbwWvaUNPbYPHHa8jLYLtD36SEom+fZFI0jOkqeqhS/niyTbl1XkRyrdrIX
X-Google-Smtp-Source: AGHT+IGjakNIfsmadSZOR6aZ3tqau8cktZYMKenKn1noXV4fs3GcwFdAU9m8Y2JYK0aGQfWZnoAbrQ==
X-Received: by 2002:a05:6102:38d3:b0:4c3:3eb:e84d with SMTP id ada2fe7eead31-503733cc2b5mr1444766137.21.1754491682783;
        Wed, 06 Aug 2025 07:48:02 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fc0d46d50bsm3684673137.17.2025.08.06.07.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 07:48:02 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-88dc394f5e7so1049102241.1;
        Wed, 06 Aug 2025 07:48:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUawhEDnWowaIZzu7Y4jOPhGySFVs/SPa7Prwj9NQ54ahR4i43y0zh7Bb1aH7aBJUYEg1VuW+VuUHu8tQ==@vger.kernel.org, AJvYcCUtSA/yacZvsoWIhmLrh/3k/BeeqXP2A8lFA7xIzjRcCbcbh77l9kdzXS9oe2h+zRP6e3W+tBjbjjpA@vger.kernel.org, AJvYcCVI2n1FntbeQhRustn/rH3tVPjiZD7X4BE8UUe27zvQcti0b7ibfOAJ0QmzCpCmTt+PHP2gYgxGzTocnQQJ@vger.kernel.org, AJvYcCWx6M5GoZ+mVIzpdnUc8cLMXDmDbEkn10YvoLvTD5bWBdf61NwDaGCnM0L2ZH/ChNBtQm4GzmZINDQoTa5VGBjk5cA=@vger.kernel.org
X-Received: by 2002:a05:6102:8025:b0:4e9:a01a:ed57 with SMTP id
 ada2fe7eead31-503733d4a69mr1442588137.20.1754491681691; Wed, 06 Aug 2025
 07:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801154550.3898494-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250801154550.3898494-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250801154550.3898494-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 16:47:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhxxJprKSr3-QmO-8+ue+guqErW5e1tj3yEHRMZhdeiQ@mail.gmail.com>
X-Gm-Features: Ac12FXy1Ns8UyKuQbFZn4T5aPw1qTSCP74zvexMXmvhIlIAHeZDLYuc9Mo5GFMs
Message-ID: <CAMuHMdVhxxJprKSr3-QmO-8+ue+guqErW5e1tj3yEHRMZhdeiQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: renesas: Add support for RZ/T2H
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 1 Aug 2025 at 17:46, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
>
> Add the pinctrl and gpio driver for RZ/T2H
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Co-developed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - No changes
>
> v2->v3:
> - Fixed Kconfig dependency.
> - Added dependency for 64bit to avoid build errors on 32bit systems.
> - Included bitfield.h

Thanks for the update!

Seems like several of my review comments on v1 were missed.

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c

> +#define PM_MASK                        GENMASK(1, 0)
> +#define PM_PIN_MASK(pin)       (PM_MASK << ((pin) * 2))

Please move PM_INPUT and PM_OUTPUT here, and insert a blank line
between the PM_* and PFC_* definitions.

> +#define PFC_MASK               GENMASK_ULL(5, 0)
> +#define PFC_PIN_MASK(pin)      (PFC_MASK << ((pin) * 8))
> +
> +#define PM_INPUT       0x01

BIT(0)

> +#define PM_OUTPUT      0x02

BIT(1)

> +struct rzt2h_pinctrl_data {
> +       const char * const *port_pins;

Do you need this? It always points rzt2h_gpio_names[].

> +       unsigned int n_port_pins;
> +       const u8 *port_pin_configs;
> +       unsigned int n_ports;
> +};
> +
> +struct rzt2h_pinctrl {
> +       struct pinctrl_dev              *pctl;
> +       struct pinctrl_desc             desc;
> +       struct pinctrl_pin_desc         *pins;
> +       const struct rzt2h_pinctrl_data *data;
> +       void __iomem                    *base0, *base1;
> +       struct device                   *dev;
> +       struct gpio_chip                gpio_chip;
> +       struct pinctrl_gpio_range       gpio_range;
> +       spinlock_t                      lock;
> +       struct mutex                    mutex;

Please add comments to these two locks, to clarify what they are
protecting against.

> +       bool                            safety_port_enabled;
> +};
> +
> +#define RZT2H_PINCTRL_REG_ACCESS(size, type) \
> +static inline void rzt2h_pinctrl_write##size(struct rzt2h_pinctrl *pctrl, u8 port, \
> +                                            type val, u16 offset) \

unsigned int offset?

> +{ \
> +       if (port > RZT2H_MAX_SAFETY_PORTS) \
> +               write##size(val, pctrl->base0 + offset); \
> +       else \
> +               write##size(val, pctrl->base1 + offset); \
> +} \
> +\
> +static inline type rzt2h_pinctrl_read##size(struct rzt2h_pinctrl *pctrl, u8 port, u16 offset) \

Likewise

> +{ \
> +       if (port > RZT2H_MAX_SAFETY_PORTS) \
> +               return read##size(pctrl->base0 + offset); \
> +       else \
> +               return read##size(pctrl->base1 + offset); \
> +}

> +static int rzt2h_validate_pin(struct rzt2h_pinctrl *pctrl, unsigned int offset)
> +{
> +       u8 port = RZT2H_PIN_ID_TO_PORT(offset);
> +       u8 pin = RZT2H_PIN_ID_TO_PIN(offset);
> +       u8 pincfg;
> +
> +       if (offset >= pctrl->data->n_port_pins || port >= pctrl->data->n_ports)
> +               return -EINVAL;
> +
> +       if (!pctrl->safety_port_enabled && port <= RZT2H_MAX_SAFETY_PORTS)
> +               return -EINVAL;
> +
> +       pincfg = pctrl->data->port_pin_configs[port];
> +       return (pincfg & (1 << pin)) ? 0 : -EINVAL;

BIT(pin)

> +}
> +

> +static int rzt2h_pinctrl_set_mux(struct pinctrl_dev *pctldev,
> +                                unsigned int func_selector,
> +                                unsigned int group_selector)
> +{
> +       struct rzt2h_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +       struct function_desc *func;
> +       struct group_desc *group;
> +       const unsigned int *pins;
> +       unsigned int i;
> +       u8 *psel_val;
> +       int ret;
> +
> +       func = pinmux_generic_get_function(pctldev, func_selector);
> +       if (!func)
> +               return -EINVAL;
> +       group = pinctrl_generic_get_group(pctldev, group_selector);
> +       if (!group)
> +               return -EINVAL;
> +
> +       psel_val = func->data;
> +       pins = group->grp.pins;
> +
> +       for (i = 0; i < group->grp.npins; i++) {
> +               dev_dbg(pctrl->dev, "port:%u pin: %u PSEL:%u\n",

Please use consistent spacing around colons.

> +                       RZT2H_PIN_ID_TO_PORT(pins[i]), RZT2H_PIN_ID_TO_PIN(pins[i]),
> +                       psel_val[i]);
> +               ret = rzt2h_validate_pin(pctrl, pins[i]);
> +               if (ret)
> +                       return ret;

Please insert a blank line.

> +               rzt2h_pinctrl_set_pfc_mode(pctrl, RZT2H_PIN_ID_TO_PORT(pins[i]),
> +                                          RZT2H_PIN_ID_TO_PIN(pins[i]), psel_val[i]);
> +       }
> +
> +       return 0;
> +};

> +static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
> +       u8 port = RZT2H_PIN_ID_TO_PORT(offset);
> +       u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
> +       int ret;
> +
> +       ret = rzt2h_validate_pin(pctrl, offset);
> +       if (ret)
> +               return ret;
> +
> +       if (!(rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit))) {

Invert the logic and return early, to reduce indentation?

> +               u16 reg;
> +
> +               reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +               reg = (reg >> (bit * 2)) & PM_MASK;
> +               if (reg == PM_OUTPUT)

The hardware supports enabling both input and output, so I think you
better check for "reg & PM_OUTPUT".

> +                       return GPIO_LINE_DIRECTION_OUT;
> +               if (reg == PM_INPUT)
> +                       return GPIO_LINE_DIRECTION_IN;
> +       }
> +
> +       return -EINVAL;
> +}

> +static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
> +       u8 port = RZT2H_PIN_ID_TO_PORT(offset);
> +       u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
> +       u16 reg;
> +
> +       reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +       reg = (reg >> (bit * 2)) & PM_MASK;
> +
> +       if (reg == PM_INPUT)

"if (reg & PM_INPUT)", to handle both PM_INPUT and PM_OUTPUT set?

> +               return !!(rzt2h_pinctrl_readb(pctrl, port, PIN(port)) & BIT(bit));
> +       if (reg == PM_OUTPUT)
> +               return !!(rzt2h_pinctrl_readb(pctrl, port, P(port)) & BIT(bit));
> +       return -EINVAL;
> +}

> +static int rzt2h_pinctrl_register(struct rzt2h_pinctrl *pctrl)
> +{
> +       struct pinctrl_desc *desc = &pctrl->desc;
> +       struct device *dev = pctrl->dev;
> +       struct pinctrl_pin_desc *pins;
> +       unsigned int i, j;
> +       u8 *pin_data;
> +       int ret;
> +
> +       desc->name = DRV_NAME;
> +       desc->npins = pctrl->data->n_port_pins;
> +       desc->pctlops = &rzt2h_pinctrl_pctlops;
> +       desc->pmxops = &rzt2h_pinctrl_pmxops;
> +       desc->owner = THIS_MODULE;
> +
> +       pins = devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL);
> +       if (!pins)
> +               return -ENOMEM;
> +
> +       pin_data = devm_kcalloc(dev, desc->npins,
> +                               sizeof(*pin_data), GFP_KERNEL);

Fits on a single line.

> +       if (!pin_data)
> +               return -ENOMEM;
> +
> +       pctrl->pins = pins;
> +       desc->pins = pins;
> +
> +       for (i = 0, j = 0; i < pctrl->data->n_port_pins; i++) {
> +               pins[i].number = i;
> +               pins[i].name = pctrl->data->port_pins[i];
> +               if (i && !(i % RZT2H_PINS_PER_PORT))
> +                       j++;
> +               pin_data[i] = pctrl->data->port_pin_configs[j];
> +               pins[i].drv_data = &pin_data[i];

Where is this used?

> +       }
> +
> +       ret = devm_pinctrl_register_and_init(dev, desc, pctrl, &pctrl->pctl);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "pinctrl registration failed\n");
> +
> +       ret = pinctrl_enable(pctrl->pctl);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "pinctrl enable failed\n");
> +
> +       return rzt2h_gpio_register(pctrl);
> +}
> +
> +static int rzt2h_pinctrl_cfg_regions(struct platform_device *pdev,
> +                                    struct rzt2h_pinctrl *pctrl)
> +{
> +       pctrl->base0 = devm_platform_ioremap_resource_byname(pdev, "nsr");
> +       if (IS_ERR(pctrl->base0))
> +               return PTR_ERR(pctrl->base0);
> +
> +       pctrl->base1 = devm_platform_ioremap_resource_byname(pdev, "srs");

When the optional "srs" region is missing, it is ignored by the
code below, but __devm_ioremap_resource() will still have printed
an error message.  So you either have to open-code this using
platform_get_resource_byname() and devm_ioremap_resource() here, or
create a static devm_platform_ioremap_resource_byname_optional()
helper that does the same, or go for a public helper directly.

> +       if (IS_ERR(pctrl->base1)) {
> +               if (PTR_ERR(pctrl->base1) != -EINVAL)
> +                       return PTR_ERR(pctrl->base1);
> +       } else {
> +               u8 port;
> +
> +               pctrl->safety_port_enabled = true;
> +
> +               /* Configure to select safety region 0x812c0xxx */
> +               for (port = 0; port <= RZT2H_MAX_SAFETY_PORTS; port++)
> +                       writeb(0x0, pctrl->base1 + RSELP(port));
> +       }
> +
> +       return 0;
> +}

> +static const u8 r9a09g077_gpio_configs[] = {
> +       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f,
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

