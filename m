Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58A2077920B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 16:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbjHKOl1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 10:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234653AbjHKOlV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 10:41:21 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7452702
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 07:41:18 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-44758646388so835502137.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691764877; x=1692369677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6U7eDiY81AXagbKXjhk/2GWeqBZwyqOSn+11Vfodus=;
        b=GNRlf/U8s89yB08jsjXe5rJP6JeIbq5lm13Gxpq7Lzy5yWWMDHpY95Y2O554iWlKXJ
         NBxCCYKH1bx+qJOZ7jkSYpUGmd8vkg0PKzQ9qOX6LW+FgyE/ESbbWY7Kd/SF4r/Eu8bw
         XdKTXglo3Hpm0yvoZzLdaf3WPgrlB9JhcdjPfFz0h2+izW2AKgKCVWtypI1TyUEuhQSm
         pCn8DC4Nu5TNaSpBocDT9MxadFRJDml8Ri6ftVj4v84nEVDVxspMifH9RS61ZFECg5+2
         KFijjHwcQP+jNNnh7NovZY1AdB4ufeqqGzQbGhs8C8X4qJ40bq3zEugy/2+klqCOpVKn
         FqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691764877; x=1692369677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6U7eDiY81AXagbKXjhk/2GWeqBZwyqOSn+11Vfodus=;
        b=GE+oY4HrG2qNK1NkBpSbueeU++K0QZg+UPmLpKmStXYVgVxdDGyow35FQR4fFlKaHl
         l9RvTzpQzf2bpERq4gkXuiMNGmyaTxd77GXnYKFlMddKaOMgXZZvvWK7Jfw5rwz1xPeA
         sg875Lu1FOD2mCOxef/gBs/KBIZwfb2WSSsX2n4Q+m8v05WP6gGM5thgE8vTbX4S2TLq
         Ox+jhNrKpvnYIZoExMkDNaMppkoWHawWkhTy8Nuo0plTdtWUdXZEnKeYDjwE1qnOt6h2
         MekuDezIb5sO1guvlI/7yMFtNEQaRh4i/WKeNlrTpacUb3ZMoDoifpxtcOuGo3u1ltsY
         suzg==
X-Gm-Message-State: AOJu0YwEuzChdMymqpw61xajfsE5nKuNjxUsOAuqOSiQJsvCHHzMUGKr
        G+zdyRJfspgsJgHjeWIluDmuL4TYEKLQZ9p2Aq4tl0eX/O5T2U/B+YqgvA==
X-Google-Smtp-Source: AGHT+IHc/x2G0HRhVHGmvk3nAYGLax6vxhgmzgLN/i1Z2VCjX+E30DlfCl2BzMuCn5qRgwZHMhTUAsLEePyUDrRzxt8=
X-Received: by 2002:a05:6102:2836:b0:443:6449:479e with SMTP id
 ba22-20020a056102283600b004436449479emr1800832vsb.8.1691764877631; Fri, 11
 Aug 2023 07:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230811131427.40466-1-brgl@bgdev.pl> <20230811131427.40466-2-brgl@bgdev.pl>
 <ZNZEq5wo655rttb/@smile.fi.intel.com>
In-Reply-To: <ZNZEq5wo655rttb/@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Aug 2023 16:41:06 +0200
Message-ID: <CAMRc=Mehcxgy-5FnpawZo+M2dpweP8kG2oXTcZ=nuqpRB3taDA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] gpio: sim: simplify code with cleanup helpers
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

On Fri, Aug 11, 2023 at 4:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Aug 11, 2023 at 03:14:27PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use macros defined in linux/cleanup.h to automate resource lifetime
> > control in gpio-sim.
>
> ...
>
> >       struct gpio_sim_chip *chip =3D gpiochip_get_data(gc);
> >       int ret;
> >
> > -     mutex_lock(&chip->lock);
> > -     ret =3D !!test_bit(offset, chip->value_map);
> > -     mutex_unlock(&chip->lock);
> > +     scoped_guard(mutex, &chip->lock)
> > +             ret =3D !!test_bit(offset, chip->value_map);
> >
> >       return ret;
>
> Isn't the same approach applicable here?
>
> ...
>
> >  {
> >       struct gpio_sim_chip *chip =3D gpiochip_get_data(gc);
>
> With
>
>         unsigned long *map =3D ...->value_map;
>
> > -     mutex_lock(&chip->lock);
> > -     bitmap_replace(chip->value_map, chip->value_map, bits, mask, gc->=
ngpio);
> > -     mutex_unlock(&chip->lock);
> > +     scoped_guard(mutex, &chip->lock)
> > +             bitmap_replace(chip->value_map, chip->value_map, bits, ma=
sk,
> > +                            gc->ngpio);
>
> ...you can satisfy me as well :-)
>
>                 bitmap_replace(map, map, bits, mask, gc->ngpio);
>
> >  }
>
> ...
>
> >  {
> >       struct gpio_sim_chip *chip =3D gpiochip_get_data(gc);
> >
> > -     mutex_lock(&chip->lock);
> > -     __assign_bit(offset, chip->value_map, !!test_bit(offset, chip->pu=
ll_map));
> > -     mutex_unlock(&chip->lock);
> > +     scoped_guard(mutex, &chip->lock)
> > +             __assign_bit(offset, chip->value_map,
> > +                          !!test_bit(offset, chip->pull_map));
>
> Ditto (I checked the line size).
>

Sorry but no. This is bikeshedding. I'm not going to add temp
variables to only use them once.

Bart

> >  }
>
> ...
>
> >       struct gpio_sim_device *dev =3D gpio_sim_bank_get_device(bank);
> >       struct gpio_sim_chip_name_ctx ctx =3D { bank->swnode, page };
> > -     int ret;
> >
> > -     mutex_lock(&dev->lock);
> > +     guard(mutex)(&dev->lock);
> > +
> >       if (gpio_sim_device_is_live_unlocked(dev))
> > -             ret =3D device_for_each_child(&dev->pdev->dev, &ctx,
> > -                                         gpio_sim_emit_chip_name);
> > -     else
> > -             ret =3D sprintf(page, "none\n");
> > -     mutex_unlock(&dev->lock);
> > +             return device_for_each_child(&dev->pdev->dev, &ctx,
> > +                                          gpio_sim_emit_chip_name);
> >
> > -     return ret;
> > +     return sprintf(page, "none\n");
>
> I looked at the original and at the change and maybe it could be done as
>
>         struct device *parent =3D &dev->pdev->dev; // Naming?
>         bool live;
>
>         live =3D gpio_sim_device_is_live_unlocked(dev);
>         if (!live)
>                 return sprintf(page, "none\n");
>
>         return device_for_each_child(parent, &ctx, gpio_sim_emit_chip_nam=
e);
>
> ...
>
> >       int ret;
> >
> > -     mutex_lock(&dev->lock);
> > -     ret =3D sprintf(page, "%s\n", hog->name ?: "");
> > -     mutex_unlock(&dev->lock);
> > +     scoped_guard(mutex, &dev->lock)
> > +             ret =3D sprintf(page, "%s\n", hog->name ?: "");
> >
> >       return ret;
>
> guard() ?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
