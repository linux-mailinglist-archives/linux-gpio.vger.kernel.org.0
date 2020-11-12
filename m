Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829272B076B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 15:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgKLOQE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 09:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgKLOQD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 09:16:03 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A9AC0613D1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 06:16:03 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id h16so205046pgb.7
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 06:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aGXz6X4B2y4Mkp6tdNbnotP/hwt0cYYuqXNDcaNuULo=;
        b=NaBaKe+7A2+M0Ii2RsY/nYJRuEO3Uo+a5PgIr+3MRRqAWou8lfjbMcIx4tQpazX7Tu
         6OQ4+y922e+P+u3Y8HPNQUy1eF/Ow1Xrp5S4BGPERjdtSjYb408P/WsbwNys8lEda+tt
         Xgdi491SKHR/ubpsnOO8S5NfoVvS1DIocxWt3qKHA5D/cIIz69SoyOHzU85Lj4+AZr/P
         BzPLWwCRtgfmCTmWDmVBql16ZsgXVYUV725tuk7v5QvBuRB9Ud/CmNV61wlYW5zWvkhn
         wr0r08yCEp4MHmjOvdl8RDa1Rfo3JNzbpIkYQexmVFZ6MLVTxrHsvc4EBnhgDItavzQh
         7EXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aGXz6X4B2y4Mkp6tdNbnotP/hwt0cYYuqXNDcaNuULo=;
        b=A686ybLxxf9o7liUYp5MeoaDIXuakXB3PTaLzjfC4vtqkUrwJOSf9tPkCHGZpgdjHV
         kbL0iukCtPecDMXbn3qGojvd5me8GI9TMCYgvAd1yXgbAACHMoWuMJTFRXad0LuiiA1G
         Xd5Jwcp96BlK8JsTdh3NZ272izNyhGiluzuawmMnfxk9jWE8ErBvrOJcfvIVFs5f78G/
         PZOar0Urekjqb4ByM6yvA5BHE8gi6FtfDeGWZ/rScO+3ZuS+bTPDFZTvU+vCEwMh508B
         D1V/ebULLBB6WFX8te4R9palIDbFUewpAS3tL/4sr5iHK/b2Xs4mS3QTtzsSzBRwufka
         xz3Q==
X-Gm-Message-State: AOAM531CGInPOZln7eH3HOcYUjulpi8HL+NwJh1+bDZOCFeg/rOh5RV3
        jqoRa2hdKr38MF/EKGM6yziksSnUiHWYY5PToj4=
X-Google-Smtp-Source: ABdhPJzxe301n3lcZpgwdXy4FNKKLuLgv0/gUJEmuBwJVrvJsglVfXS4ZwvL1sHan+8G+o+QEsLWHQOUsyT1UK2Mb9U=
X-Received: by 2002:aa7:8c4f:0:b029:18b:f361:4aa3 with SMTP id
 e15-20020aa78c4f0000b029018bf3614aa3mr10810538pfd.73.1605190563403; Thu, 12
 Nov 2020 06:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com> <CAHp75Vcfr-=v5Ba3VhR5NTnJM3gEYevUNJUdBnhdh4YUvTzVLA@mail.gmail.com>
In-Reply-To: <CAHp75Vcfr-=v5Ba3VhR5NTnJM3gEYevUNJUdBnhdh4YUvTzVLA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 12 Nov 2020 16:16:51 +0200
Message-ID: <CAHp75Vd68Kb+b4PoZ-LZcs=Bqx+t1wK7pi_5JyRLpKdr1=uMfA@mail.gmail.com>
Subject: Re: [PATCH v7 00/18] gpiolib: acpi: pin configuration fixes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jamie McClymont <jamie@kwiius.com>,
        Coiby Xu <coiby.xu@gmail.com>,
        Vasile-Laurentiu Stanimir 
        <vasile-laurentiu.stanimir@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc Mika and Hans

Linus, Bart, it would be nice to hear from you about GPIO library
cleanups and in general about the series...

On Thu, Nov 12, 2020 at 12:24 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Nov 12, 2020 at 12:21 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > There are fixes (and plenty cleanups) that allow to take into consideration
> > more parameters in ACPI, i.e. bias for GpioInt() and debounce timeout
> > for Operation Regions, Events and GpioInt() resources.
> >
> > During review Hans noted, that gpiod_set_debounce() returns -ENOTSUPP for
> > the cases when feature is not supported either by driver or a controller.
> >
> > It appears that we have slightly messy API here:
> >
> >   FUNC                  Relation with ENOTSUPP
> >
> >   gpiod_set_config()     returns if not supported
> >   gpiod_set_debounce()   as gpiod_set_config() above
> >   gpio_set_debounce()    legacy wrapper on top of gpiod_set_debounce()
> >   gpiod_set_transitory() skips it (returns okay) with debug message
> >   gpio_set_config()      returns if not supported
> >   gpio_set_bias()        skips it (returns okay)
>
> Mika, the above list is all about GPIO descriptors with an exception
> of gpio_set_debounce(). The gpio_set_*(struct gpio_desc *desc, ...)
> schema is used not only for the above set of functions, but also
> another *internal* ones
>
> gpio_set_open_drain_value_commit()
> gpio_set_open_source_value_commit()
>
> Hope this helps.
>
> I think I can move gpio_set_debounce_timeout out of gpiod_* group of
> declarations in gpiolib.h to avoid confusion. Will it work for you?
>
> > Last two functions are internal to GPIO library, while the rest is
> > exported API. In order to be consistent with both naming schemas
> > the series introduces gpio_set_debounce_timeout() that considers
> > the feature optional. New API is only for internal use.
> >
> > While at it, the few first patches clean up the current GPIO library
> > code to unify it to some extend.
> >
> > The above is followed by changes made in ACPI GPIO library part.
> >
> > The bias patch highly depends on Intel pin control driver changes
> > (they are material for v5.10 [1]), due to this and amount of the
> > prerequisite changes this series is probably not supposed to be
> > backported (at least right now).
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
> > Linus' for-next followed by Bart's for-next branches as prerequisites
> > to the series.
> >
> > Cc: Jamie McClymont <jamie@kwiius.com>
> > Cc: Coiby Xu <coiby.xu@gmail.com>
> > Cc: Vasile-Laurentiu Stanimir <vasile-laurentiu.stanimir@windriver.com>
> >
> > [1]: https://lore.kernel.org/linux-gpio/20201106181938.GA41213@black.fi.intel.com/
> >
> > Changelog v7:
> > - sent correct set of patches
> >
> > Changelog v6:
> > - added tags (Hans, Mika, Linus)
> > - dropped temporary variables in couple of patches (Mika)
> > - dropped "Add temporary variable to gpiod_set_transitory()..." (Mika)
> > - added patch to move assignments outside a lock (Mika)
> > - added patch from Vasile
> > - due to above rebased accordingly the affected ones
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
> >   gpiolib: Extract gpio_set_config_with_argument() for future use
> >   gpiolib: move bias related code from gpio_set_config() to
> >     gpio_set_bias()
> >   gpiolib: Extract gpio_set_config_with_argument_optional() helper
> >   gpiolib: Introduce gpio_set_debounce_timeout() for internal use
> >   gpiolib: acpi: Respect bias settings for GpioInt() resource
> >   gpiolib: acpi: Use named item for enum gpiod_flags variable
> >   gpiolib: acpi: Take into account debounce settings
> >   gpiolib: acpi: Move non-critical code outside of critical section
> >   gpiolib: acpi: Move acpi_gpio_to_gpiod_flags() upper in the code
> >   gpiolib: acpi: Make acpi_gpio_to_gpiod_flags() usable for GpioInt()
> >   gpiolib: acpi: Extract acpi_request_own_gpiod() helper
> >   gpiolib: acpi: Convert pin_index to be u16
> >   gpiolib: acpi: Use BIT() macro to increase readability
> >   gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work
> >
> > Vasile-Laurentiu Stanimir (1):
> >   gpiolib: acpi: Set initial value for output pin based on bias and
> >     polarity
> >
> >  MAINTAINERS                   |   1 +
> >  drivers/gpio/gpiolib-acpi.c   | 138 +++++++++++++++++++++-------------
> >  drivers/gpio/gpiolib-acpi.h   |   2 +
> >  drivers/gpio/gpiolib.c        |  98 ++++++++++++++----------
> >  drivers/gpio/gpiolib.h        |   1 +
> >  include/linux/gpio/consumer.h |   4 +-
> >  6 files changed, 147 insertions(+), 97 deletions(-)
> >
> > --
> > 2.28.0
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
