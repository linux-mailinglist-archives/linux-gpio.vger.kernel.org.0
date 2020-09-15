Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A8426A2C8
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 12:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgIOKJD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 06:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbgIOKJC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 06:09:02 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F682C06174A;
        Tue, 15 Sep 2020 03:09:02 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id l126so1654509pfd.5;
        Tue, 15 Sep 2020 03:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YcPuY/A6rGpRQSeejr+/JqR26XmSZN3uVNRZMwilN14=;
        b=KPpmOqgB8OeHft5erzFt+Fv+EXrnrmK5sB80U5H6liEy1el+Bp4oNrl5lmrEi5aBZF
         XojB7h6j/woCLRFfSPulFHKdTOpWIAuyHGE2pMwODQIj6a5TESbhsnosiE92Fqrpahlk
         EQ4stV4MuRpV4/uhiZWIKP1PHqdFXHJ3KJb/E3yLt3NnwUKCX2ZKQA0UIg+TrWFkM+hQ
         qHYEzA8OFaOEF6udCq1SKiqyU6B5yyGXixMQXb/5OuNPBJyHMrjwacknTV09EyoX36M3
         YNBVehnTGDd5tPJawRWEk0Qp523GMiwPZ12RFM67GCE14vksN5NZ8IKeqJ5P0sJ2h0Hq
         /COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YcPuY/A6rGpRQSeejr+/JqR26XmSZN3uVNRZMwilN14=;
        b=pVwK2j2+tRtDsN2YLwIfHD9qqvWMz2AHq2JlLLdDuH6gdTrSzKSLkL/mxBop+nrirj
         MK9d6AxEs/JBFbVzCJyS8ZzizombpZ9iCf6KEJCCWYFiaYJ0tIt+EesnLjMKKd4EUXtQ
         FfugDZbvW7UjjPUwiC0SfxDokaXgx5wIueyAKRoAUZHQAeNKb+dUU4vDlDfkYaerX+YV
         GEVwVw1PPrtmYSCC3eXoirktf8s0pe4OKEyT5DJKRDZt1XVIv6AfFvHpvO+Vxeh4BZA8
         lDIv8CqHniENUchxEf1DidNrAdjcbSaNZ+Q+jpEdqPw/TD2ykAoW3kF6fcOLP1xFa8I9
         oyyw==
X-Gm-Message-State: AOAM531cM+mIoQmhSxR0lYgte0oX2I47UHY3J6JMCuFvC6CTuDAUYwWX
        6c5oHoiMG81sWmzXouKlZ4HKDM7fS3N1MOy1pcY=
X-Google-Smtp-Source: ABdhPJwpHuhwAMT8JLbnfZ5ZXjccNMTJ3HfqKk3tZKUhIlsVxnv6fUWes7blhKzoUSuxWFa1eMYo+gNiU9efgttA29k=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr1209925pfn.73.1600164542050; Tue, 15
 Sep 2020 03:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200909102640.1657622-1-warthog618@gmail.com> <20200909102640.1657622-2-warthog618@gmail.com>
In-Reply-To: <20200909102640.1657622-2-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Sep 2020 13:08:44 +0300
Message-ID: <CAHp75VcpJx4fSHiWWF=Jvch+Ohk7wDJaCFPj5cOeuxT0npZ0zA@mail.gmail.com>
Subject: Re: [PATCH v8 01/20] gpiolib: cdev: desc_to_lineinfo should set info offset
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 1:28 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Set the value of the line info offset in desc_to_lineinfo, rather than

desc_to_lineinfo()

> relying on it being passed in the info.  This makes the function behave
> as you would expect from the name - it generates the line info
> corresponding to a given GPIO desc.

One nit-pick below.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> There are some instances where this results in the offset being set when
> it is already set in the info, but this is clearer especially considering
> that, as part of the replacement of strncpy with strscpy and to ensure
> kernel stack cannot be leaked to userspace, the info is initially zeroed
> in a subsequent patch.
>
>  drivers/gpio/gpiolib-cdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index e6c9b78adfc2..e95e3eab9867 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -752,6 +752,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>         bool ok_for_pinctrl;
>         unsigned long flags;
>
> +       info->line_offset = gpio_chip_hwgpio(desc);

+ blank line?

>         /*
>          * This function takes a mutex so we must check this before taking
>          * the spinlock.
> @@ -933,7 +934,6 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
>                 return NOTIFY_DONE;
>
>         memset(&chg, 0, sizeof(chg));
> -       chg.info.line_offset = gpio_chip_hwgpio(desc);
>         chg.event_type = action;
>         chg.timestamp = ktime_get_ns();
>         gpio_desc_to_lineinfo(desc, &chg.info);
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
