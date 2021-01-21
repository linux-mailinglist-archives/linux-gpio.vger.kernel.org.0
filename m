Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4462FEAF6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 14:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbhAUNB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 08:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729227AbhAUNBx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 08:01:53 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCBCC061575
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 05:01:07 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id n8so2386871ljg.3
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 05:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RIccPwtG+DtZbh54GrHH28iBdpyQe4ud8PErKeLBSaM=;
        b=pJ5cCTuO0veVuFp5P6ChG/e7PqCgH6KJC+O0ql7HbgY+zKBag1Qyqbq3FnxbCfeC0E
         3RbCob+AOh8eqOjttOa2JCIZEZRwpSb6MCnkSV/tWs4XJPQxgwQzEVJdcE0Khn82dMj1
         QbxRQymg4TkHqEY+PqX+zg0EaOFVPn1w65KiP9fnRcMLYAiRulj+KeajGMgt/CZxu+5t
         bnx7uX15cPu/fkDKiKbx28Sb+buwQgtAAivTGjVyvumQN8SOalAUz5B3IBhE2U21wTFN
         giIsA4HRnkrnarmI4YKrF16uat7qSLQ/H8BCGzN1dzgqjNvuDpNtv5KQ3tUFruhRiSa4
         4PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RIccPwtG+DtZbh54GrHH28iBdpyQe4ud8PErKeLBSaM=;
        b=kaSn5DrMBih+aZ4JUhx8mt+Q5Uvute1sW4XmXkfRiaLL6yxWyMC350yTz8GSGgoxzD
         sHDIaGoUqh5ielJBfFXiFqxzfaCNJeS4UMNM/d0MgG1evMLBt/lCka1UC65P/YIp5rVw
         e4wpCaxdwTTVSSUsc+/wDLOL13WgzPkmeII8F2a9AC8OaOURRTHi2baiwy/nLwrKX7/c
         v4ekUTIrJrYqIxKkk9RQTyCsVUBAlmcCegcOcmw0Vi8z28OFz+ax0FVId0RAa5FhnFgw
         So+Ev4Q/ykdpMqaPYtgT+L2/CELqI6UTYyRfk54QHlz6OSHRLv7NnZmWLKPLYDoaIgfn
         p0RA==
X-Gm-Message-State: AOAM5330R6ZzOq88FFgwmzpUtFFpq612U3ALZ0Ydn3hJcL+z6gaWCn6G
        355h/8KE/8PPA3dGLDg8NgWVx68XT6JW6qfUdwq+9Q==
X-Google-Smtp-Source: ABdhPJzcB+3FAhXm3US2p97E/SyColqgj8MdORzX6GwTobMAzoRtco7BRDl0F1q9zekEJ5N7wsxj1WzyoOLv2cGa4h8=
X-Received: by 2002:a05:651c:1312:: with SMTP id u18mr6935248lja.200.1611234065975;
 Thu, 21 Jan 2021 05:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20210116011412.3211292-1-saravanak@google.com>
In-Reply-To: <20210116011412.3211292-1-saravanak@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 14:00:54 +0100
Message-ID: <CACRpkdbrkNKdjMk4fmQkfSLNS_O3=Ve0u_ktBGLaP7fWaNMrqA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 16, 2021 at 2:14 AM Saravana Kannan <saravanak@google.com> wrote:

> There are multiple instances of GPIO devictree nodes of the form:
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
> This lines up with how DT nodes with the "compatible" property are
> generally converted to struct devices and then registered with driver
> core to probe them. This also allows the gpio* devices to hook into all
> the driver core capabilities like runtime PM, probe deferral,
> suspend/resume ordering, device links, etc.

Agreed. I usually tried to get driver authors to do this.

Sometimes they have been very strongly convinced that this is not
right for their hardware which leads to case 2.

> Case 2: The driver for "foo" doesn't populate its child device nodes
> with "compatible" property and instead just loops through its child
> nodes and directly registers the GPIOs with gpiolib without ever
> populating a struct device or binding a driver to it.

This usually happens when the registers for these "subdevices"
are mixed up in the address space, so there could not be a clean
"reg" property on the node, i.e. it breaks another implicit assumtion
that each such gpio node is a separate hardware and register map
entity.

They may still have "ports" or "banks" of GPIO that make sense
to separate into logical nodes and this is most often why they
do this.

I bet there are some other oddities as well.

> Drivers that follow the case 2 cause problems with fw_devlink=on.  This
> is because fw_devlink will prevent bazz from probing until there's a
> struct device that has gpio0 as its fwnode (because bazz lists gpio0 as
> a GPIO supplier). Once the struct device is available, fw_devlink will
> create a device link between with gpio0 as the supplier and bazz as the
> consumer. After this point, the device link will prevent bazz from
> probing until its supplier (the gpio0 device) has bound to a driver.
> Once the supplier is bound to a driver, the probe of bazz is triggered
> automatically.

I think in many or all cases there will eventually be such a device,
and indeed when you are talking about struct gpio_device
below, that is that device, right?

> Finding and refactoring all the instances of drivers that follow case 2
> will cause a lot of code churn and it not something that can be done in
> one shot. Examples of such instances are [1] [2].

[1] is the DesignWare GPIO controller which is actually pretty important,
a lot of devices synthesize this controller so it would be really nice to
fix properly.

That said I am not sure there is an option to actually refactor these
devices, they look like they do for very good reasons.

> This patch works around this problem and avoids all the code churn by
> simply creating a stub driver to bind to the gpio_device. Since the
> gpio_device already points to the GPIO device tree node, this allows all
> the consumers to continue probing when the driver follows case 2.

That makes sense.

> If/when all the old drivers are refactored, we can revert this patch.

I have a bad feeling about this.

This type of hacks tend to stay around forever.

That said I'm not sure this is entirely wrong either, maybe this
is business as usual and *should* stay around forever. Haven't
made my mind up about that.

> @@ -574,6 +574,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>         unsigned        i;
>         int             base = gc->base;
>         struct gpio_device *gdev;
> +       struct device_node *of_node;
> +       struct fwnode_handle *fwnode;
> +       struct device *fwnode_dev;
>
>         /*
>          * First: allocate and populate the internal stat container, and
> @@ -596,6 +599,22 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>                 gdev->dev.of_node = gc->of_node;
>         else
>                 gc->of_node = gdev->dev.of_node;
> +
> +       of_node = gdev->dev.of_node;
> +       fwnode = of_fwnode_handle(of_node);
> +       fwnode_dev = get_dev_from_fwnode(fwnode);

This symbol is called by every GPIO driver on the planet, including those
that are not using device tree such as ACPI and board files, or
PCI or USB GPIO device.

So this will not work, it will break a lot of driver.

You need to put code into drivers/gpio/gpiolib-of.c with stubs
for the !OF case in drivers/gpio/gpiolib-of.h so that systems
not using device tree can avoid this code path.

> +       /*
> +        * If your driver hits this warning, it's because you are directly
> +        * parsing a device tree node with "compatible" property and
> +        * initializing it instead of using the standard DT + device driver
> +        * model of creating a struct device and then initializing it in the
> +        * probe function. Please refactor your driver.
> +        */
> +       if (!fwnode_dev && of_find_property(of_node, "compatible", NULL)) {
> +               chip_warn(gc, "Create a real device for %pOF\n", of_node);
> +               gdev->dev.fwnode = fwnode;
> +       }

As discussed in other messages I don't know if this message
is aligned with the device tree ontology. The DT people should
speak about that.

As device tree person FWIW I think it is perfectly legal to have
DT nodes that do not incarnate as struct device.

> +static int gpio_drv_probe(struct device *dev)
> +{
> +       return 0;
> +}
> +
> +static struct device_driver gpio_drv = {
> +       .name = "gpio_drv",
> +       .bus = &gpio_bus_type,
> +       .probe = gpio_drv_probe,
> +};

Well that was curious. It actually looks like something we can
make use of one day. But put in some comments in the code
describing when this gets probed and why we do not do anything
in probe() here.

Yours,
Linus Walleij
