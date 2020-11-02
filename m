Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F012A286E
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 11:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgKBKp2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 05:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgKBKp2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 05:45:28 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB05C0617A6;
        Mon,  2 Nov 2020 02:45:28 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id o129so10768235pfb.1;
        Mon, 02 Nov 2020 02:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LhCnUGGvMtfCUTy2sFAYomV/rVdE0OmDIDPKH106jyA=;
        b=Mrb+VHkPig+Gz2ws18HWsPaW6wzpeF53ZR89vDstG7LGmBWjl1oTNxAkKjMhIrABOw
         KtDF3uk08gP9ovE1mN/JgEBmTlBY/oQrPawEIcignYgq83Mi+2SRF4j/08/P7Fvr/Ogb
         CeMzOaJJsUhqh8FnqQQrsN/zb23RoxkqVlnUKQRO9s4lxu3cp2wufq5UIaJ68t0W/sM0
         6gULNyVzzdTU2JysV1VBTsKcx3igmnuofwjglh376/Tfi0lAGWD2s69mcZhIirdcddfW
         dHqfW7Ky0HPVkgc+yToWkrhfnvMzsXNyBqaWrL5JSLLoIUOD1MYM1/t9JVafxa9ZEg/y
         6QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LhCnUGGvMtfCUTy2sFAYomV/rVdE0OmDIDPKH106jyA=;
        b=fTcpgLeq9CYuZPRTcQmIBAEwknKncCoQzbALWsOyqxiVsE9zBLUc9dfBg26bSMe5Nk
         EmzAIBeKYdFW8HD/LBsS1LNQY6msTVuKvBAXt5tbdRtYQ6m6kxiOsU6iMM1wXDlTXgmj
         UBUaiDx7UO5pWV+t7k4gPP17QbliVEJoZxdqtjDuH9sbryhP8ZeMMqEBnHjVtYL7j+hG
         m3i7yXEvS3FftAlOk8YqNBuZB0oe9GJ7bmHVJUxIFnDJGfY5Qpo+FENGDG6GtEjDyn1f
         AWPJQ6yk1M/6IR/aVWirk2rH3EjhFAEmkYcCYAikCrJvwQuTiwrxr0l53jIbyYfX+hyC
         jAnA==
X-Gm-Message-State: AOAM53271hTEKgpRcipTXopfBF8ubS7STbNjsiZPIWXD5dFtpB2C3DJB
        ++qwLzxSDzCrXam/PU/x1IpHHP2wepySRXfCNpDv2tz1GTY=
X-Google-Smtp-Source: ABdhPJwhUH0lN4AV/9fiESeluGBqMxLSwNKfxxcfiOv0sKFSbOmKFHhp310+V4Di0TNuK10b1IbRYD9reDWjp6dxsAk=
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr16517348pjs.181.1604313927758;
 Mon, 02 Nov 2020 02:45:27 -0800 (PST)
MIME-Version: 1.0
References: <20201029134027.232951-1-lars.povlsen@microchip.com> <20201029134027.232951-3-lars.povlsen@microchip.com>
In-Reply-To: <20201029134027.232951-3-lars.povlsen@microchip.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 2 Nov 2020 12:46:16 +0200
Message-ID: <CAHp75VedcNP5x72PN4tqZ_0HhbCyd666T=AWn+TFr7Fp8EEs7Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl
 driver for Microsemi Serial GPIO
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2020 at 3:40 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
> This adds a pinctrl driver for the Microsemi/Microchip Serial GPIO
> (SGPIO) device used in various SoC's.

First Q is can you use gpio-regmap?
Second one, why this driver is a pin control? I haven't found any
evidence it can be plain GPIO.

Also note, if comment is given about one part of the code, you need to
check all the rest which are similar and address accordingly.

...

> +config PINCTRL_MICROCHIP_SGPIO
> +       bool "Pinctrl driver for Microsemi/Microchip Serial GPIO"

> +       depends on OF

I think this is not needed, see below.

> +       depends on HAS_IOMEM
> +       select GPIOLIB
> +       select GENERIC_PINCONF
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS

> +       select OF_GPIO

...neither this...

> +       help
> +         Support for the serial GPIO interface used on Microsemi and
> +         Microchip SoC's. By using a serial interface, the SIO
> +         controller significantly extends the number of available
> +         GPIOs with a minimum number of additional pins on the
> +         device. The primary purpose of the SIO controller is to
> +         connect control signals from SFP modules and to act as an
> +         LED controller.

...

Missed header here, like bits.h.

> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>

> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>

I think this driver is OF independent, if you convert the OF leftovers
to device_/fwnode_ API.

Then you need to drop these headers (most of them actually are
redundant even now) and add property.h. Also you missed
mod_devicetable.h.

> +#include <linux/clk.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/platform_device.h>

Perhaps ordered and linux/pinctrl/ be grouped after generic ones?

...

> +#define __shf(x)               (__builtin_ffs(x) - 1)
> +#define __BF_PREP(bf, x)       (bf & ((x) << __shf(bf)))
> +#define __BF_GET(bf, x)                (((x & bf) >> __shf(bf)))

Isn't it home grown reimplementation of bitfield.h?

...

> +static int sgpio_gpio_request_enable(struct pinctrl_dev *pctldev,
> +                                    struct pinctrl_gpio_range *range,
> +                                    unsigned int offset)
> +{
> +       struct sgpio_bank *bank = pinctrl_dev_get_drvdata(pctldev);
> +       struct sgpio_priv *priv = bank->priv;
> +       struct sgpio_port_addr addr;
> +
> +       sgpio_pin_to_addr(priv, offset, &addr);
> +
> +       if ((priv->ports & BIT(addr.port)) == 0) {
> +               dev_warn(priv->dev, "%s: Request port %d for pin %d is not activated\n",
> +                        __func__, addr.port, offset);

Don't use __func__ in messages, it's rarely needed and here I believe
is not the case.

> +       }
> +
> +       return 0;
> +}

...

> +       /* Note that the SGIO pin is defined by *2* numbers, a port
> +        * number between 0 and 31, and a bit index, 0 to 3.
> +        */

/*
 * Fix multi-line comment
 * style. Like in this example.
 */

...

> +static int microchip_sgpio_get_ports(struct sgpio_priv *priv)
> +{
> +       struct device *dev = priv->dev;
> +       struct device_node *np = dev->of_node;
> +       int i, ret;
> +       u32 range_params[64];

Better to use reversed xmas tree order.

> +       /* Calculate port mask */
> +       ret = of_property_read_variable_u32_array(np,
> +                                                 "microchip,sgpio-port-ranges",
> +                                                 range_params,
> +                                                 2,
> +                                                 ARRAY_SIZE(range_params));
> +       if (ret < 0 || ret % 2) {
> +               dev_err(dev, "%s port range\n",
> +                       ret == -EINVAL ? "Missing" : "Invalid");



> +               return ret;
> +       }
> +       for (i = 0; i < ret; i += 2) {
> +               int start, end;
> +
> +               start = range_params[i];
> +               end = range_params[i + 1];
> +               if (start > end || end >= SGPIO_BITS_PER_WORD) {
> +                       dev_err(dev, "Ill-formed port-range [%d:%d]\n",
> +                               start, end);
> +               }
> +               priv->ports |= GENMASK(end, start);
> +       }
> +
> +       return 0;
> +}

Doesn't GPIO / pin control framework have this helper already?
If no, have you considered to use proper bitmap API here? (For
example, bitmap_parselist() or so)

...

> +       if (fwnode_property_read_u32(fwnode, "ngpios", &ngpios)) {
> +               dev_info(dev, "failed to get number of gpios for bank%d\n",
> +                        bankno);
> +               ngpios = 64;
> +       }

Don't mix OF APIs with fwnode APIs.

...

> +       pins = devm_kzalloc(dev, sizeof(*pins)*ngpios, GFP_KERNEL);
> +       if (pins) {

Use usual pattern  and drop one level of indentation ('else' is redundant).

> +               int i;
> +               char *p, *names;

> +               names = devm_kzalloc(dev, PIN_NAM_SZ*ngpios, GFP_KERNEL);
> +
> +               if (!names)

Redundant blank line.

> +                       return -ENOMEM;

> +               for (p = names, i = 0; i < ngpios; i++, p += PIN_NAM_SZ) {
> +                       struct sgpio_port_addr addr;
> +
> +                       sgpio_pin_to_addr(priv, i, &addr);

> +                       snprintf(p, PIN_NAM_SZ, "SGPIO_%c_p%db%d",
> +                                is_input ? 'I' : 'O',
> +                                addr.port, addr.bit);

Wow, snprintf() with constant size argument in a loop. Are you sure
you are doing correct?

> +                       pins[i].number = i;
> +                       pins[i].name = p;
> +               }
> +       } else
> +               return -ENOMEM;

...

> +       pctldev = devm_pinctrl_register(dev, pctl_desc, bank);
> +       if (IS_ERR(pctldev)) {
> +               dev_err(dev, "Failed to register pinctrl\n");
> +               return PTR_ERR(pctldev);
> +       }

return dev_err_probe(...);

...

> +       /* Get clock */

Useless comment.

> +       clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(clk)) {

> +               dev_err(dev, "Failed to get clock\n");
> +               return PTR_ERR(clk);

dev_err_probe() as above.

> +       }

...

> +       /* Get register map */

Useless comment.

...

> +       nbanks = device_get_child_node_count(dev);
> +       if (nbanks != 2) {
> +               dev_err(dev, "Must have 2 banks (have %d)\n", nbanks);
> +               return -EINVAL;
> +       }

Don't mix device_property API with OF one.

> +       i = 0;
> +       device_for_each_child_node(dev, fwnode) {

Ditto.

> +               ret = microchip_sgpio_register_bank(dev, priv, fwnode, i++);
> +               if (ret)
> +                       return ret;
> +       }

-- 
With Best Regards,
Andy Shevchenko
