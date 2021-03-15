Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66A9C33AE28
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 10:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbhCOJCb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 05:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhCOJCA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 05:02:00 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95945C061574
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:01:59 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id p8so64798173ejb.10
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e2sBs6NiXFEBjEW5EKicEDQG80m64//Jqveh+rRtB44=;
        b=rtOek8t/l0dOFFYOaAgvr/GxPcxuWGJZDn1GUtVOmCnYNUEjbeIDDtNAvDjHMuWvj4
         iPaiy7rj0s+kAhnC2BwwiCXA4AUT91cSe+/mCEKTfMvdiDQ1c6UHCuQdvKYAwg4i2Nn0
         6RXR/u4y5Lgs3qGqKT6ARrPDCUsNDKf2TAFDKPY7YeIphqhVK9n+sdM7W+YXa79QRYfU
         9M3beg7L32c1HbTaLBGIfBQjrXbqmtjmYHYilpzLQLBC0AQ82Gxh8qeBUk04kM5NCX6B
         UkKWX3WdGNQhgjfw+IchlH/1lymmAq6s0Aa859kmVkqIdgd8pcb4/+u/oiQFvn/lu1bs
         qKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e2sBs6NiXFEBjEW5EKicEDQG80m64//Jqveh+rRtB44=;
        b=Wqr+UvZeBLs6purS/szo5lA5rJXgasePoVmhXS2Z7y0vgV3M3Uhf7e4eFI/Lwse9ZN
         KnIaezc7f9eGGWHoHWWnkNv4u8toj+uVRXIcjEjIiu+8PpiqroK1eFY1yra921Ix1XHI
         /mx9e4WTdFCpfVk1lOW7YljwoK3k8E74gIy+I7U1pKaT4tzUvojTBZvP8tj4+18/XytR
         fwIvNIRgukd6Dfb+wKuuECQkjDgy/UI7bkx1q9jHPL3dTbM1Qn7uuC0X2oOFgILZI1iC
         V59sJE7FtjhSSJo5Gi70oOvJm8qmezW2dekx/MpRkQJHvkAosYefWjscNFOBOF6htLS7
         Dg/g==
X-Gm-Message-State: AOAM530/G8T/rBB1nL1qbN7GU1hlYPuzOLyUA3FSIW+8p3dEgw9UKFjM
        6zDi55N9PXknGsiOKL5+O3i0BGa0JGDQO11FmNdJHw==
X-Google-Smtp-Source: ABdhPJz+l2yQBZkd11UpA8i0+HaQV8ndMsfdW4Wo6PIKv963xVVZSLZsZViialetAI1yDKjwcuZU/GXtejH5Mu3dAgI=
X-Received: by 2002:a17:906:7842:: with SMTP id p2mr2450233ejm.87.1615798918325;
 Mon, 15 Mar 2021 02:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 15 Mar 2021 10:01:47 +0100
Message-ID: <CAMRc=Mfye=O4mMiK01Q6Ok+ztSfMwMcrfaZSs+LhRxi=AM+C2w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 5, 2021 at 1:03 PM Andy Shevchenko
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

Hi Andy!

Unfortunately while this may fix the particular use-case on STM32, it
breaks all other users as the 'gpio-line-names' property doesn't live
on dev_fwnode(&gdev->dev) but on dev_fwnode(chip->parent).

How about we first look for this property on the latter and only if
it's not present descend down to the former fwnode?

Bart
