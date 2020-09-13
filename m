Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFC992680F7
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Sep 2020 21:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgIMT2M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 15:28:12 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:41709 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgIMT2L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 15:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1600025290; x=1631561290;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=KfSuhuBWdbKfZmkY1vicW1hLi4TcaPsoMTVGkC57pPs=;
  b=jMLJkK9EGXWttQRdt4nDv3N29RjaaKICmr19pqwxGgwtqkBTT4e3cQsr
   1maBVlN3Aa2J+57LMqkqcYhCoO//IlKNSPgHFhsOfW0DStg78aZT3eVLk
   a7cVT0uc/4Qjzns7muO3dx1Tf9BdnNm1V9zkm5PSD2Mw8EOES7xFKTxy/
   Jg1dRveysQkHottOo2ywb0Vxz1Vq64lIYFItWfk1KOXS89oT0GS7tZsa/
   GxPdM03H0Koo462ZbipD1jKHqoM6kaQ0+KyCvJ1TmK7cTXhAS2EP/mnnm
   mDnNpquuNz2ptBUos8DvEV2mv2OXBdKvvh/DJuo2jOthF4JDx9H1BST/b
   Q==;
IronPort-SDR: L82gV9CfNkoIkGKRwnqtrKBDp7LdIqqC/CrEwCU+ixN+HcX7AAxQWpFR61EAETH9NANuK2IYjS
 OeiKzxOc9vA1Qid8peOriEYe1B7kyFDSMRcvrlSYTolv7SrpXgryg4wHiQNBuH6zlvKKt9KjyC
 /UFlO27ChtoyHjBPRwyTsg4uEfAnQc1U4NcaWXv2W0SNxAZxb8WUk1Ba2EjxyATz9ludGMcgZG
 UQNeDTjg6Shfinn6pPDGNUzJXBB4FKpM6GxpgTG0bhkyYNSTlrGC74GYXYGPLWUCFnJyPCKAcG
 j4U=
X-IronPort-AV: E=Sophos;i="5.76,423,1592895600"; 
   d="scan'208";a="86711584"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Sep 2020 12:28:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 13 Sep 2020 12:28:08 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sun, 13 Sep 2020 12:28:02 -0700
References: <20200903133528.8595-1-lars.povlsen@microchip.com> <20200903133528.8595-3-lars.povlsen@microchip.com> <CACRpkdbUv4r+Cghs1e4OEFCW4Yd1bGGQcWZ5TEb2uDWnVXhPSw@mail.gmail.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v2 2/3] pinctrl: pinctrl-mchp-sgpio: Add pinctrl driver for Microsemi Serial GPIO
In-Reply-To: <CACRpkdbUv4r+Cghs1e4OEFCW4Yd1bGGQcWZ5TEb2uDWnVXhPSw@mail.gmail.com>
Date:   Sun, 13 Sep 2020 21:28:05 +0200
Message-ID: <87pn6pwk6y.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> On Thu, Sep 3, 2020 at 3:35 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
>> (SGPIO) device used in various SoC's.
>>
>> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
> (...)
>
>> diff --git a/drivers/pinctrl/pinctrl-mchp-sgpio.c b/drivers/pinctrl/pinctrl-mchp-sgpio.c
>
> Can we just spell it out
> pinctrl-microchip-sgpio.c ?
>
> The abbreviation seems arbitrary and unnecessary.

Well, not completely arbitrary, but maybe unnecessary... I'll change
that. I'll also change that for any symbols/defines off course.

>
> I do see that this chip is using the pinctrl abstractions (very nicely)
> and should be under drivers/pinctrl/*.
>
> Sadly it doesn't mean the bindings need to be in pinctrl ... unless you
> plan to add pinctrl bindings later.
>
>> +config PINCTRL_MCHP_SGPIO
>> +       bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"
>> +       depends on OF
>> +       depends on HAS_IOMEM
>> +       select GPIOLIB
>> +       select GENERIC_PINCONF
>> +       select GENERIC_PINCTRL_GROUPS
>> +       select GENERIC_PINMUX_FUNCTIONS
>
> Nice use of these abstractions!

Thanks!

>
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>
> What's up with this OR MIT? I'd like Kate to OK this.
>
>> +#define MCHP_SGPIOS_PER_BANK   32
>> +#define MCHP_SGPIO_BANK_DEPTH  4
>> +
>> +#define PIN_NAM_SZ     (sizeof("SGPIO_D_pXXbY")+1)
>> +
>> +enum {
>> +       REG_INPUT_DATA,
>> +       REG_PORT_CONFIG,
>> +       REG_PORT_ENABLE,
>> +       REG_SIO_CONFIG,
>> +       REG_SIO_CLOCK,
>> +       MAXREG
>> +};
>> +
>> +struct mchp_sgpio_props {
>
> Just call it struct microchip_gpio_variant it is easier to read and
> does not abbreviate randomly, also it is a per-variant set of properties
> so calling it variant is more to the point.
>

Fine.

>> +struct mchp_sgpio_priv {
>
> I would just spell it out struct microchip_sgpio, it is implicit that
> the struct is private since it is defined in a c file.
>

Fine.

>> +struct mchp_sgpio_port_addr {
>
> struct microchip_sgpio_port_addr
>
> (Admittedly this is a bit about taste.)
>
>> +static inline void sgpio_writel(struct mchp_sgpio_priv *priv,
>> +                               u32 val, u32 rno, u32 off)
>> +{
>> +       u32 __iomem *reg = &priv->regs[priv->props->regoff[rno] + off];
>> +
>> +       writel(val, reg);
>> +}
>> +
>> +static inline void sgpio_clrsetbits(struct mchp_sgpio_priv *priv,
>> +                                   u32 rno, u32 off, u32 clear, u32 set)
>> +{
>> +       u32 __iomem *reg = &priv->regs[priv->props->regoff[rno] + off];
>> +       u32 val = readl(reg);
>> +
>> +       val &= ~clear;
>> +       val |= set;
>> +
>> +       writel(val, reg);
>> +}
>
> This looks like a reimplementation of regmap_update_bits for a bit,
> have you considered just using regmap? It's pretty simple.
>

Well, the registers are not in a regmap, so I did not consider that. The
utility function also serves to abstract the variant register address.

>> +static int mchp_sgpio_direction_input(struct gpio_chip *gc, unsigned int gpio)
>> +{
>> +       struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
>> +
>> +       /* Fixed-position function */
>> +       return sgpio_is_input(priv, gpio) ? 0 : -EINVAL;
>> +}
>> +
>> +static int mchp_sgpio_direction_output(struct gpio_chip *gc,
>> +                                      unsigned int gpio, int value)
>> +{
>> +       struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
>> +       struct mchp_sgpio_port_addr addr;
>> +
>> +       sgpio_pin_to_addr(priv, gpio, &addr);
>> +
>> +       /* Fixed-position function */
>> +       if (addr.input)
>> +               return -EINVAL;
>> +
>> +       sgpio_output_set(priv, &addr, value);
>> +
>> +       return 0;
>> +}
>
> This looks like the right way to handle this!

I'm glad you think so...

>
>> +static int mchp_sgpio_of_xlate(struct gpio_chip *gc,
>> +                              const struct of_phandle_args *gpiospec,
>> +                              u32 *flags)
>> +{
>> +       struct mchp_sgpio_priv *priv = gpiochip_get_data(gc);
>> +       int pin, base;
>> +
>> +       if (gpiospec->args[0] > MCHP_SGPIOS_PER_BANK ||
>> +           gpiospec->args[1] > priv->bitcount)
>> +               return -EINVAL;
>> +       base = priv->bitcount * gpiospec->args[0];
>> +       pin = base + gpiospec->args[1];
>> +       /* Add to 2nd half of output range if output */
>> +       if (gpiospec->args[2] == PIN_OUTPUT)
>> +               pin += (priv->ngpios / 2);
>> +
>> +       if (pin > gc->ngpio)
>> +               return -EINVAL;
>> +
>> +       if (flags)
>> +               *flags = gpiospec->args[3];
>> +
>> +       return pin;
>> +}
>
> I don't like this. I would certainly prefer the driver to just use standard
> GPIO bindings. I do not understand why this is necessary.
>
> If for nothing else, there should be a big comment explaining this.
>
> The only real problem I have with the driver is this extra flag tagged onto
> all the GPIOs, this seems unnecessary, and something the hardware
> driver should already know from the compatible string.

I hope my previous comments have cleared this up.

>
> Yours,
> Linus Walleij

Thank you for your time and comments!

---Lars

-- 
Lars Povlsen,
Microchip
