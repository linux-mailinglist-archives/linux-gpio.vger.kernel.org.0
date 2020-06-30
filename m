Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1328A20FF58
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 23:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729586AbgF3Vhs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 17:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbgF3Vhs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 17:37:48 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2870EC03E979;
        Tue, 30 Jun 2020 14:30:32 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id z5so10551936pgb.6;
        Tue, 30 Jun 2020 14:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U5xBvyLpKOr/G1/pIFdkzOP1KvMJUbskSgpplnzTGZI=;
        b=gevpHk/D1CiRUe+JiEVZKBwZOlT3CTqvldVFKaCoAWevvxp+XA4korqzj0TRMUe+GH
         ROtO1q5n35lNEaUWn/Xh15IBjZbXom5TnEBdzyMqDelZ8M1uLtOoLxs6MnxxPWFNPthD
         W/zEuJjuIvRoXqavNpwVtPMzERJ9wi/tSR2U51AakuS6Na/FgE9Ej0/odVcxc7100bDi
         MB5hVx5O1AA8BHcbuc7lShjAHIuXE4CARRd8+UrZhpK2yq0SHu0pazrfpqe6DQwayhAL
         ZVBmqw/AoCf6S6aji47kWb+RqNVCerXFqmiY6vX4M1oxX5qR6eGNNdSlKFbsKf7+HnAO
         P2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U5xBvyLpKOr/G1/pIFdkzOP1KvMJUbskSgpplnzTGZI=;
        b=btu8o+JMu0YthnU7sjHB64EO57nS9ckUpaQ7XLJ4FXARQ0RoDTd8yEfnBXR6G9tllu
         JxVJyhq3cK7AAcZt8rW1QSi6+t4kC1ayEpnPnZXNnPStdpFFw9L0eFSG8/gH4B5G1cqV
         5P1k6eV9MUokbQgxIR1vuC6rZ4MAC8juWVi9d7zhXrx2acKYsU6tMzvALZ8dnN/4y7UN
         yleUKLV7Mr0jIYvut3ZuRfuPjazIgJogaPfj24eSXuFNZmjonaq4RGJ3Y5UNyI8hycZx
         pGe3fGJD+UmiZnfBNe58sVX53WdAb1VOQyNQFABdlOvYY0diqxWPEcUton+mpAnDfiGO
         mNIA==
X-Gm-Message-State: AOAM533OIhAXt9VHDtrHaNXx7Gg3M9HmyAPCfHHQGc2ACGJ67x6ochzu
        m1i3G7Po2V0IZioJ5DTc5VVp/yQlx7SwJaflggw=
X-Google-Smtp-Source: ABdhPJzbOoHlqgM660bd9qepiHFkNNh62/L3fKtE0vDOVY0GuMzH3AFdRlI4do6SnkdmD9SmwSBIoq+4vBUsVd7s8qs=
X-Received: by 2002:a62:7657:: with SMTP id r84mr20132713pfc.130.1593552631611;
 Tue, 30 Jun 2020 14:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200630160736.1196697-1-mans0n@gorani.run>
In-Reply-To: <20200630160736.1196697-1-mans0n@gorani.run>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Jul 2020 00:30:15 +0300
Message-ID: <CAHp75VfuvuMQ3r_SHSUzE78TViQMqDCqPLEZ4eUjLVUpNHj7kA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 7:08 PM Sungbo Eo <mans0n@gorani.run> wrote:
>
> NXP PCA9570 is 4-bit I2C GPO expander without interrupt functionality.
> Its ports are controlled only by a data byte without register address.
>
> As there is no other driver similar enough to be adapted for it, a new
> driver is introduced here.
>

It looks good, but I would add ->get() to return buffered value.

> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> ---
> v3:
> * remove mutex
> * rename buffer to out
> * simplify return statements
> * replace ->probe() to ->probe_new()
> * move ngpio to driver_data
>   (PCA9571 is 8-bit so I thought making ngpio configurable is a good idea)
>
> v2:
> * move the direction functions below the set functions
> * use devm_gpiochip_add_data() and remove the remove callback
>
> v1:
> Tested in kernel 5.4 on an ipq40xx platform.
>
> This is my first time submitting a whole driver patch, and I'm not really
> familiar with this PCA expander series.
> Please let me know how I can improve this patch further.
>
> FYI there's an unmerged patch for this chip.
> http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2017-May/105602.html
> I don't have PCA9571 either so I didn't add support for it.
> ---
>  drivers/gpio/Kconfig        |   8 +++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-pca9570.c | 131 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 drivers/gpio/gpio-pca9570.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c6b5c65c8405..d10dcb81b841 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -962,6 +962,14 @@ config GPIO_PCA953X_IRQ
>           Say yes here to enable the pca953x to be used as an interrupt
>           controller. It requires the driver to be built in the kernel.
>
> +config GPIO_PCA9570
> +       tristate "PCA9570 4-Bit I2C GPO expander"
> +       help
> +         Say yes here to enable the GPO driver for the NXP PCA9570 chip.
> +
> +         To compile this driver as a module, choose M here: the module will
> +         be called gpio-pca9570.
> +
>  config GPIO_PCF857X
>         tristate "PCF857x, PCA{85,96}7x, and MAX732[89] I2C GPIO expanders"
>         select GPIOLIB_IRQCHIP
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 1e4894e0bf0f..33cb40c28a61 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -110,6 +110,7 @@ obj-$(CONFIG_GPIO_OCTEON)           += gpio-octeon.o
>  obj-$(CONFIG_GPIO_OMAP)                        += gpio-omap.o
>  obj-$(CONFIG_GPIO_PALMAS)              += gpio-palmas.o
>  obj-$(CONFIG_GPIO_PCA953X)             += gpio-pca953x.o
> +obj-$(CONFIG_GPIO_PCA9570)             += gpio-pca9570.o
>  obj-$(CONFIG_GPIO_PCF857X)             += gpio-pcf857x.o
>  obj-$(CONFIG_GPIO_PCH)                 += gpio-pch.o
>  obj-$(CONFIG_GPIO_PCIE_IDIO_24)                += gpio-pcie-idio-24.o
> diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
> new file mode 100644
> index 000000000000..3898d1c6f407
> --- /dev/null
> +++ b/drivers/gpio/gpio-pca9570.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for PCA9570 I2C GPO expander
> + *
> + * Copyright (C) 2020 Sungbo Eo <mans0n@gorani.run>
> + *
> + * Based on gpio-tpic2810.c
> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
> + *     Andrew F. Davis <afd@ti.com>
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +
> +/**
> + * struct pca9570 - GPIO driver data
> + * @chip: GPIO controller chip
> + * @client: I2C device pointer
> + * @out: Buffer for device register
> + */
> +struct pca9570 {
> +       struct gpio_chip chip;
> +       struct i2c_client *client;
> +       u8 out;
> +};
> +
> +static void pca9570_set_mask_bits(struct gpio_chip *chip, u8 mask, u8 bits)
> +{
> +       struct pca9570 *gpio = gpiochip_get_data(chip);
> +       u8 buffer;
> +       int err;
> +
> +       buffer = (gpio->out & ~mask) | (bits & mask);
> +
> +       err = i2c_smbus_write_byte(gpio->client, buffer);
> +       if (err)
> +               return;
> +
> +       gpio->out = buffer;
> +}
> +
> +static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
> +{
> +       pca9570_set_mask_bits(chip, BIT(offset), value ? BIT(offset) : 0);
> +}
> +
> +static void pca9570_set_multiple(struct gpio_chip *chip, unsigned long *mask,
> +                                unsigned long *bits)
> +{
> +       pca9570_set_mask_bits(chip, *mask, *bits);
> +}
> +
> +static int pca9570_get_direction(struct gpio_chip *chip,
> +                                unsigned offset)
> +{
> +       /* This device always output */
> +       return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int pca9570_direction_input(struct gpio_chip *chip,
> +                                  unsigned offset)
> +{
> +       /* This device is output only */
> +       return -EINVAL;
> +}
> +
> +static int pca9570_direction_output(struct gpio_chip *chip,
> +                                   unsigned offset, int value)
> +{
> +       /* This device always output */
> +       pca9570_set(chip, offset, value);
> +       return 0;
> +}
> +
> +static const struct gpio_chip template_chip = {
> +       .label                  = "pca9570",
> +       .owner                  = THIS_MODULE,
> +       .get_direction          = pca9570_get_direction,
> +       .direction_input        = pca9570_direction_input,
> +       .direction_output       = pca9570_direction_output,
> +       .set                    = pca9570_set,
> +       .set_multiple           = pca9570_set_multiple,
> +       .base                   = -1,
> +       .can_sleep              = true,
> +};
> +
> +static const struct i2c_device_id pca9570_id_table[] = {
> +       { "pca9570", 4 },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
> +
> +static const struct of_device_id pca9570_of_match_table[] = {
> +       { .compatible = "nxp,pca9570" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
> +
> +static int pca9570_probe(struct i2c_client *client)
> +{
> +       struct pca9570 *gpio;
> +
> +       gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
> +       if (!gpio)
> +               return -ENOMEM;
> +
> +       gpio->chip = template_chip;
> +       gpio->chip.parent = &client->dev;
> +       gpio->chip.ngpio = i2c_match_id(pca9570_id_table, client)->driver_data;
> +
> +       gpio->client = client;
> +
> +       i2c_set_clientdata(client, gpio);
> +
> +       return devm_gpiochip_add_data(&client->dev, &gpio->chip, gpio);
> +}
> +
> +static struct i2c_driver pca9570_driver = {
> +       .driver = {
> +               .name = "pca9570",
> +               .of_match_table = pca9570_of_match_table,
> +       },
> +       .probe_new = pca9570_probe,
> +       .id_table = pca9570_id_table,
> +};
> +module_i2c_driver(pca9570_driver);
> +
> +MODULE_AUTHOR("Sungbo Eo <mans0n@gorani.run>");
> +MODULE_DESCRIPTION("GPIO expander driver for PCA9570");
> +MODULE_LICENSE("GPL v2");
> --
> 2.27.0
>


-- 
With Best Regards,
Andy Shevchenko
