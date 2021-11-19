Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80618457712
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 20:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234861AbhKSTis (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 14:38:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbhKSTir (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Nov 2021 14:38:47 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5314BC061574
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 11:35:45 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id y13so46772176edd.13
        for <linux-gpio@vger.kernel.org>; Fri, 19 Nov 2021 11:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ETuyJWwJFmb5zyOlM+RsYMtsddGkivK7tN9v32DkWw=;
        b=r45mWu3jbzyMOsyawFAmUd0DoVaBZmAGSij/fcdkDpxUYcmGtCnI85pdPVfwJXZeBc
         5VKPU1g8A3e6Uyl4awBjZSwRtXEihIsAzZp+6UjktP5n9cwjSSkUCcD+T3cYidlhl2F1
         ONdXmqhFuOsFlGKPhxvepAPFOpCdy6gsWLiKn2q3DiS9w+V6Toz3vf5rxN4k0MMa1TdR
         mRD6aCVmgF1/bGGzJe5FkGfEIjIVfAJWfwT2eoUhKlvEGjMOuD0kkTUWYg7XWGWppSVF
         ZzfKFkSpMXBDza8Wcb948X4Qizd/TahsQSGw1SjB59OBiwJglBTspdFdYNE9V+Yyfuor
         06Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ETuyJWwJFmb5zyOlM+RsYMtsddGkivK7tN9v32DkWw=;
        b=35DJLq9T4IIxD6ok2rnEB6qlFPcQUdD8cCUje6b/zDcq/K0i0nd8qqT4d+UQRBy2rs
         gO2zfNCe3McIkVkGr+3Mrrl81gLdcgLPU2SoDPrFOZf1eGXvgmVUk3XB0irrXjsJjqze
         5xxPdxw4FEJLgmJ3SrQJBa5hall8xYRczkhcZkUtYDUFGCB39CgZfVGRi8aHaOyoFOVQ
         37wjJfQEbPyFnOmNrDPy73ZDvFxwn8A2ZOKTMrJp1C2G7QhQtzR/Ui3vuyKIY5kGXltI
         9BdqjEcDvxR5tgryGaAHtrOdlVQMlrxQvcNuCzAuJaDDi88sYZPPpeiRI71VKjAm5mi8
         kIJg==
X-Gm-Message-State: AOAM531yAce5iiavPXx7jqldRYYQGJ0+WhyZdnEqtXK9rhTabl3A5LoA
        UzlOQQSABZA1bvRSmLf2niH1j+oz6/HnI9o/8zN9yDSFX4Oolw==
X-Google-Smtp-Source: ABdhPJyS1KV7hzfkCD78KVd/SZZPMK74U7/2L/WTnHYSHnLy6FDG3ByJouNr9GQAX+XOGGUl01G4Sa5t0tsFbKIknpw=
X-Received: by 2002:a05:6402:50d4:: with SMTP id h20mr28524459edb.52.1637350543916;
 Fri, 19 Nov 2021 11:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20211118132317.15898-1-brgl@bgdev.pl> <20211118132317.15898-2-brgl@bgdev.pl>
 <YZaH8rsMyUztOX/r@smile.fi.intel.com> <CAMRc=MdR_RGLLPJ5Hqetj5_7ZQfUXOijEoVp3uR7cgEDHKnchA@mail.gmail.com>
 <YZbCq5Xcohm/t/FP@smile.fi.intel.com>
In-Reply-To: <YZbCq5Xcohm/t/FP@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 19 Nov 2021 20:35:33 +0100
Message-ID: <CAMRc=MdBhm-+oDiBdYQJZXYEko8rGhZtHQfu6p3DFy_a3aJOZw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: check the 'ngpios' property in core
 gpiolib code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 10:16 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 18, 2021 at 09:12:59PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Nov 18, 2021 at 6:06 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Nov 18, 2021 at 02:23:17PM +0100, Bartosz Golaszewski wrote:
> > > > Several drivers read the 'ngpios' device property on their own, but
> > > > since it's defined as a standard GPIO property in the device tree bindings
> > > > anyway, it's a good candidate for generalization. If the driver didn't
> > > > set its gc->ngpio, try to read the 'ngpios' property from the GPIO
> > > > device's firmware node before bailing out.
> > >
> > > ...
> > >
> > > >       if (gc->ngpio == 0) {
> > > > -             chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > > > -             ret = -EINVAL;
> > > > -             goto err_free_descs;
> > > > +             ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> > > > +             if (ret) {
> > > > +                     chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > > > +                     ret = -EINVAL;
> > > > +                     goto err_free_descs;
> > > > +             }
> > > > +
> > > > +             gc->ngpio = ngpios;
> > > >       }
> > >
> > > This should be
> > >
> > >         if (gc->ngpio == 0) {
> > >                 ret = device_property_read_u32(&gdev->dev, "ngpios", &ngpios);
> > >                 if (ret)
> > >                         return ret;
> >
> > But device_property_read_u32() returning -ENODATA means there's no
> > such property, which should actually be converted to -EINVAL as the
> > caller wanting to create the chip provided invalid configuration - in
> > this case: a chip with 0 lines. In case of the non-array variant of
> > read_u32 that's also the only error that can be returned so this bit
> > looks right to me.
>
> So, what is so special about -EINVAL? Why -ENODATA is not good enough which
> will exactly explain to the caller what's going on, no?
>

Let's imagine the user sets gc->ngpio = 0 incorrectly thinking it'll
make gpiolib set it to some sane default. Then gpiochip_add_data()
returns -ENODATA (No data available). This is confusing IMO. But if we
convert it to -EINVAL, it now says "Invalid value" which points to the
wrong configuration.

ENODATA means "device tree property is not present" in this case but
the problem is that user supplies the gpiolib with invalid
configuration. EINVAL is the right error here.

Bart

> > >                 gc->ngpio = ngpios;
> > >         }
> > >
> > >         if (gc->ngpio == 0) {
> > >                 chip_err(gc, "tried to insert a GPIO chip with zero lines\n");
> > >                 ret = -EINVAL;
> > >                 goto err_free_descs;
>
> When the caller intended to create a chip with 0 GPIOs they will get an error
> as you wish with an error message.
>

Yes, as it was before.

Bart

> > >         }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
