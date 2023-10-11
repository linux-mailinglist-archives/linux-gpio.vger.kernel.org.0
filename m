Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7ED7C57AE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 17:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232655AbjJKPDY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 11:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232246AbjJKPDX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 11:03:23 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C819D
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 08:03:22 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3ae1916ba69so4743679b6e.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697036601; x=1697641401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZGr0MjOwhvBq00ZZaLYaw8OqVHhMeRw+nvEkoYm3dw=;
        b=jT1Uqvjn4Y0+Y9TJ5OXUQ86dMhzra/ZhrwE9bZ3mVTej1bsm4N5C6F82UQHkU5AOkn
         Z1FGjohOPpKIYfiBPBVO+nhRUHVbCNe4JW44cyBy6+sG3ab+FYRv8ECkOr0fI66Ge+mN
         axCimuBD2KMYqtTC5gqImgEGK388dBvsgJ1PiYG/y3gHdIg7ngbG1K0NyPbNIY5WV//O
         V/Krs7rRnmvZayO648invweprpcuDVZk/Hx7R6Yspx9wt0auaF697sCiL5ByegfXDFoo
         cbN5h6aYqjgq3HiLF9N/T7J7cXO85nAcJowGagREmMrzgZ9O9+oeGjzwyitxYEPfc+ec
         9SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697036601; x=1697641401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZGr0MjOwhvBq00ZZaLYaw8OqVHhMeRw+nvEkoYm3dw=;
        b=IsIH3d+dzR79XBh/EFKVaExPkr46Shj5w94gnW5oGPBTzvSk9JMNcGxVZ6hc5f1gxZ
         5KMJ7bfI/g5GO08QkSTMuMRLn0cgXuCBBxPiUrVcNfxjvjv8uysSHJ+WAf7bwdvr6xe8
         XQ6KKZNF3dgoIKZJc7xco3WSlOYEEPTm7dlxv5eclXNaV66r/MEJ0TGGIlR2b7KxxBBm
         X/hwMeFN5Eq05exTMC3kg2NxYZufUWi2lnx/3CZr4JE7DHn3eqSXWthnyHRwNj+TpzF2
         Ry9Zem6c3SbsrzTjpy/21eZLTv9DhnceraS3TUiUzafwazfMDloBuBXNtRQgoAgMe2X2
         qSUQ==
X-Gm-Message-State: AOJu0YyUZKTP7GGG6kLvutISaOwP1/mh6ljDs4++ww29URkWbbqqr/Eo
        XmyGzVdjuJvEVEffZ6HO4fdQ21YW7AvC4n6t8CmMYOCqlbArEHjo
X-Google-Smtp-Source: AGHT+IFUb2D6iAvQaaH7P0W5dSlc7xZ4XUpRgYrdDip+lWqRdEzUC59fw8FHoZb4k1KhpSCve8sVkm3epzleoO2Og1k=
X-Received: by 2002:a05:6808:144d:b0:3a4:35bb:edae with SMTP id
 x13-20020a056808144d00b003a435bbedaemr27888321oiv.29.1697036601486; Wed, 11
 Oct 2023 08:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231011130204.52265-1-brgl@bgdev.pl> <20231011130204.52265-4-brgl@bgdev.pl>
 <b660e39e-24ad-c755-7962-aa56e8cdf4f7@axentia.se>
In-Reply-To: <b660e39e-24ad-c755-7962-aa56e8cdf4f7@axentia.se>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 11 Oct 2023 17:03:10 +0200
Message-ID: <CAMRc=Mep2_u_JdGo_W1VsOR9ajscw49KA2gK7GN3K9j_rUEn_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: mux: gpio: don't fiddle with GPIOLIB internals
To:     Peter Rosin <peda@axentia.se>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
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

On Wed, Oct 11, 2023 at 4:59=E2=80=AFPM Peter Rosin <peda@axentia.se> wrote=
:
>
> Hi!
>
> 2023-10-11 at 15:02, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the relevant API functions to retrieve the address of the
> > underlying struct device instead of accessing GPIOLIB private structure=
s
> > manually.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/i2c/muxes/i2c-mux-gpio.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-m=
ux-gpio.c
> > index 5d5cbe0130cd..48a872a8196b 100644
> > --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> > +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> > @@ -14,8 +14,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/bits.h>
> >  #include <linux/gpio/consumer.h>
> > -/* FIXME: stop poking around inside gpiolib */
> > -#include "../../gpio/gpiolib.h"
> > +#include <linux/gpio/driver.h>
> >
> >  struct gpiomux {
> >       struct i2c_mux_gpio_platform_data data;
> > @@ -176,7 +175,8 @@ static int i2c_mux_gpio_probe(struct platform_devic=
e *pdev)
> >       }
> >
> >       for (i =3D 0; i < ngpios; i++) {
> > -             struct device *gpio_dev;
> > +             struct gpio_device *gdev;
> > +             struct device *dev;
> >               struct gpio_desc *gpiod;
> >               enum gpiod_flags flag;
> >
> > @@ -195,9 +195,9 @@ static int i2c_mux_gpio_probe(struct platform_devic=
e *pdev)
> >               if (!muxc->mux_locked)
> >                       continue;
> >
> > -             /* FIXME: find a proper way to access the GPIO device */
> > -             gpio_dev =3D &gpiod->gdev->dev;
> > -             muxc->mux_locked =3D i2c_root_adapter(gpio_dev) =3D=3D ro=
ot;
> > +             gdev =3D gpiod_to_gpio_device(gpiod);
> > +             dev =3D gpio_device_to_device(gdev);
> > +             muxc->mux_locked =3D i2c_root_adapter(dev) =3D=3D root;
> >       }
> >
> >       if (muxc->mux_locked)
>
> Very nice to see that wart gone! The only small question I have
> is if these helpers are needed elsewhere, or if a more "direct"
> gpiod_to_device() would have been sufficient? That said, I have
> zero problem with this new code as-is, and that detail is of
> course squarely in gpio-land.
>
> Acked-by: Peter Rosin <peda@axentia.se>

gpiod_to_gpio_device() will be used in at least 10 other places. I
haven't identified any other potential user for
gpio_device_to_device() yet but I haven't looked hard yet either.

Bart

>
> Cheers,
> Peter
