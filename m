Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1065BD0B4
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 17:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiISPWP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 11:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiISPV5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 11:21:57 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D4638692
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 08:20:49 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id p3so13309644iof.13
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 08:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YLOApTarCsOqUAlgmIHrRc/X2zACHEMKuKTBUNKzFw4=;
        b=fAUA2XlM5yhDxFmaaD7YX83jPOwHgHi9hjjWMHaCofYsDkqiSjsHLy4jwa+8hjRjTY
         eKsYK95pUXwJFcy2Z6VLyBfHo1q9zlFdklB+FYaWC/eP+qJRlFt42I/+KYt/EzwWayat
         5aNWkeprK/CqunbtcA+LBEAz26gHmYdfGGNls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YLOApTarCsOqUAlgmIHrRc/X2zACHEMKuKTBUNKzFw4=;
        b=SCpCl/G9m5AwxD1Tbmw8fudKzWO5SU8bJONyPQZM0vMG1uDbzLjpAVaZTQby0ozBFS
         HBk+M2lKKCkPl2pn6wk809ZieN0vpB6CuLIbcaKZejdID0Y75qpIKLHfAP9wD9yIiWIi
         JCq9abT71YaqlHOlS4Gei2upeaTfrrCzXIN4gc/cCssI2wVnRwTUSBZiBGY3NSZEaJjA
         5QNtw3QV4EMR7DeEZKiaCQF0S6lx7a+YHtU36FrRfhS5juiWrKrS2JaU24Bou9efbxC6
         Aqk6piuXaZkZeExiuJPM1E3APK7gCSL4dAa1pguhcS6mPm/1PpcjwXT8bfWfGLh4K75c
         Y+oQ==
X-Gm-Message-State: ACrzQf2b60ZI9suN11vQoC+3/KzIBxZPkBphwzWqiE/+JxnqCZwustJr
        gPI3l5vUexhSrns9n4jCWYfyB5QsgH+saQ==
X-Google-Smtp-Source: AA6agR6h6jJ19TnswrKlMf0QrRpVR72KB0byrYJMTnNbzhWnIUx+wctoZEZaEon5P4HNgv1cf0ndJQ==
X-Received: by 2002:a02:cca1:0:b0:358:3b30:6d23 with SMTP id t1-20020a02cca1000000b003583b306d23mr8416770jap.20.1663600847858;
        Mon, 19 Sep 2022 08:20:47 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id f60-20020a0284c2000000b0035a17975109sm5511122jai.138.2022.09.19.08.20.46
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 08:20:47 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id p3so13309570iof.13
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 08:20:46 -0700 (PDT)
X-Received: by 2002:a05:6602:2d44:b0:6a1:b558:272d with SMTP id
 d4-20020a0566022d4400b006a1b558272dmr7433211iow.7.1663600846333; Mon, 19 Sep
 2022 08:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220914235801.1731478-1-rrangel@chromium.org>
 <20220914155914.v3.5.I4ff95ba7e884a486d7814ee888bf864be2ebdef4@changeid> <Yyg8RU2k6ZCRuqri@smile.fi.intel.com>
In-Reply-To: <Yyg8RU2k6ZCRuqri@smile.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 19 Sep 2022 09:20:33 -0600
X-Gmail-Original-Message-ID: <CAHQZ30BcM2n+bvv8CTRYpC4xhzJGr9k9=o0bJk-adDnpxsqABg@mail.gmail.com>
Message-ID: <CAHQZ30BcM2n+bvv8CTRYpC4xhzJGr9k9=o0bJk-adDnpxsqABg@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] gpiolib: acpi: Add wake_capable variants of acpi_dev_gpio_irq_get
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tim Van Patten <timvp@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 19, 2022 at 3:54 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 14, 2022 at 05:57:53PM -0600, Raul E Rangel wrote:
> > The ACPI spec defines the SharedAndWake and ExclusiveAndWake share type
> > keywords. This is an indication that the GPIO IRQ can also be used as a
> > wake source. This change exposes the wake_capable bit so drivers can
> > correctly enable wake functionality instead of making an assumption.
>
> With two nit-picks below
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Kept `acpi_dev_gpio_irq_get_by` unchanged to avoid having to touch
> >   unrelated drivers.
> > - Converted wake_capable parameter to bool.
> >
> > Changes in v2:
> > - Fixed call site in mlxbf_gige_probe
> >
> >  drivers/gpio/gpiolib-acpi.c | 17 ++++++++++++++---
> >  drivers/gpio/gpiolib-acpi.h |  2 ++
> >  include/linux/acpi.h        | 22 ++++++++++++++++++----
> >  3 files changed, 34 insertions(+), 7 deletions(-)
> >

> > diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> > index 9be1376f9a627f..c703f095993a2c 100644
> > --- a/drivers/gpio/gpiolib-acpi.c
> > +++ b/drivers/gpio/gpiolib-acpi.c
> > @@ -741,6 +741,8 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
> >               lookup->info.pin_config = agpio->pin_config;
> >               lookup->info.debounce = agpio->debounce_timeout;
> >               lookup->info.gpioint = gpioint;
> > +             lookup->info.wake_capable = agpio->wake_capable ==
> > +                                         ACPI_WAKE_CAPABLE;
>
> Can be still on one line.
>

I used clang-format to format the code. Apparently that still uses the
80 char limit. I've gone ahead and manually changed it.

> >               /*
> >                * Polarity and triggering are only specified for GpioInt
> > @@ -987,10 +989,12 @@ struct gpio_desc *acpi_node_get_gpiod(struct fwnode_handle *fwnode,
> >  }
> >
> >  /**
> > - * acpi_dev_gpio_irq_get_by() - Find GpioInt and translate it to Linux IRQ number
> > + * acpi_dev_gpio_irq_wake_get_by() - Find GpioInt and translate it to Linux IRQ
> > + *                                   number
> >   * @adev: pointer to a ACPI device to get IRQ from
> >   * @name: optional name of GpioInt resource
> >   * @index: index of GpioInt resource (starting from %0)
> > + * @wake_capable: Set to true if the IRQ is wake capable
> >   *
> >   * If the device has one or more GpioInt resources, this function can be
> >   * used to translate from the GPIO offset in the resource to the Linux IRQ
> > @@ -1002,9 +1006,13 @@ struct gpio_desc *acpi_node_get_gpiod(struct fwnode_handle *fwnode,
> >   * The function takes optional @name parameter. If the resource has a property
> >   * name, then only those will be taken into account.
> >   *
> > + * The GPIO is considered wake capable if the GpioInt resource specifies
> > + * SharedAndWake or ExclusiveAndWake.
> > + *
> >   * Return: Linux IRQ number (> %0) on success, negative errno on failure.
> >   */
> > -int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int index)
> > +int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name,
> > +                               int index, bool *wake_capable)
> >  {
> >       int idx, i;
> >       unsigned int irq_flags;
> > @@ -1061,13 +1069,16 @@ int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int ind
> >                               dev_dbg(&adev->dev, "IRQ %d already in use\n", irq);
> >                       }
> >
> > +                     if (wake_capable)
> > +                             *wake_capable = info.wake_capable;
> > +
> >                       return irq;
> >               }
> >
> >       }
> >       return -ENOENT;
> >  }
> > -EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_get_by);
> > +EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_wake_get_by);
> >
> >  static acpi_status
> >  acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
> > diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
> > index e476558d947136..1ac6816839dbce 100644
> > --- a/drivers/gpio/gpiolib-acpi.h
> > +++ b/drivers/gpio/gpiolib-acpi.h
> > @@ -18,6 +18,7 @@ struct acpi_device;
> >   * @pin_config: pin bias as provided by ACPI
> >   * @polarity: interrupt polarity as provided by ACPI
> >   * @triggering: triggering type as provided by ACPI
> > + * @wake_capable: wake capability as provided by ACPI
> >   * @debounce: debounce timeout as provided by ACPI
> >   * @quirks: Linux specific quirks as provided by struct acpi_gpio_mapping
> >   */
> > @@ -28,6 +29,7 @@ struct acpi_gpio_info {
> >       int pin_config;
> >       int polarity;
> >       int triggering;
> > +     bool wake_capable;
> >       unsigned int debounce;
> >       unsigned int quirks;
> >  };
> > diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> > index 6f64b2f3dc5479..d3121cef6cc3bc 100644
> > --- a/include/linux/acpi.h
> > +++ b/include/linux/acpi.h
> > @@ -1202,7 +1202,8 @@ bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
> >                               struct acpi_resource_gpio **agpio);
> >  bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
> >                              struct acpi_resource_gpio **agpio);
> > -int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int index);
> > +int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *name,
> > +                               int index, bool *wake_capable);
> >  #else
> >  static inline bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
> >                                             struct acpi_resource_gpio **agpio)
> > @@ -1214,16 +1215,29 @@ static inline bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
> >  {
> >       return false;
> >  }
> > -static inline int acpi_dev_gpio_irq_get_by(struct acpi_device *adev,
> > -                                        const char *name, int index)
> > +static inline int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev,
> > +                                             const char *name, int index,
> > +                                             bool *wake_capable)
> >  {
> >       return -ENXIO;
> >  }
> >  #endif
> >
> > +static inline int acpi_dev_gpio_irq_get_by(struct acpi_device *adev,
> > +                                        const char *name, int index)
> > +{
> > +     return acpi_dev_gpio_irq_wake_get_by(adev, name, index, NULL);
> > +}
> > +
> >  static inline int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
> >  {
> > -     return acpi_dev_gpio_irq_get_by(adev, NULL, index);
> > +     return acpi_dev_gpio_irq_wake_get_by(adev, NULL, index, NULL);
> > +}
>

> > +static inline int acpi_dev_gpio_irq_wake_get(struct acpi_device *adev,
> > +                                          int index, bool *wake_capable)
> > +{
> > +     return acpi_dev_gpio_irq_wake_get_by(adev, NULL, index, wake_capable);
> >  }
>
> I would put this first in the group of these three helpers, so irq_get_by and
> irq_get will be the last (from more parameters to less parameters).
>

Done

> >  /* Device properties */
> > --
> > 2.37.3.968.ga6b4b080e4-goog
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks for the review!
