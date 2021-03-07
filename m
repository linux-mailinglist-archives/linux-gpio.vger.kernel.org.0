Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5532633017C
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Mar 2021 14:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhCGN4D (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Mar 2021 08:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbhCGNzd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Mar 2021 08:55:33 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774CAC06175F
        for <linux-gpio@vger.kernel.org>; Sun,  7 Mar 2021 05:55:32 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id mj10so14723575ejb.5
        for <linux-gpio@vger.kernel.org>; Sun, 07 Mar 2021 05:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3iDxxnNR3mnsvme8OrdmyIpgVltBJYLFEpZIEq3W/BY=;
        b=HMGL9uyA1WYvmPwePvZwOjonse4xjPNMQvSYILg7rBlWF372ldpwDmpCtFI2HJWGTd
         FDfA/9jTyBh6lvGGPMHX+wjG3Cbt7zEeDFih6iGgl9cc8NWztoV/0lRGzas42vMFmIvH
         0/075KsXz+n/zss+rcerbXNH5ivYLPh6vbfGQqZ2S4g38b0oQuWj+pQrYYoyIlyL3Ao5
         XkuLvyLPZq1xPGx5WtBh+hVSukSG/chJs/7BqanIUANn1hALr8Zec7A3imp22mwBV6vR
         iyAD+LtYwD0zLcDKU1Q3mA9DQvkdOxYa7CLaTLIMPkxKNtoJZo+HBvx2WVhDzsWD3DAd
         HK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3iDxxnNR3mnsvme8OrdmyIpgVltBJYLFEpZIEq3W/BY=;
        b=VdXr39At4VFNfyoFZc7ZzHUu2q5kxA28cm3j8T11dmu0HKrvYCBEepRTcVP+wv0N2X
         GEVCOPQPXXR61RWHoslCyRC1J/1oe7X94S40RuFhNXhNxcfXZBlMvCIlU4YjtFoNYQZW
         eMi5eb1B1a73PveC4BtdNs9rnLT6oLAV+FLyfHKYKs4AUqVHp5kWFS7Uqc/Ssg+6A6ek
         pQzsbfIqtYuLalPuDTyNPguPD4/ikpOFHTmil8Dq8V7heZ0Pj1J/JmWryEnPex8TVzUU
         hqOzi/cV2aWhaPAEPbtFbeb9g4RMuxIVgWLJoCzSv6RPXzi624F1sD2BrSYq2ks7X8B2
         tsMg==
X-Gm-Message-State: AOAM531RQ5aQu/1Tv9CXzCuCfozz3MGCXe04j2i8YHP5EF5o9dG2OebB
        VVsrhT/oYC/h7IdLgCGbTS1wZSGD6Ku1lUR1igoLLw==
X-Google-Smtp-Source: ABdhPJw8AHqfxc4NR8V1MM+Ud0t6ZG2hdPJ2snSSuHuinI6KbzUzPIu0W3GlJKFNOwoh08XssaMWNKLeL7PhYkvnLEc=
X-Received: by 2002:a17:907:76c7:: with SMTP id kf7mr10656908ejc.470.1615125331157;
 Sun, 07 Mar 2021 05:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 7 Mar 2021 14:55:20 +0100
Message-ID: <CAMpxmJVjdeW5978U--4KDCVr9gtu603gq04j2Zo0ohRi1rURZg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 5, 2021 at 1:02 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On STM32MP1, the GPIO banks are subnodes of pin-controller@50002000,
> see arch/arm/boot/dts/stm32mp151.dtsi. The driver for
> pin-controller@50002000 is in drivers/pinctrl/stm32/pinctrl-stm32.c
> and iterates over all of its DT subnodes when registering each GPIO
> bank gpiochip. Each gpiochip has:
>
>   - gpio_chip.parent = dev,
>     where dev is the device node of the pin controller
>   - gpio_chip.of_node = np,
>     which is the OF node of the GPIO bank
>
> Therefore, dev_fwnode(chip->parent) != of_fwnode_handle(chip.of_node),
> i.e. pin-controller@50002000 != pin-controller@50002000/gpio@5000*000.
>
> The original code behaved correctly, as it extracted the "gpio-line-names"
> from of_fwnode_handle(chip.of_node) = pin-controller@50002000/gpio@5000*000.
>
> To achieve the same behaviour, read property from the firmware node.
>
> Fixes: 7cba1a4d5e162 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
> Reported-by: Marek Vasut <marex@denx.de>
> Reported-by: Roman Guskov <rguskov@dh-electronics.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 3bc25a9c4cd6..ba88011cc79d 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -367,22 +367,18 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
>   *
>   * Looks for device property "gpio-line-names" and if it exists assigns
>   * GPIO line names for the chip. The memory allocated for the assigned
> - * names belong to the underlying software node and should not be released
> + * names belong to the underlying firmware node and should not be released
>   * by the caller.
>   */
>  static int devprop_gpiochip_set_names(struct gpio_chip *chip)
>  {
>         struct gpio_device *gdev = chip->gpiodev;
> -       struct device *dev = chip->parent;
> +       struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
>         const char **names;
>         int ret, i;
>         int count;
>
> -       /* GPIO chip may not have a parent device whose properties we inspect. */
> -       if (!dev)
> -               return 0;
> -
> -       count = device_property_string_array_count(dev, "gpio-line-names");
> +       count = fwnode_property_string_array_count(fwnode, "gpio-line-names");
>         if (count < 0)
>                 return 0;
>
> @@ -396,7 +392,7 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
>         if (!names)
>                 return -ENOMEM;
>
> -       ret = device_property_read_string_array(dev, "gpio-line-names",
> +       ret = fwnode_property_read_string_array(fwnode, "gpio-line-names",
>                                                 names, count);
>         if (ret < 0) {
>                 dev_warn(&gdev->dev, "failed to read GPIO line names\n");
> --
> 2.30.1
>

Did you run the OF unit tests on this? The check for the parent dev
was added after a bug was reported that was only triggered in unit
tests.

Bartosz
