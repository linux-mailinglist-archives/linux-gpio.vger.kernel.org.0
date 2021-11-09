Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51BE044AC6C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 12:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241667AbhKILVV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 06:21:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:33096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236933AbhKILVV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 06:21:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5011D61184;
        Tue,  9 Nov 2021 11:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636456715;
        bh=lO8tQWqc2w+XvL3pbFer7fWOx8WpjOovLS4xqP6NpmY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N0n/Dee73r4Q0X559dbC63n6woPmMUv9NoLSbekRezGFIEab9+Njeq1M5QbEBVCGT
         8xkQCyvSGRdu8hvrFFogJWV56aN+3Gk7D+/yDRUKfLwWbiPoNj707Xa8RYtZ6rMKML
         K3nrxE1OxEj+GJnK/+EkKlvfZVfhg3hl4ULb3DYUaaD6Wz7/wbwqoggwjCSJH5gm0C
         eihRUzcJM1cpHmnnebCj7OA5T+CuRZiwgF74REp0BqsIAAsVQSZT3YEexYZISVVAyI
         NzbQGoPBMn3hIIh95NJ3/J+igf0Ew0Ub1FGxLi/U9fz/4/v6Epjjiv7hLJCGs2ejsH
         14kX41gYPygyg==
Received: by mail-wm1-f42.google.com with SMTP id z200so15511292wmc.1;
        Tue, 09 Nov 2021 03:18:35 -0800 (PST)
X-Gm-Message-State: AOAM5323ZfD2lsU3PZMvL0MPZSIDlbuquuy9fyUR5Br8Jj919bT3k0Q+
        +hE1hQk3gCg8Ft5xWZufFOqWFsj11fqwmXMOBSU=
X-Google-Smtp-Source: ABdhPJx/39MGIMYM/G7p9WtSJEXb6yf8SOLtbri1LasKTNG3haVIpi2RwrKOd2wYGXN8JRzcfURCGECdqWxmoSTGzHA=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr6072524wmi.173.1636456713698;
 Tue, 09 Nov 2021 03:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20211109100207.2474024-1-arnd@kernel.org> <20211109100207.2474024-6-arnd@kernel.org>
 <YYpMcKlcZ3JWqp5M@smile.fi.intel.com>
In-Reply-To: <YYpMcKlcZ3JWqp5M@smile.fi.intel.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 9 Nov 2021 12:18:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0VsDG3af1YkRRb=5bmvZ4zP3Du492hE_jyUWOwnYph_w@mail.gmail.com>
Message-ID: <CAK8P3a0VsDG3af1YkRRb=5bmvZ4zP3Du492hE_jyUWOwnYph_w@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] gpiolib: shrink further
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 11:24 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> > @@ -238,8 +238,6 @@ setup or driver probe/teardown code, so this is an easy constraint.)::
> >          ##   gpio_free_array()
> >
> >                  gpio_free()
> > -                gpio_set_debounce()
> > -
> >
>
> One more blank line removal?

I think two blank lines at the end of a section is the normal style
for this file.
Do you mean I should remove another line, or not remove the third blank
line here?

> > diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> > index a25a77dd9a32..d0664e3b89bb 100644
> > --- a/drivers/input/touchscreen/ads7846.c
> > +++ b/drivers/input/touchscreen/ads7846.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/of.h>
>
> >  #include <linux/of_gpio.h>
>
> (1)
>
> >  #include <linux/of_device.h>
>
> > +#include <linux/gpio/consumer.h>
>
> (2)
>
> >  #include <linux/gpio.h>
>
> (3)
>
> Seems too many...
>
> Are you planning to clean up this driver to get rid of (1) and (3) altogether?
>
> (I understand that for current purposes above is a good quick cleanup)

Ideally we should only use linux/gpio/consumer.h, which is required for
gpiod_set_debounce(). of_gpio.h is still needed for of_get_named_gpio()
and should be taken out once we change this to gpiod_get(), while
linux/gpio.h is still needed for gpio_is_valid()/gpio_get_value() and should
be removed when those are changed to the gpiod_ versions.

We could do an intermediate patch that converts one half of the
interface, something like

diff --git a/drivers/input/touchscreen/ads7846.c
b/drivers/input/touchscreen/ads7846.c
index d0664e3b89bb..60e6b292ccdf 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -140,7 +140,7 @@ struct ads7846 {
        int                     (*filter)(void *data, int data_idx, int *val);
        void                    *filter_data;
        int                     (*get_pendown_state)(void);
-       int                     gpio_pendown;
+       struct gpio_desc        *gpio_pendown;

        void                    (*wait_for_sync)(void);
 };
@@ -223,7 +223,7 @@ static int get_pendown_state(struct ads7846 *ts)
        if (ts->get_pendown_state)
                return ts->get_pendown_state();

-       return !gpio_get_value(ts->gpio_pendown);
+       return !gpiod_get_value(ts->gpio_pendown);
 }

 static void ads7846_report_pen_up(struct ads7846 *ts)
@@ -1005,6 +1005,11 @@ static int ads7846_setup_pendown(struct spi_device *spi,

        if (pdata->get_pendown_state) {
                ts->get_pendown_state = pdata->get_pendown_state;
+       } else if (ts->gpio_pendown) {
+               if (IS_ERR(ts->gpio_pendown)) {
+                       dev_err(&spi->dev, "missing pendown gpio\n");
+                       return PTR_ERR(ts->gpio_pendown);
+               }
        } else if (gpio_is_valid(pdata->gpio_pendown)) {

                err = devm_gpio_request_one(&spi->dev, pdata->gpio_pendown,
@@ -1016,10 +1016,10 @@ static int ads7846_setup_pendown(struct spi_device *spi,
                        return err;
                }

-               ts->gpio_pendown = pdata->gpio_pendown;
+               ts->gpio_pendown = gpio_to_desc(pdata->gpio_pendown);

                if (pdata->gpio_pendown_debounce)
-                       gpiod_set_debounce(gpio_to_desc(pdata->gpio_pendown),
+                       gpiod_set_debounce(ts->gpio_pendown,
                                          pdata->gpio_pendown_debounce);
        } else {
                dev_err(&spi->dev, "no get_pendown_state nor gpio_pendown?\n");
@@ -1128,7 +1128,7 @@ static const struct of_device_id ads7846_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, ads7846_dt_ids);

-static const struct ads7846_platform_data *ads7846_probe_dt(struct device *dev)
+static const struct ads7846_platform_data *ads7846_probe_dt(struct
ads7846 *ts, struct device *dev)
 {
        struct ads7846_platform_data *pdata;
        struct device_node *node = dev->of_node;
@@ -1193,7 +1193,7 @@ static const struct ads7846_platform_data
*ads7846_probe_dt(struct device *dev)
        pdata->wakeup = of_property_read_bool(node, "wakeup-source") ||
                        of_property_read_bool(node, "linux,wakeup");

-       pdata->gpio_pendown = of_get_named_gpio(dev->of_node,
"pendown-gpio", 0);
+       ts->gpio_pendown = gpiod_get(dev, "pendown-gpio", GPIOD_IN);

        return pdata;
 }
@@ -1267,7 +1267,7 @@ static int ads7846_probe(struct spi_device *spi)

        pdata = dev_get_platdata(dev);
        if (!pdata) {
-               pdata = ads7846_probe_dt(dev);
+               pdata = ads7846_probe_dt(ts, dev);
                if (IS_ERR(pdata))
                        return PTR_ERR(pdata);
        }

while leaving the platform side untouched, but I think Linus' plan was to
remove the gpio settings from all platform data and instead use the gpio
lookup in the board files.

          Arnd
