Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46DD3BF6AE
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jul 2021 10:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhGHIFm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jul 2021 04:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbhGHIFl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jul 2021 04:05:41 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B58CC061574;
        Thu,  8 Jul 2021 01:02:59 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y4so4719107pfi.9;
        Thu, 08 Jul 2021 01:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xsloucTd0/0+EpM1LEsMPbRallc6DWAH3xAvLsRVlPw=;
        b=QMgtt7eDCMwzF6d/SDkcxPtCZ/m9qPMgSwJGBPqB+Hrcxk2dsen70FDumkIE9W93v9
         yjEmXfrjeCXKaBdpvURmMqht1Ca+YxCKeFI+wUEsYbARZkPC03xpqOx7onC+e7MLZEsU
         pWO/XN2yn1PrajzBuGkkgfGSRYMiABTadNBNFxWLX3B9us8hXxJLetqeJKo360Sut2pw
         bu3iTTksATIOkJ/AxGs96zYseVzd4O35qb9sEYFkSAIp1tTEABkyEgbYrlpc2DRkPwRd
         9sVhyo7Ix276+NPrJXV67w2SAk611WNPDzifhL/o4mk3aey31+++F/OghXBpgxp0mVy+
         ldwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xsloucTd0/0+EpM1LEsMPbRallc6DWAH3xAvLsRVlPw=;
        b=BaN5V7yoKETUVb+uGfSaJ0nxDaJ2pJiI7fAeylzC0yr7RugHTdQh92GUUmpXJgjk4J
         PGpoV/SWHGipeGxkzTumomZkiHbAPijqYK9IQDOH7/mkDTiC5PPSMOnpCnjYvM9ZKmyM
         03mfQEf4KZemm1wZ2pgrLm5L6r7q10lpUeuN12wA4L/A8p+XH+N/fTHmSIVo8Dea+PZ8
         MWeAOu2g6ShaaUOqeQ4HsaxObifPQLBwa+yZMCWEeTNmtw8FnNBKNBsOKKhOA40HsEo+
         NauzvOxic0YJ2m9fmzoZWzzUKI7/tkLo6+9gSjZLeeK87rEEeoptn+5DxbDY/kx06hn9
         azcg==
X-Gm-Message-State: AOAM532Yg/hIUhYiIxenEYhLGVjSbW7OBMQgMPBHaE9/d+i6eYQ0MaRY
        WyZF/pd9bq6q2CCsCcsOPozSLjJxGQ7odiWGtvY=
X-Google-Smtp-Source: ABdhPJyjDzfDNw0tQEgR+4kTNXxc27O554ZBU8VDCgxZLXPI3Q4EqyGbAP92Om9GASQo1+0jI4p2+5SFxnKPlp6qXI4=
X-Received: by 2002:aa7:8055:0:b029:303:36a6:fec7 with SMTP id
 y21-20020aa780550000b029030336a6fec7mr30785041pfm.40.1625731378857; Thu, 08
 Jul 2021 01:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20210708070429.31871-1-sergio.paracuellos@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 8 Jul 2021 11:02:22 +0300
Message-ID: <CAHp75VeWHt-z_2Lb=mJmm6yz_cAG_ywzH5zbWG2KN1sRvA6KZg@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpiolib: convert 'devprop_gpiochip_set_names' to
 support multiple gpiochip per device
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

On Thu, Jul 8, 2021 at 10:04 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> There are some unfortunate cases where the DT representation
> of the device and the Linux internal representation differs.
> Such drivers for devices are forced to implement a custom function
> to avoid the core code 'devprop_gpiochip_set_names' to be executed
> since in any other case every gpiochip inside will got repeated
> names through its internal gpiochip banks. To avoid this antipattern
> this changes are introduced trying to adapt core 'devprop_gpiochip_set_names'
> to get a correct behaviour for every single situation.
>
> This series introduces a new 'offset' field in the gpiochip structure
> that can be used for those unfortunate drivers that must define multiple
> gpiochips per device.
>
> Drivers affected by this situation are also updated. These are
> 'gpio-mt7621' and 'gpio-brcmstb'.
>
> Motivation for this series available at [0].
>
> Thanks in advance for your feedback.

Thanks for doing this!
LGTM,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Best regards,
>     Sergio Paracuellos
>
> [0]: https://lkml.org/lkml/2021/6/26/198
>
> Sergio Paracuellos (3):
>   gpiolib: convert 'devprop_gpiochip_set_names' to support multiple
>     gpiochip baks per device
>   gpio: mt7621: support gpio-line-names property
>   gpio: brcmstb: remove custom 'brcmstb_gpio_set_names'
>
>  drivers/gpio/gpio-brcmstb.c | 45 +------------------------------------
>  drivers/gpio/gpio-mt7621.c  |  1 +
>  drivers/gpio/gpiolib.c      | 34 +++++++++++++++++++++++-----
>  include/linux/gpio/driver.h |  4 ++++
>  4 files changed, 34 insertions(+), 50 deletions(-)
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
