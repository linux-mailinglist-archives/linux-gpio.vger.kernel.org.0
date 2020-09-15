Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A62726A2DA
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 12:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgIOKMB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 06:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgIOKL7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 06:11:59 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BEAFC06174A;
        Tue, 15 Sep 2020 03:11:58 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w7so1669352pfi.4;
        Tue, 15 Sep 2020 03:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dX2YwZI+VG4fwad6V/37SXKWJsYKUWEdjwqr+RFAkC0=;
        b=GI8I48eViSrr1UGuA652a3mpmzse8EosjAkd0fsAtn2rXsvwL5O5yODhzugB80fyE8
         QUN4XG2wT8cyr1b6F4vn4Td0sc6sxvinblLLFuWSet5zvA1ohIJAc9qiV+uJvqeXQcxx
         jTsb1JtTG7uCDKShwqmFQ+dg1lzl5JG54ihNHo3DARRHHGmyoE20xazREgwdkAAtr3Y1
         EyVqmWCMzKcpewxoseLLG/srfy1Z48Zp1ymxsyOhACdcwNegDRZaWOBIlqJDfYXzRWit
         JPuVlGymlg+Ty+7SkBf+FhNdVDgktT/Sg8CjezFMF5/j8HigJ16zuqkaAa2dTLiFwAq2
         kCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dX2YwZI+VG4fwad6V/37SXKWJsYKUWEdjwqr+RFAkC0=;
        b=OqFFeSFJI7AR8fTE/nBRy98PC8Yd2Y5CiHehkDYMuOshfjrV4aB48A53r+8gMsraW7
         zJRmXhoYkqAemy/8fJIRq+B8UebwQySFWQMR8NCcsSKsY3b67E1buHk/CBrl2rmpj/Dr
         FR9M3/CII5V8ay6ht7WF/5jEHTXTwrGN/6pdd7MGcwfPJH4TYAfrL3qIXGZZiYCBn27N
         x4eqAIFuELW4oKj+O6H3nxthkaDUfm71haTeaLbXHgPuTOcZFIoqfij/qKIh8c4ZzKj5
         o5qgJKgYioMQOFGaIIPoyv9LfbyssZfvFCT9/0ZXnwOV9CQ0cUjWBfyoibF7dqi1P1lq
         3pGw==
X-Gm-Message-State: AOAM53240DHt6ujcYEXuSrZxIClbES784q9G22WS3HjlePcaIwzYj0cK
        iVzbXyA7C4HvUaChreJKp/w2u+IOoxh315nop4WskiS4peyAHD28
X-Google-Smtp-Source: ABdhPJy2H1zPYCR9WbhMArPfA13QzFAYmXZdJTL8TWY7TcRlg2KxOoLmHCtpF/pLWjLqjQVnat2ElVI027nCKqbLFIo=
X-Received: by 2002:a62:7b55:0:b029:13e:7367:2b2e with SMTP id
 w82-20020a627b550000b029013e73672b2emr16873166pfc.7.1600164717697; Tue, 15
 Sep 2020 03:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200909102640.1657622-1-warthog618@gmail.com> <20200909102640.1657622-3-warthog618@gmail.com>
In-Reply-To: <20200909102640.1657622-3-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Sep 2020 13:11:40 +0300
Message-ID: <CAHp75Vf_JVJwc7t7mMACRB9xhBgNODz-474tiK77bQ-t_X_BiQ@mail.gmail.com>
Subject: Re: [PATCH v8 02/20] gpiolib: cdev: replace strncpy with strscpy
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 9, 2020 at 1:34 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> Replace usage of strncpy with strscpy to remove -Wstringop-truncation

strnspy() with strscpy()

> warnings.
>
> The structs being populated are zeroed, to prevent stack leakage as

structures

> they are returned to userspace, so strscpy performs the equivalent

strscpy()

> function without the warnings.

Isn't this what I commented on like half a year ago and back then
reply was something that there is no warnings or so?

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> The memset in gpio_desc_to_lineinfo(), in conjunction with the strscpy,
> is necessary as strncpy zero pads the remainder of the destination.
> It also guarantees that the info cannot leak kernel stack to userspace.
> This is useful here, but is even more important for the v2 info, that
> this function is changed to generate in a subsequent patch, as that
> struct contains padding and attribute arrays that also need to be
> initialised.
>
>  drivers/gpio/gpiolib-cdev.c | 23 +++++++----------------
>  1 file changed, 7 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index e95e3eab9867..8b012879fe3f 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -752,6 +752,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>         bool ok_for_pinctrl;
>         unsigned long flags;
>
> +       memset(info, 0, sizeof(*info));
>         info->line_offset = gpio_chip_hwgpio(desc);
>         /*
>          * This function takes a mutex so we must check this before taking
> @@ -765,19 +766,11 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>
>         spin_lock_irqsave(&gpio_lock, flags);
>
> -       if (desc->name) {
> -               strncpy(info->name, desc->name, sizeof(info->name));
> -               info->name[sizeof(info->name) - 1] = '\0';
> -       } else {
> -               info->name[0] = '\0';
> -       }
> +       if (desc->name)
> +               strscpy(info->name, desc->name, sizeof(info->name));
>
> -       if (desc->label) {
> -               strncpy(info->consumer, desc->label, sizeof(info->consumer));
> -               info->consumer[sizeof(info->consumer) - 1] = '\0';
> -       } else {
> -               info->consumer[0] = '\0';
> -       }
> +       if (desc->label)
> +               strscpy(info->consumer, desc->label, sizeof(info->consumer));
>
>         /*
>          * Userspace only need to know that the kernel is using this GPIO so
> @@ -841,12 +834,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>
>                 memset(&chipinfo, 0, sizeof(chipinfo));
>
> -               strncpy(chipinfo.name, dev_name(&gdev->dev),
> +               strscpy(chipinfo.name, dev_name(&gdev->dev),
>                         sizeof(chipinfo.name));
> -               chipinfo.name[sizeof(chipinfo.name)-1] = '\0';
> -               strncpy(chipinfo.label, gdev->label,
> +               strscpy(chipinfo.label, gdev->label,
>                         sizeof(chipinfo.label));
> -               chipinfo.label[sizeof(chipinfo.label)-1] = '\0';
>                 chipinfo.lines = gdev->ngpio;
>                 if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
>                         return -EFAULT;
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
