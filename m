Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE93920734D
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 14:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389504AbgFXM3t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 08:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388296AbgFXM3s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 08:29:48 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0960CC0613ED
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 05:29:47 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id g11so936963qvs.2
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1ESt58ClxWv93YRbwFQwd7bo2ar4KSmZx3txl2ZmTe0=;
        b=xYiyFDHuq3J3EHlfdliFFKnN9LCOnNLT0paQ463HnqgNSeTRpQCTPu5hjDhYbHNuoH
         /1sGE2iqIzdvmBypochamuXx3XqSFXyoN1vSblZYyOMUppTq00HysGVcsvgoouVvBJLQ
         P4j7pCTsPXnenTPW/R+olPXS2aksvwRwDspW6Qa5P40yokgQJ6DBrj3ww1wCsiBrHiHh
         trqL8BNelt1GFW30dSbMZ2Fvy7GwmcFzRKmUE6zZxW24mwZRJue9rvVDojB58rHIFbVI
         3nLpUdcjOtZmOzvmXDltbnyjSKHdcmZuV+kkvu4aLHTURWhtDhECk1S2ccsZ4araYj3r
         lVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1ESt58ClxWv93YRbwFQwd7bo2ar4KSmZx3txl2ZmTe0=;
        b=gn7o1ca/YCTv/TiixJlnVaIQWZNTZtia8BepmHVONxA/9Xhq4+A+DBm7Wq7+670IjU
         5Qu/KrLxkRbK+LRMzCHH9loLt0Xs7MOc3UpoIYAwDeI3CZ0VBSLPUwq3qHFU0Q7T3D9e
         e3qjhcalbnUaPGglO249X6wKuPgFRUjI8uBQ47FWMKhEzaFECXTPGSb66t5TD9HgvHyF
         jeZ03xq12AIAOmkQGfMV0oj1qt7EOjNK/y/8n6oL5k4mK/NOYEsCKp+cUVOIj0lR+HwF
         MgTmrPjw/m5AUTidEk97jIW3AxL7UYkAOqaiA9LCsGyqNhssJ1SvXWb0wrhgZXpxtPFa
         4cJw==
X-Gm-Message-State: AOAM533HEqXinyIBzvcKYRIdlhieCMCIw5uw3JriRRvh7S6vkwk0D8ho
        BWUzATy+hyJsSX4A8NaAkn0AwAWUFXCJv2vM0X5S1Q==
X-Google-Smtp-Source: ABdhPJyv25a16rucBL7z8NoN7u87LJnE8BXZfa1mh6MVjMVuXFoeA5NYyDvAaKn0vScJcB1guOtyb7iid8m74FTpCGI=
X-Received: by 2002:ad4:580e:: with SMTP id dd14mr14571376qvb.96.1593001786088;
 Wed, 24 Jun 2020 05:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200623060526.29922-1-mans0n@gorani.run>
In-Reply-To: <20200623060526.29922-1-mans0n@gorani.run>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 14:29:35 +0200
Message-ID: <CAMpxmJVvU1Q2OHYfqqAMcojniQ6TSK+n5AejddwZ=pArtUWNYg@mail.gmail.com>
Subject: Re: [PATCH] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 23 cze 2020 o 08:05 Sungbo Eo <mans0n@gorani.run> napisa=C5=82(a):
>
> This patch adds support for the PCA9570 I2C GPO expander.
>
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>

Hi Sungbo, this looks pretty good, but there are some nits listed below.

> ---
> Tested in kernel 5.4 on an ipq40xx platform.
>
> This is my first time submitting a whole driver patch, and I'm not really=
 familiar with this PCA expander series.
> Please let me know how I can improve this patch further. (Do I also need =
to document the DT compatible string?)
>

Yes, you should send a separate patch to DT maintainers with DT
binding document (preferably in YAML). Please see
Documentations/devicetree/bindings for more info.

> FYI there's an unmerged patch for this chip.
> http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2017-Ma=
y/105602.html
> I don't have PCA9571 either so I didn't add support for it.
> ---
>  drivers/gpio/Kconfig        |   8 ++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-pca9570.c | 159 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 168 insertions(+)
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
> +         To compile this driver as a module, choose M here: the module w=
ill
> +         be called gpio-pca9570.
> +
>  config GPIO_PCF857X
>         tristate "PCF857x, PCA{85,96}7x, and MAX732[89] I2C GPIO expander=
s"
>         select GPIOLIB_IRQCHIP
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 1e4894e0bf0f..33cb40c28a61 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -110,6 +110,7 @@ obj-$(CONFIG_GPIO_OCTEON)           +=3D gpio-octeon.=
o
>  obj-$(CONFIG_GPIO_OMAP)                        +=3D gpio-omap.o
>  obj-$(CONFIG_GPIO_PALMAS)              +=3D gpio-palmas.o
>  obj-$(CONFIG_GPIO_PCA953X)             +=3D gpio-pca953x.o
> +obj-$(CONFIG_GPIO_PCA9570)             +=3D gpio-pca9570.o
>  obj-$(CONFIG_GPIO_PCF857X)             +=3D gpio-pcf857x.o
>  obj-$(CONFIG_GPIO_PCH)                 +=3D gpio-pch.o
>  obj-$(CONFIG_GPIO_PCIE_IDIO_24)                +=3D gpio-pcie-idio-24.o
> diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
> new file mode 100644
> index 000000000000..9ed01554f5df
> --- /dev/null
> +++ b/drivers/gpio/gpio-pca9570.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for PCA9570 I2C GPO expander
> + *
> + * Copyright (C) 2020 Sungbo Eo <mans0n@gorani.run>
> + *
> + * Based on gpio-tpic2810.c
> + * Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com=
/
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
> +       struct mutex lock;
> +};
> +
> +static void pca9570_set(struct gpio_chip *chip, unsigned offset, int val=
ue);
> +

Please just move this function here instead of declaring it and
implementing it later.

[snip!]

> +
> +static int pca9570_probe(struct i2c_client *client,
> +                        const struct i2c_device_id *id)
> +{
> +       struct pca9570 *gpio;
> +       int ret;
> +
> +       gpio =3D devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
> +       if (!gpio)
> +               return -ENOMEM;
> +
> +       i2c_set_clientdata(client, gpio);
> +
> +       gpio->chip =3D template_chip;
> +       gpio->chip.parent =3D &client->dev;
> +
> +       gpio->client =3D client;
> +
> +       mutex_init(&gpio->lock);
> +
> +       ret =3D gpiochip_add_data(&gpio->chip, gpio);

Why not devm_gpiochip_add_data()? You could drop the remove callback.

> +       if (ret < 0) {
> +               dev_err(&client->dev, "Unable to register gpiochip\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int pca9570_remove(struct i2c_client *client)
> +{
> +       struct pca9570 *gpio =3D i2c_get_clientdata(client);
> +
> +       gpiochip_remove(&gpio->chip);
> +
> +       return 0;
> +}
> +

[snip!]

Bartosz
