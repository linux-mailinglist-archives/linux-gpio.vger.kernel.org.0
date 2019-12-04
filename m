Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE774113782
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 23:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbfLDWVa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 17:21:30 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:40412 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfLDWVa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 17:21:30 -0500
Received: by mail-pj1-f65.google.com with SMTP id s35so385147pjb.7;
        Wed, 04 Dec 2019 14:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7uOomMuI9mkDudH3/Tq6vnvg4y88VOc+n31E0loZH7M=;
        b=Q9HjnBCxmvtNN8zxZWRDX8eLbJV4OsaK5gxztSXJYkHjTHmyIpNvLrI0NHllqHts5c
         xyrM4D+RoPqMBdeSto4J++yqHZB9xXrznc87VYDtPsx0Clm88S85PBpaLb52mkBqAvAh
         sTboRlR75EDz6iPZGMjhGrfnFUvLW47CqDPo/5OIYyH4HxvLV3dTwZSprxXchio0OaHt
         AktQN+DoraG71O2+hZVnXkPIFiF4j4nxRHEcwVqltSufoE6tJcf9wSHYF9h10/b9yBtB
         PZxBoHxoD65eKVfjWBdbJ+GmntIXP0mnbJ22Mhonc896p1hGgLxN3r6b+T5pVBnJTn+C
         ajDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7uOomMuI9mkDudH3/Tq6vnvg4y88VOc+n31E0loZH7M=;
        b=eQLdF65BUuPQ1SL/Ftc/YMmcm6QDyGm5d145159823uLAaqvT5cFn4Q0K+BuADkHmV
         ruML5GfcoKTZ5Dv2C6ILmvHbsJHLBjRvHnDQ1VWHUtVCaDEfUPSKIA9j7MyesTgVsbWt
         BLtNtJb7W1UOAF46hs+ansm7gwhDcGyGMEiKJP6+i3HOqI1tBwArUzQvwNXHoCZmZwBO
         yZNO1MLazqsHWUfR6NHR7atc4/U3UqD+/4d9P+qapHTrUZ1iU3/N1gR3W1AIbCBNCABV
         U3lMRhmAswtBPAhnS0TiVKIHxLxEcSNRnq0tyH3w7eWB30pI2Dx/Saf5rV9qzgPkQN78
         XLsA==
X-Gm-Message-State: APjAAAWK/jJuB/2/7UVGSPKok/bd8qbNtc++5kW1QTLVahcArSyRZPhx
        QO33vaM0LgdfAcn232oVHXsL1vCaINyyMXx1xGC+0GbjaVw=
X-Google-Smtp-Source: APXvYqzD5GzHOaXAQ/z8VrRalXeZYbNVadalCl/ap48T7RwiTRRlKy35Rxp/hvF2rcRRw0/MO2zggU6fUWh7uChFCLA=
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr5773604pjb.30.1575498089340;
 Wed, 04 Dec 2019 14:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-7-brgl@bgdev.pl>
In-Reply-To: <20191204155912.17590-7-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 00:21:17 +0200
Message-ID: <CAHp75Ve00HXD6Zm6Ypy4oapAZTJk99tzDSu-=c5NG4iOjK8KzQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] gpiolib: use gpiochip_get_desc() in gpio_ioctl()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 6:04 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Unduplicate the offset check by simply calling gpiochip_get_desc() and
> checking its return value.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 17796437d7be..b7043946c029 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1175,10 +1175,11 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>
>                 if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
>                         return -EFAULT;
> -               if (lineinfo.line_offset >= gdev->ngpio)
> -                       return -EINVAL;
>
> -               desc = &gdev->descs[lineinfo.line_offset];
> +               desc = gpiochip_get_desc(chip, lineinfo.line_offset);
> +               if (IS_ERR(desc))
> +                       return PTR_ERR(desc);
> +
>                 if (desc->name) {
>                         strncpy(lineinfo.name, desc->name,
>                                 sizeof(lineinfo.name));
> --
> 2.23.0
>


-- 
With Best Regards,
Andy Shevchenko
