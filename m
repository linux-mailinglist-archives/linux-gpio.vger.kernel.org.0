Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA0F38F369
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 21:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbhEXTCA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 15:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233167AbhEXTCA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 15:02:00 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C014C061574
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 12:00:32 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id w1so28184945ybt.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qZ/HHH6RzjFrXIpsOJzjI+Qc1VHUbpxeGOmV9lmhHyc=;
        b=YiUrbTf9fHfnrlZaVNXWX2ffeVRP5Psh3XBE1kMs9L/sXhpgKua0laF3KHras/R3fA
         bNbWe6WXHIATQsWiqoSeIF/HaQSPnkAiwe6vK8M8tFghbUBh/+Y21KsH3Bsgt/5M+nmv
         mQkPJiwt0yz+D7sDDF6b2svmm40CLw5D5Woj1+iEntXkHFWZt4g/k/y1Wn7+eZVkLySH
         Qw8DSL08hbOxcctLHINNIb0xFh9fG4UPvaYEZT+x4w56vhkK5hCkYRaowpRkzhAW6GV+
         CRVA6ZJu4PY9KVzBdCFlFnpUDwOF3bGa8oQDqzyWxmCBavTGzhYYh002Vnxkw5AWbKt6
         R2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qZ/HHH6RzjFrXIpsOJzjI+Qc1VHUbpxeGOmV9lmhHyc=;
        b=fBQiNeaVdyuTL8jerbmUmoz7KvxfCzBMogtXtxHXdfF6pQCt1690KSjb/fvNtJGunw
         qe7n0Ruyn3ZQ+CvyOZA3k5fcXb/1iD/8AgxHZwc83dLXW2IXuQBvGWsy6N1M7lflXJg1
         eunCEFLXegRZQ/r5U6PjZ66pHVL1C5Pa7zPDI4JawvfjNxH3DDYvJgN9/OydniIk6lWi
         fJ3jfIDOy7uzlVw27h+F51TnQEg8NHeubDmHyfEAZiqEw/CKIk2REOKUsm3aRiYPnmnl
         2kykg64FwVgp31z293YITUsOY53ZKtvJOedH796Tai53Ha5TdDeRPzy6BSLTCpv5lxxN
         YhMQ==
X-Gm-Message-State: AOAM530gopPjFC27AO/904IrYK6qTV38pxlMz7qzUJMjmFCFClETpOpU
        3OhSCFstRkEVk6+VKc0ymrbpyXbpMITVCDQwfH7hRw==
X-Google-Smtp-Source: ABdhPJzh926Hx6hSGwdxh6ozSTJy0YjecarXSU76V/d/BwbeV40EFDwLYSTVIkh4m/GS4WKe4225+eHJro8geqbMtwE=
X-Received: by 2002:a25:c092:: with SMTP id c140mr2244608ybf.25.1621882831629;
 Mon, 24 May 2021 12:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210515075257.7918-1-aardelean@deviqon.com>
In-Reply-To: <20210515075257.7918-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 24 May 2021 21:00:20 +0200
Message-ID: <CAMpxmJWBi=R21pK0-g4j8bOfh7Hy4tmFrcKY+X23+c2f2CiKjw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-tps65912: remove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 15, 2021 at 9:53 AM Alexandru Ardelean
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
>  drivers/gpio/gpio-tps65912.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
> index 510d9ed9fd2a..fab771cb6a87 100644
> --- a/drivers/gpio/gpio-tps65912.c
> +++ b/drivers/gpio/gpio-tps65912.c
> @@ -99,7 +99,6 @@ static int tps65912_gpio_probe(struct platform_device *pdev)
>  {
>         struct tps65912 *tps = dev_get_drvdata(pdev->dev.parent);
>         struct tps65912_gpio *gpio;
> -       int ret;
>
>         gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>         if (!gpio)
> @@ -109,16 +108,7 @@ static int tps65912_gpio_probe(struct platform_device *pdev)
>         gpio->gpio_chip = template_chip;
>         gpio->gpio_chip.parent = tps->dev;
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip,
> -                                    gpio);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, gpio);
> -
> -       return 0;
> +       return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
>  }
>
>  static const struct platform_device_id tps65912_gpio_id_table[] = {
> --
> 2.31.1
>

Applied, thanks!

Bart
