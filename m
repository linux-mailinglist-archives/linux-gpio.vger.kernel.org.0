Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D07255A65
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 14:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729123AbgH1MmP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 08:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729388AbgH1MlT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 08:41:19 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56661C061264
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 05:41:18 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id m22so1139192ljj.5
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 05:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4UZ8ZlvTgZrHgyiPtvMsKPs/Vg0QBXcLrGYhEL5DGGo=;
        b=cclCi496u2b4nzAtXD4psDYf7lxbZPKHmuhThRkQ12IsEpMklRrDHz7YIdPeW1SH4r
         4ViExmoX7OsjB7ECKtkqEb4PMI9BUB3ZTcumKMX7motHQMCBLvBScPIYkcHQypp2uR+u
         zvIX3znEalqkveDqbFpkCGT8gRSIv3lk38KyFoJahpVHAI4kDLm6psdRPktab7I0hwPr
         Llxj36AGsBCEksBq9Ve5V6Tbj3TmAKp0Xs8z7ovtjDuNan6vPcFuoEJRwD8Q7x1XMVK+
         /Btz/IghV5pqByo6o3K3j17bQPl8ORiSkMcmicU8XwpEthy/5zjY8t/45+AtwOZUCl0P
         8b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4UZ8ZlvTgZrHgyiPtvMsKPs/Vg0QBXcLrGYhEL5DGGo=;
        b=Kf8glKfdOgxTN8yjWOmonChdMMWgOe5zYC/3X1s//L4NGTMEomZ3wTGy7aKlgLPAoQ
         RybCWWtg4rDfsVLdR0LYTwxgMhGr5pEsPqJAXDy5Woyvjz9TyD9d4KqTIp+YU1Zak9Tj
         vM3SAX1pCQerysgRNH19OmII5SVxCYpC0wQTKYqN5+A8U/R9gVQHdN+NCTG9lF5FJVs3
         cRafOKxf+5iw9C8msdwlNT/f41xK1sjFUgJmGeN6B/gAahtz3eUfjobzjyy3oBZJ7uiW
         ULWrfpiGWKe89QYNtYoaaiThNRoO8sL37DnBGv6c987bNWJUbKtiBjotWY2D7WVQkeo+
         HEWg==
X-Gm-Message-State: AOAM5308V5e0zv/7wuPA9XnUR8fcUMDvM0ghv4NM8om6XTUlmGi8zR1n
        KXzWGgFF+wE1evwsfFFL6bD9RYlgw9vxVip9E5Q1dA==
X-Google-Smtp-Source: ABdhPJwKZAvun9Brh3aryP6kpA6aXrferW+axwJsWnMHgZZ89KP4fGj1jclyUW3/4IgmZOQKzqDxkugRI2Y4Pa1vsbc=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr830659ljb.283.1598618476725;
 Fri, 28 Aug 2020 05:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200824122957.1392870-1-nobuhiro1.iwamatsu@toshiba.co.jp> <20200824122957.1392870-3-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20200824122957.1392870-3-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 14:41:05 +0200
Message-ID: <CACRpkdarxKSQOvoA4yvjFUkXmZR1OzHYfQRKqLR+8TQoV+oCyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: visconti: Add Toshiba Visconti SoCs
 pinctrl support
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, punit1.agrawal@toshiba.co.jp,
        yuji2.ishikawa@toshiba.co.jp,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@misterjones.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nobuhiro!

Thanks for your patch. Some review comments below!

On Mon, Aug 24, 2020 at 2:30 PM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
>
> Add pinctrl support to Toshiba Visconti SoCs.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

> +config PINCTRL_VISCONTI
> +       bool
> +       select PINMUX
> +       select GENERIC_PINCONF
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS

Thanks for using generic stuff!

> +#define SET_BIT(data, idx)     ((data) |= BIT(idx))
> +#define CLR_BIT(data, idx)     ((data) &= ~BIT(idx))

Please do not reinvent things like this. Either open code
it, and if you want optimizations (probably not relevant in
this case) you would use:

#include <linux/bitmap.h>

set_bit() and clear_bit() if you want atomic bit ops
__set_bit() and __clear_bit() for nonatomic

The upside to using these standard calls is that they will
unfold into assembly optimizations for the architecture if
possible.

If you roll your own locking use the latter primitives.

> +/* private data */
> +struct visconti_pinctrl {
> +       void __iomem *base;
> +       struct device *dev;
> +       struct pinctrl_dev *pctl;
> +       struct pinctrl_desc pctl_desc;
> +
> +       const struct visconti_pinctrl_devdata  *devdata;
> +
> +       spinlock_t lock;

At least add a comment to this lock to say what it is locking.

> +                       /* update pudsel setting */
> +                       val = readl(priv->base + pin->pudsel_offset);
> +                       CLR_BIT(val, pin->pud_shift);
> +                       val |= set_val << pin->pud_shift;

I would just inline the &= operation but it is up to you.

> +               case PIN_CONFIG_DRIVE_STRENGTH:
> +                       arg = pinconf_to_config_argument(configs[i]);
> +                       dev_dbg(priv->dev, "DRV_STR arg = %d\n", arg);
> +                       switch (arg) {
> +                       case 2:
> +                       case 4:
> +                       case 8:
> +                       case 16:
> +                       case 24:
> +                       case 32:
> +                               set_val = (arg / 2) - 1;

This looks like you want to use

set_val = DIV_ROUND_CLOSEST(arg, 2);

Also add a comment on WHY you do this.

> +                       /* update drive setting */
> +                       val = readl(priv->base + pin->dsel_offset);
> +                       val &= ~(GENMASK(3, 0) << pin->dsel_shift);

Could this GENMASK be a #define so we know what it is?

> +/* pinmnux */

Spelling

> +       /* update mux */
> +       val = readl(priv->base + mux->offset);
> +       val &= ~mux->mask;
> +       val |= mux->val;

So here you do things explicitly and in the other case with custom
macros. I think this is better because it is easy to read.

> +static int visconti_gpio_request_enable(struct pinctrl_dev *pctldev,
> +                                     struct pinctrl_gpio_range *range,
> +                                     unsigned int pin)

Since you implement this, what GPIO driver are you using this with?

Other than that it looks all right, also the plugin for SoC is nicely designed.

Thanks!
Linus Walleij
