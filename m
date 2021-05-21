Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57F138C736
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 14:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbhEUM5V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 08:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231970AbhEUM4t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 08:56:49 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A25DC0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 05:55:25 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id b13so25945882ybk.4
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vztkWmHQgKWPGJn4DJHohOXTvYdeCFCMfmSXs9/hr3M=;
        b=L0vrt59WhxgD223N4WjstHuvb3x0kMuwpTPtDH7AKGHLMPTAg6ba6ZHaKOSxexwizv
         HYv4WxhsA1Kc0qdYd9P5oheM3mP8jlxq3oh9uLtPy1nQ1hy+vEBYulp6c8jTtbbdNmmV
         nYvgc/pGqkKZE3Ye6hrEJ61lMl2Cn3P8uPsLbDTj7pmB92IMhUEPso406xRnnb2zbsKS
         SP3fWuHDx4ihrXo7HUBeGmfaknoTUtR4K2NMmFxU5YVgEesXJeogXu6FqC0Y6PfmvNyk
         QXuJTtOr3OKbEx2wAVcJgxmx2+CvX8LAgseksMQcMGwv/U1pZsbqdLOdOvK5xIWgY4Pv
         t+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vztkWmHQgKWPGJn4DJHohOXTvYdeCFCMfmSXs9/hr3M=;
        b=oHz1HlmlCjO+eQyEydyHx2LIiEnnucUQuwOGoJ2opyJmuoUMjnvGxRF8Mq/94axBxU
         2st6tz1FC+Nt7YW7Gz9FGxDq6sHo/U3Ia0gVnPtm53U+JGSD41Espz8dWSJAxdJSnjzC
         lYzraJDux4z6cJxHMW9kdPqNPleyJJOvKSdzB7Tbf3dfKRUv+jiDnVltOgF4iIXzNykq
         oUmvLR69xd2DQxxollysFVB99j6bDdiIw53EBQAroXnoO5anCqtMlfb95L2azsNWR65p
         VKuqp8/FnwhfuFntGLoNglANWX1tT0V0dmXrciA3+SDYwPha9xDIPcHcpV0554I1IkQo
         98og==
X-Gm-Message-State: AOAM532/KLc8d6qI0Qap1io+VButN1Qkgo2YoZyPDt7Gfy3l8Q7SHyDI
        qGlwA8xqJMBmH9SHs5jU8vqxICOPl+Sujww8vJXZE+dgU2OaUA==
X-Google-Smtp-Source: ABdhPJz6/p+C7UeedeeY3v244grS/khR9g2n2Vg622QKjp5XuojoNGUsMaNRh+rB6XoU7bh6JtrGJBgcirO0fh7x+jI=
X-Received: by 2002:a25:748f:: with SMTP id p137mr14497003ybc.25.1621601724740;
 Fri, 21 May 2021 05:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210518084619.29949-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210518084619.29949-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 21 May 2021 14:55:14 +0200
Message-ID: <CAMpxmJVGGhDfEAJNZoMsSw6Y05wRgDOtfqaYZyTzjsn_7uPfVg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Make use of assign_bit() API (part 2)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 18, 2021 at 10:46 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> We have for some time the assign_bit() API to replace open coded
>
>         if (foo)
>                 set_bit(n, bar);
>         else
>                 clear_bit(n, bar);
>
> Use this API in GPIO library code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-sysfs.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index 41b3b782bf3f..7c5afd999210 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -312,10 +312,7 @@ static int gpio_sysfs_set_active_low(struct device *dev, int value)
>         if (!!test_bit(FLAG_ACTIVE_LOW, &desc->flags) == !!value)
>                 return 0;
>
> -       if (value)
> -               set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> -       else
> -               clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
> +       assign_bit(FLAG_ACTIVE_LOW, &desc->flags, value);
>
>         /* reconfigure poll(2) support if enabled on one edge only */
>         if (flags == GPIO_IRQF_TRIGGER_FALLING ||
> --
> 2.30.2
>

Patch applied, thanks!

Bartosz
