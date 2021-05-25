Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0A039040B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 16:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbhEYOhR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 10:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbhEYOgp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 10:36:45 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4ADC06138F
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:35:13 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id f9so43339442ybo.6
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EKpszL06+Fe1VQHUv5K9+04VIt7PKB0gA4dvg5DCAlc=;
        b=xJdcqMq0/NFMi4kL48AZ7dAZUv2qzbj/ChubnvtE7DS74wqJTijKI0B4QBPF5sHZes
         FAf26AEOYSpduNrWWN3tG74d4MxDE9seCXmTeu3XdM7JMIvLvbfr/JQkLsA+M3T1BYJk
         yml5QCBsMyZVzq97jqBfSZrs6bPB2L5aLIis9NdqVDcut2w4HpXUZoOCCwfR0nyICuvA
         YJ/8vDofq3rsyIh7VeTyLjpSuBakCPVMFgAEFEdtfWYYnBxBzJ8BawDBnenOo/pOhdQL
         0L3n/i40T11ZnUdvlqYT/WptOgd7IEnz61Ohfo2UVg5qJV04e6LlLoLv0if4Lgb7QIop
         wo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EKpszL06+Fe1VQHUv5K9+04VIt7PKB0gA4dvg5DCAlc=;
        b=iapzryWodBKbkhLso6xt7+e6MPgiiLMEvAcIOuELDNa14PeTE/I2HN2guSLdKGSgiA
         b4GvYNHcJtVHlhqZdeE8xiUqR01vtn4QM3WDniP0cV43Q7/094omGoIsomjeMfwQYYIp
         AcHVBM93IB0VMl+I5qmJ03iAUGH9wpeEyWkuHfTMUNZbMCXY94SKtI+67cQD3/YL6RGP
         mpb7PxqpnTWqI/amlvMmsSYw+5x40d2z1r1zZwMBFFEyq/KVY3BP68mysXGP6ChX2zzl
         HIOeyKFm7uElDad82mEZFGwqPkUlA3g/dDJtH/fhYCLVPTBK+NdKytolik96mnhJsCbK
         +5HA==
X-Gm-Message-State: AOAM533ZzENfT65HAO/ueCZxcKZpkKq4zAfVvi/ci8SbHh7te7c+Eyc+
        zzPnsNrjcOi5WjzViW7C/ZHLH/g2Zi9cE+iXF/HbrQ==
X-Google-Smtp-Source: ABdhPJyIk5t5cTB8CuOl6e3qcK32/SFw8tO8XGSCLzr/hZ/cwJO5+/3lNheLsf7MxRzgLnTHTxwxzpaPIBcpzg4XpJo=
X-Received: by 2002:a25:1b0b:: with SMTP id b11mr837606ybb.302.1621953313239;
 Tue, 25 May 2021 07:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210517113540.237495-1-aardelean@deviqon.com> <20210517113540.237495-3-aardelean@deviqon.com>
In-Reply-To: <20210517113540.237495-3-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 25 May 2021 16:35:02 +0200
Message-ID: <CAMpxmJVRFHhh5xmbVZw=c=beq8gWjZu0=OABVwxxyerfq6Dpdg@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-wm8994: remove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 1:36 PM Alexandru Ardelean
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
>  drivers/gpio/gpio-wm8994.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
> index 9af89cf7f6bc..f4a474cef32d 100644
> --- a/drivers/gpio/gpio-wm8994.c
> +++ b/drivers/gpio/gpio-wm8994.c
> @@ -263,7 +263,6 @@ static int wm8994_gpio_probe(struct platform_device *pdev)
>         struct wm8994 *wm8994 = dev_get_drvdata(pdev->dev.parent);
>         struct wm8994_pdata *pdata = dev_get_platdata(wm8994->dev);
>         struct wm8994_gpio *wm8994_gpio;
> -       int ret;
>
>         wm8994_gpio = devm_kzalloc(&pdev->dev, sizeof(*wm8994_gpio),
>                                    GFP_KERNEL);
> @@ -279,17 +278,7 @@ static int wm8994_gpio_probe(struct platform_device *pdev)
>         else
>                 wm8994_gpio->gpio_chip.base = -1;
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, &wm8994_gpio->gpio_chip,
> -                                    wm8994_gpio);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "Could not register gpiochip, %d\n",
> -                       ret);
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, wm8994_gpio);
> -
> -       return ret;
> +       return devm_gpiochip_add_data(&pdev->dev, &wm8994_gpio->gpio_chip, wm8994_gpio);
>  }
>
>  static struct platform_driver wm8994_gpio_driver = {
> --
> 2.31.1
>

Applied, thanks!

Bart
