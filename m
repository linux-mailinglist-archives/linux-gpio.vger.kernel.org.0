Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B12221A3D9
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 17:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgGIPhZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 11:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgGIPhZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 11:37:25 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315A2C08C5CE;
        Thu,  9 Jul 2020 08:37:25 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ls15so1289384pjb.1;
        Thu, 09 Jul 2020 08:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w7Ubvg8e4zQNRdPMZFAOJHoQs4EP5RxpwlppI/L4fWY=;
        b=mnLqwOIUc0256uzhoNrPwY9e5iUO3z3xTNu0NVvh88SixdQHzfZwqYpXZ+0AslLx/K
         RRLA4WyPd4US0zEc84eEvCSHr+TSf3H+bufyh0QESS8vn92CbutSZjZvVTGNA6PaOo0v
         QvVjiBO1QbG0vje32ngNnAqlocP+Uz/uXYu90v+evzVt9F4WM5SQ3GZ0DhSVqp/cq2bs
         45NrKmNK2HMOxc0NueSKcjX+k4fIeKbE+hDvx7LItGckhwHoJ9sp0gQG9vUIeDy6xkX0
         9v7EvirdaJAb6SBzmtS9R8LZRifsXalQ0entH4WvcABFIyR+AcZTFX1fQNemepQ3ES89
         kUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w7Ubvg8e4zQNRdPMZFAOJHoQs4EP5RxpwlppI/L4fWY=;
        b=CjlvM4C3g8ZtS+1DuFSZugN8ixdeSj7ZS4pBtE81uugrQeZR/0hJASdJENjqQiMR6A
         b8pmi3s7ZEMARvrwKzQiypUgkjJ24EPIGijHaHb+o6mQo94IA6KIRUNnXkN3xrGq1yka
         DJI8VzTo/dLIT/tC4Oe/OzZhByWTt6QzsMvITR9XOMp2VQT9BeBTADiG+jkgPK9MEAjX
         WguZMp8qOlNTYhgVNXN7Xw9tifO4sY8/w7XTki0JfBevErxI6N6Rl26aZ0AlmogNi+PY
         LKoFnjzHU644trQRJdxyQM89LK0j52EZmyPRVQlCMFND80NxSu7KpEs3+q0swiMlp3SR
         euIQ==
X-Gm-Message-State: AOAM531P7+Q5Acln2hgHSKy7ideqqtns9D6hBuLm4D+NGzgZTaPrMEIk
        5CgWxvvK36S4M+9N0um+Y+VUXMPn6iQ5DB5+T+M=
X-Google-Smtp-Source: ABdhPJwSIb2mCf7y9jWBwxvwEVXI/jcfu33HDPP/ejPHESI+6eNys6v3UUWEzXY8sccdw1wmI6vSa0FD5uExN+uLaoA=
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr642166pjb.129.1594309044632;
 Thu, 09 Jul 2020 08:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200709134829.216393-1-mans0n@gorani.run>
In-Reply-To: <20200709134829.216393-1-mans0n@gorani.run>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 18:37:08 +0300
Message-ID: <CAHp75VenQVhgkH7FORFAb5WJaBB-s2ktoKR+3xCeA=y7b90oFw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] gpio: add GPO driver for PCA9570
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

On Thu, Jul 9, 2020 at 4:48 PM Sungbo Eo <mans0n@gorani.run> wrote:
>
> NXP PCA9570 is a 4-bit I2C GPO expander without interrupt functionality.
> Its ports are controlled only by a data byte without register address.
>

LGTM, thanks!

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA9570.pdf
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> ---
> v6:
> * removed client
> * re-added mutex
> * removed template_chip
>
> v5:
> * amended the commit message
> * removed unnecessary castings
> * added data to of_match_table
>
> v4:
> * removed ->direction_input() and ->direction_output()
>   (Seems unnecessary to me)
> * removed ->set_multiple()
>   (I'm not sure this implementation is really correct)
> * added ->get()
>   (DS says we can read the status from the device)
> * read current status during probe
>
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
>  drivers/gpio/Kconfig        |   8 ++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-pca9570.c | 146 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 155 insertions(+)
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
> index 000000000000..cb2b2f735c15
> --- /dev/null
> +++ b/drivers/gpio/gpio-pca9570.c
> @@ -0,0 +1,146 @@
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
> +#include <linux/property.h>
> +
> +/**
> + * struct pca9570 - GPIO driver data
> + * @chip: GPIO controller chip
> + * @lock: Protects write sequences
> + * @out: Buffer for device register
> + */
> +struct pca9570 {
> +       struct gpio_chip chip;
> +       struct mutex lock;
> +       u8 out;
> +};
> +
> +static int pca9570_read(struct pca9570 *gpio, u8 *value)
> +{
> +       struct i2c_client *client = to_i2c_client(gpio->chip.parent);
> +       int ret;
> +
> +       ret = i2c_smbus_read_byte(client);
> +       if (ret < 0)
> +               return ret;
> +
> +       *value = ret;
> +       return 0;
> +}
> +
> +static int pca9570_write(struct pca9570 *gpio, u8 value)
> +{
> +       struct i2c_client *client = to_i2c_client(gpio->chip.parent);
> +
> +       return i2c_smbus_write_byte(client, value);
> +}
> +
> +static int pca9570_get_direction(struct gpio_chip *chip,
> +                                unsigned offset)
> +{
> +       /* This device always output */
> +       return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int pca9570_get(struct gpio_chip *chip, unsigned offset)
> +{
> +       struct pca9570 *gpio = gpiochip_get_data(chip);
> +       u8 buffer;
> +       int ret;
> +
> +       ret = pca9570_read(gpio, &buffer);
> +       if (ret)
> +               return ret;
> +
> +       return !!(buffer & BIT(offset));
> +}
> +
> +static void pca9570_set(struct gpio_chip *chip, unsigned offset, int value)
> +{
> +       struct pca9570 *gpio = gpiochip_get_data(chip);
> +       u8 buffer;
> +       int ret;
> +
> +       mutex_lock(&gpio->lock);
> +
> +       buffer = gpio->out;
> +       if (value)
> +               buffer |= BIT(offset);
> +       else
> +               buffer &= ~BIT(offset);
> +
> +       ret = pca9570_write(gpio, buffer);
> +       if (ret)
> +               goto out;
> +
> +       gpio->out = buffer;
> +
> +out:
> +       mutex_unlock(&gpio->lock);
> +}
> +
> +static int pca9570_probe(struct i2c_client *client)
> +{
> +       struct pca9570 *gpio;
> +
> +       gpio = devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
> +       if (!gpio)
> +               return -ENOMEM;
> +
> +       gpio->chip.label = client->name;
> +       gpio->chip.parent = &client->dev;
> +       gpio->chip.owner = THIS_MODULE;
> +       gpio->chip.get_direction = pca9570_get_direction;
> +       gpio->chip.get = pca9570_get;
> +       gpio->chip.set = pca9570_set;
> +       gpio->chip.base = -1;
> +       gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
> +       gpio->chip.can_sleep = true;
> +
> +       mutex_init(&gpio->lock);
> +
> +       /* Read the current output level */
> +       pca9570_read(gpio, &gpio->out);
> +
> +       i2c_set_clientdata(client, gpio);
> +
> +       return devm_gpiochip_add_data(&client->dev, &gpio->chip, gpio);
> +}
> +
> +static const struct i2c_device_id pca9570_id_table[] = {
> +       { "pca9570", 4 },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
> +
> +static const struct of_device_id pca9570_of_match_table[] = {
> +       { .compatible = "nxp,pca9570", .data = (void *)4 },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, pca9570_of_match_table);
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
