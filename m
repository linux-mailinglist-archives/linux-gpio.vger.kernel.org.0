Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1177390401
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 16:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbhEYOgC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 10:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234018AbhEYOf7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 10:35:59 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12417C06138A
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:34:26 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id z38so13732548ybh.5
        for <linux-gpio@vger.kernel.org>; Tue, 25 May 2021 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J87R9tGiD9qctV4x8vijaWhBzZTCCpwwEZSuP/rj7yI=;
        b=DfjIbrccGsOONpshpqpgyzHXUeXlDTIb7+n07hF3C0K/Apkws/U7vq7MUssKfyYbH4
         JW/GkEuWU2SM+e7WQiaS653ngRi3Z/6jrRH2ViGAzBE3WHJwqjsrOgpghCryNo+Xn8Qw
         Eokvd9R0RPYI5oiOKUp/cB6GPP1IsWJIuVVTF5OoujB/V+BoXVSeEL8dsmjhiUIo4ShC
         wFMwPVGNicErpOLVuK3ARe9OyR+R0J3aOkaVbMqKNuwKet6OldMiDKoWMVTXE1CQwAQY
         ZnNhPiFRzBAFPSnS4g06SABRAdYAQ/17sKxg+IRjOJnQbfR0+Y+tvATRlDHPKmWJOQw5
         g0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J87R9tGiD9qctV4x8vijaWhBzZTCCpwwEZSuP/rj7yI=;
        b=U9RWjMmtlkAy17pNXQ9n0PgIw+LUReRPP2DYfDfIpfWs18jKaZMrpbM/OtUAQLMskR
         W9q8p3GM6iL5QYXhMVFOjnvjOYZs2aAhuL5GBnuWcIzpS/4H+k2fnMRhmNC9ZWjMvtb8
         y+/Ek8YHiIMW2lp/yWZGV9cv9IKW+y018G4oK6tbHRnLRa2ubCd2Mw3a9lzgZgAqY2hw
         pSS5KgpEGT5T/ByDfr7liGUFch74xUbP+pPhC2pnsKf3XbCpmTB5aB+/FEx5yV+Ju3Cb
         IKyuoZhARy0hwEX/WD5IhqACzmAFUlrmGidsqIsvQQMnCQ8MG6VBUsDi3H2C+jyrjnki
         LzpA==
X-Gm-Message-State: AOAM533vitEVuK2IKKt53f5+aRABMWshd7f3ucX/T5mqCoZLjkwj1xxG
        gQIU/WV9XgO7eD+kwGmld5saCuJ9v1CX3hYkurOaxP94G6+jeQ==
X-Google-Smtp-Source: ABdhPJzBzcqbICD0tyi3BQmP2SWh0dbpw78j3Ea6Tcpet57GoI8yzQRqi9jzWtt6VAa829lWWXNvS//+ayHLxDrZkXM=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr41609806ybp.366.1621953264969;
 Tue, 25 May 2021 07:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210516062315.10832-1-aardelean@deviqon.com>
In-Reply-To: <20210516062315.10832-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 25 May 2021 16:34:14 +0200
Message-ID: <CAMpxmJXJOnEfMrDf5krOAOydEui6fAHGqUx8Ub7iWZxMEOqT5Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-sta2x11: remove platform_set_drvdata() +
 cleanup probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 16, 2021 at 8:23 AM Alexandru Ardelean
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
>  drivers/gpio/gpio-sta2x11.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sta2x11.c b/drivers/gpio/gpio-sta2x11.c
> index a74bb97a41e2..392fcab06ab8 100644
> --- a/drivers/gpio/gpio-sta2x11.c
> +++ b/drivers/gpio/gpio-sta2x11.c
> @@ -398,15 +398,7 @@ static int gsta_probe(struct platform_device *dev)
>                 return err;
>         }
>
> -       err = devm_gpiochip_add_data(&dev->dev, &chip->gpio, chip);
> -       if (err < 0) {
> -               dev_err(&dev->dev, "sta2x11 gpio: Can't register (%i)\n",
> -                       -err);
> -               return err;
> -       }
> -
> -       platform_set_drvdata(dev, chip);
> -       return 0;
> +       return devm_gpiochip_add_data(&dev->dev, &chip->gpio, chip);
>  }
>
>  static struct platform_driver sta2x11_gpio_platform_driver = {
> --
> 2.31.1
>

Applied, thanks!

Bart
