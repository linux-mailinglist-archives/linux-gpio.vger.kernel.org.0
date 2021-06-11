Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACA83A48F4
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 21:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhFKTB6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 15:01:58 -0400
Received: from mail-yb1-f180.google.com ([209.85.219.180]:34405 "EHLO
        mail-yb1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhFKTB4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 15:01:56 -0400
Received: by mail-yb1-f180.google.com with SMTP id c8so3998818ybq.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jun 2021 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=txpJhphRW+zqWc5SQouuoFiurfy3eRal/BliZF5gMZY=;
        b=e32Jo77VruUyLGp0VsLav7hbQCXF0PIP8+t2IFaYoI/UgSpO0vFG54LQ2pshvnIPZn
         UmdQ654CCLVvuVOHEYgbR+VWeNkUQxr0SmLjEO2vwRK5Ts5u4EZhck/dkEnrF0FyFbdp
         8l2zKux+pUr05MseofQvdhLU0JN8KQJT/hesaItN7z2QqmmAgeEl1+dJpss7svcbyCIZ
         yJSXhDf+c8Xx58VZwu5yLry82dEhAc3GXTTemtTuT2pekR+CbX8YvefmYxjRl0nUSkbU
         ZrNEnzg7GuGQzfstfweThMbNqqjAEOTQiI9v3A/LdhcneTwUspur7vKE2xDaRK9gyE7s
         QE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=txpJhphRW+zqWc5SQouuoFiurfy3eRal/BliZF5gMZY=;
        b=Bc4fHoiPJRtxOWeOdWIb+5g1LCunmWYImsQ20S16nbqfxUUgrNhvTsO4nUxSKT/z6J
         JUY1vsRNGlki37iXSXBUGrNSE9dEEWrV6wrLkIpGzBXSAKS5iBGcP7IFNqJkw+pgF1Go
         dDL4EoxeC5Us1LIVpBGvcaaOL7gn4Z3WZu9Xp+a9aX1wyD6z5n14h9lX7IC2PhPTnqiT
         gJAENqJXbi371HgAflsgQhavzhOnOX+UHvVCMamblaHwg6vTTK3wRWZgundyD5G2YfjJ
         OIQk2l9b3Z3gnulgzKJN146WW4uPgQFatxoWl3W3YCzsqEyTN3V2Sud6Yp+HZZ412B9t
         fKgg==
X-Gm-Message-State: AOAM5338kG9bK/Pf9iWwUBuws7JGmPgn1Eqkin2PyFcX+lbaiFrKG5Cx
        biwIyFHYKMzPHQi1aT0MfTfyiY9EPJWaf9akr4fp1A==
X-Google-Smtp-Source: ABdhPJx/T3Qz3DWAlDtZBVE06lIWFdevaKCMfE+rTQDoCAabJnjIt58EzU+PLA6oUU03k5IkIMUe2RJoNCQ9eRsuSbk=
X-Received: by 2002:a25:18c3:: with SMTP id 186mr7839000yby.0.1623437938147;
 Fri, 11 Jun 2021 11:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210608143853.4153234-1-weiyongjun1@huawei.com>
In-Reply-To: <20210608143853.4153234-1-weiyongjun1@huawei.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 11 Jun 2021 20:58:47 +0200
Message-ID: <CAMpxmJVBwiZ__Lmg7dgt0Vnxpa1dd_rvK=oXCc_YbXjijmsweg@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: idt3243x: Fix return value check in idt_gpio_probe()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 8, 2021 at 4:28 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In case of error, the function devm_platform_ioremap_resource_byname()
> returns ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
>
> Fixes: 4195926aedca ("gpio: Add support for IDT 79RC3243x GPIO controller")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpio/gpio-idt3243x.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
> index e961acee1571..50003ad2e589 100644
> --- a/drivers/gpio/gpio-idt3243x.c
> +++ b/drivers/gpio/gpio-idt3243x.c
> @@ -142,8 +142,8 @@ static int idt_gpio_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         ctrl->gpio = devm_platform_ioremap_resource_byname(pdev, "gpio");
> -       if (!ctrl->gpio)
> -               return -ENOMEM;
> +       if (IS_ERR(ctrl->gpio))
> +               return PTR_ERR(ctrl->gpio);
>
>         ctrl->gc.parent = dev;
>
> @@ -160,8 +160,8 @@ static int idt_gpio_probe(struct platform_device *pdev)
>
>         if (device_property_read_bool(dev, "interrupt-controller")) {
>                 ctrl->pic = devm_platform_ioremap_resource_byname(pdev, "pic");
> -               if (!ctrl->pic)
> -                       return -ENOMEM;
> +               if (IS_ERR(ctrl->pic))
> +                       return PTR_ERR(ctrl->pic);
>
>                 parent_irq = platform_get_irq(pdev, 0);
>                 if (!parent_irq)
>

Applied, thanks!

Bartosz
