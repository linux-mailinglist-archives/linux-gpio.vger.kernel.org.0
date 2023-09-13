Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 184DC79ECC8
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 17:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbjIMP1s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 11:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjIMP1r (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 11:27:47 -0400
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92257CCD
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 08:27:43 -0700 (PDT)
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-493a661d7b6so696456e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694618862; x=1695223662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSmC0s21CEToS8tT8/hcVHG8zlJnCs3gFSAowj5TofQ=;
        b=O/YQl8YeczH8YccBwr2fU3w7x515nnv5UNEkKB8hk9zGCI3Bf158GNNwrptLS7DNOb
         mddGay6+YLPz2U1bvb0vUZwq+KJA2lDx4ueueNv/b+ip3dPZSa8pgRsun99tzGAzIKh1
         GcaMTC4IVynVkO79NWqxfBANR6PFgZFheYEQofQ0xeu9GY/n4IslpxoUkiYATjLsYhIT
         zJoqi/oyE0hka2WbKN/t5H81MRzjCNOWgvnO+gJ+ZdbnyBMpHMV+vB13YxThnqSjvst6
         Vyq5CROWiZ6QWdR0yPWc2LXgh0bFvQ/Kba8E0Vxicxws+x2jy8ysumibYoj8/WkmjtAa
         15pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694618862; x=1695223662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSmC0s21CEToS8tT8/hcVHG8zlJnCs3gFSAowj5TofQ=;
        b=mBE2IzOdXHSlJUmi5IFfRYxCA26/MhyfKeXXGLufRh3CXn5FDiRFIs5PFldFaqfVje
         0nNLX6i8sVyLtEk80m+kDXWsassQg/7FxciPd7wtl5asU/7CqI3WfkXtXsgqMN50ZdRn
         NLjaXq6OKCgOZI4CzyMfClvCV0TNyynclFeC5hDmBD+t1bMCsLUnfhmQppcKLQ9xD+hZ
         SAh4KyMHk6NJsZNMn8R+5R7Dl/xbzyN2JDaEoes+Ry8wBgsALrNWb6378WymTmWp5g4A
         xO7j0jNjwG+I0d8dCz0wj8rwDn6zfztlY5lNd3Qx8zzZmL3waCnh+XImrcGmlUtvLZ3C
         2Q1g==
X-Gm-Message-State: AOJu0Ywkc7JBMVnOdTX9C3W8iv8GlwYsI/Jzcc5bYmEvrjn7fkOKH4Tv
        d7wrOOXTX4DFvBQ5/awYWa8E/HT12+yyCMDdz0NAUQ==
X-Google-Smtp-Source: AGHT+IGJvSLa8C0RY/pr1gb/IZEvzflaY24bVdWemEE/cCm0VktS9dQ2lxieIG0IxGCKKXQOFQUu8JrCk0IMybi8d6g=
X-Received: by 2002:a1f:c743:0:b0:490:1723:a491 with SMTP id
 x64-20020a1fc743000000b004901723a491mr1488004vkf.5.1694618862617; Wed, 13 Sep
 2023 08:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230901134041.1165562-1-andriy.shevchenko@linux.intel.com>
 <20230901134041.1165562-5-andriy.shevchenko@linux.intel.com> <71232fcf-98c4-373a-805-141a349fd25@linux-m68k.org>
In-Reply-To: <71232fcf-98c4-373a-805-141a349fd25@linux-m68k.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 Sep 2023 17:27:31 +0200
Message-ID: <CAMRc=Merdmv_gFm58y1iHWmYmT=t_OmXyQgOXCxqwr7wsmjjYQ@mail.gmail.com>
Subject: Re: [PATCH v1 05/10] gpio: pca953x: Simplify code with cleanup helpers
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 13, 2023 at 4:35=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
>         Hi Andy,
>
> On Fri, 1 Sep 2023, Andy Shevchenko wrote:
> > Use macros defined in linux/cleanup.h to automate resource lifetime
> > control in gpio-pca953x.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Thanks for your patch, which is now commit 8e471b784a720f6f
> ("gpio: pca953x: Simplify code with cleanup helpers") in
> gpio/gpio/for-next.
>
> > --- a/drivers/gpio/gpio-pca953x.c
> > +++ b/drivers/gpio/gpio-pca953x.c
> > @@ -557,9 +554,8 @@ static int pca953x_gpio_get_value(struct gpio_chip =
*gc, unsigned off)
> >       u32 reg_val;
> >       int ret;
> >
> > -     mutex_lock(&chip->i2c_lock);
> > -     ret =3D regmap_read(chip->regmap, inreg, &reg_val);
> > -     mutex_unlock(&chip->i2c_lock);
> > +     scoped_guard(mutex, &chip->i2c_lock)
> > +             ret =3D regmap_read(chip->regmap, inreg, &reg_val);
>
> I can't say I'm thrilled about the lack of curly braces.  I was also
> surprised to discover that checkpatch nor gcc W=3D1 complain about the
> indentation change.
> I know we don't use curly braces in single-statement for_each_*() loops,
> but at least these have the familiar "for"-prefix.  And having the scope
> is very important here, so using braces, this would stand out more.
>
> Hence can we please get curly braces, like
>
>      scoped_guard(mutex, &chip->i2c_lock) {
>             ret =3D regmap_read(chip->regmap, inreg, &reg_val);
>      }
>
> ?
>
> Thanks! ;-)

I strongly disagree. The scope here is very clear - just like it is in
a for loop, in a while loop or in an if block:

if (foo)
    bar()

if (foo) {
    bar();
    baz();
}

Only compound statements need curly braces in the kernel and it has
been like this forever. I don't really see a need to make it an
exception.

That being said - I don't think the coding style for guard has ever
been addressed yet, so maybe bring it up with Peter Zijlstra?

Bart

>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                                             -- Linus Torv=
alds
