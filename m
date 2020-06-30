Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D2C20F169
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 11:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731272AbgF3JSs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 05:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729866AbgF3JSr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 05:18:47 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296DAC03E979
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 02:18:47 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id l6so17904585qkc.6
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 02:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yajFcXutlyuUzXy6XrHRrjFI2VbI//s8KLRf+4QmWBo=;
        b=FAJaW2kEMqg+Eibw8vg8/cs1Xr3KiMYlvgcGE6tU3+20StMG5tPd8qBDeyg4ij50u2
         TWWF0L828wRFQ7/B2Y3+a7lZugpLhKr/t4HZWKDYE0iIoAGdDXGGfZdRB+wrtXlkgoB0
         3oTwopapi3G8a4LyEkRuHP3XP4pzbbM1GUscBxfiKeLC1NjFdTO3zeTKrhfLnGUnZd9u
         Xi0zNxeJxSF2C98x0uKzf0EFxBBR44DKRCTvEyDjmxRTY9tvzABqiWnD8kilGeqbOqI9
         r5wZjOP744G5Nl0StX1JVRqxCXiv+tdZQOwxs5QdbxUfeW9uUsYQqlgb7z9e9nifxMA3
         IYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yajFcXutlyuUzXy6XrHRrjFI2VbI//s8KLRf+4QmWBo=;
        b=FG7BfcZ0j0rILkxOLCqUqHCHhKta8JPExNEMZ/txa4TLnmSDsgDC8bhBwkyC2q3iSH
         +y1ESBnf8PNXc6GyKaNQq6/fQoCZbafvmF4BCFU29exyq0i3T5YplhscIuFIzaUYOj4y
         ZYdEZqZUwfpPQjAkNyhNQm0zGAXR1SKDDwe3HhlaHl3wH8t6ke5/xJjnhk92S0wwm6t8
         HU9WAGT05Ln71xSWXILb5Zl7Hr7QPeo+rYDQIckMIp3tBeBfQK+alob9mRvtV8udKYru
         x1HAA2FYV+RicrpiUqCkKaA5t6hbhI+1N2eSsqE6GNpxphfkkyxVKTwy6Y1DZ2RODUJn
         14nA==
X-Gm-Message-State: AOAM533U7nf3ahlidIglcSkE59zFdzG+jteBN/+9RrtTpwL/4C0lxV5B
        io/2CuWXHxktML8UWPzc8d5u8B/jGAMQ/8KY1XhqmQ==
X-Google-Smtp-Source: ABdhPJxrawPMLg0aITxW+2XdI/OX7FTuR+6QiUPJ8FUGnCSz6nWPmPlzoCa+ca9sT3mq3U8FX5EFfHN8hUhoBXH8cEo=
X-Received: by 2002:a37:9c81:: with SMTP id f123mr17654644qke.21.1593508726111;
 Tue, 30 Jun 2020 02:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200625075805.363918-1-mans0n@gorani.run>
In-Reply-To: <20200625075805.363918-1-mans0n@gorani.run>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 30 Jun 2020 11:18:35 +0200
Message-ID: <CAMpxmJXDHX-U-HWR8093orBU1ZxEeWp_r2Xar+k5FMoZ1pS78Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2020 at 9:58 AM Sungbo Eo <mans0n@gorani.run> wrote:
>
> NXP PCA9570 is 4-bit I2C GPO expander without interrupt functionality.
> Its ports are controlled only by a data byte without register address.
>
> As there is no other driver similar enough to be adapted for it, a new
> driver is introduced here.
>
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>

Hi Sungbo,

on top of Andy's review, here are some more nits I spotted.

> ---
> v2:
> * move the direction functions below the set functions
> * use devm_gpiochip_add_data() and remove the remove callback
>
> v1:
> Tested in kernel 5.4 on an ipq40xx platform.
>
> This is my first time submitting a whole driver patch, and I'm not really familiar with this PCA expander series.
> Please let me know how I can improve this patch further.
>
> FYI there's an unmerged patch for this chip.
> http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2017-May/105602.html
> I don't have PCA9571 either so I didn't add support for it.
> ---
>  drivers/gpio/Kconfig        |   8 ++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-pca9570.c | 148 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 157 insertions(+)
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
> index 000000000000..e6b6c4e791c0
> --- /dev/null
> +++ b/drivers/gpio/gpio-pca9570.c
> @@ -0,0 +1,148 @@
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
> +#include <linux/mutex.h>
> +
> +/**
> + * struct pca9570 - GPIO driver data
> + * @chip: GPIO controller chip
> + * @client: I2C device pointer
> + * @buffer: Buffer for device register
> + * @lock: Protects write sequences
> + */
> +struct pca9570 {
> +       struct gpio_chip chip;
> +       struct i2c_client *client;
> +       u8 buffer;

Could you rename it to reg or something else more obvious? A buffer
can be for anything.

> +       struct mutex lock;
> +};
> +
> +static void pca9570_set_mask_bits(struct gpio_chip *chip, u8 mask, u8 bits)
> +{
> +       struct pca9570 *gpio = gpiochip_get_data(chip);
> +       u8 buffer;
> +       int err;
> +
> +       mutex_lock(&gpio->lock);
> +
> +       buffer = gpio->buffer & ~mask;
> +       buffer |= (mask & bits);
> +
> +       err = i2c_smbus_write_byte(gpio->client, buffer);
> +       if (!err)
> +               gpio->buffer = buffer;
> +
> +       mutex_unlock(&gpio->lock);
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
> +       .ngpio                  = 4,
> +       .can_sleep              = true,
> +};
> +
> +static const struct of_device_id pca9570_of_match_table[] = {
> +       { .compatible = "nxp,pca9570" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, pca9570_of_match_table);

If you're not using it in probe than maybe move it next to the I2C device table?

> +
> +static int pca9570_probe(struct i2c_client *client,
> +                        const struct i2c_device_id *id)
> +{
> +       struct pca9570 *gpio;
> +       int ret;
> +
> +       gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
> +       if (!gpio)
> +               return -ENOMEM;
> +
> +       i2c_set_clientdata(client, gpio);
> +
> +       gpio->chip = template_chip;
> +       gpio->chip.parent = &client->dev;
> +
> +       gpio->client = client;
> +
> +       mutex_init(&gpio->lock);
> +
> +       ret = devm_gpiochip_add_data(&client->dev, &gpio->chip, gpio);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "Unable to register gpiochip\n");

You don't need this message, the core library will print something for
you. Just do return devm_gpiochip_add_data().

> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct i2c_device_id pca9570_id_table[] = {
> +       { "pca9570", },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
> +
> +static struct i2c_driver pca9570_driver = {
> +       .driver = {
> +               .name = "pca9570",
> +               .of_match_table = pca9570_of_match_table,
> +       },
> +       .probe = pca9570_probe,
> +       .remove = pca9570_remove,
> +       .id_table = pca9570_id_table,
> +};
> +module_i2c_driver(pca9570_driver);
> +
> +MODULE_AUTHOR("Sungbo Eo <mans0n@gorani.run>");
> +MODULE_DESCRIPTION("GPIO expander driver for PCA9570");
> +MODULE_LICENSE("GPL v2");
> --

Bart
