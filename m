Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF0A3501D6
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 16:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235916AbhCaODn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 10:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235630AbhCaOD1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 10:03:27 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71ED3C061574;
        Wed, 31 Mar 2021 07:03:27 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id v23so7956659ple.9;
        Wed, 31 Mar 2021 07:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fy/Lii1C+il9pHjSHwGwr2IkdGTboeNxx/tAmnUV3w4=;
        b=dJ4hO9DMjknNiGKQBJYsPKZ5Rj3wQQYJXyW2qnzApF9Np2x+PkrB0nFEhfxqda5Hrr
         3OAV5EYbOY6Txjq/TVw7nt7B1bLrwF6CufuNU/w7VR2zAPvaWOs0KN83GeEGt1lnZMo0
         64L/pzTeTMPWNw+nHqriRuUZ/vmRKXYc+utkjqSkR6r2kxrpT3DVYMNIHZSE2EJ2Li94
         u2azs9ClAKZI0TZSKP0gs6YdvXzRi6kZfG5iEZDSkLjzzPcZFnmiN0Sf7+GCM79qIJod
         GYzQATU6firD28YQKGM8GXNm9/dNo1QJOyBK5MZvlI0K1md39X1ZePdCcUheYZ8sCJwx
         ZKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fy/Lii1C+il9pHjSHwGwr2IkdGTboeNxx/tAmnUV3w4=;
        b=n/HgTABQwhJ7Lhqi7qhZibXDiL4nC+YVw6msHL7ikkZ+TreATyXKiQlsjqN+840V9y
         sK1lS7IdKRaoy/EbhahECTHOioWHiiFueNnkhBFgLKJLInjN9flfj+j4w5Ayvj2Ur/te
         VFle/2eP5ZLyUbrJYf1lAH5eqQkLUWKmi3DaBfrUy7rax0FdMzlK28+1nfEcSDV+nLH6
         3B6RZ+DswMHYYQ29iUyuGZoa0JVsueV2w+1fIVhfq2gTabnS5eiNQvHk3Rq2venoW5iY
         +vChAa+GNyQIojdphNWjAfavozGHlKjNPbZD63XzYCDUdAX3L9ESuyBlS9KnYvN/uYWz
         fvbg==
X-Gm-Message-State: AOAM530vQTcRbjZa8jafFUr09DEBw9pLu1dH/HWzvkthVHTR5zS1ekfw
        +8A0jwLz2772UEaYTCOeP1DWUao8J21whM2HW54=
X-Google-Smtp-Source: ABdhPJx1J+nMQQcY4pA2KgdNvKEdhnjtfy2XFHvLhGtTwI2fIgYzNT0U1D3pj3tS7z3OtNanyJPHFsoSky6cseMqQNM=
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr3729837pjr.228.1617199406889;
 Wed, 31 Mar 2021 07:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <11a8323c249ae6ea7584402ab0fb74551b6a4b7d.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <CAHp75Vcc3CNXguMK-ZhRfvfjVBQBbcGEYK_+WQAmb_Sw5-Derw@mail.gmail.com>
 <4c143c8ee65fe52840ccbb4e1b422b6e473563d9.camel@ew.tq-group.com>
 <CAHp75VfVCTj170S_4Lh9JyDYFfUQLjTtnU=O-iXgUVXcycLxwg@mail.gmail.com> <38b1191ce594d9fefe9e0e98b3fa8ca0a23ee3ea.camel@ew.tq-group.com>
In-Reply-To: <38b1191ce594d9fefe9e0e98b3fa8ca0a23ee3ea.camel@ew.tq-group.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 17:03:10 +0300
Message-ID: <CAHp75VcuD49UgkXCrPL3VKiOsx4qSDsf=zB2vp6yVS1aJCuc2w@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: tqmx86: really make IRQ optional
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 31, 2021 at 4:36 PM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> On Wed, 2021-03-31 at 15:39 +0300, Andy Shevchenko wrote:
> > On Wed, Mar 31, 2021 at 3:37 PM Matthias Schiffer
> > <matthias.schiffer@ew.tq-group.com> wrote:
> > > On Wed, 2021-03-31 at 15:29 +0300, Andy Shevchenko wrote:

...

> > > I don't understand which part of the code is dead now. I assume the
> > > `return irq` case is still useful for unexpected errors, or things like
> > > EPROBE_DEFER? I'm not sure if EPROBE_DEFER is relevant for this driver,
> > > but just ignoring the error code completely doesn't seem right to me.
> >
> > platform_get_irq() AFAIK won't ever return such a code.
> > So, basically your conditional is always false.
> >
> > I would like to see the code path which makes my comment wrong.
> >
>
> EPROBE_DEFER appears a few times in platform_get_irq_optional()
> (drivers/base/platform.c), but it's possible that this is only relevant
> for OF-based platforms and not x86.

Ah, okay, that's something I haven't paid attention to.

So the root cause of the your case is platform_get_irq_optional|()
return code. I'm wondering why it can't return 0 instead of absent
IRQ? Perhaps you need to fix it instead of lurking into each caller.

-- 
With Best Regards,
Andy Shevchenko
