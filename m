Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF8060325
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2019 11:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbfGEJeB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jul 2019 05:34:01 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33988 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728266AbfGEJeB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jul 2019 05:34:01 -0400
Received: by mail-oi1-f196.google.com with SMTP id l12so6750073oil.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2019 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k7JeaJZT9YLEJlXuKXiJcbNBJ0svwTrsoQVxCOdP3dc=;
        b=mpEnVSRnmeyi+d9CXxwfr5p0t/UtYdJ8mHFSB1cfOuZbfj98idtIUKu9MXbcplNKVm
         Mb5R7Wmsww3eqzijwq/psqqW3JWGMe3WRYcyQDusKrzaKjotLc/mXzF7sSq/HeMz751a
         mgKUnUsKzIRJfTnMY3LKNeSUUjr6kyHsPFP3uL7+QPKuhWDonVt3mQk2sM7Ma4nH3g6o
         CmEkCHrxBn5WM7nvbNXYn8sfPsEY49vZ6+BMTnmOL4ShhnMTfeU584fxtXeBHU5ck1/O
         4xH/B0kknxH/8HHXnb3kqFSSmbuIakpGcyEa7crP9P+SiqcXM+By/0bDicdQOKYNtuup
         EjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k7JeaJZT9YLEJlXuKXiJcbNBJ0svwTrsoQVxCOdP3dc=;
        b=ujAqWgJUR4dsLl6ClVC5CQOFkFts8Zvj80FTYJ0/454aWaFLHU3OXnxbT/2AsZN8ru
         60zrRtU5zZdk2opMeWKHaSzvCZO1e+4437mN0d6nAN970U2DsdbdKZBe8HRTi9twDDow
         En32s7Sj7EYEYlMbOV/BxpugfJuOuU3QOlz7o3xbT8ovkEtf9z4rj2jsVQ91Qx2jExGw
         z9JCu8J5F027S2EVWPVcyETPMt8TGjNug/XB746cGDNoFI0W4O6BdP5lH8dvWth+QhfJ
         kPC8C8uG7uXlKQTNxEmK25SQbCcvOjFcKTO/k5QxIHEBRE822fEq6E5iaXXKSL5RlbCg
         9QCQ==
X-Gm-Message-State: APjAAAUzeybt7WS/b16hSwVjtC6egx1EvOXeXiCGlzc4WHgpUpqjNtsE
        MB5Dik14GSWgeslOE42j5vQRyofJMhy2mjn/QiEf4g==
X-Google-Smtp-Source: APXvYqxqzTa/ARUTZ5WSojLnyWSxsdX9n6tGNrUqj5cuuqMryH0l/dHnjFBS3EoEGSLjPcrj4i0sVSlI+tSZEvL0CxU=
X-Received: by 2002:aca:b58b:: with SMTP id e133mr1432573oif.147.1562319240426;
 Fri, 05 Jul 2019 02:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190704153803.12739-1-bigeasy@linutronix.de> <20190704153803.12739-8-bigeasy@linutronix.de>
In-Reply-To: <20190704153803.12739-8-bigeasy@linutronix.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 5 Jul 2019 11:33:49 +0200
Message-ID: <CAMpxmJXZy6S8OLb9iD6zfoFHnhZT4Nc0baxR1hH8YgphaEFOOw@mail.gmail.com>
Subject: Re: [PATCH 7/7] gpiolib: Use spinlock_t instead of struct spinlock
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 4 lip 2019 o 17:38 Sebastian Andrzej Siewior
<bigeasy@linutronix.de> napisa=C5=82(a):
>
> For spinlocks the type spinlock_t should be used instead of "struct
> spinlock".
>
> Use spinlock_t for spinlock's definition.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/gpio/gpiolib.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 7a65dad43932c..7c52c2442173e 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -210,7 +210,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_=
sleep,
>                                   struct gpio_array *array_info,
>                                   unsigned long *value_bitmap);
>
> -extern struct spinlock gpio_lock;
> +extern spinlock_t gpio_lock;
>  extern struct list_head gpio_devices;
>
>  struct gpio_desc {
> --
> 2.20.1
>

Thanks for spotting that!

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
