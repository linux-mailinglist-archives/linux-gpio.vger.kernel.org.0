Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE16E15185E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2020 11:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgBDKCy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Feb 2020 05:02:54 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43900 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgBDKCx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Feb 2020 05:02:53 -0500
Received: by mail-qt1-f196.google.com with SMTP id d18so13817281qtj.10
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2020 02:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ghM8CfDa2/Ip4ndXnRYAbe1Eu4uBNcrod/lKoX3nDBg=;
        b=v0Omv0O4C/AwHbOELDscFcPwuSulnYIuPoeE25KexTghf+iVaKp5SbFyQm3bIQE+dv
         DT6q0tKslugZxYcPHu8YMZTOoSH0zpQqvLUxRgVWaGgaNkkZyUDoq2m750PoVTOlGCq9
         IEYPIaCm3SP9hQ97+2qaKkLo+blNzjIMY3ItFu8ok3TsABpQ18OLgipXg8xqB4SD7tBe
         cqsM+lX1kRNDJmK1/khqVP+rsTwx/MUljvjPzyjy8GNcFmE5BwB7YTHddkybSSgHyBLh
         /oNBxWGZpFWc1OuZ39Sqlr/w+YpWkj1GuoQd38pCm2rRMjq4DzQVSe30OpC15ONx2z2/
         Zvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ghM8CfDa2/Ip4ndXnRYAbe1Eu4uBNcrod/lKoX3nDBg=;
        b=E2sHvM+JflSwPzVzxaKcgO8SYSfxaYXCcTyzCYfvfKFYoh9OQ0mYclPVYsxDWDSvSF
         lY3nNqDC07AkZAZklfWJn9RiJXgkduSUYQkJH1xmvFK+KuUBNhOf08TVJ453ZaHym/o4
         NyT71gfkKyI/gjtBWFMGCDUeIvLMVNOVpKjyS0iZGI0XmTiniiMhc39gTHL8gZ5vBw8y
         T40rqAFLrH2f1MHeKvW+YPC1yqhDo6YKaA12xTJGCDg3Eot5jFoViLq7gFCP4PqIne25
         H0MKtQfsmaMMdVYNkgBVZfua842Bgt65X8llAcBWHhhmaavqj9BpTQSJXfwV+AIB14Wz
         zzAg==
X-Gm-Message-State: APjAAAVfrwr6ex/RMGibu5XHzdlrgWnJli3mdBEaGSEprxfByHbPH/NT
        6KNQw+1nYL/VocWdq7xpgnuUopBa1QbKhjTDfjT+rgag
X-Google-Smtp-Source: APXvYqwQTTcjLTUSdw2YxJiWqB7SSbUbkClipYnoODuBiqHI6usAirDN4EtChY8ZOsC8bOhQ+uZ7bVy0mBQKoy5pIcs=
X-Received: by 2002:ac8:3676:: with SMTP id n51mr27469255qtb.208.1580810571333;
 Tue, 04 Feb 2020 02:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20200129123021.26200-1-axel.lin@ingics.com>
In-Reply-To: <20200129123021.26200-1-axel.lin@ingics.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 4 Feb 2020 11:02:40 +0100
Message-ID: <CAMpxmJUUCwtrh85oyMSYiJ3-saEe8wNQY03HHRODv_vueMeVWQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: bd71828: Remove unneeded defines for GPIO_LINE_DIRECTION_IN/OUT
To:     Axel Lin <axel.lin@ingics.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 29 sty 2020 o 13:30 Axel Lin <axel.lin@ingics.com> napisa=C5=82(a=
):
>
> They are defined in gpio/driver.h now.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/gpio/gpio-bd71828.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpio/gpio-bd71828.c b/drivers/gpio/gpio-bd71828.c
> index 04aade9e0a4d..3dbbc638e9a9 100644
> --- a/drivers/gpio/gpio-bd71828.c
> +++ b/drivers/gpio/gpio-bd71828.c
> @@ -10,16 +10,6 @@
>  #define GPIO_OUT_REG(off) (BD71828_REG_GPIO_CTRL1 + (off))
>  #define HALL_GPIO_OFFSET 3
>
> -/*
> - * These defines can be removed when
> - * "gpio: Add definition for GPIO direction"
> - * (9208b1e77d6e8e9776f34f46ef4079ecac9c3c25 in GPIO tree) gets merged,
> - */
> -#ifndef GPIO_LINE_DIRECTION_IN
> -       #define GPIO_LINE_DIRECTION_IN 1
> -       #define GPIO_LINE_DIRECTION_OUT 0
> -#endif
> -
>  struct bd71828_gpio {
>         struct rohm_regmap_dev chip;
>         struct gpio_chip gpio;
> --
> 2.20.1
>

Applied for fixes. Thanks!

Bartosz
