Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591832D3FA9
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 11:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728631AbgLIKNo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 05:13:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728431AbgLIKNo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 05:13:44 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB9CC0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 02:13:03 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id v3so1039241ilo.5
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 02:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vv5EWNGcGOBn17lzKflBTUVfS6qMaqRPW6pG3V7oNm0=;
        b=J3x3PEchxftRulVBJUUkwjAyds3S4iVfo7cL1pmt+TY8BVCJFnLoV2menBIMu+JiAE
         BGB4+onCy3TaXHgMTJJGoTyuLroFPWLK+oB3a9zFyoNUTgyxp7AcAACmNpVt78Y7mT0/
         FLTDUUp3ys1vYttx5rmNdPvXr7aJJFefDwZwRlvdBoVgBXhNdcLoZSLqgrslJLMQ01Wf
         8dvhkYD1sOPd7G9Pydlubps9cTcBG9V2M6osNuF03XcUTqa4ZJizt2AqAI4kumhSvK+q
         3PGfP+bLzL28vL17RWX50CRCcTasSzfmOWKcmvu/Hrfub7UqLjbl0Uc8kj6xSwDJGCJL
         cIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vv5EWNGcGOBn17lzKflBTUVfS6qMaqRPW6pG3V7oNm0=;
        b=akYZOBMZqUMW5OngFqwh6MHcVzBIsph+ICwkEXxHBO+FUA5YtUpOU9d4QoLdhlPA9w
         l8lmULvBg8jpWySB8/II/659SsbAhaW/k9zTrX7+ET/2JJHl8MP4tQGQVbRo0e6AIro9
         32To2EJpC20DoKvyXCTaHNKTza4ZDcvwhSaLrLODU7zPvBv7nbwoDvBY20ok7vMUIEIB
         mgO5XPC8TTVH76hJ0C16ZRrwV6/3HDn4EjAGaqlnhBEUduBaaWMk0yZZYWTWJLl+xELC
         wJtA/Iv8nsdH3QCLgfbzwdxcd2NTnc8FXridKwLXWQVd1fAH2cYbhPo8SVurHPXB9goe
         0ZUw==
X-Gm-Message-State: AOAM532WVaoTWkTgZpikuEzVyrjYjFfq7rM64jOoqEmpipGKMV13u9V0
        Bkuhwd39eHVTW7DiUdKzQUDifKYsNnIOzzQTH8LkTc42jGL2ag==
X-Google-Smtp-Source: ABdhPJyWYOBwMpRn9vmNphxqlGSawmSzx3hzRUsRkaHE/Iv4myQSGJETiu82M4kxl7aUMKMvyb53ponV6YUzpOLrqbc=
X-Received: by 2002:a92:c945:: with SMTP id i5mr1884465ilq.6.1607508783343;
 Wed, 09 Dec 2020 02:13:03 -0800 (PST)
MIME-Version: 1.0
References: <20201209095248.22408-1-brgl@bgdev.pl> <CACRpkdZgK3dmjM32BYAWFvHOhBUsQbNbCSNMaebvRr+Jnes=Ww@mail.gmail.com>
In-Reply-To: <CACRpkdZgK3dmjM32BYAWFvHOhBUsQbNbCSNMaebvRr+Jnes=Ww@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Dec 2020 11:12:52 +0100
Message-ID: <CAMRc=Mdq7LBTAbUguuLH=f5_vfo5pc95BCveqSvApBTC26aNQQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.11-rc1
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2020 at 11:07 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Bartosz,
>
> On Wed, Dec 9, 2020 at 10:52 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > These are the patches I collected over this release cycle. Nothing all
> > too exciting - mainly just updates to drivers and refactoring of the
> > core code. Please pull.
>
> Nice!
>
> But I get a merge conflict in gpiolib-acpi.c! Since I said Andy should
> be maintaining that file it makes me a bit nervous.
>
> It looks like this:
>
> index 6cc5f91bfe2e,23fa9df8241d..000000000000
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@@ -586,6 -526,40 +586,43 @@@ static bool acpi_get_driver_gpio_data(s
>         return false;
>   }

Strange, I didn't see any conflicts in next...

>
> ++<<<<<<< HEAD
> ++=======
> + static enum gpiod_flags
> + acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
> + {
> +       switch (agpio->io_restriction) {
> +       case ACPI_IO_RESTRICT_INPUT:
> +               return GPIOD_IN;
> +       case ACPI_IO_RESTRICT_OUTPUT:
> +               /*
> +                * ACPI GPIO resources don't contain an initial value for the
> +                * GPIO. Therefore we deduce that value from the pull field
> +                * instead. If the pin is pulled up we assume default to be
> +                * high, if it is pulled down we assume default to be low,
> +                * otherwise we leave pin untouched.
> +                */
> +               switch (agpio->pin_config) {
> +               case ACPI_PIN_CONFIG_PULLUP:
> +                       return GPIOD_OUT_HIGH;
> +               case ACPI_PIN_CONFIG_PULLDOWN:
> +                       return GPIOD_OUT_LOW;
> +               default:
> +                       break;
> +               }
> +               break;

This break is the only thing I have in my tree. Andy told me to take
that patch with his ack. It seems you don't have this function in your
tree - was it moved at some point?

Bartosz

> +       default:
> +               break;
> +       }
> +
> +       /*
> +        * Assume that the BIOS has configured the direction and pull
> +        * accordingly.
> +        */
> +       return GPIOD_ASIS;
> + }
> +
> ++>>>>>>> 1542ec5eaddb45b4fe625de3d95ee4e94226514d
>   static int
>   __acpi_gpio_update_gpiod_flags(enum gpiod_flags *flags, enum
> gpiod_flags update)
>   {
>
> I don't exactly know what do do here ... any advice?
>
> Yours,
> Linus Walleij
