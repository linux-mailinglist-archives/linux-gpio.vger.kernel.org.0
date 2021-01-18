Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0A72FABB4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 21:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388997AbhARUjd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 15:39:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388321AbhARUjV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 15:39:21 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B19C061575
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 12:38:39 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id e67so5295587ybc.12
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 12:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhToM7IjXFf7PiS5+2d0PmH/vMBj4YKlxeJ8qHTByDs=;
        b=hGfh5m/9b2i2+e64U0z66ReZb3tkZMk6t/V7i83DkGhXp6FkXlNxHVlmyIbnqaloAO
         QQ1PJWvNkVnu6EGxUhRa/Ow2V58KDt7xPTSNQI++JiCZRrtWaIpyyZILCP3EbpoQezTx
         u6D5BkcKGOCEt5RWFbYteb0KWOdSqNZqW7K5eYC8A4Clv1TYSUxtnELZE1lx2jIkZP7r
         +ioqDnXiTromCcI8Ihj57voVcGpQ1aF02KIQDbqBUedXDW2DImZc1y2myH7wpuLYBcQy
         CYFG83MxNoovrNMW/w8oRes4mCQdHxfk1V10fEdqfyewuSeg7ENFqvWwZysATxISUmBS
         D9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhToM7IjXFf7PiS5+2d0PmH/vMBj4YKlxeJ8qHTByDs=;
        b=QLjVzi4j+SCLeYtbJM9/Kd6J9cqbk3CnCQOPIMX6H3pHfM1mVfg1XxppBLwnd2jNxx
         8xCWg57/PJlslXKdcEUIgTNf+JUmccZ19hLNfJenL0fGRUvo/5dIUPaxjn5XKhK8Knz+
         +/mhLvWAM1/wtqW+zLku1txgRmGQ+Ti0Q/fPPCh5HMuUvNg57+vg+imE9xXlPQdGB0x2
         LNLqA7UHhostLJnB/1XFtiH6+nWoTunCzIHOj+2Iho39xQlQ8bYwdsVBsnoriOLi0+Dc
         zjwY1bY8gtzfAs5L/Xa4oVdVnpfQGxRnK20X0ItucC9C/9eA0yRuqfgyESjMc2U9ACXq
         QJTg==
X-Gm-Message-State: AOAM533JUb/roJEYJzL5B3oKAlT8vK2zBrqkZJQK7ZF4os09hok3XXbX
        SKjrRhP2Rn7J6FE1tTlv5nrs6dR8boBounbkehYlbw==
X-Google-Smtp-Source: ABdhPJw7rwFn7aUAdETTEMqsHoSCpRPI3wwo4ec0Vn51K0kHuxUARBwtcHwybpaUm96KDuksSXLLoflTCdEtbZsn2bU=
X-Received: by 2002:a25:d295:: with SMTP id j143mr1420246ybg.20.1611002318707;
 Mon, 18 Jan 2021 12:38:38 -0800 (PST)
MIME-Version: 1.0
References: <20210116011412.3211292-1-saravanak@google.com> <87r1mjkc07.wl-maz@kernel.org>
In-Reply-To: <87r1mjkc07.wl-maz@kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 18 Jan 2021 12:38:02 -0800
Message-ID: <CAGETcx_5JJ2An=URY=0GwBbZzjfqN4w=-+2BuCsstYePej3sRw@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 17, 2021 at 4:02 AM Marc Zyngier <maz@kernel.org> wrote:
>
> Hi Saravana,
>
> Thanks for posting this, much appreciated.
>
> On Sat, 16 Jan 2021 01:14:11 +0000,
> Saravana Kannan <saravanak@google.com> wrote:
> >
> > There are multiple instances of GPIO devictree nodes of the form:
> >
> > foo {
> >       compatible = "acme,foo";
> >       ...
> >
> >       gpio0: gpio0@xxxxxxxx {
> >               compatible = "acme,bar";
> >               ...
> >               gpio-controller;
> >       };
> >
> >       gpio1: gpio1@xxxxxxxx {
> >               compatible = "acme,bar";
> >               ...
> >               gpio-controller;
> >       };
> >
> >       ...
> > }
> >
> > bazz {
> >       my-gpios = <&gpio0 ...>;
> > }
> >
> > Case 1: The driver for "foo" populates struct device for these gpio*
> > nodes and then probes them using a driver that binds with "acme,bar".
> > This lines up with how DT nodes with the "compatible" property are
> > generally converted to struct devices and then registered with driver
> > core to probe them. This also allows the gpio* devices to hook into all
> > the driver core capabilities like runtime PM, probe deferral,
> > suspend/resume ordering, device links, etc.
> >
> > Case 2: The driver for "foo" doesn't populate its child device nodes
> > with "compatible" property and instead just loops through its child
> > nodes and directly registers the GPIOs with gpiolib without ever
> > populating a struct device or binding a driver to it.
>
> That's not quite an accurate description. The gpiolib subsystem does
> create a struct device. It doesn't register a driver though, which is
> what causes the issue with fr_devlink (more on that below).

The devices created by gpiolib care are created for case 1 and case 2.
They are just devices gpiolib uses to represent a virtual software
device to hook different attributes to and expose them in sysfs. I'm
not talking about those devices here. The devices I'm referring to are
devices that represent the actual HW IP -- so what I'm saying is
accurate.

> >
> > Drivers that follow the case 2 cause problems with fw_devlink=on.  This
> > is because fw_devlink will prevent bazz from probing until there's a
> > struct device that has gpio0 as its fwnode (because bazz lists gpio0 as
> > a GPIO supplier). Once the struct device is available, fw_devlink will
> > create a device link between with gpio0 as the supplier and bazz as the
> > consumer. After this point, the device link will prevent bazz from
> > probing until its supplier (the gpio0 device) has bound to a driver.
> > Once the supplier is bound to a driver, the probe of bazz is triggered
> > automatically.
> >
> > Finding and refactoring all the instances of drivers that follow case 2
> > will cause a lot of code churn and it not something that can be done in
> > one shot. Examples of such instances are [1] [2].
> >
> > This patch works around this problem and avoids all the code churn by
> > simply creating a stub driver to bind to the gpio_device. Since the
> > gpio_device already points to the GPIO device tree node, this allows all
> > the consumers to continue probing when the driver follows case 2.
> >
> > If/when all the old drivers are refactored, we can revert this
> > patch.
>
> My personal gripe with this approach is that it is an abrupt change in
> the way DT and device model are mapped onto each other.
>
> As far as I know (and someone please correct me if I am wrong), there
> is zero expectation that a device/subdevice/random IP block described
> by a node with a "compatible" property will end-up being managed by a
> driver that is bound to that particular node.
>
> The node/subnode division is a good way to express some HW boundaries,
> but doesn't say anything about the way this should be handled in the
> kernel. Assuming that everything containing a "compatible" string will
> eventually be bound to a driver is IMO pretty limiting.

The default behavior of of_platform_populate() is to create a struct
device for every node with "compatible" property. That's how top level
devices (or children of simple-bus devices) are populated. IIRC,
that's what a lot of other busses do too. So, if anything, not having
a struct device for nodes with "compatible" property is an exception.

Honestly, if one has a driver that supports a HW IP, I don't see any
reason it should operate outside of the device-driver model supported
by driver core. The driver code is there for a reason -- to solve all
the common problems faced by drivers. Operating outside of it just
causes reinventing the wheel, things like playing chicken with
initcalls to make sure drivers initialize their device in the right
order, not working with deferred probe, etc. For example, the rockchip
driver in your device (the one that follows case 2) tries to get some
clocks. But if that fails with -EPROBE_DEFER, the driver has no way
for it to recover and just doesn't register the GPIO anymore.

Obviously exceptions are allowed for devices that are needed before
the driver core even comes up -- like early, clocks, irqs and timers
for the kernel/scheduler to kick off.

> >
> > [1] - https://lore.kernel.org/lkml/20201014191235.7f71fcb4@xhacker.debian/
> > [2] - https://lore.kernel.org/lkml/e28e1f38d87c12a3c714a6573beba6e1@kernel.org/
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> > Cc: Kever Yang <kever.yang@rock-chips.com>
> > Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> > v1 -> v2:
> > - Fixed up compilation errors that were introduced accidentally
> > - Fixed a missing put_device()
> >
> >  drivers/gpio/gpiolib.c | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index b02cc2abd3b6..12c579a953b0 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -574,6 +574,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >       unsigned        i;
> >       int             base = gc->base;
> >       struct gpio_device *gdev;
> > +     struct device_node *of_node;
> > +     struct fwnode_handle *fwnode;
> > +     struct device *fwnode_dev;
> >
> >       /*
> >        * First: allocate and populate the internal stat container, and
> > @@ -596,6 +599,22 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
> >               gdev->dev.of_node = gc->of_node;
> >       else
> >               gc->of_node = gdev->dev.of_node;
> > +
> > +     of_node = gdev->dev.of_node;
> > +     fwnode = of_fwnode_handle(of_node);
> > +     fwnode_dev = get_dev_from_fwnode(fwnode);
> > +     /*
> > +      * If your driver hits this warning, it's because you are directly
> > +      * parsing a device tree node with "compatible" property and
> > +      * initializing it instead of using the standard DT + device driver
> > +      * model of creating a struct device and then initializing it in the
> > +      * probe function. Please refactor your driver.
> > +      */
> > +     if (!fwnode_dev && of_find_property(of_node, "compatible", NULL)) {
> > +             chip_warn(gc, "Create a real device for %pOF\n", of_node);
>
> chip_warn() is not a good idea here, as gc->dev hasn't been
> initialised yet, and results in the following output:

Thanks, will look into this.

>
> [    0.113996] gpio (null): (gpio0): Create a real device for /pinctrl/gpio0@ff720000
> [    0.114727] gpio (null): (gpio1): Create a real device for /pinctrl/gpio1@ff730000
> [    0.115340] gpio (null): (gpio2): Create a real device for /pinctrl/gpio2@ff780000
> [    0.115912] gpio (null): (gpio3): Create a real device for /pinctrl/gpio3@ff788000
> [    0.116437] gpio (null): (gpio4): Create a real device for /pinctrl/gpio4@ff790000
>
> > +             gdev->dev.fwnode = fwnode;
> > +     }
> > +     put_device(fwnode_dev);
> >  #endif
> >
> >       gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
> > @@ -4202,6 +4221,17 @@ void gpiod_put_array(struct gpio_descs *descs)
> >  }
> >  EXPORT_SYMBOL_GPL(gpiod_put_array);
> >
> > +static int gpio_drv_probe(struct device *dev)
> > +{
> > +     return 0;
> > +}
> > +
> > +static struct device_driver gpio_drv = {
> > +     .name = "gpio_drv",
> > +     .bus = &gpio_bus_type,
> > +     .probe = gpio_drv_probe,
> > +};
> > +
> >  static int __init gpiolib_dev_init(void)
> >  {
> >       int ret;
> > @@ -4213,9 +4243,16 @@ static int __init gpiolib_dev_init(void)
> >               return ret;
> >       }
> >
> > +     if (driver_register(&gpio_drv) < 0) {
> > +             pr_err("gpiolib: could not register GPIO stub driver\n");
> > +             bus_unregister(&gpio_bus_type);
> > +             return ret;
> > +     }
> > +
> >       ret = alloc_chrdev_region(&gpio_devt, 0, GPIO_DEV_MAX, GPIOCHIP_NAME);
> >       if (ret < 0) {
> >               pr_err("gpiolib: failed to allocate char dev region\n");
> > +             driver_unregister(&gpio_drv);
> >               bus_unregister(&gpio_bus_type);
> >               return ret;
> >       }
>
> On the positive side, this patch brings my RK3399 system back to life.
> However, on a system that doesn't suffer from this problem, I end-up
> with the following issue:
>
> $ ls -l /sys/bus/platform/drivers/mb86s70-gpio/51000000.gpio/of_node
> lrwxrwxrwx 1 root root 0 Jan 17 11:15 /sys/bus/platform/drivers/mb86s70-gpio/51000000.gpio/of_node -> ../../../firmware/devicetree/base/gpio@51000000
> $ ls -l /sys/bus/gpio/drivers/gpio_drv/gpiochip0/of_node
> lrwxrwxrwx 1 root root 0 Jan 16 18:30 /sys/bus/gpio/drivers/gpio_drv/gpiochip0/of_node -> ../../../../firmware/devicetree/base/gpio@51000000
>
> where two drivers are now handling the same of_node. Somehow, I don't
> think this is a good idea, even if I didn't spot anything problematic
> yet (maybe because there isn't anything useful hanging off the GPIOs
> on this particular machine).

I agree it looks weird, but it doesn't really break anything and I'm
pretty confident about it. IIRC there are other cases (unrelated to
fw_devlink) where this happens too. Also, there are many cases of two
devices pointing to the same of_node. If we really don't like this,
then the solution is to have gpiolib NOT initialize the of_node like
this. I can also have the stub driver not probe this device for case
1. That's pretty easy to do.

> Overall, I'm concerned that this is a change in semantics that affects
> the whole device model, and I wonder whether forcing everyone in the
> same mould is the right approach.
>
> An alternative I've been thinking about is to flag the device as
> "satisfying existing dependencies" at the point where it is
> registered. Because at the end of the day, we don't really care for
> the *driver* part of it (case in point, the stub driver you introduced
> doesn't do anything). We only care about *someone* saying "this device
> is ready to be used".

This might be doable (haven't fully thought of the corner cases it
might cause for device links) if gpiolib had put the device in a class
(instead of a bus) because "class" devices don't probe. "Bus" devices
are expected to probe and there's no way to tell if it's safe to
ignore waiting for this device to probe. That'd break device links
(not just fw_devlink) in a fundamental way too. Also, I don't know the
reasons why gpiolib uses a bus instead of a class, but if we change
that now, it's going to affect the sysfs layout and break UAPI.

So, IMHO, this patch (with the clean up for Case 1) is the best
compromise to get fw_devlink=on working. Considering how trivial this
patch is and fw_devlink=on helping out a lot of people, I'd recommend
we go with this patch and if we find a better solution later, we can
implement that and remove this.

-Saravana
