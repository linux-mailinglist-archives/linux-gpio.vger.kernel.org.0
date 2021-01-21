Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285E72FF4F6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 20:45:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbhAUToj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 14:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727475AbhAUToa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Jan 2021 14:44:30 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CFB2C0613D6
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 11:43:50 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id k4so3197996ybp.6
        for <linux-gpio@vger.kernel.org>; Thu, 21 Jan 2021 11:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xTI7PMD+538A9KNpYpp6AWplF5YKKg25tlI4KH4VBTQ=;
        b=SIMCiagHVnXH7BKY3CgffVHxNoJcGABKZzTyfPpw9MLGGnaqJ07SMt1I1x//vBWuK+
         YvcjUPmwtNzE26iRaoOMWxRwKDiX+RA7LYPo/HgvTM6681WARrTd9ZdZBN3uAYRjI49T
         DAXK0S7o6eoKy3MvetllQ/wLoMDCDPUlZ0x2KbO/cDdHc1w676/OqdkAFGHfdLoKKS0z
         eNL/HPmkc7edKHlQDllOG2jcAxRVNi5hLjWP4RXmSRG1MjNE4uI10jcfkxsvdTjTXi++
         5YcviY5Ru3iIkON9Jo/xHrt8YHGmgs9OCXcXe5qe7kN0/kiVYXFlsevLsr3t9wjxcmZg
         30dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xTI7PMD+538A9KNpYpp6AWplF5YKKg25tlI4KH4VBTQ=;
        b=dlUP8jkcYc2oysBi7EyHNZ6ymylRk4vuR7qATctcGC+TZGsP2foTXQSd4BTGEliJbH
         X5e8QB6ef0YkF2RQvqCoZRtfMMIMkxCYo9X72iRx/rjUhDxsGPD6pvVBb6iKxRgaSuxR
         ausY91PVyxJWI5upulR2w2F2XMWC66uQUl/6dPVwFe338vcmaigQJikqPNuxd6TqZMyO
         iBtQdDtz1FjfbKET57AhBChqe1Zc0m9yldrkzRVKLEdEDbKELI8I4VgjCNiLiLlk6lNi
         vW+IFf9lKtm1+LxnNntrGPZNeT4yMMlWz+7WJGD9TryY4HKN9KHbBP0WmSL7jraFnhPP
         pzGA==
X-Gm-Message-State: AOAM530nANB6riClFehLdYn+ruaSQNMX2sCOh2XU5K693fSETEwKhMlI
        0/Saw90ggKuIhtB5JCRMvmDpgqavihQPI4JZcthoOw==
X-Google-Smtp-Source: ABdhPJyL8v7wpOGPLM98S3FdomE+hQ4nQP2Bcn8EjcP4EEoPwZFCuuZ0li87Jq+H979JRqD/Zg1YPI70326iFwBfv8M=
X-Received: by 2002:a25:c343:: with SMTP id t64mr1447268ybf.228.1611258229303;
 Thu, 21 Jan 2021 11:43:49 -0800 (PST)
MIME-Version: 1.0
References: <20210116011412.3211292-1-saravanak@google.com> <CACRpkdbrkNKdjMk4fmQkfSLNS_O3=Ve0u_ktBGLaP7fWaNMrqA@mail.gmail.com>
In-Reply-To: <CACRpkdbrkNKdjMk4fmQkfSLNS_O3=Ve0u_ktBGLaP7fWaNMrqA@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 21 Jan 2021 11:43:13 -0800
Message-ID: <CAGETcx8Jp_wCyoLXeMxe+vaqjPO_urHnzS7Vfi=tbKPTKk5v=Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Linus Walleij <linus.walleij@linaro.org>
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

On Thu, Jan 21, 2021 at 5:01 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sat, Jan 16, 2021 at 2:14 AM Saravana Kannan <saravanak@google.com> wrote:
>
> > There are multiple instances of GPIO devictree nodes of the form:
> >
> > foo {
> >         compatible = "acme,foo";
> >         ...
> >
> >         gpio0: gpio0@xxxxxxxx {
> >                 compatible = "acme,bar";
> >                 ...
> >                 gpio-controller;
> >         };
> >
> >         gpio1: gpio1@xxxxxxxx {
> >                 compatible = "acme,bar";
> >                 ...
> >                 gpio-controller;
> >         };
> >
> >         ...
> > }
> >
> > bazz {
> >         my-gpios = <&gpio0 ...>;
> > }
> >
> > Case 1: The driver for "foo" populates struct device for these gpio*
> > nodes and then probes them using a driver that binds with "acme,bar".
> > This lines up with how DT nodes with the "compatible" property are
> > generally converted to struct devices and then registered with driver
> > core to probe them. This also allows the gpio* devices to hook into all
> > the driver core capabilities like runtime PM, probe deferral,
> > suspend/resume ordering, device links, etc.
>
> Agreed. I usually tried to get driver authors to do this.
>
> Sometimes they have been very strongly convinced that this is not
> right for their hardware which leads to case 2.
>
> > Case 2: The driver for "foo" doesn't populate its child device nodes
> > with "compatible" property and instead just loops through its child
> > nodes and directly registers the GPIOs with gpiolib without ever
> > populating a struct device or binding a driver to it.
>
> This usually happens when the registers for these "subdevices"
> are mixed up in the address space, so there could not be a clean
> "reg" property on the node, i.e. it breaks another implicit assumtion
> that each such gpio node is a separate hardware and register map
> entity.
>
> They may still have "ports" or "banks" of GPIO that make sense
> to separate into logical nodes and this is most often why they
> do this.
>
> I bet there are some other oddities as well.

Ah, thanks for the context. But couldn't they just skip the
"compatible" property in the DT if these individual nodes aren't
considered separate devices? It's too late for existing DT device
bindings, but maybe in the future we can ask them to skip the
"compatible" property if they don't consider the sub nodes to be
distinct devices?

> > Drivers that follow the case 2 cause problems with fw_devlink=on.  This
> > is because fw_devlink will prevent bazz from probing until there's a
> > struct device that has gpio0 as its fwnode (because bazz lists gpio0 as
> > a GPIO supplier). Once the struct device is available, fw_devlink will
> > create a device link between with gpio0 as the supplier and bazz as the
> > consumer. After this point, the device link will prevent bazz from
> > probing until its supplier (the gpio0 device) has bound to a driver.
> > Once the supplier is bound to a driver, the probe of bazz is triggered
> > automatically.
>
> I think in many or all cases there will eventually be such a device,
> and indeed when you are talking about struct gpio_device
> below, that is that device, right?
>
> > Finding and refactoring all the instances of drivers that follow case 2
> > will cause a lot of code churn and it not something that can be done in
> > one shot. Examples of such instances are [1] [2].
>
> [1] is the DesignWare GPIO controller which is actually pretty important,
> a lot of devices synthesize this controller so it would be really nice to
> fix properly.
>
> That said I am not sure there is an option to actually refactor these
> devices, they look like they do for very good reasons.
>
> > This patch works around this problem and avoids all the code churn by
> > simply creating a stub driver to bind to the gpio_device. Since the
> > gpio_device already points to the GPIO device tree node, this allows all
> > the consumers to continue probing when the driver follows case 2.
>
> That makes sense.
>
> > If/when all the old drivers are refactored, we can revert this patch.
>
> I have a bad feeling about this.
>
> This type of hacks tend to stay around forever.
>
> That said I'm not sure this is entirely wrong either, maybe this
> is business as usual and *should* stay around forever. Haven't
> made my mind up about that.

Considering your comment about why some (not all) of these nodes
aren't considered separate devices, looks like this has to stay this
way forever? I can drop this line in the commit text.

> > @@ -574,6 +574,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >         unsigned        i;
> >         int             base = gc->base;
> >         struct gpio_device *gdev;
> > +       struct device_node *of_node;
> > +       struct fwnode_handle *fwnode;
> > +       struct device *fwnode_dev;
> >
> >         /*
> >          * First: allocate and populate the internal stat container, and
> > @@ -596,6 +599,22 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >                 gdev->dev.of_node = gc->of_node;
> >         else
> >                 gc->of_node = gdev->dev.of_node;
> > +
> > +       of_node = gdev->dev.of_node;
> > +       fwnode = of_fwnode_handle(of_node);
> > +       fwnode_dev = get_dev_from_fwnode(fwnode);
>
> This symbol is called by every GPIO driver on the planet, including those
> that are not using device tree such as ACPI and board files, or
> PCI or USB GPIO device.
>
> So this will not work, it will break a lot of driver.
>
> You need to put code into drivers/gpio/gpiolib-of.c with stubs
> for the !OF case in drivers/gpio/gpiolib-of.h so that systems
> not using device tree can avoid this code path.

It's not clear in the diff due to lack of sufficient context lines,
but this piece of code is already inside a #ifdef CONFIG_OF_GPIO.

To cover the case where CONFIG_OF_GPIO is enabled but we get here for
non-DT devices, I just need to add a !fwnode check here. Then stuff
will automatically NOP out for non-DT devices. Since the
gdev->dev.of_node is set a few lines above, I think gdev->dev.fwnode
should also be set close to it (which is what the next few lines do).
I'll add this additional check to v3.

>
> > +       /*
> > +        * If your driver hits this warning, it's because you are directly
> > +        * parsing a device tree node with "compatible" property and
> > +        * initializing it instead of using the standard DT + device driver
> > +        * model of creating a struct device and then initializing it in the
> > +        * probe function. Please refactor your driver.
> > +        */
> > +       if (!fwnode_dev && of_find_property(of_node, "compatible", NULL)) {
> > +               chip_warn(gc, "Create a real device for %pOF\n", of_node);
> > +               gdev->dev.fwnode = fwnode;
> > +       }
>
> As discussed in other messages I don't know if this message
> is aligned with the device tree ontology. The DT people should
> speak about that.

Considering what you said earlier, I'll just drop this message.

> As device tree person FWIW I think it is perfectly legal to have
> DT nodes that do not incarnate as struct device.
>
> > +static int gpio_drv_probe(struct device *dev)
> > +{
> > +       return 0;
> > +}
> > +
> > +static struct device_driver gpio_drv = {
> > +       .name = "gpio_drv",
> > +       .bus = &gpio_bus_type,
> > +       .probe = gpio_drv_probe,
> > +};
>
> Well that was curious. It actually looks like something we can
> make use of one day. But put in some comments in the code
> describing when this gets probed and why we do not do anything
> in probe() here.

Ack.

Thanks for the review.

-Saravana
