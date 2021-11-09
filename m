Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E53444A5C5
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 05:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240343AbhKIEdE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 23:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240330AbhKIEdD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 23:33:03 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A1BC061767
        for <linux-gpio@vger.kernel.org>; Mon,  8 Nov 2021 20:30:18 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id q124so31537404oig.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Nov 2021 20:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3aMCHdg6dYLfrOpFqTf8iRJZcFBmekB2LXHxGiDDgy0=;
        b=FEnq43hbc5WNuoM0SIDOUtHHWeeE9KevXjdQI4jfDEJeydwFSCvxbAYdm+BFFz/sAn
         frT29zE+zrEzeWBWvym+0ONUxz/w/3noh81sGPT7bUUQREJM2bt0Rh5+KRIOpXbCcqnn
         KPs/7V+kKXp0kojmsKOeSwrOz0RPvl5VRPiQXUOqNxPAGsx3B1lExZcY4MQ2BHHQUFAv
         ngBFfYSVKKVuwTzjMa+QXkLLXX/dTAlOpdV7g81Cztge6DHKCbmEyvtQVlhXaZ8PU7Kb
         q/oP8Dbnna8ciG9jsA1NeSIxVqbyjggu3axAGrOm0Zysc1kjLRI3XLK+CmED7be14M0I
         2JWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3aMCHdg6dYLfrOpFqTf8iRJZcFBmekB2LXHxGiDDgy0=;
        b=VP362j1f4scv1RpnXj2qHWwa2wfYuuUTyxz5252jWArxUUOkge3RNxInTXGfnW1UKv
         xoCS2MYe5z3tgWShParP9BedLRf1uNOqBKpleBQzaOAFSDFDSVGswfjNXl/oY5+Exjea
         5EvLeuUBpgycWqhSrigi24DFOSmSlkY5DlJUi8GUaF7wNEJ0McEovXhR+lM0bARtE3ln
         1NfljJaglWe23einvkjMsYO1fW0H7gP4YVvQTWAsqsdkJmb8yDjyBW5Bg3egYlW5lwl4
         F3mDbjnj823VpZk/U17jyUSqtYYfMSNz0PcaBdQfLJOJcizP29g04zq3hZMHkd8O1/Yq
         jBfQ==
X-Gm-Message-State: AOAM530KHiZZwDHaBHbVUmHinS3dKwECTs6MHBmRR3flYjgcDO4S7JTq
        ea9qZ7EoS38RaxrAJXpzZvKDE7I6OUcRl5uij8laSw==
X-Google-Smtp-Source: ABdhPJy8sc8GnKM0PDWYUWc3cieSbMiO3NMOFr6ByPHq55IFQwk3OIhRsn0bB1uprhEHRkHh37Yx1UJ3aF9e8xws67E=
X-Received: by 2002:a54:4791:: with SMTP id o17mr3332646oic.114.1636432217421;
 Mon, 08 Nov 2021 20:30:17 -0800 (PST)
MIME-Version: 1.0
References: <1635324926-22319-1-git-send-email-wells.lu@sunplus.com>
 <1635754277-32429-1-git-send-email-wells.lu@sunplus.com> <1635754277-32429-2-git-send-email-wells.lu@sunplus.com>
In-Reply-To: <1635754277-32429-2-git-send-email-wells.lu@sunplus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:30:05 +0100
Message-ID: <CACRpkdYSzHW6Y0CS5H=9uJdPxm1HvjAYNYznLXNkiXWwi-JB1w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: Add driver for Sunplus SP7021
To:     Wells Lu <wellslutw@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        qinjian@cqplus1.com, dvorkin@tibbo.com,
        Wells Lu <wells.lu@sunplus.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Wells Lu,

thanks for your patch!

This driver needs a bit of work, I will point out some things and I
think it will be quite different if we also change the bindings.

On Mon, Nov 1, 2021 at 9:11 AM Wells Lu <wellslutw@gmail.com> wrote:

> +config PINCTRL_SPPCTL
> +       bool "Sunplus SP7021 pinmux and GPIO driver"
> +       depends on SOC_SP7021
> +       depends on OF && HAS_IOMEM
> +       select PINMUX
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select OF_GPIO
> +       select GPIOLIB
> +       select GPIO_SYSFS

Don't do this, sysfs is deprecated.

> +obj-$(CONFIG_PINCTRL_SPPCTL) += sppctl.o
> +obj-$(CONFIG_PINCTRL_SPPCTL) += sppctl_pinctrl.o
> +obj-$(CONFIG_PINCTRL_SPPCTL) += sppctl_sysfs.o
> +obj-$(CONFIG_PINCTRL_SPPCTL) += sppctl_gpio_ops.o
> +obj-$(CONFIG_PINCTRL_SPPCTL) += sppctl_gpio.o
> +obj-$(CONFIG_PINCTRL_SPPCTL) += pinctrl_inf_sp7021.o
> +obj-$(CONFIG_PINCTRL_SPPCTL) += gpio_inf_sp7021.o

This multitide of files makes this a bit hard to read and review,
usually pin controllers are in one-two files for a single SoC.

> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

Drop this boilerplate on all files and just use the SPDX tag.

> +const size_t GPIS_listSZ = sizeof(sppctlgpio_list_s)/sizeof(*(sppctlgpio_list_s));

Use only lowercase in variable names.
This looks like a reimplementation of ARRAY_SIZE(),
replace with that if this is the case.

> +const size_t sppctlpins_allSZ = ARRAY_SIZE(sppctlpins_all);

Instead of defining consts for random sizes like this,
just inline ARRAY_SIZE() where you use it.

> +// gpio: is defined in gpio_inf_sp7021.c
> +const size_t PMUX_listSZ = sizeof(sppctlpmux_list_s)/sizeof(*(sppctlpmux_list_s));

Same comment as above. Etc.

> +/* CEC pin is not used. Release it for others. */
> +//static const unsigned int pins_hdmi1[] = { D(10, 6), D(10, 7), D(12, 2), D(12, 1) };
> +//static const unsigned int pins_hdmi2[] = { D(8, 3), D(8, 4), D(8, 5), D(8, 6) };
> +//static const unsigned int pins_hdmi3[] = { D(7, 4), D(7, 5), D(7, 6), D(7, 7) };

Don't leave commented-out code in the driver. Delete
all this stuff.

> +void print_device_tree_node(struct device_node *node, int depth)
> +{
> +       int i = 0;
> +       struct device_node *child;
> +       struct property    *properties;
> +       char                indent[255] = "";
> +
> +       for (i = 0; i < depth * 3; i++)
> +               indent[i] = ' ';
> +       indent[i] = '\0';
> +
> +       ++depth;
> +       if (depth == 1) {
> +               pr_info("%s{ name = %s\n", indent, node->name);
> +               for (properties = node->properties; properties != NULL;
> +                       properties = properties->next)
> +                       pr_info("%s  %s (%d)\n", indent, properties->name, properties->length);
> +               pr_info("%s}\n", indent);
> +       }
> +
> +       for_each_child_of_node(node, child) {
> +               pr_info("%s{ name = %s\n", indent, child->name);
> +               for (properties = child->properties; properties != NULL;
> +                       properties = properties->next)
> +                       pr_info("%s  %s (%d)\n", indent, properties->name, properties->length);
> +               print_device_tree_node(child, depth);
> +               pr_info("%s}\n", indent);
> +       }
> +}

This kind of debugging code should be deleted or use what
is in the device tree core.

> +void sppctl_gmx_set(struct sppctl_pdata_t *_p, uint8_t _roff, uint8_t _boff, uint8_t _bsiz,
> +                   uint8_t _rval)
> +{
> +       uint32_t *r;

Don't use uint8_t or uint16_t or uint32_t, use the kernel
short forms u8, u16 or u32, simply.

Don't start any variable names with _underscore, it i a
big confusion for the head because it has ambigous
semantics.

Try to find concise descriptive variable names.

> +       struct sppctl_reg_t x = { .m = (~(~0 << _bsiz)) << _boff,
> +                                 .v = ((uint16_t)_rval) << _boff };
> +
> +       if (_p->debug > 1)
> +               KDBG(_p->pcdp->dev, "%s(x%X,x%X,x%X,x%X) m:x%X v:x%X\n",
> +                    __func__, _roff, _boff, _bsiz, _rval, x.m, x.v);

Do not reinvent kernel debugging use the dev_dbg() macro.

> +       r = (uint32_t *)&x;

Try to avoid casting like this. It is usually a sign that something is wrong.

> +       if (_fun % 2 == 0)
> +               ;
> +       else {
> +               x.v <<= 8;
> +               x.m <<= 8;
> +       }

This is code that is incredibly terse and deviant from the kernels
general style. Please read a few other pin control drivers and
familiarize with how these drivers usually look.

> +uint8_t sppctl_fun_get(struct sppctl_pdata_t *_p,  uint8_t _fun)
> +{
> +       uint8_t pin = 0x00;
> +       uint8_t func = (_fun >> 1) << 2;

This looks like shting to get rid of bit 0.
Just use bitwise logic instead.

> +       ret = request_firmware_nowait(THIS_MODULE, true, _fwname, _dev, GFP_KERNEL, p,
> +                                     sppctl_fwload_cb);

So this pin controller needs a firmware? That is the first time
I have ever seen that. Please add comments describing what this
firmware is and what it does, also explain it in the commit
message.

> +int sppctl_pctl_resmap(struct platform_device *_pd, struct sppctl_pdata_t *_pc)
> +{
> +       struct resource *rp;
> +
> +       // resF
> +       rp = platform_get_resource(_pd, IORESOURCE_MEM, 0);
> +       if (IS_ERR(rp)) {
> +               KERR(&(_pd->dev), "%s get res#F ERR\n", __func__);
> +               return PTR_ERR(rp);
> +       }
> +       KDBG(&(_pd->dev), "mres #F:%p\n", rp);

Thes resF etc are very terse and hard to understand. It seems written
by someone who knows everything of what they are doing but with
very little interest to explain it to others. Code readability is important.

> +static struct platform_driver sppctl_driver = {
> +       .driver = {
> +               .name           = MNAME,

Don't abbreviate so compulsively.
SP7021_MODULE_NAME is fine.

> +static int __init sppctl_drv_reg(void)
> +{
> +       return platform_driver_register(&sppctl_driver);
> +}
> +postcore_initcall(sppctl_drv_reg);

Why do you need a postcore_initcall()?

> +MODULE_AUTHOR(M_AUT1);
> +MODULE_AUTHOR(M_AUT2);
> +MODULE_DESCRIPTION(M_NAM);
> +MODULE_LICENSE(M_LIC);

Just inline the strings, all other drivers do.

> +#define MNAME "sppctl"
> +#define M_LIC "GPL v2"
> +#define M_AUT1 "Dvorkin Dmitry <dvorkin@tibbo.com>"
> +#define M_AUT2 "Wells Lu <wells.lu@sunplus.com>"
> +#define M_NAM "SP7021 PinCtl"
> +#define M_ORG "Sunplus/Tibbo Tech."
> +#define M_CPR "(C) 2020"

This is too much and too abbreviated names, just use
the strings directly in the macros.

> +#include <linux/version.h>

Why?

> +#include <linux/of_gpio.h>

Never use this include in new code. It is legacy.

> +#define SPPCTL_MAX_NAM 64
> +#define SPPCTL_MAX_BUF PAGE_SIZE
> +
> +#define KINF(pd, fmt, args...) \
> +       do { \
> +               if ((pd) != NULL) \
> +                       dev_info((pd), fmt, ##args); \
> +               else \
> +                       pr_info(MNAME ": " fmt, ##args); \
> +       } while (0)
> +#define KERR(pd, fmt, args...) \
> +       do { \
> +               if ((pd) != NULL) \
> +                       dev_info((pd), fmt, ##args); \
> +               else \
> +                       pr_err(MNAME ": " fmt, ##args); \
> +       } while (0)
> +#ifdef CONFIG_PINCTRL_SPPCTL_DEBUG
> +#define KDBG(pd, fmt, args...) \
> +       do { \
> +               if ((pd) != NULL) \
> +                       dev_info((pd), fmt, ##args); \
> +               else \
> +                       pr_debug(MNAME ": " fmt, ##args); \
> +       } while (0)
> +#else
> +#define KDBG(pd, fmt, args...)
> +#endif

Don't reimplement kernel debugging use dev_dbg(), dev_info()
dev_err() etc directly. I don't see why you need
CONFIG_PINCTRL_SPPCTL_DEBUG at all, if you absolutely
want to control debugging for these files only just use
this in your Makefile

subdir-ccflags-$(CONFIG_PINCTRL_SPPCTL_DEBUG)  := -DDEBUG

This will turn on/off the output from dev_dbg().

> +struct sppctl_pdata_t {
> +       char name[SPPCTL_MAX_NAM];
> +       uint8_t debug;

Don't use u8 for things like this use bool.

> +       char fwname[SPPCTL_MAX_NAM];
> +       void *sysfs_sdp;
> +       void __iomem *baseF;    // functions
> +       void __iomem *base0;    // MASTER , OE , OUT , IN
> +       void __iomem *base1;    // I_INV , O_INV , OD
> +       void __iomem *base2;    // GPIO_FIRST
> +       void __iomem *baseI;    // IOP
> +       // pinctrl-related
> +       struct pinctrl_desc pdesc;
> +       struct pinctrl_dev *pcdp;
> +       struct pinctrl_gpio_range gpio_range;
> +       struct sppctlgpio_chip_t *gpiod;

*gpiod is a bad name because we use it quite a lot
in the kernel for GPIO descriptors.

> +struct sppctl_reg_t {
> +       uint16_t v;     // value part
> +       uint16_t m;     // mask part
> +};

These are not types (no typedef) so don't add *_t
suffixes, just drop those everywhere.

> +       const char * const name;
> +       const uint8_t gval;             // value for register
> +       const unsigned * const pins;    // list of pins
> +       const unsigned int pnum;        // number of pins

Use kerneldoc to document struct members.

There will be many more comments but work on these things
to begin with!

Yours,
Linus Walleij
