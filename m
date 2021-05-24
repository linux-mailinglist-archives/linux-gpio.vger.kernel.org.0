Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C44138F365
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 21:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbhEXTB2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 15:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233354AbhEXTB2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 15:01:28 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAD3C06138A
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 11:59:58 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id g38so39453975ybi.12
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d2qRtcBPi7fkJde21gR/Y6WPC5DkPL6SAS4CSueAMYY=;
        b=wczBVJTBvwgIw9qC1aMEMc2GowUXpLLM0YE7d21fILY814nCuVWmY/QLmDXJcDdH4Z
         lTFuec9T86+TA8DibRUdhHCCF+U0gZ3fTHMw8/tPiUpu7BvZG3UjXZG1J0zhR7cIc4B9
         9DyS6tuCWCWNuBOUF5bPAowwrTZua9oseYaTAZk7q7HMpy9NpbcHkHyy5CZ+Ogh/0rzX
         dc/ohpVLPmF8lS0LiCxdd7o6gQSFxsfR5Y0o3GnNluSGSD/Fk3yY4y5kMqlUC6gFEuCv
         NruMJFLltUHLI3IIQOMwARMxlp/JUThqBqO42Mgggz5QAr74T5OFMFEIij0kGn9k4OHE
         TOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d2qRtcBPi7fkJde21gR/Y6WPC5DkPL6SAS4CSueAMYY=;
        b=t30MaWXQNWFK6lntbti2wnGxEXcvtz3UWq12QbauLp63oInSaVItnoP0u5zbsEVOpC
         58UZLUuDOjqFcNb3fXuK1vjFZzQk0hu9heoKKiorUWKeg9wpI3wWpgEX5WxMcPoxO99/
         tegK9V/p1cHvLPk9eY6A1c9rZveMgTY1+Xd3PDmZFy5d8tz0mvPJHvliaNO0FAHW/AMC
         WwwwnZsivdY3DO5xD2itbk/2/HoPyTjnBxm8k869LAyE/2euGUq57BQFi8HPbzSsH62+
         OsLFzRNc+GMGFAxBBOz+Md6G2nF01+n9rBBaibQvfo+L/9GxIL0yLqHMIVZ42G58homY
         d3Zw==
X-Gm-Message-State: AOAM533Oj0f6nIm9eRytOVkhcVaWkiD6PslklpKm0nNq2wuXbFQtvdkP
        iiO+UUE1aftw+NjH41X7nPjFX848j54BNyNgKjFM3A==
X-Google-Smtp-Source: ABdhPJxzAqx2imCHWUqve+desDl2YKJklVrPlr+914/FhxB0hBHLJvgjeNAGhXQlgv2g9UzQzaNwgVQsPbUa6Ph9ZiI=
X-Received: by 2002:a25:c092:: with SMTP id c140mr2240873ybf.25.1621882797973;
 Mon, 24 May 2021 11:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210515105831.9439-1-aardelean@deviqon.com>
In-Reply-To: <20210515105831.9439-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 24 May 2021 20:59:47 +0200
Message-ID: <CAMpxmJXbsLm00RdzDqU4dBazxvvhD0hHuO-119wMwO2FP+r4xg@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-tc3589x: emove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 15, 2021 at 12:58 PM Alexandru Ardelean
<aardelean@deviqon.com> wrote:
>
> The platform_set_drvdata() call is only useful if we need to retrieve back
> the private information.
> Since the driver doesn't do that, it's not useful to have it.
>
> If this is removed, we can also just do a direct return on
> devm_gpiochip_add_data(). We don't need to print that this call failed as
> there are other ways to log/see this during probe.
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/gpio/gpio-tc3589x.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
> index 55b8dbd13d11..8d158492488f 100644
> --- a/drivers/gpio/gpio-tc3589x.c
> +++ b/drivers/gpio/gpio-tc3589x.c
> @@ -357,16 +357,7 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &tc3589x_gpio->chip,
> -                                    tc3589x_gpio);
> -       if (ret) {
> -               dev_err(&pdev->dev, "unable to add gpiochip: %d\n", ret);
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, tc3589x_gpio);
> -
> -       return 0;
> +       return devm_gpiochip_add_data(&pdev->dev, &tc3589x_gpio->chip, tc3589x_gpio);
>  }
>
>  static struct platform_driver tc3589x_gpio_driver = {
> --
> 2.31.1
>


Applied, thanks!

Bart
