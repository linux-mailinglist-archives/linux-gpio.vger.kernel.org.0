Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE813FC501
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 11:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240648AbhHaJa5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 05:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240649AbhHaJax (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 05:30:53 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D41C061575
        for <linux-gpio@vger.kernel.org>; Tue, 31 Aug 2021 02:29:58 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id e133so18062919ybh.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Aug 2021 02:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+wJSd/b8R9DZgfIJi5U7BwHEGhO0PaWYM/2wUsKfQ1Y=;
        b=hMqfRmcGyVFEZgNxjCRVYYeUYAuLBXArcD3MGBBtcFns6zz0uE5jME2WPybkWXRnu0
         jrB0cIkqf9knP8+I/dyiLWEBA0ifJKbQcmVVrSEKfj2I6JmhN66YyjsaNPPJ2U9zfT5D
         hIXxk2jFdnycgWHrEOUtKKY8oE3rpmaAH9luvTDYwHe+tlYNu8hWZfHJW1kjKLSp/V9K
         iW12rs4yPlYWcmlSNRYM2Hk9cvLzYKhR6tb5FJRFqUXfmi4/RmTZEaBqCepGMPbv2Opd
         PC1jI6pZ3zi/vtRkIKdNBOGKr8WD40r2gkFvg2fwcsv9QCz7Z/+mkrnviuYgnnfV6gS/
         IdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+wJSd/b8R9DZgfIJi5U7BwHEGhO0PaWYM/2wUsKfQ1Y=;
        b=LHfCO7tVR6w5EPncos4wjlvzpEEMeowexTrZ5Xg12I5RUA2brWAt0BGFz/yoHcU11e
         cSRdVG7zYOpgswYxiR5bMl/vjltRe22OiLt+zyOqqQdNMm9MfwhxPDDRT9KR2vTVJImf
         MpJEcYeO2S2XpAxz7MYzjLn9ExsjnFTRtUUdq+S8vEMJ29VsgZhafwD3h3YKghxMRQUd
         pnY4go3UCF/R7eOOoZYwuwFdV7QCUVvDBDOM2XNzIBUegj2Nf9gqzyjkpZ4r5gPJDZY5
         NiFEjpRqmWtFWjkWaK+/BLrR64BFm/MmkhzqGuh73WTlf+0RpL9RVAwMC6uyEI6cB+Au
         x3yw==
X-Gm-Message-State: AOAM531XiM7PLf+oseJLIXg+mk2vAFFfpXiHqKLfuosCtEvCitOJt7A5
        T3LAuM5jElog7jJOYa00F2nZFCWt7G5OSNWEzpYzaA==
X-Google-Smtp-Source: ABdhPJyC89SH9/jtyx3m7kK793S2xGNGm4PosM/nre2oaEhTJ4mlVT2GBJOafwzSnQSE8oRaPdMU3YkV7/2FjT/GGDc=
X-Received: by 2002:a25:1d07:: with SMTP id d7mr29544339ybd.469.1630402197664;
 Tue, 31 Aug 2021 02:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210707135144.191567-1-aardelean@deviqon.com> <20210825070125.32918-1-aardelean@deviqon.com>
In-Reply-To: <20210825070125.32918-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 31 Aug 2021 11:29:46 +0200
Message-ID: <CAMpxmJWpOjsJXSDJ3w64MrKeT3Uh1Jx+C7tP44Dj7uF9tnw-Eg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: viperboard: remove platform_set_drvdata() call
 in probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 25, 2021 at 9:02 AM Alexandru Ardelean
<aardelean@deviqon.com> wrote:
>
> The platform_set_drvdata() call is only useful if we need to retrieve back
> the private information.
> Since the driver doesn't do that, it's not useful to have it.
>
> This change removes it.
> Also removing with this change is some logging about the failure to init
> the gpio chip data. There are other logging methods to view that this
> failed.
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>
> Changelog v1 -> v2:
> * remove dev_err() prints
> * [styling] added empty line before first devm_gpiochip_add_data()
>
>  drivers/gpio/gpio-viperboard.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
> index c301c1d56dd2..e55d28a8a66f 100644
> --- a/drivers/gpio/gpio-viperboard.c
> +++ b/drivers/gpio/gpio-viperboard.c
> @@ -404,11 +404,10 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
>         vb_gpio->gpioa.get = vprbrd_gpioa_get;
>         vb_gpio->gpioa.direction_input = vprbrd_gpioa_direction_input;
>         vb_gpio->gpioa.direction_output = vprbrd_gpioa_direction_output;
> +
>         ret = devm_gpiochip_add_data(&pdev->dev, &vb_gpio->gpioa, vb_gpio);
> -       if (ret < 0) {
> -               dev_err(vb_gpio->gpioa.parent, "could not add gpio a");
> +       if (ret < 0)
>                 return ret;
> -       }
>
>         /* registering gpio b */
>         vb_gpio->gpiob.label = "viperboard gpio b";
> @@ -421,15 +420,8 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
>         vb_gpio->gpiob.get = vprbrd_gpiob_get;
>         vb_gpio->gpiob.direction_input = vprbrd_gpiob_direction_input;
>         vb_gpio->gpiob.direction_output = vprbrd_gpiob_direction_output;
> -       ret = devm_gpiochip_add_data(&pdev->dev, &vb_gpio->gpiob, vb_gpio);
> -       if (ret < 0) {
> -               dev_err(vb_gpio->gpiob.parent, "could not add gpio b");
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, vb_gpio);
>
> -       return ret;
> +       return devm_gpiochip_add_data(&pdev->dev, &vb_gpio->gpiob, vb_gpio);
>  }
>
>  static struct platform_driver vprbrd_gpio_driver = {
> --
> 2.31.1
>

Applied, thanks!

Bart
