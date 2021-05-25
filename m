Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44515390403
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 16:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbhEYOgP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 10:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234018AbhEYOgL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 10:36:11 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36877C06138B
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:34:40 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id y197so1625915ybe.11
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sh47QlGxynanW52vYTCNZQKEfUAOENA1b1YEoaqVTSk=;
        b=sfhJFFb1CG1PY7FfloUbp/iRPdzwOkluLPCH7sflM08U7vFCMLmxB9WgaUO9qz0A1s
         DyUbS2lcrTkxrlsLH/vIhx6PkHvyWoQ4Ugp0fyDERZB2GQvtAVk7ziMqZMxNba1xeSkw
         wMikZFv3dmBINzyOOCFfM0AWsIhPiAbwt1uxCb0r/39Ewd7KhSNSRddYBfXll64aheEi
         MdGXr74F1dIOPL+UXwL75kJLNu9bq1V7eUtCvIFtEdXUJ7fTHziJbm5EatLQWV/RoFcB
         ehIoMYGn/C91GZqbHtiW/RW2tOsJlq6t/H4xv+6jyyIYtqPzW1oBo1c5BTU8xHgiS1Og
         ZKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sh47QlGxynanW52vYTCNZQKEfUAOENA1b1YEoaqVTSk=;
        b=tD1uYMuk/561zab4SHAx7Dm75FK2v+CRI2tPMAtuaEBY+0n41nD55t/QEYt3cetvSv
         r476nZEuqt4hVziSh8OrIYiml0dEIO/IDyr7hUo0hyMwq17Dg3I1/oQV1KEdCXNqnJEx
         PsVAcHxnm3seWvzCqqxp6r1VKkJHHCrouWXXTP/C/plT7P6Q57miQKVI90B9YJ3fnD7R
         esJXyBdNOxOTaM2IldHFJ8PRnnrnGOZ74KDNDEBjcvgJkeuKQALAiTf9C/yqpx0Svhmy
         sfMAdj3fHkIMIKTTwXTOzdiCeEs6Vz/FsREyKcL0IvbcnXQXQSfd/z4n4ygN2ob2Txxg
         +/eg==
X-Gm-Message-State: AOAM532zeFSpR4icWiu0PhN0bhjBuoLK+pxB98Ej3CcY0Od43EufP+TP
        zHRfjQMjn09pADRIzpbVJYlAutEW2BZKgWrpYRxsvA==
X-Google-Smtp-Source: ABdhPJzhmBfOioNjtysUAFjXCR+OW1Yd6WL/Vzh2dJ7U2bimHrv94asdaQzxIM0jD3C3hRac6RNfFU7GvteljYxIHdU=
X-Received: by 2002:a25:8804:: with SMTP id c4mr43679649ybl.469.1621953279543;
 Tue, 25 May 2021 07:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210516062629.13550-1-aardelean@deviqon.com>
In-Reply-To: <20210516062629.13550-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 25 May 2021 16:34:29 +0200
Message-ID: <CAMpxmJVomR44cweFFKagbKPPRwXUN6GD_c1kq2UegyhvZ-UAEw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-sprd: remove platform_set_drvdata() + cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 16, 2021 at 8:26 AM Alexandru Ardelean
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
>  drivers/gpio/gpio-sprd.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
> index 36ea8a3bd451..25c37edcbc6c 100644
> --- a/drivers/gpio/gpio-sprd.c
> +++ b/drivers/gpio/gpio-sprd.c
> @@ -222,7 +222,6 @@ static int sprd_gpio_probe(struct platform_device *pdev)
>  {
>         struct gpio_irq_chip *irq;
>         struct sprd_gpio *sprd_gpio;
> -       int ret;
>
>         sprd_gpio = devm_kzalloc(&pdev->dev, sizeof(*sprd_gpio), GFP_KERNEL);
>         if (!sprd_gpio)
> @@ -259,14 +258,7 @@ static int sprd_gpio_probe(struct platform_device *pdev)
>         irq->num_parents = 1;
>         irq->parents = &sprd_gpio->irq;
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &sprd_gpio->chip, sprd_gpio);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "Could not register gpiochip %d\n", ret);
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, sprd_gpio);
> -       return 0;
> +       return devm_gpiochip_add_data(&pdev->dev, &sprd_gpio->chip, sprd_gpio);
>  }
>
>  static const struct of_device_id sprd_gpio_of_match[] = {
> --
> 2.31.1
>


Applied, thanks!

Bart
