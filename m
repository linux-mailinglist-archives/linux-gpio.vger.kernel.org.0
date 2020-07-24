Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E7422CEDD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 21:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgGXTrf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 15:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXTrf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 15:47:35 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0073FC0619D3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 12:47:34 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id md7so5950267pjb.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2020 12:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9C8ZpvEekmA/lR73OQBFnAzJ/Z+bHIfueHbS7kuqXzg=;
        b=Grg1lp2JHSVK5ErCgBDE+YjtZDWLkej0oSIOE0WyWjJpn7QXiY9TdrsFpCeU8jYUcm
         3eK/k77Oy3hlBxJssiAzayr4GwN8INutI0Reug790+63+xvXo876NipRSaLS0J1AiDo0
         gm3b/JA/YB9IzXNztD1cSS4kHHrdRzA8qQiS4vUiaYOD0BdVoBnHSLR1fQV+42C2legc
         wK2nfbarRcVTkfR34gUwuXtH+IRNdQSvAA5SpX3IZDZ6GrDWWFgrOJdFcr1wPe6o681A
         yJh7LhE3npCakh6RBiyKEL6dSA2hFhQ6JfTfI2fiGXFEhG38pGWhvvAyP1yN3m6vQ8sc
         nxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9C8ZpvEekmA/lR73OQBFnAzJ/Z+bHIfueHbS7kuqXzg=;
        b=C3YYeLrpf3yOy/ztWgQI85zSGlPErLN2IBZqhw71ViqY3YKM+b9qkuLPh9zWsPtsuB
         P+V7ntMJeSYrEFjFXA8V7sJ3kUpNglrObaKsTLYd5Umc4MG1qr1k5x3r5UgtznEleZYs
         UFQolSfcmyZR3pwos6MjiHcm0fXUApfWDDIA/s3sISmz56MiBd1co1RlLZT9MlJpzNz1
         tjo/UOqeVJbx1h/bWfV8diXGc55xND7OHAjMPQnsTL1cVNGnwWdKRz97MZ7T3o93DL55
         GWW+R7t8CpcgY6B+c1O9cKo7kkdI5lfspj5p2nsVztwbNMQUnTIusq/qqZ+ZqQ7uobsm
         qONw==
X-Gm-Message-State: AOAM532tqchdWFah0N2d8ONHCA39l7UsuwObzTGydB4QtuUmLgcodD53
        Wq5n+PYDAC9CcIdhHwdqJ0ewvURY4ofFOB1Q0q8=
X-Google-Smtp-Source: ABdhPJwWdunCHlA/BDmkACb563Q2B4yTgShqjt3lq1k5ubLqM5KE1NVIwCp1wR2o3+Yd73yw2T2DOuVSWwbYvpZv1/A=
X-Received: by 2002:a17:90a:a393:: with SMTP id x19mr4385140pjp.228.1595620054481;
 Fri, 24 Jul 2020 12:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200717141924.57887-1-linus.walleij@linaro.org>
 <CAPLW+4kX_1YNDNNeqzQGHZmnr0PYKHsrN++jw9-jOYv6Da3UuQ@mail.gmail.com>
 <CACRpkdYxhOQnXUaW-MdT4NX+NEES91NOoMPR6wEcaCrUR253Cw@mail.gmail.com> <CAPLW+4mWw12ZsyK3-LiwcpQtiNMkbgUnGUHBbjtk-7vVZQQaxA@mail.gmail.com>
In-Reply-To: <CAPLW+4mWw12ZsyK3-LiwcpQtiNMkbgUnGUHBbjtk-7vVZQQaxA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 Jul 2020 22:47:17 +0300
Message-ID: <CAHp75Vcgcom29jOjNjmj8hcC6DjCdw7XqbmPPfe9d+mRjxvQdA@mail.gmail.com>
Subject: Re: [PATCH] gpio: max732x: Use irqchip template
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 24, 2020 at 1:50 PM Sam Protsenko
<semen.protsenko@linaro.org> wrote:
> On Tue, 21 Jul 2020 at 12:54, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Sun, Jul 19, 2020 at 6:34 PM Sam Protsenko
> > <semen.protsenko@linaro.org> wrote:

...

> > Just that really, that the IRQs happen as before.

> Just tested it on my MAX7325 board [1], by adding gpio-keys and
> gpio-leds to BBB dts [2]. Alas, the patch seems to be breaking IRQs.
> Before the patch, I can see gpio-buttons appear in /proc/interrupts
> and dmesg is clear of errors. After applying the patch, no gpio-keys
> appear in /proc/interrupts and dmesg is reporting errors like this:
>
>     irq: no irq domain found for max7325@68 !
>
> This is probably because the patch is setting gpio_chip structure
> fields after devm_gpiochip_add_data() was executed.

...

> I didn't check if it's a correct fix, so the diff above is only to
> check the idea.

I checked pca953x and there the same trick has been applied. In my
setup that driver works. I think it's the right way to go.

-- 
With Best Regards,
Andy Shevchenko
