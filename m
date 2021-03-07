Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35E53302E1
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Mar 2021 17:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbhCGQPY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Mar 2021 11:15:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbhCGQPH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Mar 2021 11:15:07 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4E8C06174A;
        Sun,  7 Mar 2021 08:15:06 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id s7so3703930plg.5;
        Sun, 07 Mar 2021 08:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dqYPDrvULCWuDLLiROQSM7KZ6r9QBZIFlqyHz32fU3Q=;
        b=VD2/Om/q53mjKBnvfyCtORYsezDqpSVjzNabmtzRkNe0gCEW8lyX/fSXPzQwhu0vvV
         djyL/kOUiw/K7J7WttKTNgbx/qwEcYMg5tIqto8+ucHRaXkU3W0Q9Ciwo3am/lxGibHv
         HXEYTNk41JsGhCH2kB6FcTxfOazrfXz4Z5P49cXanMkm0og8eDK9X+by1Am93iRvkIaI
         8M/ScwpW+tW40aX+1ecQy38tF14mDnUssrLq4eowwfg1YH5c4MZSUV3Sg3z0Ltqnnf5m
         VSBqTdvgaB0ItX8blJfzvRUukz8sJj8VWvJxIezjtIIaHtD3K9CovJttMMHO3QIV9iFP
         11VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dqYPDrvULCWuDLLiROQSM7KZ6r9QBZIFlqyHz32fU3Q=;
        b=aVqUf/abcTTkCsCUzrxCBU+kV+/3CmGpnDCXy9cc1UF9ualtDiRXhpjkVjD10oH2MG
         SwoZb2YZ6nU1i+P4uEvIxn+xEqI3iEmuIBASr0wZeY68dlzVMw7g5wxJm/wz4XjwXwew
         WWYSLltxx0KyED6JHqN2h4g51UZnKS8X+hpTyJSzprL/fdJ9Jh2T7RhdpB6MNGtBdBF/
         ubGUk+OfW5PAVvFw8il8S+oqlWogVlaX41kwGQEJm5JPQ3X5jECm5rbNkr2cY7MHYttq
         Lmwsa47q/syjlBah87SJvXVYgDE/+SBYDbOQ0TJiT7RuVHXfKt4ezuBkYV1zh0xdQiYm
         gtZA==
X-Gm-Message-State: AOAM533amk5L9J/67jlv2BuQUMITmw5Tm0pweLOmzr/VXVCa3RKm82c4
        yZCOX9WifoDtBrs3cJ0ZM8QoWjtj3djpMjklsdg=
X-Google-Smtp-Source: ABdhPJyYa41l/dL3WgoVvX8tlhWsMpU/bevODmkNMSqnbgRBqYLdqQz2bM0YmcqWKsZObwWwBy247BkIRV5ndmoEGBI=
X-Received: by 2002:a17:90a:4586:: with SMTP id v6mr19645953pjg.129.1615133705330;
 Sun, 07 Mar 2021 08:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com> <CAMpxmJVjdeW5978U--4KDCVr9gtu603gq04j2Zo0ohRi1rURZg@mail.gmail.com>
In-Reply-To: <CAMpxmJVjdeW5978U--4KDCVr9gtu603gq04j2Zo0ohRi1rURZg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 7 Mar 2021 18:14:49 +0200
Message-ID: <CAHp75Vf9XbZ4S-2aqfQafaw8jJrW3oVQYEw06roi3zOBKRMmOA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware node
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 7, 2021 at 4:22 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Fri, Mar 5, 2021 at 1:02 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On STM32MP1, the GPIO banks are subnodes of pin-controller@50002000,
> > see arch/arm/boot/dts/stm32mp151.dtsi. The driver for
> > pin-controller@50002000 is in drivers/pinctrl/stm32/pinctrl-stm32.c
> > and iterates over all of its DT subnodes when registering each GPIO
> > bank gpiochip. Each gpiochip has:
> >
> >   - gpio_chip.parent = dev,
> >     where dev is the device node of the pin controller
> >   - gpio_chip.of_node = np,
> >     which is the OF node of the GPIO bank
> >
> > Therefore, dev_fwnode(chip->parent) != of_fwnode_handle(chip.of_node),
> > i.e. pin-controller@50002000 != pin-controller@50002000/gpio@5000*000.
> >
> > The original code behaved correctly, as it extracted the "gpio-line-names"
> > from of_fwnode_handle(chip.of_node) = pin-controller@50002000/gpio@5000*000.
> >
> > To achieve the same behaviour, read property from the firmware node.
> >
> > Fixes: 7cba1a4d5e162 ("gpiolib: generalize devprop_gpiochip_set_names() for device properties")
> > Reported-by: Marek Vasut <marex@denx.de>
> > Reported-by: Roman Guskov <rguskov@dh-electronics.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/gpio/gpiolib.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 3bc25a9c4cd6..ba88011cc79d 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -367,22 +367,18 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
> >   *
> >   * Looks for device property "gpio-line-names" and if it exists assigns
> >   * GPIO line names for the chip. The memory allocated for the assigned
> > - * names belong to the underlying software node and should not be released
> > + * names belong to the underlying firmware node and should not be released
> >   * by the caller.
> >   */
> >  static int devprop_gpiochip_set_names(struct gpio_chip *chip)
> >  {
> >         struct gpio_device *gdev = chip->gpiodev;
> > -       struct device *dev = chip->parent;
> > +       struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
> >         const char **names;
> >         int ret, i;
> >         int count;
> >
> > -       /* GPIO chip may not have a parent device whose properties we inspect. */
> > -       if (!dev)
> > -               return 0;
> > -
> > -       count = device_property_string_array_count(dev, "gpio-line-names");
> > +       count = fwnode_property_string_array_count(fwnode, "gpio-line-names");
> >         if (count < 0)
> >                 return 0;
> >
> > @@ -396,7 +392,7 @@ static int devprop_gpiochip_set_names(struct gpio_chip *chip)
> >         if (!names)
> >                 return -ENOMEM;
> >
> > -       ret = device_property_read_string_array(dev, "gpio-line-names",
> > +       ret = fwnode_property_read_string_array(fwnode, "gpio-line-names",
> >                                                 names, count);
> >         if (ret < 0) {
> >                 dev_warn(&gdev->dev, "failed to read GPIO line names\n");
> > --
> > 2.30.1
> >
>
> Did you run the OF unit tests on this? The check for the parent dev
> was added after a bug was reported that was only triggered in unit
> tests.

Parent is not used anymore. But I can run unittests next week (or if
you know that they are failing now, can you please show the failure?).


-- 
With Best Regards,
Andy Shevchenko
