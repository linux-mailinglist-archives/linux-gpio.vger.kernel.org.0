Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8F72FFF9B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 10:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbhAVJ5J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 04:57:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbhAVJ4h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 04:56:37 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147B8C061786;
        Fri, 22 Jan 2021 01:55:56 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id g15so3425604pjd.2;
        Fri, 22 Jan 2021 01:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tD+ViDmR1uT2A2nMuxssbpuh+e9V2Sp2uc5IPNHYRMQ=;
        b=VlQ2NozSIgFj3HoLHAlzUv32PtjdSBDyESnmP635x/9sEnoOiFqw/ODUFzid7L7vrE
         vpX85Sf8QO3yRMYbLBhLVLp2XtwdBicnNt8EP6QknqvSxfxU/D8PXnJ87sy5yFG2hVl8
         DgCayFPpC6pZJJ+rdqvuJvU4Ex61N6P110L2VodNwP89d951Nj4HdzXiVb/Gg7tC2p83
         OxOW8fAAbgOnLP32TR4zYY7SLJj5anian6mblgZUB4F72I4IIFGyYjgBVMbXJWJVnu8M
         0awqxpBcQdc6j26XYOnPCkFjnZIcu/sElAragRh/MZIfSvpxF6C443nuLZhDLh14QoZn
         V05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tD+ViDmR1uT2A2nMuxssbpuh+e9V2Sp2uc5IPNHYRMQ=;
        b=nQtIffmNwrh40KiEkQAVxuJqLLB6isQ2GfvORhWB9zp7t4nqDiuHD+HcmkbL+XrK8H
         gWI0HLCvl50QSOZ+HFbdw3yCtFztELZy1524w7/B8sLmzIGDrmvj11XHhl0wyHjsO0re
         su0HurFyJdv3ZhI9V4x98IcIeLqm7u81XPtyzwqdyDOKwzJSW2UlYMRokqJoTDJ21IfF
         IcPCs4Lma/bCioFadqobAjXBv+09/ObZnY1mMKORqkwqodWLHUScN6h2bl3ZltZcFof+
         hNkQVilJ9rNuispaRypYKuwB433bJFsLQLXZW1ipsGqAhhZ2k+AJjJBfdpAl6GAIMOgQ
         O//g==
X-Gm-Message-State: AOAM533wIsZ0SBKlN5Ij8EmNQPM3usTYRkPS5jsWJj1MfyG9zotOVUCs
        W9obY6jjeRvxV5gq9t/dDvKiAXAJiOyinJDhjDg=
X-Google-Smtp-Source: ABdhPJwZaXNka3/peRQC2KxL3hXIK1JqDTWtfCYGB2DZsvxyL8e//ejrzxE35ta2iegzyCDLrIrNnmeYBaa5X7or0P4=
X-Received: by 2002:a17:90a:1050:: with SMTP id y16mr4542088pjd.181.1611309355511;
 Fri, 22 Jan 2021 01:55:55 -0800 (PST)
MIME-Version: 1.0
References: <20210121223756.1112199-1-saravanak@google.com>
In-Reply-To: <20210121223756.1112199-1-saravanak@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Jan 2021 11:56:44 +0200
Message-ID: <CAHp75VcrsVcUWaaE8JZHGDMyX9MKYONoVo+9-rzT7rvnkH5xSg@mail.gmail.com>
Subject: Re: [PATCH v4] gpiolib: Bind gpio_device to a driver to enable
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

On Fri, Jan 22, 2021 at 12:40 AM Saravana Kannan <saravanak@google.com> wrote:
>
> There are multiple instances of GPIO device tree nodes of the form:
>
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
> This driver for "acme,bar" then registers the gpio* nodes with gpiolib.
> This lines up with how DT nodes with the "compatible" property are
> typically converted to struct devices and then registered with driver
> core to probe them. This also allows the gpio* devices to hook into all
> the driver core capabilities like runtime PM, probe deferral,
> suspend/resume ordering, device links, etc.
>
> Case 2: The driver for "foo" doesn't populate struct devices for these
> gpio* nodes before registering them with gpiolib. Instead it just loops
> through its child nodes and directly registers the gpio* nodes with
> gpiolib.
>
> Drivers that follow case 2 cause problems with fw_devlink=on. This is
> because fw_devlink will prevent bazz from probing until there's a struct
> device that has gpio0 as its fwnode (because bazz lists gpio0 as a GPIO
> supplier). Once the struct device is available, fw_devlink will create a
> device link with gpio0 device as the supplier and bazz device as the
> consumer. After this point, since the gpio0 device will never bind to a
> driver, the device link will prevent bazz device from ever probing.
>
> Finding and refactoring all the instances of drivers that follow case 2
> will cause a lot of code churn and it is not something that can be done
> in one shot. In some instances it might not even be possible to refactor
> them cleanly. Examples of such instances are [1] [2].
>
> This patch works around this problem and avoids all the code churn by
> simply setting the fwnode of the gpio_device and creating a stub driver
> to bind to the gpio_device. This allows all the consumers to continue
> probing when the driver follows case 2.

...

> @@ -596,6 +596,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>                 gdev->dev.of_node = gc->of_node;
>         else
>                 gc->of_node = gdev->dev.of_node;
> +       gdev->dev.fwnode = of_fwnode_handle(gdev->dev.of_node);

This looks like a complete breakage on ACPI enabled systems. Care to
test on ACPI and confirm it works? I could recommend to use Intel
Galileo platform since there is a dwapb GPIO and a lot of nice
(semi-sarcastic, because of many quirks) code over the kernel.

(Yes, you have to have both OF and ACPI in the config being enabled
which is valid combination)

>  #endif

...

> +static int gpio_stub_drv_probe(struct device *dev)
> +{
> +       /*
> +        * The DT node of some GPIO chips have a "compatible" property, but
> +        * never have a struct device added and probed by a driver to register
> +        * the GPIO chip with gpiolib. In such cases, fw_devlink=on will cause
> +        * the consumers of the GPIO chip to get probe deferred forever because

get a probe

> +        * they will be waiting for a device associated with the GPIO chip
> +        * firmware node to get added and bound to a driver.
> +        *
> +        * To allow these consumers to probe, we associate the struct
> +        * gpio_device of the GPIO chip with the firmware node and then simply
> +        * bind it to this stub driver.
> +        */
> +       return 0;
> +}

...

> +       if (driver_register(&gpio_stub_drv) < 0) {
> +               pr_err("gpiolib: could not register GPIO stub driver\n");
> +               bus_unregister(&gpio_bus_type);
> +               return ret;
> +       }
> +
>         ret = alloc_chrdev_region(&gpio_devt, 0, GPIO_DEV_MAX, GPIOCHIP_NAME);
>         if (ret < 0) {
>                 pr_err("gpiolib: failed to allocate char dev region\n");
> +               driver_unregister(&gpio_stub_drv);
>                 bus_unregister(&gpio_bus_type);
>                 return ret;
>         }

Looks like you missed to fix the __exit call in this module.

-- 
With Best Regards,
Andy Shevchenko
