Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C48F2B02A6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 11:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgKLKXu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 05:23:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbgKLKXt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Nov 2020 05:23:49 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A344C0613D1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 02:23:49 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id h6so3804287pgk.4
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 02:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PHMBNOWcq0xh/cgA7kW3gzIqu8kdIFed4Jq9FLGC650=;
        b=HY3PlzkZsTfh3t9frGUqs1ySurXU3bw18coLjvtvHmKGpdLdznRvxXHLjtB2KKzlx1
         fGT0PB/aYm/tVOZHjDKgtcBb4uXsVhdZlLWMbSFU6ndALrgLM1x1mvZSs1cml6+EXdgn
         vdjrbdmfWPpDYEQIO/oosezo3Yk8eImsq3bRJqReVoxFb+EzuAhBj5fVIQgpbdkmbWbx
         MCLECpYxlqLEm9zpAlxrlnC1qwmf9vVRi5J43t0hf3RVizU5O/bTz98I8h24+B0UWeRC
         ifWyCKRtNp5LLfIiDTAdoy2FB/Gr9O00MYsWzCgO4549Bk9dHvbdZrbbwD7SzeyGcPJ0
         AXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PHMBNOWcq0xh/cgA7kW3gzIqu8kdIFed4Jq9FLGC650=;
        b=CpgCXOEUX/G0iHE1FzODz2jvL/FTePbjADq/qR6pamOXahfm8TD3lySyoUNZE/Mqyu
         x3r/2B+xIABTzjZTHogXUgr3XI/tsBlDo3VM36qxb2lYrgbLKjg386iHQ2hTHeLHOIba
         /1GwLU3nRf+1j175PAtlfXEzThk7DAFcFdZyIxWQ2YXwQ5lG2/60/wGDaj8Eb4vCsfxb
         S5CFUKsHAgLn1uyfZDoxnfw2km45v/b2NWw+yGMiSWNuCGw/sdUzYTaQ+8e/XnWE3TnP
         gZDwks+ST3+KbzW4041DKYOyzFiJ7R+Ynd88WdJygu6rXHTs5AWMxZ9TCj5Y+CNT2oX6
         8GmA==
X-Gm-Message-State: AOAM5309AitVK/bEfaterTJ+MZaAHZiVVTR+q8Ds9FBegbq2IeKKiKwS
        7NshKkyBjqA0/tt+dVP7N+TXldfm2JCQZe/q4YY=
X-Google-Smtp-Source: ABdhPJz1i3wrWzIy6SvJQ0XT2+w6pW8hdppkVU/vvNZbDFuIhEiQZpT7L48xuc8tjOjIViX75RAgxQON3ILXAx0Coos=
X-Received: by 2002:a63:4d64:: with SMTP id n36mr17033509pgl.203.1605176629095;
 Thu, 12 Nov 2020 02:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 12 Nov 2020 12:24:38 +0200
Message-ID: <CAHp75Vcfr-=v5Ba3VhR5NTnJM3gEYevUNJUdBnhdh4YUvTzVLA@mail.gmail.com>
Subject: Re: [PATCH v7 00/18] gpiolib: acpi: pin configuration fixes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Thu, Nov 12, 2020 at 12:21 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> There are fixes (and plenty cleanups) that allow to take into consideration
> more parameters in ACPI, i.e. bias for GpioInt() and debounce timeout
> for Operation Regions, Events and GpioInt() resources.
>
> During review Hans noted, that gpiod_set_debounce() returns -ENOTSUPP for
> the cases when feature is not supported either by driver or a controller.
>
> It appears that we have slightly messy API here:
>
>   FUNC                  Relation with ENOTSUPP
>
>   gpiod_set_config()     returns if not supported
>   gpiod_set_debounce()   as gpiod_set_config() above
>   gpio_set_debounce()    legacy wrapper on top of gpiod_set_debounce()
>   gpiod_set_transitory() skips it (returns okay) with debug message
>   gpio_set_config()      returns if not supported
>   gpio_set_bias()        skips it (returns okay)

Mika, the above list is all about GPIO descriptors with an exception
of gpio_set_debounce(). The gpio_set_*(struct gpio_desc *desc, ...)
schema is used not only for the above set of functions, but also
another *internal* ones

gpio_set_open_drain_value_commit()
gpio_set_open_source_value_commit()

Hope this helps.

I think I can move gpio_set_debounce_timeout out of gpiod_* group of
declarations in gpiolib.h to avoid confusion. Will it work for you?

> Last two functions are internal to GPIO library, while the rest is
> exported API. In order to be consistent with both naming schemas
> the series introduces gpio_set_debounce_timeout() that considers
> the feature optional. New API is only for internal use.
>
> While at it, the few first patches clean up the current GPIO library
> code to unify it to some extend.
>
> The above is followed by changes made in ACPI GPIO library part.
>
> The bias patch highly depends on Intel pin control driver changes
> (they are material for v5.10 [1]), due to this and amount of the
> prerequisite changes this series is probably not supposed to be
> backported (at least right now).
>
> The last patch adds Intel GPIO tree as official one for ACPI GPIO
> changes.
>
> Assuming [1] makes v5.10 this series can be sent as PR to Linus
> for v5.11 cycle.
>
> Note, some patches are also depend to the code from GPIO fixes / for-next
> repositories. Unfortunately there is no one repository which contains all
> up to date for-next changes against GPIO subsystem. That's why I have merged
> Linus' for-next followed by Bart's for-next branches as prerequisites
> to the series.
>
> Cc: Jamie McClymont <jamie@kwiius.com>
> Cc: Coiby Xu <coiby.xu@gmail.com>
> Cc: Vasile-Laurentiu Stanimir <vasile-laurentiu.stanimir@windriver.com>
>
> [1]: https://lore.kernel.org/linux-gpio/20201106181938.GA41213@black.fi.intel.com/
>
> Changelog v7:
> - sent correct set of patches
>
> Changelog v6:
> - added tags (Hans, Mika, Linus)
> - dropped temporary variables in couple of patches (Mika)
> - dropped "Add temporary variable to gpiod_set_transitory()..." (Mika)
> - added patch to move assignments outside a lock (Mika)
> - added patch from Vasile
> - due to above rebased accordingly the affected ones
>
> Changelog v5:
> - introduced gpio_set_debounce_timeout()
> - made a prerequisite refactoring in GPIO library code
> - updated the rest accordingly
>
> Changelog v4:
> - extended debounce setting to ACPI events and Operation Regions
> - added Ack (Linus)
> - added few more cleanup patches, including MAINTAINERS update
>
> Changelog v3:
> - dropped upstreamed OF patch
> - added debounce fix
>
> Andy Shevchenko (17):
>   gpiolib: Replace unsigned by unsigned int
>   gpiolib: add missed break statement
>   gpiolib: use proper API to pack pin configuration parameters
>   gpiolib: Extract gpio_set_config_with_argument() for future use
>   gpiolib: move bias related code from gpio_set_config() to
>     gpio_set_bias()
>   gpiolib: Extract gpio_set_config_with_argument_optional() helper
>   gpiolib: Introduce gpio_set_debounce_timeout() for internal use
>   gpiolib: acpi: Respect bias settings for GpioInt() resource
>   gpiolib: acpi: Use named item for enum gpiod_flags variable
>   gpiolib: acpi: Take into account debounce settings
>   gpiolib: acpi: Move non-critical code outside of critical section
>   gpiolib: acpi: Move acpi_gpio_to_gpiod_flags() upper in the code
>   gpiolib: acpi: Make acpi_gpio_to_gpiod_flags() usable for GpioInt()
>   gpiolib: acpi: Extract acpi_request_own_gpiod() helper
>   gpiolib: acpi: Convert pin_index to be u16
>   gpiolib: acpi: Use BIT() macro to increase readability
>   gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work
>
> Vasile-Laurentiu Stanimir (1):
>   gpiolib: acpi: Set initial value for output pin based on bias and
>     polarity
>
>  MAINTAINERS                   |   1 +
>  drivers/gpio/gpiolib-acpi.c   | 138 +++++++++++++++++++++-------------
>  drivers/gpio/gpiolib-acpi.h   |   2 +
>  drivers/gpio/gpiolib.c        |  98 ++++++++++++++----------
>  drivers/gpio/gpiolib.h        |   1 +
>  include/linux/gpio/consumer.h |   4 +-
>  6 files changed, 147 insertions(+), 97 deletions(-)
>
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
