Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3102679D1
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 13:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgILLL1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 07:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgILLLP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 07:11:15 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF04C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 04:11:14 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so14576200ljk.8
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=difJeTP+wV7JyemjeWX3GldS9tsqpKh0tmwoGysikgA=;
        b=PHEEwmZH0GmE/ddgwQsvtRHwatJShCMl8y2YHwI7N4grJggqzM1xLhzEsjLeosNc9t
         nnouvutJlZBAv+T3DkIn8zydOcB6d4qKPGPX3XgzaQSl8rEckvpDZkgXBUDmqZnYHkrE
         n7tdrjSjl12tQhG2/cWnj+zy9zSL0o4NoCsJXtQQkakVGRfEBqGMWHRQBiCIWST5c76i
         E2Bpq8CjKtVcVE+y7QWsVJM7w4toH+r7cbhss3XIeEz0hu2N29G6Lk/+eVDj8YNOZ4+H
         U2WoMdzqMLsZXwe5XaJat9yNYPEVRKt0sAbhYVGTTC8Z8FjPIcie8ywoxH3t9httEGMA
         d+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=difJeTP+wV7JyemjeWX3GldS9tsqpKh0tmwoGysikgA=;
        b=ENRNm0e3tW8Pe++VQMuJ1xtlxr/w/bsS5J4gM5rRsOAuUWWzR6v5ovfEI8acgzTDd7
         6nbUa7JFkNq5actfkCxF+d9/YhJsJV6ZTJj8sU+pstxjBNYS1sYjS5NTlH8WURmzsfsF
         SMPV+65n56z3VPna2JDJIxcbe/+Jl0aG29UGKS+IqVAa8iojoBaoT7frY8RGhE7GwZXk
         O9+ov/7CpB8xwzxofJFRmvyx9fTx5MDg3K3XdKX0gi2o7kUl7ZRhFoS7gs6hJwuNI9Xn
         j3WtbXkY1k20WlRsQ1uihZ/hH0aTSISBiapiW2vmk9uGgnLvMMIvLSWZaAv/RvNcWDzf
         u+ng==
X-Gm-Message-State: AOAM533LvUzuVx3zZeTOycfdU7eYPgHwKpr5fs6h4+daAGylXneKmOuQ
        pBpxMX+dz+Vq2NcuIWofmt7B3zREWTo2UsryaQCy8JuDyV7m4g==
X-Google-Smtp-Source: ABdhPJzzO4J1ksW5rgtoJxMVbDnefY+BTIco1KcPrO3ijTsjJfIAo2n7aBEwVvZ7iqVJVytssUr0NCLz+Ssx70c/ZWM=
X-Received: by 2002:a05:651c:107b:: with SMTP id y27mr2047736ljm.338.1599909072951;
 Sat, 12 Sep 2020 04:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200903133528.8595-1-lars.povlsen@microchip.com> <20200903133528.8595-3-lars.povlsen@microchip.com>
In-Reply-To: <20200903133528.8595-3-lars.povlsen@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 13:11:02 +0200
Message-ID: <CACRpkdbUv4r+Cghs1e4OEFCW4Yd1bGGQcWZ5TEb2uDWnVXhPSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: pinctrl-mchp-sgpio: Add pinctrl driver
 for Microsemi Serial GPIO
To:     Lars Povlsen <lars.povlsen@microchip.com>,
        Kate Stewart <kstewart@linuxfoundation.org>
Cc:     Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 3, 2020 at 3:35 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
> (SGPIO) device used in various SoC's.
>
> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
(...)

> diff --git a/drivers/pinctrl/pinctrl-mchp-sgpio.c b/drivers/pinctrl/pinctrl-mchp-sgpio.c

Can we just spell it out
pinctrl-microchip-sgpio.c ?

The abbreviation seems arbitrary and unnecessary.

I do see that this chip is using the pinctrl abstractions (very nicely)
and should be under drivers/pinctrl/*.

Sadly it doesn't mean the bindings need to be in pinctrl ... unless you
plan to add pinctrl bindings later.

> +config PINCTRL_MCHP_SGPIO
> +       bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
> +       depends on OF
> +       depends on HAS_IOMEM
> +       select GPIOLIB
> +       select GENERIC_PINCONF
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS

Nice use of these abstractions!

> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)

What's up with this OR MIT? I'd like Kate to OK this.

> +#define MCHP_SGPIOS_PER_BANK   32
> +#define MCHP_SGPIO_BANK_DEPTH  4
> +
> +#define PIN_NAM_SZ     (sizeof("SGPIO_D_pXXbY")+1)
> +
> +enum {
> +       REG_INPUT_DATA,
> +       REG_PORT_CONFIG,
> +       REG_PORT_ENABLE,
> +       REG_SIO_CONFIG,
> +       REG_SIO_CLOCK,
> +       MAXREG
> +};
> +
> +struct mchp_sgpio_props {

Just call it struct microchip_gpio_variant it is easier to read and
does not abbreviate randomly, also it is a per-variant set of properties
so calling it variant is more to the point.

> +struct mchp_sgpio_priv {

I would just spell it out struct microchip_sgpio, it is implicit that
the struct is private since it is defined in a c file.

> +struct mchp_sgpio_port_addr {

struct microchip_sgpio_port_addr

(Admittedly this is a bit about taste.)

> +static inline void sgpio_writel(struct mchp_sgpio_priv *priv,
> +                               u32 val, u32 rno, u32 off)
> +{
> +       u32 __iomem *reg = &priv->regs[priv->props->regoff[rno] + off];
> +
> +       writel(val, reg);
> +}
> +
> +static inline void sgpio_clrsetbits(struct mchp_sgpio_priv *priv,
> +                                   u32 rno, u32 off, u32 clear, u32 set)
> +{
> +       u32 __iomem *reg = &priv->regs[priv->props->regoff[rno] + off];
> +       u32 val = readl(reg);
> +
> +       val &= ~clear;
> +       val |= set;
> +
> +       writel(val, reg);
> +}

This looks like a reimplementation of regmap_update_bits for a bit,
have you considered just using regmap? It's pretty simple.

> +static int mchp_sgpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
> +
> +       /* Fixed-position function */
> +       return sgpio_is_input(priv, gpio) ? 0 : -EINVAL;
> +}
> +
> +static int mchp_sgpio_direction_output(struct gpio_chip *gc,
> +                                      unsigned int gpio, int value)
> +{
> +       struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
> +       struct mchp_sgpio_port_addr addr;
> +
> +       sgpio_pin_to_addr(priv, gpio, &addr);
> +
> +       /* Fixed-position function */
> +       if (addr.input)
> +               return -EINVAL;
> +
> +       sgpio_output_set(priv, &addr, value);
> +
> +       return 0;
> +}

This looks like the right way to handle this!

> +static int mchp_sgpio_of_xlate(struct gpio_chip *gc,
> +                              const struct of_phandle_args *gpiospec,
> +                              u32 *flags)
> +{
> +       struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
> +       int pin, base;
> +
> +       if (gpiospec->args[0] > MCHP_SGPIOS_PER_BANK ||
> +           gpiospec->args[1] > priv->bitcount)
> +               return -EINVAL;
> +       base = priv->bitcount * gpiospec->args[0];
> +       pin = base + gpiospec->args[1];
> +       /* Add to 2nd half of output range if output */
> +       if (gpiospec->args[2] == PIN_OUTPUT)
> +               pin += (priv->ngpios / 2);
> +
> +       if (pin > gc->ngpio)
> +               return -EINVAL;
> +
> +       if (flags)
> +               *flags = gpiospec->args[3];
> +
> +       return pin;
> +}

I don't like this. I would certainly prefer the driver to just use standard
GPIO bindings. I do not understand why this is necessary.

If for nothing else, there should be a big comment explaining this.

The only real problem I have with the driver is this extra flag tagged onto
all the GPIOs, this seems unnecessary, and something the hardware
driver should already know from the compatible string.

Yours,
Linus Walleij
