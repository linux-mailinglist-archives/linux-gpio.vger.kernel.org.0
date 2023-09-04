Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844887914A9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Sep 2023 11:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbjIDJWs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Sep 2023 05:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjIDJWr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Sep 2023 05:22:47 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EA218D
        for <linux-gpio@vger.kernel.org>; Mon,  4 Sep 2023 02:22:44 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-44d426d0e05so537961137.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 Sep 2023 02:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693819363; x=1694424163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEQ5w7xZwjvl4o7D/UwPtekEyUloXNNBLXgCL89FI+g=;
        b=w5bGYbwWjug3yR43MTvQhRJnaXM0qohiob3YBHtQ8bY9398/i+3ayidUa6T91GyxZs
         zOjzkwtgvupOppnQY6/9tkX5bvYOjKBOefidOVH46L7/gCsZ4XFrOolHIHuy0tPcE3r9
         2CED5PTyTUv4v+cVh7XKBxCGA59xbudJWoJPfIkIgiAGKO0NWWQRJdL/pcIMHtl+wjn6
         gwndQIhTkEFsojlcB7Z+LWpSjL7OoFUpJGzk8Vr4IFsCsb5EvXgFaV1xpSukwAt6wOOL
         SeVjQ4fTUi5EY/L2gBphrRF/VbSvBmP46hKTZKunacif2BSLubHNbaVdI0bb41hSi48Q
         d8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693819363; x=1694424163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gEQ5w7xZwjvl4o7D/UwPtekEyUloXNNBLXgCL89FI+g=;
        b=KrA8vT0Bzwrr9tkGgOMMPl3Hi98TiCZhcGFJwhpSaxy19aXPfuATZnwMV7cqvMnVEV
         Tevg0VAfgGwC1S/KY9AHgsH4m3ao1Wa+N17sgz7y6QaDGCSzULdRZzzKx9w/6gtHk9uz
         9ZNeXmi8fivwMWR/+NsEaqPn01NequTQ2jFkIAn2cwgfjcS6dx9ASnCF4mH8wM4pKEO0
         cUHHSkpMLNOzk/jfYf0f6YABkDluWo3Vs0XjjufzTalXIR4v8Xh0Ai2L1yTQ2oO01gd+
         uQl0D7IBPvV7uukPR7ted2xJXyXrwgTWIknZL2OVfJNCct5UucataqoNFYCjtL3GVxwI
         xHoA==
X-Gm-Message-State: AOJu0YzVQPQOdybmwRTHMZUtOKuHHpflk8ZtChFTYNX4lJ67bcuoND8Z
        X0FoM2m7kCpxXTLVx2prS1LLbEjY4YjhnvY90GDCpPgqhkywn9A+L4A=
X-Google-Smtp-Source: AGHT+IHmKVZY+BtLyRZ9Y5kEr7EiAs5rrywBA/p8vdVCm4QP1mqQ1kfxrWauY3gBHIX5Jm9KlQAcfYXBOVLFHDn+LwY=
X-Received: by 2002:a05:6102:3170:b0:44d:4a41:893e with SMTP id
 l16-20020a056102317000b0044d4a41893emr6028730vsm.6.1693819363526; Mon, 04 Sep
 2023 02:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230901183240.102701-1-brgl@bgdev.pl> <ZPJTT/l9fX1lhu6O@smile.fi.intel.com>
 <CAMRc=Mekf9Rek3_G2ttQY+yBvWM3+P4RAWVOQH99eajn38F+og@mail.gmail.com> <ZPWcTMPiu4MSq+F7@smile.fi.intel.com>
In-Reply-To: <ZPWcTMPiu4MSq+F7@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 4 Sep 2023 11:22:32 +0200
Message-ID: <CAMRc=MfZv70FXHyNw4yK90NL5-jjAJa6qbKc6SV2ZwbaJkKQqg@mail.gmail.com>
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

On Mon, Sep 4, 2023 at 10:59=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Sep 02, 2023 at 04:40:05PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Sep 1, 2023 at 11:10=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Sep 01, 2023 at 08:32:40PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > -static void gpio_sim_free(struct gpio_chip *gc, unsigned int offse=
t)
> > >
> > > Why is this?
> >
> > Dunno, some git shenanigans?
>
> Time to use --patience then?
>

Ha! I wasn't even aware you can use this with format-patch. Looks much
better indeed.

> ...
>
> > > > -     /* Used by sysfs and configfs callbacks. */
> > > > -     dev_set_drvdata(&gc->gpiodev->dev, chip);
> > > > +     /* Used by sysfs callbacks. */
> > > > +     dev_set_drvdata(swnode->dev, chip);
> > >
> > > dev pointer of firmware node is solely for dev links. Is it the case =
here?
> > > Seems to me you luckily abuse it.
> >
> > I don't think so. If anything we have a helper in the form of
> > get_dev_from_fwnode() but it takes reference to the device while we
> > don't need it - we know it'll be there because we created it.
> >
> > This information (struct device of the GPIO device) can also be
> > retrieved by iterating over the device children of the top platform
> > device and comparing their fwnodes against the one we got passed down
> > from probe() but it's just so many extra steps.
> >
> > Or we can have a getter in gpio/driver.h for that but I don't want to
> > expose another interface is we can simply use the fwnode.
>
> dev pointer in the fwnode strictly speaking is optional. No-one, except
> its solely user, should rely on it (its presence and lifetime).
>

Where is this documented? Because just by a quick glance into
drivers/base/core.c I can tell that if a device has an fwnode then
fwnode->dev gets assigned when the device is created and cleared when
it's removed (note: note even attached to driver, just
created/removed). Seems like pretty reliable behavior to me.

Bart

> --
> With Best Regards,
> Andy Shevchenko
>
>
