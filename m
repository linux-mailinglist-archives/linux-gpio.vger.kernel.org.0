Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B737A2F8F3E
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Jan 2021 21:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbhAPUgs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Jan 2021 15:36:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbhAPUgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Jan 2021 15:36:43 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D015DC061573;
        Sat, 16 Jan 2021 12:36:02 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id p18so8361592pgm.11;
        Sat, 16 Jan 2021 12:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qlDjbs1sUL5XWOdxOspY5u20wDpTDh7tT0jZLEeNJas=;
        b=VXB5zP+5ah3S1ak4s1fI3datYUXlolUqj3efsgYhzOh1CXKwATBeWkkKt0ZFmK7KzS
         81t+vRRMom82MqMjDN0BWSpGCeVMaV6wYCN5gLM/FZ5PAjPNzXeMeTpBb228+NCNCysT
         cy0Kk4XlE682MSyYOtlZgfrd2GyG8MAJIdxNhXjpcmnNeNCtzMnqLGBcYnFJnPXsG5DQ
         MmJmxZaWsBwQk2kfI2YsFowTS3I5BRZnuvBAX0pTifEHSvZR9IiQRdD9KrEMWYIrdg9h
         1vhxniEK+olw8UvK8EL+ycfMulN1CTJd6K3hDYoX48J8jXx0RB8D00lE3SZgZ/2AJiZV
         8CZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qlDjbs1sUL5XWOdxOspY5u20wDpTDh7tT0jZLEeNJas=;
        b=etiECdcT19tMZtUUN0mw+H2Osvmy34KVV5y8L7hzPwBq1VMP4nF5QQyr4gJXBJv6pc
         J8D8NpGru58USH7BVXRpKS6UZdDPpNi7dW4PQusObqEAgki65ix4FnCDWnWk8iXNTqpV
         mTjCBtp7vqWohmqwqT3Kng0OCQhF3bF63GFSJddz0p7LbMJIplme+1Ls5bmMVWpjrLW7
         T/zouACMZnQ0E9DVaydHZZ4XQZdmLXtp6W+EhokgW39gZAwCqqX63gYTmh6/b6SKbrE0
         TU6Ra0/38unJpVkcILognWYYoY+x3Za334tRj+UHE6dl6ffsITyol5TxobfscjGkQc1c
         JMwA==
X-Gm-Message-State: AOAM5327zzLNIQiOqJSnNexraON8SwCw08wBab1MdmmE8wQIATkd4CtK
        nLU0Uxbs6CGKv/elfCxGDOreTH7YuB3KaNANy0Y=
X-Google-Smtp-Source: ABdhPJw9m2yy/yo2erp8zTLR/lG+PnbT8qXrE3wQQULu1mYrKntYioVQk62tY9A742KG3YR1BFNwhGfiL0CGJOTJW5w=
X-Received: by 2002:a63:4b16:: with SMTP id y22mr19151172pga.203.1610829362311;
 Sat, 16 Jan 2021 12:36:02 -0800 (PST)
MIME-Version: 1.0
References: <20210115210107.3087548-1-saravanak@google.com>
In-Reply-To: <20210115210107.3087548-1-saravanak@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 22:35:45 +0200
Message-ID: <CAHp75VdgtESi5X8O09ENdQ0sohk+gCHeGxQxs6p8XAVxNYmQrw@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 15, 2021 at 11:03 PM Saravana Kannan <saravanak@google.com> wrote:
>
> There are multiple instances of GPIO devictree nodes of the form:

What? Device Tree (or device tree).

> foo {
>         compatible = "acme,foo";
>         ...
>
>         gpio0: gpio0@xxxxxxxx {
>                 compatible = "acme,bar";
>                 ...
>                 gpio-controller;
>         };
>
>         gpio1: gpio1@xxxxxxxx {
>                 compatible = "acme,bar";
>                 ...
>                 gpio-controller;
>         };
>
>         ...
> }
>
> bazz {
>         my-gpios = <&gpio0 ...>;
> }
>
> Case 1: The driver for "foo" populates struct device for these gpio*
> nodes and then probes them using a driver that binds with "acme,bar".
> This lines up with how DT nodes with the "compatible" property are
> generally converted to struct devices and then registered with driver
> core to probe them. This also allows the gpio* devices to hook into all
> the driver core capabilities like runtime PM, probe deferral,
> suspend/resume ordering, device links, etc.
>
> Case 2: The driver for "foo" doesn't populate its child device nodes
> with "compatible" property and instead just loops through its child
> nodes and directly registers the GPIOs with gpiolib without ever
> populating a struct device or binding a driver to it.
>
> Drivers that follow the case 2 cause problems with fw_devlink=on.  This

follow case

> is because fw_devlink will prevent bazz from probing until there's a
> struct device that has gpio0 as its fwnode (because bazz lists gpio0 as
> a GPIO supplier). Once the struct device is available, fw_devlink will
> create a device link between with gpio0 as the supplier and bazz as the
> consumer. After this point, the device link will prevent bazz from
> probing until its supplier (the gpio0 device) has bound to a driver.
> Once the supplier is bound to a driver, the probe of bazz is triggered
> automatically.
>
> Finding and refactoring all the instances of drivers that follow case 2
> will cause a lot of code churn and it not something that can be done in

it is not

> one shot. Examples of such instances are [1] [2].
>
> This patch works around this problem and avoids all the code churn by
> simply creating a stub driver to bind to the gpio_device. Since the
> gpio_device already points to the GPIO device tree node, this allows all
> the consumers to continue probing when the driver follows case 2.
>
> If/when all the old drivers are refactored, we can revert this patch.
>
> [1] - https://lore.kernel.org/lkml/20201014191235.7f71fcb4@xhacker.debian/
> [2] - https://lore.kernel.org/lkml/e28e1f38d87c12a3c714a6573beba6e1@kernel.org/

Link: tags?

...

> +       of_node = gdev->dev.of_node;

This seems unused (see below).

> +       fwnode = of_fwnode_handle(of_node);

I don't get this. Are you telling that dev_fwnode(&gdev->dev) is not the same?

> +       fwnode_dev = get_dev_from_fwnode(fwnode);
> +
> +       /*
> +        * If your driver hits this warning, it's because you are directly
> +        * parsing a device tree node with "compatible" property and
> +        * initializing it instead of using the standard DT + device driver
> +        * model of creating a struct device and then initializing it in the
> +        * probe function. Please refactor your driver.
> +        */

> +       if (!fwnode_dev && of_find_property(gdev->dev.of_node, "compatible")) {

fwnode_property_present() ?

> +               chip_warn(gc, "Create a real device for %pOF\n" of_node);

%pfw ?

> +               gdev->dev.fwnode = fwnode;

Why not dev_fwnode()?

> +       }
>  #endif

...

> +static struct device_driver gpio_drv = {
> +       .name = "gpio_drv",

Can it have a better name, please?

> +       .bus = &gpio_bus_type,
> +       .probe = gpio_drv_probe,
> +};

-- 
With Best Regards,
Andy Shevchenko
