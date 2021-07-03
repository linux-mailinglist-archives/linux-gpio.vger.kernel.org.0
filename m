Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C401A3BA873
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jul 2021 13:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhGCLfS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Jul 2021 07:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhGCLfS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Jul 2021 07:35:18 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127F2C061762;
        Sat,  3 Jul 2021 04:32:44 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id u14so12589684pga.11;
        Sat, 03 Jul 2021 04:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dJ8X2YRC0JhJTsGiT28Fh8AeOU8awZb0R8xjJWjXHEo=;
        b=PQu7UAmuTmx5FqbTV8rk3QS7yrW8Yg+vdl5YQa5q4Zfr/EhvKTuWUjNnhFQNRvGEO2
         425p20vGiMMY0upsKtqWmF4weB4sVqIA7Pe4pV8ahgHQkwjNq1eDw2E+SZ/OUCjrgmEc
         7bKWoS2HrQ4APeju9mtqIgtjWJ4YzGJRN3gSEbkxLOvVvmow30XuJTpL7AQlGUU8WNa+
         Hd9CbVzu0wFGzec/LZX3+eo3JBqiHWwkcawdlwukJZXv8RSlClDXKZhIVKprZLPUsMig
         VyqMAYcNQ7WkpJz+oTB/9wNVlmOyrt7zuLgv/8qxDSqj6As1FQCOIPFgR/OMg8dJtYPq
         OE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dJ8X2YRC0JhJTsGiT28Fh8AeOU8awZb0R8xjJWjXHEo=;
        b=U49SUGzqtehOSDOUInODqmxBa94+49lSax/gN4o/Zdrw1U2ynaKEx9ykUTbzjReQrW
         Dd2/9eQnzR+cJhkx6pVnrn3mjLGTSayexe0Q2RHoGq2d9+LFvzU48uCyyBur4t3B7cN0
         SJgPRED0rkoTjB1/c6ZX3EEjAzGHvSveg3OXa9iU1/2kKURfW3JtAm/7tKcebB6fe3UT
         tL080Mh3qJeB38SqPHIAX6Jlx3GqzuQJpTXezsbgIutFGHj0rdBIjO5kswYbMRW1noAK
         9wMISR57Hs1ESJkAsLgqKqPpTM+0MaBcTdmUDd8w4xEISkC1rXdsscH3lAAhQyMp9zva
         HX1g==
X-Gm-Message-State: AOAM533/guLBKMXiidLCdHFSyPsfGZYdkaTqufCgvLHpoku2QkXVTcpz
        J6sQTMBSyt+Mu19TtQqiTUe5svc8q65e2JvYVio=
X-Google-Smtp-Source: ABdhPJy7cWlOqWyCbqT2Nug01nZJ3C337LHaHhTusOqh6wBLiGHFU1uDITBO+vjn56HUC+1qwkBqCcBaNB4eboLemhw=
X-Received: by 2002:aa7:8055:0:b029:303:36a6:fec7 with SMTP id
 y21-20020aa780550000b029030336a6fec7mr4590173pfm.40.1625311963467; Sat, 03
 Jul 2021 04:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
 <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com>
 <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
 <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com>
 <CAMhs-H-WwCfPDspgxzN=W8QouZ7WPAeyJDYf_6=YezyCkTM=Vw@mail.gmail.com>
 <CAHp75VcF-HDZ6mKvXT=zYnBrcPaNJ+SYJ72LQ7s-62zQ5ZqoQg@mail.gmail.com>
 <CAMhs-H9gw63j98vVo3y0ymW4_6rFNL8u5cYNM2hzyrmkPB3h3w@mail.gmail.com>
 <CAHp75VccSCWa=EH8i01_b_HLZRumUZ48oRjeuaV5Dp1BQAoz2w@mail.gmail.com>
 <CAMhs-H_Ne4W79Awbmo6w_68X+h0-ybjvzNsbh=XuHMPJJ8-hDQ@mail.gmail.com>
 <CACRpkdaqSoyDUn3dVuVgzRK_7AabdY=1FzAnhHZzPs3qS+GfsA@mail.gmail.com>
 <CAMhs-H_pomsvKXuerkVsNQva+B+tPr2xRZAU2R7oyjZ+GaQpqQ@mail.gmail.com> <CAMhs-H_=_tYk3Qj5-NaAmWgnuWc0ZRSEABZzwPfMxiUHP35nbw@mail.gmail.com>
In-Reply-To: <CAMhs-H_=_tYk3Qj5-NaAmWgnuWc0ZRSEABZzwPfMxiUHP35nbw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 3 Jul 2021 14:32:06 +0300
Message-ID: <CAHp75VdmTHr8zq0boz2ci0YO4fS9Zuf+LFXeK7CGiHqHkXKKMQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NeilBrown <neil@brown.name>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 3, 2021 at 2:06 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Fri, Jul 2, 2021 at 1:30 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:

...

> -               ret = devprop_gpiochip_set_names(gc);
> +               ret = devprop_gpiochip_set_names(gc, 0);

I had been expecting that this parameter would be in the field of the gpiochip.

...

> The problem I see with this approach is that
> 'devprop_gpiochip_set_names' already trusts in gpio_device already
> created and this happens in 'gpiochip_add_data_with_key'. So doing in
> this way force "broken drivers" to call this new
> 'devprop_gpiochip_set_names_base' function after
> 'devm_gpiochip_add_data' is called so the core code has already set up
> the friendly names repeated for all gpio chip banks and the approach
> would be to "overwrite" those in a second pass which sounds more like
> a hack than a solution.
>
> But maybe I am missing something in what you were pointing out here.

Would the above work?

-- 
With Best Regards,
Andy Shevchenko
