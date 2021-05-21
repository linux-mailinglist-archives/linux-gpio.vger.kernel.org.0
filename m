Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFC8438C8B9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 15:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236144AbhEUNyM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 09:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbhEUNyE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 09:54:04 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABFFC0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:52:40 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id n83so16709609ybg.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 May 2021 06:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hYyazQCV7o9/2ffX8oGQlM25PnfYmuFFZClG9zAHqJc=;
        b=j/wmMDvq3difoHoU5SX0tyjbMB5bynTLuxWgfvvtxkWX6KYClGT/XVAMt+3Q221+BW
         hUBbNCQPDDiVyNNOFrjU/y69OQOzSs1NaBK4JJBul8oUQeBXOJtlD1kCpP6/0QLVyM4Q
         cLUhO6zRZwgHZ+/SM1SlF0Ab7t9ZusWM/sobTQmE22BaPG9LA1kbUGv6uHwsvL59iO3A
         t3SzLIAoDbfUGdW9OctPBQ9pVE3QvVDxvFitxOktBTd9NjGiPn0+Y3f9qTa93h8BbxkD
         xhue1VzAJhcaoSGbx636t1B8FHniYtFHwrfUQliTMKRgi2TZ53L8X7WNs3AtQa4inNmO
         6S+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hYyazQCV7o9/2ffX8oGQlM25PnfYmuFFZClG9zAHqJc=;
        b=A5s9WwDY4+t4sqc8U+2PZsM6hDeH4uXImdGbFBDWwkbp/EcL0GMxKOgUDBuw9DaZ/6
         yFUg01zxEXcr0ktOQggq7s07V8wsAZ5InPTAr8v8PHoWoUyTnzV/UMP9x31xCJgQGD5w
         1GBr9fxqxK/dISwz+MH1qoW6wuWYNFOy7J2uejz1RMhZoShgWlhaBxaW9e5YvAC1r4Ay
         6TpO2+zmq0w0wCUAFpZDv0sW7WEyO8M5dFXHfNdNVvzExbr2IfUSAE8z0BiFW8ItlOPY
         TWF4ZTrR4wzVWc7FYk0+97flGiL/Fi0qew2csyJX1LSy+mPDZs2i1+0TXoe6DNGg73+2
         qnzg==
X-Gm-Message-State: AOAM530PSSi2FLMFtrOGbJMYQeXxjjKoCrco2M+5913w+4wfyT0RoaAX
        N5VBbTx0o22FXfMznjKwFiU/wmDJwpv36VylK7dNpw==
X-Google-Smtp-Source: ABdhPJy3kkuAHHd98B11lrxrq9K6DHkYZ0z6vF25s6RHXk7bi60FZKix45bdB3moE7LYh9l8X2S/jPZOAZ3Bp/en79A=
X-Received: by 2002:a25:bd04:: with SMTP id f4mr15874966ybk.302.1621605159628;
 Fri, 21 May 2021 06:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210514094108.28890-1-aardelean@deviqon.com>
In-Reply-To: <20210514094108.28890-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 21 May 2021 15:52:29 +0200
Message-ID: <CAMpxmJWmc-8cCZ5EQcnBKSAmXPbcVUnX7GdhKgKWFp5i=B6y1w@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-tps68470: remove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 14, 2021 at 11:41 AM Alexandru Ardelean
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
>  drivers/gpio/gpio-tps68470.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
> index f7f5f770e0fb..423b7bc30ae8 100644
> --- a/drivers/gpio/gpio-tps68470.c
> +++ b/drivers/gpio/gpio-tps68470.c
> @@ -125,7 +125,6 @@ static const char *tps68470_names[TPS68470_N_GPIO] = {
>  static int tps68470_gpio_probe(struct platform_device *pdev)
>  {
>         struct tps68470_gpio_data *tps68470_gpio;
> -       int ret;
>
>         tps68470_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps68470_gpio),
>                                      GFP_KERNEL);
> @@ -146,16 +145,7 @@ static int tps68470_gpio_probe(struct platform_device *pdev)
>         tps68470_gpio->gc.base = -1;
>         tps68470_gpio->gc.parent = &pdev->dev;
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc,
> -                                    tps68470_gpio);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "Failed to register gpio_chip: %d\n", ret);
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, tps68470_gpio);
> -
> -       return ret;
> +       return devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc, tps68470_gpio);
>  }
>
>  static struct platform_driver tps68470_gpio_driver = {
> --
> 2.31.1
>

Applied. I got confused by the dev_get_drvdata() call earlier in probe
but this one's for the parent.

Thanks,
Bart
