Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9964454F
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 18:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730575AbfFMQnY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 12:43:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40845 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730481AbfFMGpD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jun 2019 02:45:03 -0400
Received: by mail-lj1-f195.google.com with SMTP id a21so17377246ljh.7
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 23:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DWLAbQmXGpCrDaKrDjQ46XCoQNaEdIMk20G/+yWNhgk=;
        b=rpCCguew50R1u2w1BybI0dwwbcq3hYe2e0GRtch/bK3yRWfJNY07PlKLwcFTgpAK/6
         h8O6fBqhmyno+x5nhMhE4Xeu9ygMJHBcDWjp/16YKYQjtNlQsdCuqCJqdcAUH81amkob
         vA7EFvAeeE/K2VnROz/C0y5nuxgQnCy4YExn8GThnNRGAzVzYeB7hdlVnFmmJJt2vSNS
         P8rLNaF8etVcwxdnRNPuod/bB796qUMoW5kkhvNEWsNbwzhyiL1V9OPr8ihvSZc33vsa
         PWWOpqiNFpIVb94i2+s8bAX5IxjTM58WDyKEU8tFTrNgY78TvhA/L5AmVWlLpAs5v+4D
         Z0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DWLAbQmXGpCrDaKrDjQ46XCoQNaEdIMk20G/+yWNhgk=;
        b=Q44gkUpczTcl/ge5LBymlU/Yu2wLfZfZZkYQz04cd/64NiITK5cfkjBX+g4+qbFffK
         +sW9xtGDAmXtGdbcZOpaPxJKRm1uBZBw+V45O9sHSjWRir01Z22Nd3n3k5Jeda6GwWd9
         ihykf7diZqPONV5JC7ZrOfcrfVeA60tGsG67fdzq/KyM7x4EA16SwFUwH2+FrsLpTb2m
         zIBHGLYnNQX3Zlkb2F9M2pMivSBGJTsqqXPQ9IMO6wqmud7AyKQPtalV4AjExXipey5J
         GXJdfDiQgRsGDQnKfBhG6ifrtyCCknnq+s/zzxvLhRwKPsudIRi2IYvT2sL87cHEdVns
         E/fw==
X-Gm-Message-State: APjAAAXXGHInA+OT09rpWUb392C/uenDj4k9tRMlHB647LK2uCkoHRE5
        Uo7umfI/8obK0hzE94sPiNJvDHxdBrFN/F59hiBj6A==
X-Google-Smtp-Source: APXvYqwfiTbyLeLiRNw/ZZ+U2S7PH4CfH0M+FDekZGu341QPQIZYoWNaGOTo8rDKpREjmhKBZv49S39kqyZKSzJ3+MI=
X-Received: by 2002:a2e:5d54:: with SMTP id r81mr8775678ljb.104.1560408300282;
 Wed, 12 Jun 2019 23:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com> <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
In-Reply-To: <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Jun 2019 08:44:48 +0200
Message-ID: <CACRpkdaSLwELtWMiEvYRBRF1d6E_9ymupdiCe-rEaaJkCfOd4A@mail.gmail.com>
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio configuration
To:     Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Harish,

thanks for your patch! We have discussed this a lot
and it's nice to see it materialize!

On Wed, Jun 12, 2019 at 6:50 AM Harish Jenny K N
<harish_kandiga@mentor.com> wrote:

> Provides a new virtual gpio controller to configure the polarity
> of the gpio pins used by the userspace.

I think we should refrain from using both the terms
"virtual", as it is a real thing, just modeled like this and
any reference to userspace because kernel drivers may
need this just as much.

> When there is no kernel
> driver using the gpio pin, it becomes necessary for the userspace
> to configure the polarity of the gpio pin.

So sometimes this might be necessary also for kernelspace,
it models the inverter on the PCB very well, and the fact
that DTS files work around it by adding things like
active low flags are really just hacks.
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> ---
>  drivers/gpio/Kconfig         |   9 +++
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpio-inverter.c | 144 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 drivers/gpio/gpio-inverter.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index acd40eb..15893dd 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -77,6 +77,15 @@ config GPIO_GENERIC
>         depends on HAS_IOMEM # Only for IOMEM drivers
>         tristate
>
> This driver enables the userspace to directly use the gpio pin

Instead of "userspace" write "consumers".

> without worrying about the hardware level polarity configuration.
> Polarity configuration will be done by the virtual gpio controller
> based on device tree information

Call it the "inverter GPIO controller wrapper" or something
like this.

> +config GPIO_INVERTER
> +       tristate "Virtual GPIO controller for configuring the gpio polarity"

"Inverter GPIO controller for handling hardware inverters"

> +++ b/drivers/gpio/gpio-inverter.c
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Virtual GPIO controller for configuring the gpio polarity

Text like for the Kconfig.

> +#include <linux/gpio.h>
> +struct gpio_inverter {
> +       struct gpio_chip gpiochip;
> +       int count;
> +       struct gpio_desc *gpios[0];
> +};
> +
As everyone already pointed out, drop this.

> +#include <linux/of_gpio.h>

Also drop this.

> +static int gpio_inverter_direction_input(struct gpio_chip *chip,
> +                                        unsigned int offset)
> +{
> +       struct gpio_inverter *virt = gpiochip_get_data(chip);

Don't call it "virt" just call it "inv" or something, it isn't
really virtual.

> +       gpio_chip = &virt->gpiochip;
> +       gpio_chip->direction_input = gpio_inverter_direction_input;
> +       gpio_chip->direction_output = gpio_inverter_direction_output;
> +       gpio_chip->get = gpio_inverter_get;
> +       gpio_chip->set = gpio_inverter_set;
> +       gpio_chip->label = dev_name(dev);
> +       gpio_chip->parent = dev;
> +       gpio_chip->owner = THIS_MODULE;
> +       gpio_chip->base = -1;
> +       gpio_chip->ngpio = count;

As has been pointed out, check if we can wrap all functions
also .get/set_multiple (remembering inversion of course) and
.set_config().

> +static int gpio_inverter_remove(struct platform_device *pdev)
> +{
> +       struct gpio_inverter *virt = platform_get_drvdata(pdev);
> +
> +       gpiochip_remove(&virt->gpiochip);
> +
> +       return 0;
> +}

Can't you just use devm_gpiochip_add_data() and get rid of
this remove() function?

> +static int __init gpio_inverter_init(void)
> +{
> +       return platform_driver_register(&gpio_inverter_driver);
> +}
> +late_initcall(gpio_inverter_init);
> +
> +static void __exit gpio_inverter_exit(void)
> +{
> +       platform_driver_unregister(&gpio_inverter_driver);
> +}
> +module_exit(gpio_inverter_exit);

Why can't you just use module_platform_driver() and
handle all at the driver init level? Providers should
defer.

Yours,
Linus Walleij
