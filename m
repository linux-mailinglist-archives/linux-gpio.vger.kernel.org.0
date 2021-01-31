Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F34309F1A
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Jan 2021 22:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbhAaV3c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Jan 2021 16:29:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhAaV32 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Jan 2021 16:29:28 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2915DC0613D6
        for <linux-gpio@vger.kernel.org>; Sun, 31 Jan 2021 13:28:48 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id q201so11365730ybg.8
        for <linux-gpio@vger.kernel.org>; Sun, 31 Jan 2021 13:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iRXDaKcuPFZ1g77tcHjhAIL2RDFfqyx64KolFOkHk6U=;
        b=XvpETEDk2H5tcjSbBQN4HnqVuhUQI3+QSEJlKDFtdKi88L46MBvepFZHFPVtq9D5bM
         ekSi4ZXYMxU5vfZCbCJms+amTxqKsCwPhpB6dlJ2f5cKJJ1HmUtnTKFr4Fj66FQEa1F7
         r9W/iOAIiakiXAxN/np1MuWy8I3FrEjiKMsQswHiJAUYRpJB7MlT6364BueInCAPi8RQ
         MhnpHgfw+VhAAQocFv4XhYCr2O0vqW5bZmUXWW1gDXcoknm91LK3vNL781oGw1a4bld2
         +LMmrTNaZzussuR35otsiZLqApAh9ezYR66jXARcEyjNeFAyoEmwwJJInZx8fTYyu431
         n18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iRXDaKcuPFZ1g77tcHjhAIL2RDFfqyx64KolFOkHk6U=;
        b=i1hkfBgGiM1O5y6oRoE8UcoPlhGk41i2mOAsqO1C6JUCyl6Yreb+7MzbnM+rsVEOdZ
         LjTKHFUEDyNX/IqaUtOcMRMfQVQVehXhu0CxVKYRi7DKT5eSRBXLZhUt76lkOgfbCJja
         HHZcH+xQPlQhtvOXRri8uyZJqhEcI0nVgQSAhT4HAMNHo7zjld7q4oR+XvMvFKVI4yQC
         9QYGIPWxuhoOd29+UWYkFjcpqDgr/j4U6sU8TIpmiRgYzQDJPqgaeQ3p96eDVtlR1hPK
         e1rwYPoeZAPfgSg6lJBFFPOs9uJ7dG12gJhscajtg40POqEVzWZkSGwiwacO/Nc3PJo/
         2IvQ==
X-Gm-Message-State: AOAM530UZ0I693dkb7DxfojOIzpSCtD5SROdBVkMaOLqCMqPJF77/Eej
        YTUe4/m63RiPJye3AQ6Rs2uTXE5jVmbU8KDeTrPJXA==
X-Google-Smtp-Source: ABdhPJzNRqmVODPGlcwJSngHDnaah4BYKFGgvm59Zu/LuEPWFcbvMKS/7k9Rb6xc6189AWvCE/XXZ1s9JAk6Cb3bluQ=
X-Received: by 2002:a25:b74c:: with SMTP id e12mr11313396ybm.20.1612128527221;
 Sun, 31 Jan 2021 13:28:47 -0800 (PST)
MIME-Version: 1.0
References: <20210122193600.1415639-1-saravanak@google.com> <544ad0e4-0954-274c-8e77-866aaa5661a8@gmail.com>
In-Reply-To: <544ad0e4-0954-274c-8e77-866aaa5661a8@gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Sun, 31 Jan 2021 13:28:11 -0800
Message-ID: <CAGETcx_CYKczo+geD7yDo+T2+_-tgGYwtjR-2sMPQYHuz-wAgw@mail.gmail.com>
Subject: Re: [PATCH v5] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 30, 2021 at 9:39 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 22.01.2021 22:35, Saravana Kannan =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > There are multiple instances of GPIO device tree nodes of the form:
> >
> > foo {
> >       compatible =3D "acme,foo";
> >       ...
> >
> >       gpio0: gpio0@xxxxxxxx {
> >               compatible =3D "acme,bar";
> >               ...
> >               gpio-controller;
> >       };
> >
> >       gpio1: gpio1@xxxxxxxx {
> >               compatible =3D "acme,bar";
> >               ...
> >               gpio-controller;
> >       };
> >
> >       ...
> > }
> >
> > bazz {
> >       my-gpios =3D <&gpio0 ...>;
> > }
> >
> > Case 1: The driver for "foo" populates struct device for these gpio*
> > nodes and then probes them using a driver that binds with "acme,bar".
> > This driver for "acme,bar" then registers the gpio* nodes with gpiolib.
> > This lines up with how DT nodes with the "compatible" property are
> > typically converted to struct devices and then registered with driver
> > core to probe them. This also allows the gpio* devices to hook into all
> > the driver core capabilities like runtime PM, probe deferral,
> > suspend/resume ordering, device links, etc.
> >
> > Case 2: The driver for "foo" doesn't populate struct devices for these
> > gpio* nodes before registering them with gpiolib. Instead it just loops
> > through its child nodes and directly registers the gpio* nodes with
> > gpiolib.
> >
> > Drivers that follow case 2 cause problems with fw_devlink=3Don. This is
> > because fw_devlink will prevent bazz from probing until there's a struc=
t
> > device that has gpio0 as its fwnode (because bazz lists gpio0 as a GPIO
> > supplier). Once the struct device is available, fw_devlink will create =
a
> > device link with gpio0 device as the supplier and bazz device as the
> > consumer. After this point, since the gpio0 device will never bind to a
> > driver, the device link will prevent bazz device from ever probing.
> >
> > Finding and refactoring all the instances of drivers that follow case 2
> > will cause a lot of code churn and it is not something that can be done
> > in one shot. In some instances it might not even be possible to refacto=
r
> > them cleanly. Examples of such instances are [1] [2].
> >
> > This patch works around this problem and avoids all the code churn by
> > simply setting the fwnode of the gpio_device and creating a stub driver
> > to bind to the gpio_device. This allows all the consumers to continue
> > probing when the driver follows case 2.
> >
> > [1] - https://lore.kernel.org/lkml/20201014191235.7f71fcb4@xhacker.debi=
an/
> > [2] - https://lore.kernel.org/lkml/e28e1f38d87c12a3c714a6573beba6e1@ker=
nel.org/
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> > Cc: Kever Yang <kever.yang@rock-chips.com>
> > Fixes: e590474768f1 ("driver core: Set fw_devlink=3Don by default")
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> > v1 -> v2:
> > - Fixed up compilation errors that were introduced accidentally
> > - Fixed a missing put_device()
> >
> > v2 -> v3:
> > - Changed chip_warn() to pr_warn()
> > - Changed some variable names
> >
> > v3 -> v4:
> > - Dropped the warning since it's not always valid
> > - This simplifies the code a lot
> > - Added comments and fixed up commit text
> >
> > v4 -> v5:
> > - Fixed the code to not mess up non-DT cases.
> > - Moved code into gpiolib-of.c
> >
> >  drivers/gpio/gpiolib-of.c | 11 +++++++++++
> >  drivers/gpio/gpiolib-of.h |  5 +++++
> >  drivers/gpio/gpiolib.c    | 38 +++++++++++++++++++++++++++++++-------
> >  3 files changed, 47 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> > index b4a71119a4b0..baf0153b7bca 100644
> > --- a/drivers/gpio/gpiolib-of.c
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -1039,3 +1039,14 @@ void of_gpiochip_remove(struct gpio_chip *chip)
> >  {
> >       of_node_put(chip->of_node);
> >  }
> > +
> > +void of_gpio_dev_init(struct gpio_chip *gc, struct gpio_device *gdev)
> > +{
> > +     /* If the gpiochip has an assigned OF node this takes precedence =
*/
> > +     if (gc->of_node)
> > +             gdev->dev.of_node =3D gc->of_node;
> > +     else
> > +             gc->of_node =3D gdev->dev.of_node;
> > +     if (gdev->dev.of_node)
> > +             gdev->dev.fwnode =3D of_fwnode_handle(gdev->dev.of_node);
> > +}
> > diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
> > index ed26664f1537..8af2bc899aab 100644
> > --- a/drivers/gpio/gpiolib-of.h
> > +++ b/drivers/gpio/gpiolib-of.h
> > @@ -15,6 +15,7 @@ int of_gpiochip_add(struct gpio_chip *gc);
> >  void of_gpiochip_remove(struct gpio_chip *gc);
> >  int of_gpio_get_count(struct device *dev, const char *con_id);
> >  bool of_gpio_need_valid_mask(const struct gpio_chip *gc);
> > +void of_gpio_dev_init(struct gpio_chip *gc, struct gpio_device *gdev);
> >  #else
> >  static inline struct gpio_desc *of_find_gpio(struct device *dev,
> >                                            const char *con_id,
> > @@ -33,6 +34,10 @@ static inline bool of_gpio_need_valid_mask(const str=
uct gpio_chip *gc)
> >  {
> >       return false;
> >  }
> > +static inline void of_gpio_dev_init(struct gpio_chip *gc,
> > +                                 struct gpio_device *gdev)
> > +{
> > +}
> >  #endif /* CONFIG_OF_GPIO */
> >
> >  extern struct notifier_block gpio_of_notifier;
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index b02cc2abd3b6..70fb15ae5d36 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -590,13 +590,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *g=
c, void *data,
> >               gdev->dev.of_node =3D gc->parent->of_node;
> >       }
> >
> > -#ifdef CONFIG_OF_GPIO
> > -     /* If the gpiochip has an assigned OF node this takes precedence =
*/
> > -     if (gc->of_node)
> > -             gdev->dev.of_node =3D gc->of_node;
> > -     else
> > -             gc->of_node =3D gdev->dev.of_node;
> > -#endif
> > +     of_gpio_dev_init(gc, gdev);
> >
> >       gdev->id =3D ida_alloc(&gpio_ida, GFP_KERNEL);
> >       if (gdev->id < 0) {
> > @@ -4202,6 +4196,29 @@ void gpiod_put_array(struct gpio_descs *descs)
> >  }
> >  EXPORT_SYMBOL_GPL(gpiod_put_array);
> >
> > +static int gpio_stub_drv_probe(struct device *dev)
> > +{
> > +     /*
> > +      * The DT node of some GPIO chips have a "compatible" property, b=
ut
> > +      * never have a struct device added and probed by a driver to reg=
ister
> > +      * the GPIO chip with gpiolib. In such cases, fw_devlink=3Don wil=
l cause
> > +      * the consumers of the GPIO chip to get probe deferred forever b=
ecause
> > +      * they will be waiting for a device associated with the GPIO chi=
p
> > +      * firmware node to get added and bound to a driver.
> > +      *
> > +      * To allow these consumers to probe, we associate the struct
> > +      * gpio_device of the GPIO chip with the firmware node and then s=
imply
> > +      * bind it to this stub driver.
> > +      */
> > +     return 0;
> > +}
> > +
> > +static struct device_driver gpio_stub_drv =3D {
> > +     .name =3D "gpio_stub_drv",
> > +     .bus =3D &gpio_bus_type,
> > +     .probe =3D gpio_stub_drv_probe,
> > +};
> > +
> >  static int __init gpiolib_dev_init(void)
> >  {
> >       int ret;
> > @@ -4213,9 +4230,16 @@ static int __init gpiolib_dev_init(void)
> >               return ret;
> >       }
> >
> > +     if (driver_register(&gpio_stub_drv) < 0) {
> > +             pr_err("gpiolib: could not register GPIO stub driver\n");
> > +             bus_unregister(&gpio_bus_type);
> > +             return ret;
> > +     }
> > +
> >       ret =3D alloc_chrdev_region(&gpio_devt, 0, GPIO_DEV_MAX, GPIOCHIP=
_NAME);
> >       if (ret < 0) {
> >               pr_err("gpiolib: failed to allocate char dev region\n");
> > +             driver_unregister(&gpio_stub_drv);
> >               bus_unregister(&gpio_bus_type);
> >               return ret;
> >       }
> >
>
> Hi,
>
> This patch causes these new errors on NVIDIA Tegra30 Nexus 7 using recent=
 linux-next:
>
>  gpio-1022 (cpu-pwr-req-hog): hogged as input
>  max77620-pinctrl max77620-pinctrl: pin gpio4 already requested by max776=
20-pinctrl; cannot claim for gpiochip1
>  max77620-pinctrl max77620-pinctrl: pin-4 (gpiochip1) status -22
>  max77620-pinctrl max77620-pinctrl: could not request pin 4 (gpio4) from =
group gpio4  on device max77620-pinctrl
>  gpio_stub_drv gpiochip1: Error applying setting, reverse things back
>  gpio_stub_drv: probe of gpiochip1 failed with error -22
>
> Please fix, thanks in advance.

I have a partial guess on why this is happening. So can you try this patch?

Thanks,
Saravana

--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4213,6 +4213,8 @@ static int gpio_stub_drv_probe(struct device *dev)
         * gpio_device of the GPIO chip with the firmware node and then sim=
ply
         * bind it to this stub driver.
         */
+       if (dev->fwnode && dev->fwnode->dev !=3D dev)
+               return -EBUSY;
        return 0;
 }
