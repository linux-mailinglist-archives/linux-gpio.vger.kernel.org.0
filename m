Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C1738FC54
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 10:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhEYINQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 04:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231303AbhEYIMU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 04:12:20 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18887C0612A6
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 01:08:41 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id p39so6646071pfw.8
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 01:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=75XRIfIEgHlJfl/WDjj50cBlBJrq+0slcEaWeiveqgo=;
        b=rxvAw4SR2G0PDjav9NZ4aH3jmi3+m70MdvFyB9W/KLLMeI2d1Zjr3awxGryrbD3j9d
         ZGtk1yYT/8hr944kePRjTylWaasPuncblxA+F1RxeliDghDHwl+VtR9YiPBgZhbbE9gp
         BU3AKSssadF9wwBR/i0O5zWRHTzvn3nZSYQBpDIyo1r1Im+XdKm2XmoUYA9wSL0eToep
         BWg7uSuQwYD/LPyxI5PoEuBY1Zbv6S2t2ngMoYBiVjMU3RnxHLRrRkBOPHOU/OHlaUgk
         f0CrzLMuvB0s6L3AqkgE0SN1KwRFDIEv66Em6COyZpd0O8GfsmXRnbmySh1bMPnDBvVr
         szYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=75XRIfIEgHlJfl/WDjj50cBlBJrq+0slcEaWeiveqgo=;
        b=SOQp5Z+3KRxg05sVAYpeNOxdhnaI5YXpYimwKXPh2EvQykaYZOXAsRdBqLWwHZuimm
         2Tr8VdDT+kTWXCBq2IXEOTbYWfGOXdOc/GBWf4FzKY4lrap52+qfmEkn/XwsMIcxaFno
         UzerNRZF5afk5KeMeZuVXu3CGrOPO+utPJtypRQD8yNhzY0ve8nt3C+8KQ0yBIpLMbA7
         7tCZNBVGDY9o9ONvkzK+r79MJ5wxm0iSbvfl8czhvcQZ58HnPkLYeINOYqKb2xRJfYzq
         McBiwwGNK0TVTQ2dLI2jENpML8n+E0R8FaHdyKs3SmRhaiYOS6LlgSV/d/Pnbp8juQ9B
         rPNQ==
X-Gm-Message-State: AOAM5314Qf2AQ9K/eVUvXkTX179/ei/XbMkJkHdYay36bevXt69J1DHb
        tSuGzA7pcVw5jk5tmhxLCJdnKI9JiLzXBlv3HJI=
X-Google-Smtp-Source: ABdhPJwNEJimO6Xc3pFsJifT10Y18RGcK2TNfzMl+FfyP+eKkz+h4t20IXJSrn9/deIxlC2It5Hz2U6fKcp/pibFf1Q=
X-Received: by 2002:a62:bd07:0:b029:2df:2c0a:d5e9 with SMTP id
 a7-20020a62bd070000b02902df2c0ad5e9mr28532152pff.7.1621930120106; Tue, 25 May
 2021 01:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210525054149.1792-1-kunyang_fan@asus.com> <20210525054149.1792-2-kunyang_fan@asus.com>
In-Reply-To: <20210525054149.1792-2-kunyang_fan@asus.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 25 May 2021 11:08:24 +0300
Message-ID: <CAHp75VfHEv9xOZT6BKUcjwL2RcoDyv+ZknvvLqU1exZJW=uNRQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpio: add driver for AAEON devices
To:     aaeon.asus@gmail.com
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        AceLan Kao <acelan.kao@canonical.com>,
        Kunyang_Fan <kunyang_fan@asus.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 8:42 AM <aaeon.asus@gmail.com> wrote:
>
> From: Kunyang_Fan <kunyang_fan@asus.com>
>
> This patch add support for the GPIO pins whose control are
> transported to BIOS through ASUS WMI interface.
>
> Signed-off-by: Kunyang_Fan <kunyang_fan@asus.com>

Missed SoB of the submitter. Dunno if it's a critical issue.

...

> +obj-$(CONFIG_GPIO_AAEON)                += gpio-aaeon.o

Way too generic file name. So the configuration option name.

...

> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.

Same as for all patches.

...

> +static int aaeon_gpio_get_number(void);
> +static int aaeon_gpio_get_direction(struct gpio_chip *chip,
> +                                unsigned int offset);
> +static int aaeon_gpio_output_set_direction(struct gpio_chip *chip,
> +                                unsigned int offset, int value);
> +static int aaeon_gpio_input_set_direction(struct gpio_chip *chip,
> +                                unsigned int offset);
> +static int aaeon_gpio_get(struct gpio_chip *chip,
> +                                unsigned int offset);
> +static void aaeon_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +                                int value);

Why forward declarations?!

...

> +static int aaeon_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
> +{

> +       int err, retval;
> +       u32 dev_id = 0x0;

Reversed xmas tree order.

> +       dev_id |= offset;

Just keep it in the definition block

       u32 dev_id = offset;

Ditto for all the rest similar lines.

> +       err = asus_wmi_evaluate_method(GET_DIRECTION_METHOD_ID, dev_id,
> +                                      0, &retval);
> +       if (err)
> +               return err;
> +
> +       return retval;
> +}

...

> +static int __init aaeon_gpio_probe(struct platform_device *pdev)
> +{
> +       int err, i;
> +       int dio_number = 0;
> +       struct aaeon_gpio_data *data;
> +       struct aaeon_gpio_bank *bank;

Reversed xmas tree order, same for the all similar places across the series.


> +       /* Prevent other drivers adding this platfom device */
> +       if (!wmi_has_guid(AAEON_WMI_MGMT_GUID)) {
> +               pr_debug("AAEON Management GUID not found\n");
> +               return -ENODEV;
> +       }

Dead code?

> +       dio_number = aaeon_gpio_get_number();
> +       if (dio_number < 0)
> +               return -ENODEV;

Why shadowing error code?

> +       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->nr_bank = ARRAY_SIZE(aaeon_gpio_bank);
> +       data->bank = aaeon_gpio_bank;
> +       platform_set_drvdata(pdev, data);
> +       bank = &data->bank[0];
> +       bank->chip.parent = &pdev->dev;
> +       bank->chip.ngpio = dio_number;
> +       bank->data = data;

+ blank line

> +       err = devm_gpiochip_add_data(&pdev->dev, &bank->chip, bank);
> +       if (err)
> +               pr_debug("Failed to register gpiochip %d: %d\n", i, err);
> +
> +       return err;

Besides the fact of using dev_dbg() and another fact that it is not
needed (device core can print it for you)

return devm_...(...);

> +}

...

> +

Redundant blank line (same applies for entire series).

> +module_platform_driver_probe(aaeon_gpio_driver, aaeon_gpio_probe);

-- 
With Best Regards,
Andy Shevchenko
