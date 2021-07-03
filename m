Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0DBB3BA8A3
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jul 2021 14:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhGCMH5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Jul 2021 08:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbhGCMH5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Jul 2021 08:07:57 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC7AC061762;
        Sat,  3 Jul 2021 05:05:23 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id h18so3502383vsj.2;
        Sat, 03 Jul 2021 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YrphHIKKNpwDrjBvImzBllcHPyqT527cfhc4uIy0bkM=;
        b=KzSVMkJRvUpu/dIMFegOMKzrMIKMdqp7THZ84dvVxOITjQI3hEyNymmZ5YP3wVvmRo
         BorOFT9ksyhSu43hqzt0fild7OvJDj80ff3H88edW+0oxVuZhM0HRbgJaJJClj0GTR1z
         rxdIbYdCyisqcLM6m43JVK52oyfDDD/bfklM66XMpC8Erfgu3CNE4sTTTbuwEh3ukSWY
         Xq3nl9eyBH75EPSiPdy6x6u52PRS3+Ax/B0LVKSLgraq8IpZYNiYJ2IUsRBt9tOcQgmn
         vB7y8mg3lZjFtxtqb98nMySSSwfJfIalEqdqSUsGpLMHxHKtWwQ3VAL5rGuuOcpjtsJO
         J3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YrphHIKKNpwDrjBvImzBllcHPyqT527cfhc4uIy0bkM=;
        b=XyxOVRjA2ARC5HfGkBUwCO7M6Iimv6d9tMQizGHNuyD3SkE7DRy0HRtCU9F5w5RwC5
         VElIt+VImjJAjd90pfAY/VyjDLFljVumZgmYPlKhi3lcEIF6oWTziml2JjIzocFREKZY
         spEpeSWSuY3tgmruEIYefW6NX6binESgqDF0NnnTOunHX8nBX5DmCNDrkVUxEM7bAJIl
         4uzKa2eWaQ9T/z3E11cs1iFtEPVr6WyJXkVoMQhRFcX19glfE/nkb/5PDBwXFPLDQEej
         WqGVbAeIqc6rqdqIReYcGh5VTkumPVJr8M11zhVVGVcQ5b2rD+Xh3UzeAWbFaHNnjxt0
         G9rQ==
X-Gm-Message-State: AOAM531wTR+QdvK0ZIqOczdly4SInspP+tOV9kuCwuQlblSc2KXebaih
        SilrLrbMGXWhqObt6d+iMrjh3m6o6LRNF7rjUvQ=
X-Google-Smtp-Source: ABdhPJx9AnkVHFQkXTkxSZDFO2L/ew0FDpqMBNjFGkQaE/aAEoWib+/CF2e2RE+I6uV1BbPoI5144EJAx9qalSXng5U=
X-Received: by 2002:a05:6102:32d5:: with SMTP id o21mr3650464vss.28.1625313922947;
 Sat, 03 Jul 2021 05:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
 <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
 <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
 <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com>
 <CAMhs-H-WwCfPDspgxzN=W8QouZ7WPAeyJDYf_6=YezyCkTM=Vw@mail.gmail.com>
 <CAHp75VcF-HDZ6mKvXT=zYnBrcPaNJ+SYJ72LQ7s-62zQ5ZqoQg@mail.gmail.com>
 <CAMhs-H9gw63j98vVo3y0ymW4_6rFNL8u5cYNM2hzyrmkPB3h3w@mail.gmail.com>
 <CAHp75VccSCWa=EH8i01_b_HLZRumUZ48oRjeuaV5Dp1BQAoz2w@mail.gmail.com>
 <CAMhs-H_Ne4W79Awbmo6w_68X+h0-ybjvzNsbh=XuHMPJJ8-hDQ@mail.gmail.com>
 <CACRpkdaqSoyDUn3dVuVgzRK_7AabdY=1FzAnhHZzPs3qS+GfsA@mail.gmail.com>
 <CAMhs-H_pomsvKXuerkVsNQva+B+tPr2xRZAU2R7oyjZ+GaQpqQ@mail.gmail.com>
 <CAMhs-H_=_tYk3Qj5-NaAmWgnuWc0ZRSEABZzwPfMxiUHP35nbw@mail.gmail.com> <CAHp75VdmTHr8zq0boz2ci0YO4fS9Zuf+LFXeK7CGiHqHkXKKMQ@mail.gmail.com>
In-Reply-To: <CAHp75VdmTHr8zq0boz2ci0YO4fS9Zuf+LFXeK7CGiHqHkXKKMQ@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 3 Jul 2021 14:05:11 +0200
Message-ID: <CAMhs-H_e2U7nUav8h+Q0w-aZXvD6VM6wpg857WbFgw6x3z1ufA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NeilBrown <neil@brown.name>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Sat, Jul 3, 2021 at 1:32 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jul 3, 2021 at 2:06 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> > On Fri, Jul 2, 2021 at 1:30 PM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
>
> ...
>
> > -               ret = devprop_gpiochip_set_names(gc);
> > +               ret = devprop_gpiochip_set_names(gc, 0);
>
> I had been expecting that this parameter would be in the field of the gpiochip.
>
> ...

If doing it in that way is preferred, I have no problem at all. But in
that case I think there is no need for a new
'devprop_gpiochip_set_names_base' and we can assume for all drivers to
be zero and if is set taking it into account directly in
devprop_gpiochip_set_names function? Is this what you mean by having
this field added there??

>
> > The problem I see with this approach is that
> > 'devprop_gpiochip_set_names' already trusts in gpio_device already
> > created and this happens in 'gpiochip_add_data_with_key'. So doing in
> > this way force "broken drivers" to call this new
> > 'devprop_gpiochip_set_names_base' function after
> > 'devm_gpiochip_add_data' is called so the core code has already set up
> > the friendly names repeated for all gpio chip banks and the approach
> > would be to "overwrite" those in a second pass which sounds more like
> > a hack than a solution.
> >
> > But maybe I am missing something in what you were pointing out here.
>
> Would the above work?

The following works for me, but the overwritten part of the
'gdev->descs[i].name' because this has been already called once by the
core code is hacky and dirty, IMHO :)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4a7e295c3640..ad145ab0794c 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -537,6 +537,8 @@ extern int gpiochip_add_data_with_key(struct
gpio_chip *gc, void *data,
        devm_gpiochip_add_data_with_key(dev, gc, data, NULL, NULL)
 #endif /* CONFIG_LOCKDEP */

+extern int devprop_gpiochip_set_names_base(struct gpio_chip *gc, int base);
+
 static inline int gpiochip_add(struct gpio_chip *gc)
 {
        return gpiochip_add_data(gc, NULL);

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6e3c4d7a7d14..f9942d5d2f2a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -361,13 +361,14 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
 /*
  * devprop_gpiochip_set_names - Set GPIO line names using device properties
  * @chip: GPIO chip whose lines should be named, if possible
+ * @base: starting index in names array to start copying from
  *
  * Looks for device property "gpio-line-names" and if it exists assigns
  * GPIO line names for the chip. The memory allocated for the assigned
  * names belong to the underlying software node and should not be released
  * by the caller.
  */
-static int devprop_gpiochip_set_names(struct gpio_chip *chip)
+static int devprop_gpiochip_set_names(struct gpio_chip *chip, int base)
 {
        struct gpio_device *gdev = chip->gpiodev;
        struct device *dev = chip->parent;
@@ -383,12 +384,18 @@ static int devprop_gpiochip_set_names(struct
gpio_chip *chip)
        if (count < 0)
                return 0;

-       if (count > gdev->ngpio) {
+       if (count > gdev->ngpio && base == 0) {
                dev_warn(&gdev->dev, "gpio-line-names is length %d but
should be at most length %d",
                         count, gdev->ngpio);
                count = gdev->ngpio;
        }

+       if (count <= base) {
+               for (i = 0; i < count; i++)
+                       gdev->descs[i].name = "";
+               return 0;
+       }
+
        names = kcalloc(count, sizeof(*names), GFP_KERNEL);
        if (!names)
                return -ENOMEM;
@@ -401,14 +408,21 @@ static int devprop_gpiochip_set_names(struct
gpio_chip *chip)
                return ret;
        }

+       count = (base >= count) ? (base - count) : count;
        for (i = 0; i < count; i++)
-               gdev->descs[i].name = names[i];
+               gdev->descs[i].name = names[base + i];

        kfree(names);

        return 0;
 }

+int devprop_gpiochip_set_names_base(struct gpio_chip *gc, int base)
+{
+       return devprop_gpiochip_set_names(gc, base);
+}
+EXPORT_SYMBOL_GPL(devprop_gpiochip_set_names_base);
+
 static unsigned long *gpiochip_allocate_mask(struct gpio_chip *gc)
 {
        unsigned long *p;
@@ -684,7 +698,7 @@ int gpiochip_add_data_with_key(struct gpio_chip
*gc, void *data,
        if (gc->names)
                ret = gpiochip_set_desc_names(gc);
        else
-               ret = devprop_gpiochip_set_names(gc);
+               ret = devprop_gpiochip_set_names(gc, 0);
        if (ret)
                goto err_remove_from_list;

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 82fb20dca53a..d4f19ab726b2 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -282,6 +282,12 @@ mediatek_gpio_bank_probe(struct device *dev,
                return ret;
        }

+       ret = devprop_gpiochip_set_names_base(&rg->chip, bank * MTK_BANK_WIDTH);
+       if (ret) {
+               dev_err(dev, "Error setting line names for bank %d", bank);
+               return ret;
+       }
+
        /* set polarity to low for all gpios */
        mtk_gpio_w32(rg, GPIO_REG_POL, 0);

Best regards,
    Sergio Paracuellos

>
> --
> With Best Regards,
> Andy Shevchenko
