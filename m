Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4550390406
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 16:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234041AbhEYOgW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 10:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234024AbhEYOgW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 10:36:22 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FA0C06138A
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:34:52 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id o18so5664814ybc.8
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=njgvTgunXRRg63Qq7f9ciea0tevIVNyjwcAX5SfR81k=;
        b=d8pUYi2iVtwO8K+ayyuIuksX1hs5UfJiFyf6Zb9h2a/1hVo0t4FXVoSpNu7AvVR/gD
         7ukU62YXBrszNvUDe8aIwTS7Pv1UCztSV+nsQ/xY3L5lhmnKjYyH/Wy7uae8CxdHk6dq
         cyXzQcDW8QFCfzKxVsp/D8P/nKX7HFD2VGAYF8ZOyQoCpKdOMjY/RY5IN6kQhChNpwtE
         uY17s4kkjFNT3nftBvQT2tT/9ApQvhsvhTqwT2FqMiVIr+lWf1zbSRTTBN41fad6jGVl
         j4OP2h0WAzxmsTuwOqfDZb2VBCATwP0x0iZF+ksUcCcon68NT3sx1XCoZfDjNHX2896X
         3J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=njgvTgunXRRg63Qq7f9ciea0tevIVNyjwcAX5SfR81k=;
        b=KOdq81PIrA7MZkL2z7ojpbXQPGPisWs+gX6CwSEsdclKRovFprOkttiIIQm9yUspTE
         CWdoVXiUjVQfwNtFXCFAkYe3bxh0WDe/NfGoMqTsw/uffJ3oTBVU1MFoCF9YXKjRguLS
         aWyR8y/7aY7EtyAavt1/fR+cGddmlmAGbxXaEX7XRBJg52pfpylL5IdODPUVMU21ueSL
         F8AKmTaEdxxY4FZiqI1fb1o36VGQOeV2SOTgk/OB6UEpUKsrRYdZ6DnE5F2pRC6L+MkK
         XWA9HOwmdw5/vLTTBpI9BQiddyLHnqNzC1e131yoI26X7EX33kcMN/dNvziVe48Dy5Bv
         NevA==
X-Gm-Message-State: AOAM533kn9riTkZoptlcOMkSnPLqs69oArbIb4Yr09jYlDqVTxeb+xNe
        RDnTKN+cUG41rSKOPZETPBxbp9HO7YUsOAMqZvMsGg==
X-Google-Smtp-Source: ABdhPJx1+4Ya6VM1PTPaiZSaBUZ3bw2w68ryEhikjeKvCRVos/qYo6B2Q3lgDLBFxNEkCvea6OQhWOPKB5mz4ZCDJWY=
X-Received: by 2002:a25:e08e:: with SMTP id x136mr39284583ybg.0.1621953291480;
 Tue, 25 May 2021 07:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210521181708.11524-1-aardelean@deviqon.com>
In-Reply-To: <20210521181708.11524-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 25 May 2021 16:34:40 +0200
Message-ID: <CAMpxmJXK7ccGQd0KFQpuEx8nSaBMufw2fyVyXyX=ErP2xgFjHw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-tps65910: remove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 21, 2021 at 8:17 PM Alexandru Ardelean
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
>  drivers/gpio/gpio-tps65910.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
> index 0c0b445c75c0..7fa8c841081f 100644
> --- a/drivers/gpio/gpio-tps65910.c
> +++ b/drivers/gpio/gpio-tps65910.c
> @@ -165,16 +165,8 @@ static int tps65910_gpio_probe(struct platform_device *pdev)
>         }
>
>  skip_init:
> -       ret = devm_gpiochip_add_data(&pdev->dev, &tps65910_gpio->gpio_chip,
> -                                    tps65910_gpio);
> -       if (ret < 0) {
> -               dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, tps65910_gpio);
> -
> -       return ret;
> +       return devm_gpiochip_add_data(&pdev->dev, &tps65910_gpio->gpio_chip,
> +                                     tps65910_gpio);
>  }
>
>  static struct platform_driver tps65910_gpio_driver = {
> --
> 2.31.1
>

Applied, thanks!

Bart
