Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45309113780
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 23:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfLDWVC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 17:21:02 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41908 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfLDWVC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 17:21:02 -0500
Received: by mail-pg1-f195.google.com with SMTP id x8so533741pgk.8;
        Wed, 04 Dec 2019 14:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TfzWmUKLkvL8hNreIPlb3Fho1EmywWcMoeImerdOggQ=;
        b=Xzmv/Qpd7aqGazlDsRyZOFAKj0S386WV6/PyIWZTfIYU0VdEWdEvEIEF9Dq0Wg5oIy
         g+evKKRz1+kbC/ELd59/PEtFQ0HEK2puo54rt06EGIuGZfS5rrbklCkSZvzDBydqZ0pv
         1vniJPezHANFsQlupXEwU5fMIMgWArfJ6GC8I0WuVKcoFWmhCaPN3LS28NZhlpHsniuY
         JtTq8VAme+mr2D9YgEP8HIFrQYYrEH9XUd9ba5eKXMKdaQm4iI7CXEy9/4eJdXK6LxwN
         UjIwp0HCPwk/Jwu5Q+5ExwhcA2Ib5jaVwuCrWjDGffhEcQbY9GC8SjpBHPqAeIJWE8va
         EWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TfzWmUKLkvL8hNreIPlb3Fho1EmywWcMoeImerdOggQ=;
        b=M2nd0f9wdS2pwW1bA5bGqpcEzb6zHu4pQwgb6CM0Oj9Yr5NZnJ63HpMxY6tz7gJaQg
         1fov6+qdBTCP1kb6N/HrIDwP2nO7zAcmdXBl8AnAyJzfG2TQL2bfOB0D3iq0amPfuQmd
         iS5xHxvXG/D8dgLoUC5DgnGiapxp1DHzLTSs2kufJej8RmQz0tEPZl3Nk5xO04ZpL2Kr
         8m3JIxZToeyyGkwfhqaT9LdXjxnP5qTRvMkhctkWmJu9Jch0e1EvBn/W+JxlGUndVw+m
         9x13qVy60pC64INUExEUNCA6bZFabXy665elHKCCxkHXDgIvd0kJP0wsCnHOyd8GdMDx
         CTrQ==
X-Gm-Message-State: APjAAAXuBvaw2IIaZnr+l0hoXF5TR3aODZnLy8BSP/kc8YDkOORUqft1
        HQlIAT7Pky3Hyh8/3JwDAEOTSJrieo+N3ks3vCI=
X-Google-Smtp-Source: APXvYqwhOCQEb7KrTQyi4ejpAuRRjiQoNRglsDRk788ae0sKtfP7kpJoli+bFd+uAye/avJD/GQb4QYqvPS8aoTuPdY=
X-Received: by 2002:a63:941:: with SMTP id 62mr6106336pgj.203.1575498061439;
 Wed, 04 Dec 2019 14:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-6-brgl@bgdev.pl>
In-Reply-To: <20191204155912.17590-6-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 00:20:50 +0200
Message-ID: <CAHp75VeMY2TRKOmz6WTA+8q2UYu+6sw4Xi_9SiiKur1ND8pMuA@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] gpiolib: use gpiochip_get_desc() in lineevent_create()
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

On Wed, Dec 4, 2019 at 6:05 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Unduplicate the ngpio check by simply calling gpiochip_get_desc() and
> checking its return value.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 6ef55cc1188b..17796437d7be 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1009,8 +1009,9 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>         lflags = eventreq.handleflags;
>         eflags = eventreq.eventflags;
>
> -       if (offset >= gdev->ngpio)
> -               return -EINVAL;
> +       desc = gpiochip_get_desc(gdev->chip, offset);
> +       if (IS_ERR(desc))
> +               return PTR_ERR(desc);
>
>         /* Return an error if a unknown flag is set */
>         if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
> @@ -1048,7 +1049,6 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>                 }
>         }
>
> -       desc = &gdev->descs[offset];
>         ret = gpiod_request(desc, le->label);
>         if (ret)
>                 goto out_free_label;
> --
> 2.23.0
>


-- 
With Best Regards,
Andy Shevchenko
