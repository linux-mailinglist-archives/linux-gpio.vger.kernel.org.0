Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368F72AD86A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730958AbgKJONd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:13:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730703AbgKJONc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:13:32 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F0FC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:13:32 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id v12so11521191pfm.13
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M/Wbwc9NAiIxtgM/0e/ZkERhngg/OaAFxws8ElWVezg=;
        b=kW8Ur+Bhy9P8B3XgtBYoyDnRElllr0Wp2STvwcKP1ZKCIgB/mlnbaiQmlH/S/WDkMr
         cNfrI6vsl/nFCdyUD/KWbye5CNXt71KYFOkHOYasA+5YnViW/KL4eKlKWDkPRp/os9Rv
         EhRV9+oxqaTyIHNJ0jCdeQc/GkFyXsGmctLbdwZpVI6iIjuiqNUFKvxEtAfdn4A8Blql
         2513LnQ9GXcscaIUThH+EBfhdstAwQdHgBBEdt+A2pH/vPtB/W0Q5bffGPYumd8+He5q
         p+vDg3qWeOw+cMgtQwj1Q5HwTuMINm9VqR+a/SWL0nMRkjvtLZ4UAJPhp5LvUF6SBF/B
         51cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M/Wbwc9NAiIxtgM/0e/ZkERhngg/OaAFxws8ElWVezg=;
        b=JXwOay2MNCTtH7f4oDRdgUO/hzF72JruslJoE0h6dqT4W6HOEY1xcNzvsCkOiyStC8
         +2iQ/Pl/EzL9fKqamoSzWVQXucH/xbw/p71nY+XXEbM683zLHhifh3vEvO9vPoXbXxjn
         EDHP0QpmrXGxQnBMbRUsIVNrIysiOIlhzQWDd7V8YA4THaUuQ4Z5GQrQTACl8lfVcdRD
         KuchAAzV7kyxRkSABL7JTwlB+VFrsToWMuxSf9pqBgE3g2LvOFF+rgqu8ywG09uwp+5k
         rLnYDxoccCvVyxc7qJ3IEived90YUEIzAyBgfoM3BH2/uBz1PXXrD1zl6+6eMU67Mt75
         Sh2w==
X-Gm-Message-State: AOAM531TYIYW819zfOmDPRcX9gi1SHcAK7cPwRi0HmwDFJfZQP5Rx2cb
        zVt7zxiPglHj+iVl8oea7lTeNtCuosOp9C2jicU=
X-Google-Smtp-Source: ABdhPJwyyP6lMRoccrbttmgOrZ/++jV0c6JJWKq5GyT96ejJSdymwR48sep07l7sV/sYyK4NppIzHjAaRIImDgQPU0w=
X-Received: by 2002:a63:4511:: with SMTP id s17mr17205223pga.4.1605017611779;
 Tue, 10 Nov 2020 06:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com> <2baa55ec-d2f0-fb76-6e83-614e899ab752@redhat.com>
In-Reply-To: <2baa55ec-d2f0-fb76-6e83-614e899ab752@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Nov 2020 16:14:20 +0200
Message-ID: <CAHp75VfqvE9gZ3fmjm54nRV_e9_bCDAZZnXP27f0j9i-uH6uDA@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] gpiolib: acpi: pin configuration fixes
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jamie McClymont <jamie@kwiius.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 4:10 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/9/20 9:53 PM, Andy Shevchenko wrote:
> > There are fixes (and plenty cleanups) that allow to take into consideration
> > more parameters in ACPI, i.e. bias for GpioInt() and debounce timeout
> > for Operation Regions, Events and GpioInt() resources.
> >
> > During review Hans noted, that gpiod_set_debounce() returns -ENOTSUPP for
> > the cases when feature is not supported either by driver or a controller.
> >
> > It appears that we have slightly messy API here:
> >
> >   FUNC                        Relation with ENOTSUPP
> >
> >   gpiod_set_config()   returns if not supported
> >   gpiod_set_debounce()         as gpiod_set_config() above
> >   gpio_set_debounce()  legacy wrapper on top of gpiod_set_debounce()
> >   gpiod_set_transitory() skips it (returns okay) with debug message
> >   gpio_set_config()    returns if not supported
> >   gpio_set_bias()      skips it (returns okay)
> >
> > Last two functions are internal to GPIO library, while the rest is
> > exported API. In order to be consistent with both naming schemas
> > the series introduces gpio_set_debounce_timeout() that considers
> > the feature optional. New API is only for internal use.
> >
> > While at it, the few first patches do clean up the current GPIO library
> > code to unify it to some extend.
> >
> > The above is followed by changes made in ACPI GPIO library part.
> >
> > The bias patch highly depends on Intel pin control driver changes
> > (they are material for v5.10 [1]), due to this and amount of the
> > prerequisite changes this series is probably not supposed to be
> > backported (at least right now).
>
> The entire series looks good to me, feel free to add my:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thanks!

I still would like Mika to have a look and perform a couple more tests myself.
And I have one emergency task right now, so I think we have time to
let others have a look and comment / test / etc.

>
> to patches 1-16 (patch 17 makes sense to me, but I do not feel
> I'm the right person to ack it).
>
> Regards,
>
> Hans
>
>
>
>
> >
> > The last patch adds Intel GPIO tree as official one for ACPI GPIO
> > changes.
> >
> > Assuming [1] makes v5.10 this series can be sent as PR to Linus
> > for v5.11 cycle.
> >
> > Note, some patches are also depend to the code from GPIO fixes / for-next
> > repositories. Unfortunately there is no one repository which contains all
> > up to date for-next changes against GPIO subsystem. That's why I have merged
> > Bart's for-current followed by Linus' fixes followed by Bart's for-next
> > followed by Linus' for-next branches as prerequisites to the series.
> >
> > Cc: Jamie McClymont <jamie@kwiius.com>
> >
> > [1]: https://lore.kernel.org/linux-gpio/20201106181938.GA41213@black.fi.intel.com/
> >
> > Changelog v5:
> > - introduced gpio_set_debounce_timeout()
> > - made a prerequisite refactoring in GPIO library code
> > - updated the rest accordingly
> >
> > Changelog v4:
> > - extended debounce setting to ACPI events and Operation Regions
> > - added Ack (Linus)
> > - added few more cleanup patches, including MAINTAINERS update
> >
> > Changelog v3:
> > - dropped upstreamed OF patch
> > - added debounce fix
> >
> > Andy Shevchenko (17):
> >   gpiolib: Replace unsigned by unsigned int
> >   gpiolib: add missed break statement
> >   gpiolib: use proper API to pack pin configuration parameters
> >   gpiolib: Add temporary variable to gpiod_set_transitory() for cleaner
> >     code
> >   gpiolib: Extract gpio_set_config_with_argument() for future use
> >   gpiolib: move bias related code from gpio_set_config() to
> >     gpio_set_bias()
> >   gpiolib: Extract gpio_set_config_with_argument_optional() helper
> >   gpiolib: Extract gpio_set_debounce_timeout() for internal use
> >   gpiolib: acpi: Respect bias settings for GpioInt() resource
> >   gpiolib: acpi: Use named item for enum gpiod_flags variable
> >   gpiolib: acpi: Take into account debounce settings
> >   gpiolib: acpi: Move acpi_gpio_to_gpiod_flags() upper in the code
> >   gpiolib: acpi: Make acpi_gpio_to_gpiod_flags() usable for GpioInt()
> >   gpiolib: acpi: Extract acpi_request_own_gpiod() helper
> >   gpiolib: acpi: Convert pin_index to be u16
> >   gpiolib: acpi: Use BIT() macro to increase readability
> >   gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work
> >
> >  MAINTAINERS                   |   1 +
> >  drivers/gpio/gpiolib-acpi.c   | 130 ++++++++++++++++++++--------------
> >  drivers/gpio/gpiolib-acpi.h   |   2 +
> >  drivers/gpio/gpiolib.c        |  97 ++++++++++++++-----------
> >  drivers/gpio/gpiolib.h        |   1 +
> >  include/linux/gpio/consumer.h |   4 +-
> >  6 files changed, 141 insertions(+), 94 deletions(-)
> >
>


-- 
With Best Regards,
Andy Shevchenko
