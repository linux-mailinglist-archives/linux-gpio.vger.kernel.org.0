Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3666A2182E0
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgGHIxk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgGHIxj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:53:39 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECEAC08C5DC;
        Wed,  8 Jul 2020 01:53:39 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id o1so11333311plk.1;
        Wed, 08 Jul 2020 01:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VOj8KMo33FR22/jWCVdCcCGb06O1I/LxQuTqwI48/VM=;
        b=XVaw/fGyrcXlucPs4sMyJWqR/2tGNDhmci6LOfI7G2KzbfyBiuLIKeM3gt/i/FHfTl
         UcGL2VCudJBfvOAz0gWIcSHSf8k4L/na8w87HHwtvzKtaiul8V0eRHIFkzQTmRwQXJ1t
         qagZ8IY5GU2EmHW3bCPmMlKSzPzLtMMxWRdGVHsR8hhYAlRuduo83IaB6cl1CRv3vrpV
         WmzaO1zzTkd26THfyWZygotRdemT0E1Xk0Kpv4kpvIGCrUoiyVv8ap132a5iT/e7XPQI
         PoN0RSoRRLf4uboTyl4zzhAX3Gi9sNsGm7NlcJjlMbzOSKgP7xdR7pnfuDvcI2xQvu3T
         fGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VOj8KMo33FR22/jWCVdCcCGb06O1I/LxQuTqwI48/VM=;
        b=k3erQ4J8Hb9fMnC4DAui8e8VoTJUsR7oFJ1zJ691MDxE5mx5w0HF5MFtlRnEDmyFhu
         gIfNuWZA2QsC8hHmiKMmBHH3zRz1S5T0kMbWuzBox5uyFI/OVInsYmJxqpqBTOH4tQDJ
         U0iUEM/h0GGDOUwn2v/nwz790gwCjlIch0MXMEou1F+920fmHiL5lNj/DHDdYrzsRk9e
         uqeluPyrBvrIKn90PgHaExXZ1o0f8eDAQbivSB9SWXm5PH2PmkHBqZLq/Us7pQtMZF90
         KfzUQGQjqcoe7KsS9OAsFCdvSYh37Iq1/cy8s4WQghKQs/pIyFZLIdl9tjoR6aS0vfmX
         Gkog==
X-Gm-Message-State: AOAM532KJkndkBn6LUFIC2gFMDcYhDMT/SL27r+vDRfH6flvBD0+EUJk
        TYj9h2a7zQ+ClO7d6Lq5rpHGqI7x9UM2iOvfiAE=
X-Google-Smtp-Source: ABdhPJzAFjNmz79HHfOIHYsJ4VMDby2KumuiiAmBdz+zEaO/KA1y9Ri6f8yoIalH6rKTEGj14uU3CTNqOQmxPn7hMiw=
X-Received: by 2002:a17:90a:a393:: with SMTP id x19mr8741109pjp.228.1594198419141;
 Wed, 08 Jul 2020 01:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-2-digetx@gmail.com>
 <CAHp75VdFVGgKxR+n5TUMuFnWDy_uEmEeG=TvR9s7Xbe=jOdObg@mail.gmail.com>
In-Reply-To: <CAHp75VdFVGgKxR+n5TUMuFnWDy_uEmEeG=TvR9s7Xbe=jOdObg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jul 2020 11:53:22 +0300
Message-ID: <CAHp75VdTw87aOGqnjS-jukiHcMACG7-gDDhDWP6hikSLWpDebQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] gpio: max77620: Initialize interrupts state
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 11:51 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:

...

> > +       max77620_gpio_initialize(mgpio);
>
> I guess we have special callback for that, i.e.
> https://elixir.bootlin.com/linux/v5.8-rc3/C/ident/init_hw.

Sorry, here is correct link

https://elixir.bootlin.com/linux/v5.8-rc3/source/include/linux/gpio/driver.h#L212

-- 
With Best Regards,
Andy Shevchenko
