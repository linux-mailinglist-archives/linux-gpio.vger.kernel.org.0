Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE65386C1C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 23:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237845AbhEQVUS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 17:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbhEQVUR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 17:20:17 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC26C061573;
        Mon, 17 May 2021 14:19:00 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id 10so5869307pfl.1;
        Mon, 17 May 2021 14:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HmtmSlANL5hXoX5/p9EqO9MY89a2/kaIYLyVwNKJMYg=;
        b=W8edT1gRe6XOTX2A1r44kRpv4L9Q3PtPiEGIp1rDQNfRbxWhe3/FMeAV75Qe/H39H0
         o7JI3D4wQv5DvaQWKiza8vh+rxW9sg3rzYKtVCxtL68Gmw+fuemWEkSnM+/b+UB59FcG
         3COaFg2IBjeXQwkMIlIFTcYGDTN3ZWJ5k2zo+IfSgYJTArEYv0ld7JY6N7QtKGhpenD3
         xna+/Isgh6gVfL9vFW6mTc2Oya0pZVs4tBiqgjH6wVGUQS12kX2OQOy56OT2lbMe9XL4
         SjNqlRlPlGWx1t2TaDIs712ghW+AiZNwgWO5fIkQIzfjuJkzgsCus88w3jH5uxVQh20r
         87ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HmtmSlANL5hXoX5/p9EqO9MY89a2/kaIYLyVwNKJMYg=;
        b=lN6dFXLD3pZirhsZlX1g3IPNNPdfznGCUSDWDMJPifPdTMsHqIt2uYX2QHfMHMTHav
         YmlXvVcGCSb406e/4iDpHQCHazGqjbLgfvvmbPh5QahQX/AAOX3QnvCpqxrLgkXk9N+w
         EKlgPEevIVb+zuGyLnUKKyh7TsU2Cd6OXLEx/VnoDitgrYwG5tgVlAuPWhk/ZTr+4dLW
         UVhSZKpcurcVi7cQDuBAjCR0MCVfUTfwI+RAYXs89p2/wKCIGEwy4huV7EEj6oKYZk7W
         T+gTpxTq9tHi1mrgJH8EItE9kXF3QH0ivkLVIzAs9RNVf8Mqn6u7S9dDJ0GavW6Nchy/
         /h6g==
X-Gm-Message-State: AOAM531Qe9PWVDLARG/xrDtNAUGLBquheziny/pfnCyibDadH4TBOoSU
        ipcJ/qwX2Fq8b7JbPIAzWyBWYlryt8zdwzYWQ4k=
X-Google-Smtp-Source: ABdhPJxrzCSbJpWzIydyyWcxiebEG1ZpDDpq/sKkRgLvOnkeGgPI7sqMUTVOjYrbQ+vUtUMVItnNcNHwkRG5j3wP69U=
X-Received: by 2002:a05:6a00:1591:b029:2d9:369a:b846 with SMTP id
 u17-20020a056a001591b02902d9369ab846mr1659775pfk.40.1621286340365; Mon, 17
 May 2021 14:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621279162.git.sander@svanheule.net> <f1ca940216c0accfc804afee2dbe46d260d890ae.1621279162.git.sander@svanheule.net>
In-Reply-To: <f1ca940216c0accfc804afee2dbe46d260d890ae.1621279162.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 May 2021 00:18:43 +0300
Message-ID: <CAHp75Vc5a4PsHsJ2sNsRNT7BaBJ=Kxb+KKM7x7jWeRdOS8WfnQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] mfd: Add RTL8231 core device
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net> wrote:
>
> The RTL8231 is implemented as an MDIO device, and provides a regmap
> interface for register access by the core and child devices.
>
> The chip can also be a device on an SMI bus, an I2C-like bus by Realtek.
> Since kernel support for SMI is limited, and no real-world SMI
> implementations have been encountered for this device, this is currently
> unimplemented. The use of the regmap interface should make any future
> support relatively straightforward.
>
> After reset, all pins are muxed to GPIO inputs before the pin drivers
> are enabled. This is done to prevent accidental system resets, when a
> pin is connected to the parent SoC's reset line.

> [missing MDIO_BUS dependency, provided via REGMAP_MDIO]
> Reported-by: kernel test robot <lkp@intel.com>

What is the culprit? Shouldn't this have a Fixes tag?

...

> +         Support for the Realtek RTL8231 GPIO and LED expander.
> +         Provides up to 37 GPIOs, 88 LEDs, and one PWM output.

> +         When built as a module, this module will be named rtl8231_expander.

The name is not the one it will be according to Makefile.

> +obj-$(CONFIG_MFD_RTL8231)      += rtl8231.o

...

> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mdio.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>

...

> +static int rtl8231_init(struct device *dev, struct regmap *map)
> +{
> +       unsigned int ready_code;
> +       unsigned int v;

> +       int err = 0;

Redundant assignment.

> +       err = regmap_read(map, RTL8231_REG_FUNC1, &v);

> +       ready_code = FIELD_GET(RTL8231_FUNC1_READY_CODE_MASK, v);

If we got an error why we need a read_core, what for?

> +       if (err) {
> +               dev_err(dev, "failed to read READY_CODE\n");
> +               return err;

> +       } else if (ready_code != RTL8231_FUNC1_READY_CODE_VALUE) {

Redundant 'else'.

> +               dev_err(dev, "RTL8231 not present or ready 0x%x != 0x%x\n",
> +                       ready_code, RTL8231_FUNC1_READY_CODE_VALUE);
> +               return -ENODEV;
> +       }

...

> +       return err;

Is it somehow different to 0?

> +}

...

> +static int rtl8231_mdio_probe(struct mdio_device *mdiodev)
> +{
> +       struct device *dev = &mdiodev->dev;
> +       struct regmap_field *led_start;
> +       struct regmap *map;
> +       int err;
> +
> +       map = devm_regmap_init_mdio(mdiodev, &rtl8231_mdio_regmap_config);

> +

Redundant blank line.

> +       if (IS_ERR(map)) {
> +               dev_err(dev, "failed to init regmap\n");
> +               return PTR_ERR(map);
> +       }
> +
> +       led_start = devm_regmap_field_alloc(dev, map, RTL8231_FIELD_LED_START);
> +       if (IS_ERR(led_start))
> +               return PTR_ERR(led_start);
> +
> +       dev_set_drvdata(dev, led_start);
> +
> +       mdiodev->reset_gpio = gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +       device_property_read_u32(dev, "reset-assert-delay", &mdiodev->reset_assert_delay);
> +       device_property_read_u32(dev, "reset-deassert-delay", &mdiodev->reset_deassert_delay);
> +
> +       err = rtl8231_init(dev, map);
> +       if (err)

Resource leakage.

> +               return err;
> +
> +       /* LED_START enables power to output pins, and starts the LED engine */
> +       regmap_field_write(led_start, 1);

> +       return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, rtl8231_cells,
> +               ARRAY_SIZE(rtl8231_cells), NULL, 0, NULL);

Ditto.

> +}

...

> +#ifdef CONFIG_PM

Replace this with __maybe_unused attribute.


> +#define RTL8231_PM_OPS (&rtl8231_pm_ops)

> +#else
> +#define RTL8231_PM_OPS NULL
> +#endif /* CONFIG_PM */

...

> +static const struct of_device_id rtl8231_of_match[] = {
> +       { .compatible = "realtek,rtl8231" },
> +       {},

No need to have a comma for the terminator line.

> +};

-- 
With Best Regards,
Andy Shevchenko
