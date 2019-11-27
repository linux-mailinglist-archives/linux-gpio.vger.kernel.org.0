Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB59010B094
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 14:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfK0Nta (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 08:49:30 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:37388 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfK0Nta (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 08:49:30 -0500
Received: by mail-ua1-f65.google.com with SMTP id l38so6990153uad.4
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2019 05:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+nx+9qeUsVrgVxpWb5DGUTX9y7FEWCWKgVQeRiw+fPY=;
        b=UfmrOfsSSr4N7iI9BXNqYEpRJx9A8H5jGQAhTC4CjaX3hP2U3ruLhBevRf5OFQjbGI
         TKAe2SCcNPBm0WDAOxX1MGvTE8n1JFiPtDGrUMFaKl+Zf8T5kjtPjuaGkQmHnjpscrf1
         rsTh6TolGy7ETbKDMiLBe3WoyCq9KZ8zuMxZdcpkTfaceyO7KpQnnNBuDmntwx5kYMNT
         w5JafA+irlzk3yJLliprj02VrDtVGN51HK7QEmYsj3hEj3CHsv7r5nR9sOPu5tvesSJI
         RaXnid6BtkHjSvotmPWXdMzdFCJqGEZ6CEsKLrrQ6+B6hfz9l4B4uD7zK40ed6rnubxL
         boRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+nx+9qeUsVrgVxpWb5DGUTX9y7FEWCWKgVQeRiw+fPY=;
        b=Rhrb81q6P+mqwpyxZjsb9FZA9vIP7q2hSwasJK44EipLR0s423DCACeyo3C3Gi/uI7
         SmmVx7YSS5DhPiSaNH0YaHtfKl6sYaumvyXIQZX3qhuO18zIEImpSOyGmix1Ltqq2p1R
         jfby9XUvM7fYijfc30nLI/AaWuzqzC443TD5Z5qzBtCSFppgdVWxp0RRpoW3bFnNjjQy
         blrveDAta0tGJJ3D12qV3q3ewcteXc7kbmdqll+9pAPPbP0XkmbzCZEF/DQbPQsc5y68
         /5+7Z21w6LX6+IxfNajZG+wrZ60QayZGK6km1khNp96V7uRXzQMpYnTC3DIlX2Z2Q2cQ
         TTLA==
X-Gm-Message-State: APjAAAXuo7u121eQTiZxLbq30VuodwC6Uco/XetjIJAJv+v2JSVLPDGT
        0LYnWSJw4yJXcujQaLt3wFv1tpxb4QM0bl7rBr2FwA==
X-Google-Smtp-Source: APXvYqzedabYD3uY1NUNLUI3MPPvnAd6IgQOrq2x8I9KcgoT62IcEarJDYmcmpswdWe232KyoNDSmfy6U6TgM8ea1k4=
X-Received: by 2002:ab0:2551:: with SMTP id l17mr2707934uan.54.1574862568419;
 Wed, 27 Nov 2019 05:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20191127115619.20278-1-m.felsch@pengutronix.de> <20191127115619.20278-4-m.felsch@pengutronix.de>
In-Reply-To: <20191127115619.20278-4-m.felsch@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Nov 2019 14:49:17 +0100
Message-ID: <CACRpkdbd4J-FUNi=F12YQfNPajNCVaoKyqWU7qjmfFMbonzDKg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: da9062: add driver support
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marco,

thanks for your patch!

On Wed, Nov 27, 2019 at 12:56 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> The DA9062 is a mfd pmic device which supports 5 GPIOs. The GPIOs can
> be used as input, output or have a special use-case.
>
> The patch adds the support for the normal input/output use-case.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
(...)

> +config PINCTRL_DA9062
> +       tristate "Dialog Semiconductor DA9062 PMIC pinctrl and GPIO Support"
> +       depends on MFD_DA9062
> +       select GPIOLIB

Hm this would be one of those that could use GENERIC_REGMAP_GPIO
the day we invent it but we haven't invented it yet.

> +#include <../gpio/gpiolib.h>

Put a comment above this telling us why you do this thing.

> +static int da9062_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
(...)
> +       return val & BIT(offset);

You should #include <linux/bits.h> since you use BIT()

Usually I clamp it like this:
return !!(val & BIT(offset));

> +static int da9062_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct da9062_pctl *pctl = gpiochip_get_data(gc);
> +       struct regmap *regmap = pctl->da9062->regmap;
> +       int gpio_mode;
> +
> +       gpio_mode = da9062_pctl_get_pin_mode(regmap, offset);
> +       if (gpio_mode < 0)
> +               return gpio_mode;
> +
> +       switch (gpio_mode) {
> +       case DA9062_PIN_ALTERNATE:
> +               return -ENOTSUPP;
> +       case DA9062_PIN_GPI:
> +               return 1;
> +       case DA9062_PIN_GPO_OD:
> +       case DA9062_PIN_GPO_PP:
> +               return 0;

We recently added defines for these directions in
<linux/gpio/driver.h>:

#define GPIO_LINE_DIRECTION_IN  1
#define GPIO_LINE_DIRECTION_OUT 0

Please use these. (Soon in Torvald's tree, else
in my "devel" branch.)

> +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> +                                      unsigned int offset)
> +{
> +       struct da9062_pctl *pctl = gpiochip_get_data(gc);
> +       struct regmap *regmap = pctl->da9062->regmap;
> +       struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
> +       unsigned int gpi_type;
> +       int ret;
> +
> +       ret = da9062_pctl_set_pin_mode(regmap, offset, DA9062_PIN_GPI);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * If the gpio is active low we should set it in hw too. No worries
> +        * about gpio_get() because we read and return the gpio-level. So the
> +        * gpiolib active_low handling is still correct.
> +        *
> +        * 0 - active low, 1 - active high
> +        */
> +       gpi_type = !gpiod_is_active_low(desc);

That's interesting. Correct too, I guess.

> +static int da9062_gpio_direction_output(struct gpio_chip *gc,
> +                                       unsigned int offset, int value)
> +{
> +       /* Push-Pull / Open-Drain options are configured during set_config */
> +       da9062_gpio_set(gc, offset, value);

That looks dangerous. There is no guarantee that .set_config()
always gets called.

Please create a local state container for the mode of each pin in
struct da9062_pctl and set it to push-pull by default at probe, then
set this to whatever the state is here and let the .set_config()
alter it later if need be.

If we don't do that you will get boot-time defaults I think and that
might create bugs.

> +static int da9062_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
> +                                 unsigned long config)
> +{
(...)
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +               return da9062_pctl_set_pin_mode(regmap, offset,
> +                                               DA9062_PIN_GPO_OD);
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +               return da9062_pctl_set_pin_mode(regmap, offset,
> +                                               DA9062_PIN_GPO_PP);

So also store this in the per-pin state.

Yours,
Linus Walleij
