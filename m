Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C36A7791D6
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 16:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235993AbjHKO2v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 10:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235761AbjHKO2v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 10:28:51 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0431F2728
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 07:28:50 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-794b8fe8cc4so2017107241.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691764129; x=1692368929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tc07SxZJY2eDcFZkrgpwTC7P2aOBanwIwMd01fE54i8=;
        b=AlZl01Q+SE0LEQj2mnBN6S2URRIg5W/C5en0obWCVpC38pZW+tgd0TMTD7WhilEt8y
         1MQvMayMD4xSlSYOA9QvCaqrmUwg7sM8BFrriATYW72kB6xNn/ifpg9rcmKa95g5mPAg
         HCVTRMMEPoaKPbzv79joxD+y0H59ujZs20ys2DOhFMnLZGLJRyXsJyktD+grQxj+vLFy
         QLX9f/lEJYiSyH4tTmWL13aoABzbk8hPwiM2mfbszt2Dhk89g0F+vGOACMOknZ2HptFn
         94v93TIVCuiNfjnH5SzLHxYgUT7JF71PYwXPidN049z5OcuIl6IEtubGCrC8/xHpohTQ
         JrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691764129; x=1692368929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tc07SxZJY2eDcFZkrgpwTC7P2aOBanwIwMd01fE54i8=;
        b=IP6Vdcb5GBlq+nm2KSdJ5yNUPzYLnXiqA4d02nLU4XPFpKZFPPv51pRNpXBCo9WMLz
         bKC1I2bCpU1vOLnp48npGEo63z+X004CCg8xj1wEXEhGOCnoZeZCpm6rfAFa5Rtji31i
         5Zg4TNTur1Uv25cF9taq+MXhVtf9suXUbW02Du7+UKqdNwOkzhJF38zvYRvQhHyPOWaS
         0pTT6aXUpVK7rQTcq4eRvOjqgZtBGWEZYsb4ujRtTjr/GXC4AFVC4Jn9PEJm3Fak6A5N
         fLbBf4EPcMu227EHkog0NtVRbx3uIOAr4OP7/+vbJ/GDpYmeXjwl7f6WYRaKNOKkwrd0
         LJFw==
X-Gm-Message-State: AOJu0YzgCdEMbC8AoXFwzU0GKtkIjk7Vh3RegD0pEiBdwDjx3Ub/Zwy1
        L0ARXqcqj4acQy09zNB9JD5aU1XCuBu7j/qEkixo8g==
X-Google-Smtp-Source: AGHT+IEfiGZNrJyt/E3fXKxgbRDbJt1H89UCHll6KiyTBc7S/gkoV4PGoY6w6jT3Q+HpyUy15u9P0qc/TYaqpBZ5Xzo=
X-Received: by 2002:a67:f8d8:0:b0:445:944:b6dc with SMTP id
 c24-20020a67f8d8000000b004450944b6dcmr1725903vsp.7.1691764129100; Fri, 11 Aug
 2023 07:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230811131427.40466-1-brgl@bgdev.pl> <20230811131427.40466-2-brgl@bgdev.pl>
 <ZNZEq5wo655rttb/@smile.fi.intel.com>
In-Reply-To: <ZNZEq5wo655rttb/@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Aug 2023 16:28:38 +0200
Message-ID: <CAMRc=Me+Oc0hJwLqy_wAhVGjbDm2vZUDpsDbD4+6jiL-vZp9eg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] gpio: sim: simplify code with cleanup helpers
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
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

You are a tough negotiator...

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

What's the difference?!

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

Bart
