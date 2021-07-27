Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C143D794B
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 17:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbhG0PFi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 11:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbhG0PFi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 11:05:38 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63885C061757;
        Tue, 27 Jul 2021 08:05:37 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id m1so18203641pjv.2;
        Tue, 27 Jul 2021 08:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rkWTp0+7c81MOA3cEyNsoB0z/jGDOju/zoUBM++4ewo=;
        b=B1WylBIqQyGM0yCazlGYVj3ZY2My7XNU4aLSP9KvLLaTphFpj6aZtg2y1ADZi8gov1
         CTcyD7F5Dgg03AnsuT39QRYIbMVgwjQQg3ChX+u0Reid5z/ki4mfCplce6SqWDCJYBhy
         kvwPJb99idzmIRksk2LHtKSwcrRVfc+iUsRa24KGyu2cF2Y6rauByM1LWGExtIT8a0Nt
         9qf4KN/c+MiAtfhXqFQM6K8qnq1ZzISX0GtZ/3InS6SALyoNztysDN7QMUWJSNPZaAIw
         PrE8hPY3lrcTnzI/GHmvx4l7M45MtsfTe6L2QoJwUwiihyCo1/SNZcfLSuf0IbDfxTqB
         8u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rkWTp0+7c81MOA3cEyNsoB0z/jGDOju/zoUBM++4ewo=;
        b=Mhafo0XYDbk6E97HInzvcWUJkfC87NKDQ9mdllbuLO1E5Xa4Qn5Knpj4AE17GNJph7
         Fx+HnCgVvF3e1kg/2DeQMWiDCGG6BmAYL1pQbAHWvOJDORkm0iPwyobAeq/wFYEAM7mT
         slHCgBrYUizw0j9AjSKtAydmSd9XtZCNypDDFoVm/1xAvQ3fVjpjtT1XZjN4Yd/y/K1j
         il6kpJPPJDvezVzO514jL9orseIcXnpzo2Dw/hy0KZd449rdBHklFcNK8VEFJlm2tDUi
         uaEdDv5AsUl9fI7iUU0nq0Zm3uFDWU2wvEJ378FXFK+QvXD99GdIc7JfePSeqytSuK+T
         g9KA==
X-Gm-Message-State: AOAM531NQ7ipHdDwE8SvvxRp98oo+Rd4efew8iZCKInMFVfFasXpw1Bn
        SdAbYmQ2D7p9sd8j2Qoy/HFBd826nhBiUy/rmNw=
X-Google-Smtp-Source: ABdhPJzV8WVK79CHXE8mMIGYsmCqL8fOvP+g311Y7pLwfAcecyNnzEGpOzZ+D2IikHH5xAwRYrMsPRz5HsSGf5UnPkk=
X-Received: by 2002:a17:90b:3647:: with SMTP id nh7mr22839838pjb.228.1627398336914;
 Tue, 27 Jul 2021 08:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210727144816.8697-1-sergio.paracuellos@gmail.com> <20210727144816.8697-2-sergio.paracuellos@gmail.com>
In-Reply-To: <20210727144816.8697-2-sergio.paracuellos@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Jul 2021 18:04:57 +0300
Message-ID: <CAHp75VdxrBbnkBDfhb3q7KM3CkAzyAq86gqjLFD5aaKNzVJCHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip banks per device
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        gregory.0xf0@gmail.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        NeilBrown <neil@brown.name>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 27, 2021 at 5:48 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> The default gpiolib-of implementation does not work with the multiple
> gpiochip banks per device structure used for example by the gpio-mt7621
> and gpio-brcmstb drivers. To fix these kind of situations driver code
> is forced to fill the names to avoid the gpiolib code to set names
> repeated along the banks. Instead of continue with that antipattern
> fix the gpiolib core function to get expected behaviour for every
> single situation adding a field 'offset' in the gpiochip structure.
> Doing in this way, we can assume this offset will be zero for normal
> driver code where only one gpiochip bank per device is used but
> can be set explicitly in those drivers that really need more than
> one gpiochip.

...

> +               dev_warn(&gdev->dev, "gpio-line-names too short (length %d) "
> +                        "cannot map names for the gpiochip at offset %u\n",

Reflow this that string literal will be on one line (it's fine to be
over even 100).

> +                        count, chip->offset);

--
With Best Regards,
Andy Shevchenko
