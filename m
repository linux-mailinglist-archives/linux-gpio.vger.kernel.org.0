Return-Path: <linux-gpio+bounces-20634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3692AC6706
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 12:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6471B9E09DD
	for <lists+linux-gpio@lfdr.de>; Wed, 28 May 2025 10:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518BD2798FD;
	Wed, 28 May 2025 10:33:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4B31FFC41;
	Wed, 28 May 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428435; cv=none; b=SxrcRYBtDWxs5HSkownCz3hRHAgpFqXvNENzMQUY2rkprXFLXsqf4BQYf4Ib5Pqfc9yMISyO/BxEBxSUHdu0ISvbPPHnJbVu572jA97Av7or85ffmCeIt8H1xLXawc96u+NpRGCwFLElqN2RQGnqpefrcHtKXqlt0XtZftFLtYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428435; c=relaxed/simple;
	bh=ne6IX4us/VjqdWhTGuAJz3lSn7Rnzm2r4vE6MDwMMVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6vC4hMrhT/aY8yKEi05vvLhC17fbzyMNovydQKk+7VYUEgeTE+jy+HpDP0LOcft3k467KZHA68gB70nIeHWA8Jeb4EmUIhUl3I/oLHxxdTeTfi93gWcurNt/cyIYPx+9rrxDKtpg9h/ixPbhjrQln3TXKuTTUPRQuDqbL5TGXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-87dfd390745so1550078241.1;
        Wed, 28 May 2025 03:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428431; x=1749033231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDl9b7iJlwm+QFS5s1eRQDi/izVTXH90EB/w8qJ6d+w=;
        b=BxouMftfA3XTwdLg7DeJWWv9sVeDztP/LB7kSTzbwr8BHbK136mOZx+iuvg4tpX/hG
         4gNJUkvsVuauZAybVq9uk+8Ibolb8ldyKLa1ndpH3neb4OzoHCEgnd6hG9zvL7uLt0GQ
         iZa5QK5ZvOWemh3iP2xS539UvOOjrkgijfJrHEwzjNYKk7s9HlLAxyQ/DNOMiSvPIdro
         QHejpqOP4kpR4QZpn9HHLswsuTp2RTaHhWECZ30Dbevqrc5lktaRcyqWau4yQwkHpWiF
         8Q/lkj9gJGq8nPzsgQwgLFHR6cLYLRT+xJjcy1LMmYvZmg1CHTroMr6D7VE0BcxTEcJn
         0WEw==
X-Forwarded-Encrypted: i=1; AJvYcCWpPa2gjZpamwiH7Zg0x+bYPXeozCkuVuhW3pZs1+3NeGDI0+F9+c/axLhM/Z58F34P4ow+c4+68GPJTQPMN02M4Oc=@vger.kernel.org, AJvYcCX+gCibEUhNEcqfY37MwNwiHKHDY+QrmVBjNetrETC5VyRv9j1oiidCSdfrLvkNqE3ticU0uHPOL7IM@vger.kernel.org, AJvYcCXmcREPlOOzJ4h3VNGt2ryeoLfE78VUPfhoTP6uXfHY+AUBpxc1u9EpcMCVFzL+sc8b+qiHgj9Kaa2/DrYX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgraj1/e4uw+9BsDRucjt1QnGtXbPzD89E8PiNhYOqaXaG7bN8
	spa73zlz6/HkMWF7Y/EgfDx9aUqVkCx7iBx4D/EhfdzamjcX8VyvowzGfWevJI8P
X-Gm-Gg: ASbGncutZtmd9GbhAdbKc7uhrUbbF8BJt9pnqBih57re5FW/9Dg8YqsucY4Z966UCbk
	ujY2uq4d+PJjbvcxAFlqmPXdowHbuoq6Ox7iyT6u3fdc9SAySXzXLG7O8NINc8lsgSoMtRMase5
	kkASuOMFxzYyN9MVz1nZtXOK2gKHmAK6BOb3L4BW3LMAyqR6Pn6Xx9MLnP4AeEDRAiUr8MSRp0p
	dKjK4Z9tGzq0DWlnOTFMKnadYb2wuh+lbxoG2/dKynscAb4yNgDFKxci8eHhmxED3v04pVd5JM+
	nnn2JAx/eTXditS+zEOyC6H65sxqo9wLfRJAFfWY7arSkIP8wR33xc6QYBNLjnba0ftkXprhoPo
	aLc5b6nEIRPty3w==
X-Google-Smtp-Source: AGHT+IHxahTFgi6WKkxIE5oBu4wQTTIGQy5fYrYx1aCKhsJcXrdmNak2ITo13pMXzAoMREpTcIB3Rg==
X-Received: by 2002:a05:6102:1509:b0:4e1:48ee:6f3e with SMTP id ada2fe7eead31-4e4241638a1mr12730620137.20.1748428430948;
        Wed, 28 May 2025 03:33:50 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e59fc11396sm541023137.5.2025.05.28.03.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 03:33:50 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e45bfb885cso1784146137.3;
        Wed, 28 May 2025 03:33:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3MBOdu/WROA/LtJ5fXzsBYHJHrbBJckvqmmIciItQlDN3AavxPVIBtuI5/+Dki+4/Olb1o1Jk+sVpkxlw@vger.kernel.org, AJvYcCUngQjc4bVoJ6pURmm3+JWaN+99Ktm61NpMuIoG1JhBx6TbmLfoaeaSoeFH+6OFv29F5VajznqF3pbFuRjmbhoK2Ys=@vger.kernel.org, AJvYcCXy+P4cJL1fY0HRaDKyBnS7m1r0X9VcELPoaEMU1gQhSB82f8FvgB9IAoedOxFEHhe2kHzxHpY/sUTI@vger.kernel.org
X-Received: by 2002:a05:6102:6046:b0:4e4:57db:b28a with SMTP id
 ada2fe7eead31-4e457dbb8e4mr7125331137.19.1748428430243; Wed, 28 May 2025
 03:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519215734.577053-1-thierry.bultel.yh@bp.renesas.com> <20250519215734.577053-3-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250519215734.577053-3-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 12:33:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5bSYnQxott+dc01ORFPzhPL8eo1ToUdKA7n8GkB+30w@mail.gmail.com>
X-Gm-Features: AX0GCFssHahz9JB_OZEfek7C-zx1lTx-89JvbMePDOwI6XsCAqQ7GLT1vnqNeGE
Message-ID: <CAMuHMdU5bSYnQxott+dc01ORFPzhPL8eo1ToUdKA7n8GkB+30w@mail.gmail.com>
Subject: Re: [PATCH 2/3] Add the pinctrl and gpio driver for RZ/T2H
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 19 May 2025 at 23:57, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add basic support, pinmode is not supported yet.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/Kconfig
> +++ b/drivers/pinctrl/renesas/Kconfig
> @@ -44,6 +44,7 @@ config PINCTRL_RENESAS
>         select PINCTRL_RZG2L if ARCH_R9A09G047
>         select PINCTRL_RZG2L if ARCH_R9A09G056
>         select PINCTRL_RZG2L if ARCH_R9A09G057
> +       select PINCTRL_RZT2H if ARCH_R9A09G077
>         select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
>         select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
>         select PINCTRL_PFC_SH7269 if CPU_SUBTYPE_SH7269
> @@ -261,6 +262,18 @@ config PINCTRL_RZV2M
>           This selects GPIO and pinctrl driver for Renesas RZ/V2M
>           platforms.
>
> +config PINCTRL_RZT2H

Please preserve sort order.

> +       bool "pin control support for RZ/T2H"
> +       depends on OF
> +       depends on ARCH_R9A09G077 || COMPILE_TEST
> +       select GPIOLIB
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF
> +       help
> +         This selects GPIO and pinctrl driver for Renesas RZ/T2H
> +         platforms.
> +
>  config PINCTRL_PFC_SH7203
>         bool "pin control support for SH7203" if COMPILE_TEST
>         select PINCTRL_SH_FUNC_GPIO
> diff --git a/drivers/pinctrl/renesas/Makefile b/drivers/pinctrl/renesas/Makefile
> index 2ba623e04bf8..ef877c516225 100644
> --- a/drivers/pinctrl/renesas/Makefile
> +++ b/drivers/pinctrl/renesas/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_PINCTRL_PFC_SHX3)                += pfc-shx3.o
>  obj-$(CONFIG_PINCTRL_RZA1)     += pinctrl-rza1.o
>  obj-$(CONFIG_PINCTRL_RZA2)     += pinctrl-rza2.o
>  obj-$(CONFIG_PINCTRL_RZG2L)    += pinctrl-rzg2l.o
> +obj-$(CONFIG_PINCTRL_RZT2H)    += pinctrl-rzt2h.o

Please preserve sort order.

>  obj-$(CONFIG_PINCTRL_RZN1)     += pinctrl-rzn1.o
>  obj-$(CONFIG_PINCTRL_RZV2M)    += pinctrl-rzv2m.o
>
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> new file mode 100644
> index 000000000000..dd2772672716
> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -0,0 +1,783 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/T2H Pin Control and GPIO driver core
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/mutex.h>
> +
> +#include <dt-bindings/pinctrl/rzt2h-pinctrl.h>
> +
> +#include "../core.h"
> +#include "../pinconf.h"
> +#include "../pinmux.h"
> +
> +#define DRV_NAME       "pinctrl-rzt2h"
> +
> +/*
> + * Use 16 lower bits [15:0] for pin identifier
> + * Use 16 higher bits [31:16] for pin mux function
> + */
> +#define MUX_PIN_ID_MASK                GENMASK(15, 0)
> +#define MUX_FUNC_MASK          GENMASK(31, 16)
> +
> +/*
> + * n indicates number of pins in the port, a is the register index
> + * and f is pin configuration capabilities supported.
> + */
> +#define RZT2H_GPIO_PORT_PACK(n, a, f)  (((n) << 28) | ((a) << 20) | (f))

Unused...

> +
> +#define RZT2H_GPIO_PORT_GET_PINCNT(x)  FIELD_GET(GENMASK(30, 28), (x))
> +#define RZT2H_GPIO_PORT_GET_INDEX(x)   FIELD_GET(GENMASK(26, 20), (x))
> +#define RZT2H_GPIO_PORT_GET_CFGS(x)    FIELD_GET(GENMASK(19, 0), (x))
> +
> +/*
> + * BIT(31) indicates dedicated pin, p is the register index while
> + * referencing to SR/IEN/IOLH/FILxx registers, b is the register bits

RZ/T2H does not have SR/IEN/IOLH/FILxx registers.

> + * (b * 8) and f is the pin configuration capabilities supported.
> + */
> +#define RZT2H_SINGLE_PIN               BIT(31)
> +#define RZT2H_SINGLE_PIN_PACK(p, b, f) (RZT2H_SINGLE_PIN | \
> +                                        ((p) << 24) | ((b) << 20) | (f))
> +
> +#define RZT2H_SINGLE_PIN_GET_PORT_OFFSET(x)    FIELD_GET(GENMASK(30, 24), (x))
> +#define RZT2H_SINGLE_PIN_GET_BIT(x)            FIELD_GET(GENMASK(22, 20), (x))
> +#define RZT2H_SINGLE_PIN_GET_CFGS(x)           FIELD_GET(GENMASK(19, 0), (x))

... until here.

> +
> +#define P(n)                   (0x001 * (n))

This does not seem to conflict with a definition in a public header
file yet, surprisingly ;-)

> +#define PM(n)                  (0x200 + 0x002 * (n))
> +#define PMC(n)                 (0x400 + 0x001 * (n))
> +#define PFC(n)                 (0x600 + 0x008 * (n))
> +#define PIN(n)                 (0x800 + 0x001 * (n))

Perhaps use m instead of n, to match the documentation?
I would use decimal values for the (small) multipliers.

> +#define DRCTL(n)               (0xA00 + 0x008 * (n))

Unused

> +
> +#define RSELPSR                        0x1F04

Unused

> +
> +#define PM_MASK                        0x03

GENMASK(1, 0)

> +#define PFC_MASK               0x3FULL

GENMASK_ULL(5, 0)

> +#define PM_INPUT               0x1

BIT(0)

> +#define PM_OUTPUT              0x2

BIT(1)

> +#define SR_MASK                        0x01

Incorrect, not really a mask, and part of the DRCTL register, so

    #define DRCTL_SR BIT(5)

> +#define SCHMITT_MASK           0x01

Incorrect, not really a mask, and part of the DRCTL register, so

    #define DRCTL_SMT BIT(4)

> +#define IOLH_MASK              0x03

Do you mean DRV_MASK?

    #define DRCTL_DRV_MASK GENMASK(1, 0)

> +#define PUPD_MASK              0x03

    #define DRCTL_PUPD_MASK GENMASK(3, 2)

Anyway, all four are unused (for now, I assume).

May be easier to read if you interleave the register offset definitions
and the corresponding register bit definitions.

> +
> +#define RZT2H_PIN_ID_TO_PORT(id)       ((id) / RZT2H_PINS_PER_PORT)
> +#define RZT2H_PIN_ID_TO_PORT_OFFSET(id)        (RZT2H_PIN_ID_TO_PORT(id) + 0x10)

Unused

> +#define RZT2H_PIN_ID_TO_PIN(id)                ((id) % RZT2H_PINS_PER_PORT)
> +
> +struct rzt2h_dedicated_configs {
> +       const char *name;
> +       u32 config;
> +};

Unused

> +
> +struct rzt2h_pinctrl_data {
> +       const char * const *port_pins;
> +       unsigned int n_port_pins;
> +};
> +
> +struct rzt2h_pinctrl {
> +       struct pinctrl_dev              *pctl;
> +       struct pinctrl_desc             desc;
> +       struct pinctrl_pin_desc         *pins;
> +       const struct rzt2h_pinctrl_data *data;
> +       void __iomem                    *base0, *base1;
> +       struct device                   *dev;
> +       struct clk                      *clk;
> +       struct gpio_chip                gpio_chip;
> +       struct pinctrl_gpio_range       gpio_range;

This seems to be set only.

> +       int safety_region;

Unused

> +       spinlock_t                      lock;
> +       struct mutex                    mutex;

Please add comments to these two, to clarify what they are protecting
against.

> +};
> +
> +#define RZT2H_PORT_SAFETY_LAST 12
> +
> +#define RZT2H_PINCTRL_REG_ACCESS(size, type) \
> +static void rzt2h_pinctrl_write##size(struct rzt2h_pinctrl *pctrl, u8 port, type val, u16 offset) \

unsigned int offset

> +{ \
> +       if (port > RZT2H_PORT_SAFETY_LAST) \
> +               write##size(val, pctrl->base0 + offset); \
> +       else \
> +               write##size(val, pctrl->base1 + offset); \
> +} \
> +\
> +static type rzt2h_pinctrl_read##size(struct rzt2h_pinctrl *pctrl, u8 port, u16 offset) \

unsigned int offset

> +{ \
> +       if (port > RZT2H_PORT_SAFETY_LAST) \
> +               return read##size(pctrl->base0 + offset); \
> +       else \
> +               return read##size(pctrl->base1 + offset); \
> +}
> +
> +RZT2H_PINCTRL_REG_ACCESS(b, u8)
> +RZT2H_PINCTRL_REG_ACCESS(w, u16)
> +RZT2H_PINCTRL_REG_ACCESS(q, u64)
> +
> +static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
> +                                      u8 port, u8 pin, u64 func)
> +{
> +       u64 reg_pfc;
> +       u32 reg;

In other functions, you use "u16 reg16" and "u8 reg8".
Please be consistent and pick one style.

> +
> +       guard(spinlock_irqsave)(&pctrl->lock);
> +
> +       /* Set pin to 'Non-use (Hi-Z input protection)'  */
> +       reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +       reg &= ~(PM_MASK << (pin * 2));
> +       rzt2h_pinctrl_writew(pctrl, port, reg, PM(port));
> +
> +       /* Temporarily switch to GPIO mode with PMC register */
> +       reg = rzt2h_pinctrl_readb(pctrl, port, PMC(port));
> +       rzt2h_pinctrl_writeb(pctrl, port, reg & ~BIT(pin), PMC(port));
> +
> +       /* Select Pin function mode with PFC register */
> +       reg_pfc = rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> +       reg_pfc &= ~(PFC_MASK << (pin * 8));
> +       rzt2h_pinctrl_writeq(pctrl, port, reg_pfc | (func << (pin * 8)), PFC(port));
> +
> +       /* Switch to Peripheral pin function with PMC register */
> +       reg = rzt2h_pinctrl_readb(pctrl, port, PMC(port));
> +       rzt2h_pinctrl_writeb(pctrl, port, reg | BIT(pin), PMC(port));
> +};
> +
> +static int rzt2h_pinctrl_set_mux(struct pinctrl_dev *pctldev,
> +                                unsigned int func_selector,
> +                                unsigned int group_selector)
> +{
> +       struct rzt2h_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +       struct function_desc *func;
> +       unsigned int i, *psel_val;
> +       struct group_desc *group;
> +       const unsigned int *pins;
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

Please use consistent spacing around the colons.

> +                       RZT2H_PIN_ID_TO_PORT(pins[i]), RZT2H_PIN_ID_TO_PIN(pins[i]),
> +                       psel_val[i]);
> +               rzt2h_pinctrl_set_pfc_mode(pctrl, RZT2H_PIN_ID_TO_PORT(pins[i]),
> +                                          RZT2H_PIN_ID_TO_PIN(pins[i]), psel_val[i]);
> +       }
> +
> +       return 0;
> +};

> +static void rzt2h_gpio_set_direction(struct rzt2h_pinctrl *pctrl, u32 port,
> +                                    u8 bit, bool output)
> +{
> +       u16 reg16;
> +
> +       guard(spinlock_irqsave)(&pctrl->lock);
> +
> +       reg16 = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +       reg16 &= ~(PM_MASK << (bit * 2));
> +
> +       reg16 |= (output ? PM_OUTPUT : PM_INPUT) << (bit * 2);
> +       rzt2h_pinctrl_writew(pctrl, port, reg16, PM(port));
> +}
> +
> +static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
> +       u32 port = RZT2H_PIN_ID_TO_PORT(offset);
> +       u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
> +
> +       if (!(rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit))) {

Invert the logic and return early, to reduce indentation?

> +               u16 reg16;
> +
> +               reg16 = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +               reg16 = (reg16 >> (bit * 2)) & PM_MASK;
> +               if (reg16 == PM_OUTPUT)

The hardware supports enabling both input and output, so I think you
better check for "(reg16 >> (bit * 2)) & PM_OUTPUT".

> +                       return GPIO_LINE_DIRECTION_OUT;
> +       }
> +
> +       return GPIO_LINE_DIRECTION_IN;
> +}
> +
> +static int rzt2h_gpio_direction_input(struct gpio_chip *chip,
> +                                     unsigned int offset)
> +{
> +       struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
> +       u32 port = RZT2H_PIN_ID_TO_PORT(offset);
> +       u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
> +
> +       rzt2h_gpio_set_direction(pctrl, port, bit, false);
> +
> +       return 0;
> +}
> +
> +static void rzt2h_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +                          int value)
> +{
> +       struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
> +       u32 port = RZT2H_PIN_ID_TO_PORT(offset);
> +       u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
> +       u8 reg8;
> +
> +       guard(spinlock_irqsave)(&pctrl->lock);
> +
> +       reg8 = rzt2h_pinctrl_readb(pctrl, port, P(port));
> +
> +       if (value)
> +               rzt2h_pinctrl_writeb(pctrl, port, reg8 | BIT(bit), P(port));
> +       else
> +               rzt2h_pinctrl_writeb(pctrl, port, reg8 & ~BIT(bit), P(port));
> +}
> +
> +static int rzt2h_gpio_direction_output(struct gpio_chip *chip,
> +                                      unsigned int offset, int value)

Please move this function up, just below rzt2h_gpio_direction_input().

> +{
> +       struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
> +       u32 port = RZT2H_PIN_ID_TO_PORT(offset);
> +       u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
> +
> +       rzt2h_gpio_set(chip, offset, value);
> +       rzt2h_gpio_set_direction(pctrl, port, bit, true);
> +
> +       return 0;
> +}
> +
> +static int rzt2h_gpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +       struct rzt2h_pinctrl *pctrl = gpiochip_get_data(chip);
> +       u32 port = RZT2H_PIN_ID_TO_PORT(offset);
> +       u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
> +       u16 reg16;
> +
> +       reg16 = rzt2h_pinctrl_readw(pctrl, port, PM(port));
> +       reg16 = (reg16 >> (bit * 2)) & PM_MASK;
> +
> +       if (reg16 == PM_INPUT)

"if (reg16 & PM_INPUT)", to handle both PM_INPUT and PM_OUTPUT set?

> +               return !!(rzt2h_pinctrl_readb(pctrl, port, PIN(port)) & BIT(bit));
> +       else if (reg16 == PM_OUTPUT)
> +               return !!(rzt2h_pinctrl_readb(pctrl, port, P(port)) & BIT(bit));
> +       else
> +               return -EINVAL;
> +}

> +static int rzt2h_pinctrl_probe(struct platform_device *pdev)
> +{
> +       struct rzt2h_pinctrl *pctrl;
> +       int ret;
> +
> +       pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> +       if (!pctrl)
> +               return -ENOMEM;
> +
> +       pctrl->dev = &pdev->dev;
> +
> +       pctrl->data = of_device_get_match_data(&pdev->dev);
> +       if (!pctrl->data)
> +               return -EINVAL;
> +
> +       pctrl->base0 = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(pctrl->base0))
> +               return PTR_ERR(pctrl->base0);
> +
> +       pctrl->base1 = devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(pctrl->base1))
> +               return PTR_ERR(pctrl->base1);
> +
> +       pctrl->clk = devm_clk_get_optional(pctrl->dev, NULL);

Why optional?

> +       if (IS_ERR(pctrl->clk)) {
> +               ret = PTR_ERR(pctrl->clk);
> +               return dev_err_probe(pctrl->dev, ret, "failed to get GPIO clk\n");
> +       }
> +
> +       spin_lock_init(&pctrl->lock);
> +       mutex_init(&pctrl->mutex);
> +       platform_set_drvdata(pdev, pctrl);
> +
> +       if (pctrl->clk) {
> +               ret = clk_prepare_enable(pctrl->clk);
> +               if (ret)
> +                       return dev_err_probe(pctrl->dev, ret,
> +                                            "failed to enable GPIO clk\n");
> +               ret = devm_add_action_or_reset(&pdev->dev, rzt2h_pinctrl_clk_disable,
> +                                      pctrl->clk);
> +               if (ret)
> +                       return dev_err_probe(pctrl->dev, ret,
> +                                            "failed to register GPIO clk disable action\n");
> +       }
> +
> +       return rzt2h_pinctrl_register(pctrl);
> +}

> +core_initcall(rzt2h_pinctrl_init);

MODULE_DESCRIPTION/AUTHOR?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

