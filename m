Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9083150F3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 14:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbhBINxx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 08:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbhBINw4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 08:52:56 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0601FC061786;
        Tue,  9 Feb 2021 05:52:15 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id s15so9772399plr.9;
        Tue, 09 Feb 2021 05:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ltX/D6liAM5hSiXkr+tjZJvQ+HPeM0NdJdyG+zrYIJI=;
        b=a5y6kLI7NmpM1X7QcRaPYEzgLKvEdV7hmEsn2TGrcLO1gOhvINHMeN7+yWmqhzZoyP
         oi2yQZwPSgNMm8DbpPdl+tO5SXSpikIMi9eUWstGgmwNvujUyH5vxRG7ddFSEHRdiFVB
         GPaiXdo3rQd4h2RYOMetFr/VbyhiyCwAnwXVY7sd8UPFNXZh7mfguNHuHDpcsT9fJbkc
         gk00qdwp6vhGFlGX0nmP6GJS1fVIzW/27AqfBbQYU333lG9HPTYBdwMh5nCafNToa8nG
         YnsLVcYuPnITkQ3Y8gA7/PCgVb97aqR4u1aJSWo0mqdwYb3or9+7Tbq3GO4M0gEZBLQk
         gy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ltX/D6liAM5hSiXkr+tjZJvQ+HPeM0NdJdyG+zrYIJI=;
        b=dd+rvdHn9YUi33APp/PCSc/mvIoDqaN2ahpxP91VU7IM9oO2TdkEd04hmK20XK0vrx
         wv5V8fjPmF0+oB2eSoEzNqMlV74Lc6eA8h3dEYSjXXi1YiSjgwfWMttOAQ3ckxweluHO
         owitikHomPzIyd2nkJdl7NWb3L4w4vjVFbcOJaXUWYxDMKsrbwI+iwmUk/WkGqLf3Bp1
         MENS5hCS+pztPLPHGTCYcu974BAlc+XTX4GYm0mozHntXRhPSYbB2EIAkfPWSMQRkgnV
         NFYbDQJPHOzhiJl0qp4y1YuY1UfOsqqkpJSK971Oq5KUywAPSTK7il8PDHWA0XTGZWXz
         4pWw==
X-Gm-Message-State: AOAM532RcrPTM0nOIZgRfL93pNPTsOiiUHOBRfwfooQTdxZNgK0Nlfb3
        xS2ojnMvb9fzZAYmidk2/W8jaHieCMTW8QN9UYw=
X-Google-Smtp-Source: ABdhPJxtKiBHHx8i8Yp4W/4/oUuJ2Hr9HCwlpdOOdEkv0rfq6DfcaZ+pxR/hbtRrBioSJ8K7Sc5gdo7lfeWXgya+Aqg=
X-Received: by 2002:a17:90a:c84:: with SMTP id v4mr4206391pja.228.1612878734494;
 Tue, 09 Feb 2021 05:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20210208085954.30050-1-nikita.shubin@maquefel.me>
 <5450294.DvuYhMxLoT@redslave> <CAHp75VeW6EWrGPbzBrSPry9Lb8GDvA-C-mkCvmJMTVPeeVxjKg@mail.gmail.com>
 <2202252.ElGaqSPkdT@redslave>
In-Reply-To: <2202252.ElGaqSPkdT@redslave>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 Feb 2021 15:51:58 +0200
Message-ID: <CAHp75VeOPgN9TMjd4diuiuTZJML23JJCj8AZaApenznmMCiV5Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] gpio: ep93xx: Fix single irqchip with multi gpiochips
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 9, 2021 at 2:54 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> On Tuesday, 9 February 2021 15:46:19 MSK Andy Shevchenko wrote:
> >On Tue, Feb 9, 2021 at 2:35 PM Nikita Shubin
> <nikita.shubin@maquefel.me> wrote:
> >> On Monday, 8 February 2021 16:20:17 MSK Andy Shevchenko wrote:
> >> >On Mon, Feb 8, 2021 at 11:00 AM Nikita Shubin
> >> <nikita.shubin@maquefel.me> wrote:

...

> >> >> +       ic->name = devm_kasprintf(dev, GFP_KERNEL, "gpio-irq-%s",
> >> >> label);
> >> >
> >> >Is the label being NULL okay?
>
> You mean ENOMEM should be honored ? I think you are right about it.

Depending on what is the answer to the question below. If NULL label
is okay (and here is just optional) then simply comment it in the
code, otherwise check is missed.

> >> The label is taken from ep93xx_gpio_banks[], so unless we explicitly
> >> pass zero to ep93xx_init_irq_chip(), we are ok.
> >
> >Maybe I was unclear, let me rephrase: Is the *resulting* label being
> >NULL okay?

-- 
With Best Regards,
Andy Shevchenko
