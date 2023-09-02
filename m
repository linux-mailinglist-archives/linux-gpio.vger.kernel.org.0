Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 127D4790847
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Sep 2023 16:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbjIBOkV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Sep 2023 10:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232129AbjIBOkV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Sep 2023 10:40:21 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CD910EF
        for <linux-gpio@vger.kernel.org>; Sat,  2 Sep 2023 07:40:17 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-44d4d997dcfso14751137.0
        for <linux-gpio@vger.kernel.org>; Sat, 02 Sep 2023 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693665617; x=1694270417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmvs943FMEQtbu1KacuFgagsI7Z/vptG6vhwuSDiOEg=;
        b=UduDqpfQXcWy7bDhGA2q8bDFr/eE4cFiQjvxl2ZDTpRvWOXJOv8ydp2FjHQkvbyBZi
         OGOwNp/bqW4OfrTPS2G82jOrXbu9RllJCHG7/zt0bp6lXHqB91Lfb9+oBeQM6DsmbwiF
         xunRLASqWlGvy2xWyL3+6cim22o/XvhseOU3Cpuxeew7Szjscl8QrdFlnkTwfkuzXajW
         Vh7wrYQbW2uRbKL3CdY1FFDibJO3o7tgCcrm8lOxc+EEvT3PGSxVYXyqSsFugYxfB3lO
         TO3eAGWK5UOf3arOayZeA9ApPT8EKKMlSYtGSBCqO3XVBKBMZ4w6lyMifLa+sOSwlBm7
         ZGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693665617; x=1694270417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmvs943FMEQtbu1KacuFgagsI7Z/vptG6vhwuSDiOEg=;
        b=HqKoOWg/ASHhewCIc1HrueIiGqelsMZMv6si6Ul4ivqmKqBCDsgB6XnizLJN7GBSqA
         DIpyHAszmmchZKP/Sk9x/+QeevBD1OOfKTqW3CWEyGC8NFuj06BSJoZ9xvuvT4zZ/XfL
         rDRCmdqtmNiwyFSwlB4RJlmiVNfHooUqMiYAvGDmVX3bpV6I5VZGKctKxGpc7rssCqps
         RICmHqy9nPE0NVAFmTIQL34TbgyoHlae7ZKO8iWuHrOeTxdEJwdPrqeLVuxbwAvPmybG
         YIztDUPQowN6C1NpxF4MwT2cdX0HMOYoecdfrqQdE85Np9e+BkXY+bUFX5PR2XzSSLiB
         sEEg==
X-Gm-Message-State: AOJu0YzFMiZ9wm0eG/ssSMI6dayS5P3PV7AEFo3YROsoCwaKgvlCIMB1
        sgoyySteNiCIxIZf+qeFZPiAKxMNvOs7Jy+X0EPdFA==
X-Google-Smtp-Source: AGHT+IHg7L1xeU8puyvHGovJX7vzUppkLBpLLUZGgzFIfE3T3JWZWCJhoWmAGkh5G1ByHO4s1X/+AMgJRoQNNWrKAto=
X-Received: by 2002:a67:f7cd:0:b0:44d:40b1:9277 with SMTP id
 a13-20020a67f7cd000000b0044d40b19277mr5576233vsp.12.1693665616757; Sat, 02
 Sep 2023 07:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230901183240.102701-1-brgl@bgdev.pl> <ZPJTT/l9fX1lhu6O@smile.fi.intel.com>
In-Reply-To: <ZPJTT/l9fX1lhu6O@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 2 Sep 2023 16:40:05 +0200
Message-ID: <CAMRc=Mekf9Rek3_G2ttQY+yBvWM3+P4RAWVOQH99eajn38F+og@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: don't fiddle with GPIOLIB private members
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 1, 2023 at 11:10=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 01, 2023 at 08:32:40PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We access internals of struct gpio_device and struct gpio_desc because
> > it's easier but it can actually be avoided and we're working towards a
> > better encapsulation of GPIO data structures across the kernel so let's
> > start at home.
> >
> > Instead of checking gpio_desc flags, let's just track the requests of
> > GPIOs in the driver. We also already store the information about
> > direction of simulated lines.
> >
> > For kobjects needed by sysfs callbacks: we can leverage the fact that
> > once created for a software node, struct device is accessible from that
> > fwnode_handle. We don't need to dereference gpio_device.
> >
> > While at it: fix one line break and remove the untrue part about
> > configfs callbacks using dev_get_drvdata() from a comment.
>
> ...
>
> > -static void gpio_sim_free(struct gpio_chip *gc, unsigned int offset)
>
> Why is this?
>

Dunno, some git shenanigans?

> > +static int gpio_sim_request(struct gpio_chip *gc, unsigned int offset)
> >  {
> >       struct gpio_sim_chip *chip =3D gpiochip_get_data(gc);
> >
> >       scoped_guard(mutex, &chip->lock)
> > +             __set_bit(offset, chip->request_map);
> > +
> > +     return 0;
> > +}
> > +
> > +static void gpio_sim_free(struct gpio_chip *gc, unsigned int offset)
> > +{
> > +     struct gpio_sim_chip *chip =3D gpiochip_get_data(gc);
> > +
> > +     scoped_guard(mutex, &chip->lock) {
> >               __assign_bit(offset, chip->value_map,
> >                            !!test_bit(offset, chip->pull_map));
> > +             __clear_bit(offset, chip->request_map);
> > +     }
> >  }
>
> Seems to me like you. shuffled the order of the two functions.
> Can you leave _free() at the same location in the file?
>

I didn't. Request comes before free but they're next to each other.

> ...
>
> > -     /* Used by sysfs and configfs callbacks. */
> > -     dev_set_drvdata(&gc->gpiodev->dev, chip);
> > +     /* Used by sysfs callbacks. */
> > +     dev_set_drvdata(swnode->dev, chip);
>
> dev pointer of firmware node is solely for dev links. Is it the case here=
?
> Seems to me you luckily abuse it.
>

I don't think so. If anything we have a helper in the form of
get_dev_from_fwnode() but it takes reference to the device while we
don't need it - we know it'll be there because we created it.

This information (struct device of the GPIO device) can also be
retrieved by iterating over the device children of the top platform
device and comparing their fwnodes against the one we got passed down
from probe() but it's just so many extra steps.

Or we can have a getter in gpio/driver.h for that but I don't want to
expose another interface is we can simply use the fwnode.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>
