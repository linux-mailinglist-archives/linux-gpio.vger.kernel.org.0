Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62BED7780F9
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 21:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbjHJTEY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 15:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233897AbjHJTEY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 15:04:24 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D49E56
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 12:04:23 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-79da1a3e2e2so69972241.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 12:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691694263; x=1692299063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsXOhon4zq2nLMmNgmSv53z5EHN1tQRGhx0TUkk6Klg=;
        b=CJcK9emsQ143J/ZoWMqWZ2Bi6Luc+Zr2TZL9sE7xRltRQu3Wgj+p1yPG525mmiD/9r
         Iu3ft5IR59BRz5R5oNeDJF0BE+679i94Iyj5jMxS/SioJhjfnKBTB5y6A4rah1tAqkdL
         /0KgGuGouiH6rYLPkzH/1MhHaM7W54ngi1iIfCNCIoyjbam/BngZD+w7kMeo62kpYSfT
         URddNZu6FLN23zbJQXBMxBQXBKaZsru6eOB2SR1k/CrRaHpebCKdrxBsUFSL4uav8YEk
         r0xA/E6X/vOAaQ0FDilv0xvjQEBEBMmEqI//nJWd05n4v1Jh9rkHIblxrllvrfDyuZXS
         Evvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691694263; x=1692299063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsXOhon4zq2nLMmNgmSv53z5EHN1tQRGhx0TUkk6Klg=;
        b=Ogt17ZZz2BDh+7aOdaI+PoDhFmhgEETAKWTgd4D0B9Fri+ul1XsyCCkE0B7xs6SIbo
         OaNQ9kN57vcT+mnaRoSq2l9Pslltqjpl0U1LUlRKkBViFn2e9zLPBre9RmFSuE/ypT0K
         YRxhEJipMoZEu+kzjvaisfNwLw+elWZ1FzlUX6qEIeU25zgm6u4cOHi7tsfG1wjZsHua
         o4SirtdTfVaWJbADcdYepr2/2C8uWfsZDz4wdyciRn8nCixpwdE2OUIkRb7xweGf3S0C
         qvT2LbewWTrcgZ3As8MY/PZA8USyFY7HsNNnSemufoUM5yrfUnBtPqGQH8FAn9SwnrmF
         Nojw==
X-Gm-Message-State: AOJu0YwcIKo69Go0uwFksFn9wom+XzJy8MH5NJ+Ip6UMEyF8NvJiEBaz
        T5VaON5oJgGwekMHF+uyJdpZ71PSBQ4ROMAvgoZ85g==
X-Google-Smtp-Source: AGHT+IGpfGW16xkFSZ7YVwW9e5avOXGggi9RHf41QGewNMrpqmB3JUIejV8sAcBVPQX+I8uwdSU8raQpkEpDamKrKGM=
X-Received: by 2002:a67:fdc3:0:b0:446:da54:19a7 with SMTP id
 l3-20020a67fdc3000000b00446da5419a7mr1883322vsq.1.1691694262889; Thu, 10 Aug
 2023 12:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230809131442.25524-1-brgl@bgdev.pl> <20230809131442.25524-2-brgl@bgdev.pl>
 <ZNT2pNW3aPu82vs1@smile.fi.intel.com>
In-Reply-To: <ZNT2pNW3aPu82vs1@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 10 Aug 2023 21:04:12 +0200
Message-ID: <CAMRc=Me43ZqeDf0e3pA=UJ-x_051HxUbzESmTfSSTbG3cV8-hw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: sim: simplify code with cleanup helpers
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

On Thu, Aug 10, 2023 at 4:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Aug 09, 2023 at 03:14:42PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use macros defined in linux/cleanup.h to automate resource lifetime
> > control in the gpio-simulator.
>
> gpio-sim ?
>

Meh, if you insist...

> ...
>
> > -     mutex_lock(&chip->lock);
> > +     guard(mutex)(&chip->lock);
>
> I hoped to see somehing like
>
>         guard_mutex(...);
>
> But looking into cleanup.h it seems to me that the lock itself on GPIO li=
brary
> can be defined with respective class, no?
>

Why though? This is perfectly clear and concise as it is. It's similar
to going bare mutex_lock() everywhere instead of wrapping it with
foo_lock() which requires you to go and check what you're locking.

> ...
>
> > +     scoped_guard(mutex, &chip->lock)
> > +             bitmap_replace(chip->value_map, chip->value_map, bits, ma=
sk,
> > +                            gc->ngpio);
>
> Perhaps with {} ?
>

This scoped_guard() thing is in essence a for loop, so I believe
kernel coding style applies and a single statement doesn't require a
{}.

> ...
>
> >       int ret;
> >
> > -     mutex_lock(&dev->lock);
> > +     guard(mutex)(&dev->lock);
> > +
> >       pdev =3D dev->pdev;
> >       if (pdev)
> >               ret =3D sprintf(page, "%s\n", dev_name(&pdev->dev));
> >       else
> >               ret =3D sprintf(page, "gpio-sim.%d\n", dev->id);
> > -     mutex_unlock(&dev->lock);
> >
> >       return ret;
>
> Now can be
>
>         if (...)
>                 return ...
>         else // if you wish (not needed)
>                 return ...
>
> ...
>
> >       int ret;
> >
> > -     mutex_lock(&dev->lock);
> > +     guard(mutex)(&dev->lock);
> > +
> >       if (gpio_sim_device_is_live_unlocked(dev))
> >               ret =3D device_for_each_child(&dev->pdev->dev, &ctx,
> >                                           gpio_sim_emit_chip_name);
> >       else
> >               ret =3D sprintf(page, "none\n");
> > -     mutex_unlock(&dev->lock);
> >
> >       return ret;
>
> As per above. And may be other functions as well.
>

Sure.

> ...
>
> >       int ret;
> >
> > -     mutex_lock(&dev->lock);
> > -     ret =3D sprintf(page, "%s\n", line->name ?: "");
> > -     mutex_unlock(&dev->lock);
> > +     scoped_guard(mutex, &dev->lock)
> > +             ret =3D sprintf(page, "%s\n", line->name ?: "");
> >
> >       return ret;
>
> Why not
>
>         guard(...);
>         return sprintf(...);
>
> ?

I'll change that too.

Bart

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
