Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D1D3B52AE
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 11:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhF0Jeg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 05:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhF0Jeg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 05:34:36 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85ABBC061574;
        Sun, 27 Jun 2021 02:32:12 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id kt19so207585pjb.2;
        Sun, 27 Jun 2021 02:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DrTexKvAE7eD72sH911wcIhVTQqUB3PuR1hPWbayYW0=;
        b=TuEQF7hfkVVhYz1bLcEtJ3EzxL0IwlAvhIxXB0tpQluNJrmBmYsRUAu8jqSZELIixa
         MIqnj7jiJ3Ubamv7pkJgOoAAE8OShr8stJxNBX8ZiVLXLCRSffB2pAI/j6M1s3GLP6zj
         PaNMS766G9m4ulyl+vPihfD4xNYc0+daKsEL5YQ3bXkeKzx15WoQQf89gZFBdA3MY44T
         ilTouy/EwIiJUqUHH8c0Nu6xvp8Jsd+1BT3H+mE68qadhX4DGwshmAi/FSH/NVbRZ0a7
         wD9iHkHNB91kCFKtnquO7QZZGTobvhTomHSDWmwKZIP84BovZl8pvKxifhTXInDw/pxG
         CArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DrTexKvAE7eD72sH911wcIhVTQqUB3PuR1hPWbayYW0=;
        b=PzFvr9y6WdXu4sMPyqtkSujl1LhmYrO4DEIDfAMmZKQ8i1eUOHtbG/x7ZvA4CwYJyN
         v0nrp4ox6IoDRyMNICDKkwWAC6ajipr6ADAKfeRS9yCFYMfn0Zzq0BwwqeoUy89oilk4
         I+Er5+2TaReIuTBzQaZLTJgtSP5EFfJJPHJjUxWilSdxzf9r+Fa2xPnhW9NxbIv7wigX
         z+axeJzjoJGhQJ1PUiHszX/S0d5O5o7ooMYiYwpH1uLgVk6ZPpGcXfWhOobERTaTd6Q6
         iKcziaLPPZWzrYZdrhiQNAgVXsM6acB/ZSyIO5OvH9r8nSecHlgTfEZDP7LqKznhzZXt
         WkUg==
X-Gm-Message-State: AOAM532X6G23dbDeaHhRpADcyZ2vX2RT1zDFFXiSX1MNLDlxpw8g1kjy
        RUy/BZXAfscrmOK1iaqHYq5zimLgLrjqxs2jRnA=
X-Google-Smtp-Source: ABdhPJwPV2x7Q16y9KLKLX1QMMSTIxUNPbnUrLQs4kiIMo2MkjiCgs4kLkCK5S0VLsdvYNcR1XXWKo/BOeeXS16apZ0=
X-Received: by 2002:a17:90a:bc89:: with SMTP id x9mr21316470pjr.228.1624786331214;
 Sun, 27 Jun 2021 02:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210619073551.13703-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20210619073551.13703-1-sergio.paracuellos@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 27 Jun 2021 12:31:35 +0300
Message-ID: <CAHp75Vd4UPiPKy98jV_LuCE10dCrSwU06AddCq5Q0POm0graOw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mt7621: support gpio-line-names property
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        git@johnthomson.fastmail.com.au,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        neil@brown.name, opensource@vdorst.com,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 19, 2021 at 1:02 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> The default handling of the gpio-line-names property by the
> gpiolib-of implementation does not work with the multiple
> gpiochip banks per device structure used by the gpio-mt7621
> driver.
>
> This commit adds driver level support for the device tree
> property so that GPIO lines can be assigned friendly names.

...

> +static void
> +mediatek_gpio_set_names(struct device *dev, struct mtk_gc *rg)
> +{
> +       struct device_node *np = dev->of_node;
> +       const char **names;
> +       int nstrings, base;
> +       unsigned int i;
> +
> +       names = devm_kcalloc(dev, MTK_BANK_WIDTH, sizeof(*names),
> +                            GFP_KERNEL);
> +       if (!names)
> +               return;
> +
> +       base = rg->bank * MTK_BANK_WIDTH;
> +       nstrings = of_property_count_strings(np, "gpio-line-names");
> +       if (nstrings <= base)
> +               goto assign_names;
> +
> +       for (i = 0; i < MTK_BANK_WIDTH; i++) {
> +               const char *name;
> +               int ret;
> +
> +               ret = of_property_read_string_index(np, "gpio-line-names",
> +                                                   base + i, &name);
> +               if (ret) {
> +                       if (ret != -ENODATA)
> +                               dev_err(dev, "unable to name line %d: %d\n",
> +                                       base + i, ret);
> +                       break;
> +               }
> +
> +               if (*name)
> +                       names[i] = name;
> +       }
> +
> +assign_names:
> +       rg->chip.names = names;
> +}

Any idea why it's not a duplicate of
https://elixir.bootlin.com/linux/v5.13-rc7/C/ident/devprop_gpiochip_set_names,
and why the latter is not called in your case?

-- 
With Best Regards,
Andy Shevchenko
