Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83EEFEAADF
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 08:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfJaHLY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 03:11:24 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33602 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbfJaHLX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 03:11:23 -0400
Received: by mail-oi1-f196.google.com with SMTP id m193so4322141oig.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vOyipCkLNyKv1wkKn28aQiJoCa88470RoCvsSLV/CPw=;
        b=oI7yT3zkF3Vkah9qV6E5S6w0HfXhlH3SYuV+5KYWZaRoz2L+Bmpm7ZFaqpPcCOFBy3
         gMJDmqT7LnYScMEiHMNF83ATt9TXIaG+sF5bSAJcRnFZT1GVl7q5Ra2JaQNF6Wc28VuL
         4JAAjnK6/MzutN0xjGSIYCNoQLFnEbWvR5tO4uDCh5g6/Ovvwma4i6rF6FVCkswNfY0m
         ry6jd7vEfpYfC7chfouU9jZ3umSQlLDG2REqJcSS/CfA4cLYVRxidydA4+SKmrha3Lgj
         nFdmpDQ2rinKJB0I6xeg+VDt+Z4rEaBkdGZwKHsh5vfiD3p+DGv8ulukrX/lmYdz8hzx
         1n8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vOyipCkLNyKv1wkKn28aQiJoCa88470RoCvsSLV/CPw=;
        b=klkPA+UBgU/r3BLq4ncN5Dagsi1wui2r4VVQpMd2zxLNm5uj07IEfkTnPgYwjWjgCJ
         qDcl91W/k3ushpSMZgfx5LAbiMGa4zUf++kmy9Ne1GkFOp+FJiozKtrqxFZO4D8gYT20
         yhsG1mSoUYSXywcqcdDUaDf1c8M4y6z4Jtp5bhKYK6uX9+X48UAa2F67YJ8DkisEBiFm
         SowU65lQ3hgdo4463g0L/ViNvr6OfKC3Re/xlRuMkVvjm+Ufz/QAFEzgrCnZPWhDOg6L
         kdsJF1ydpdbOvqj2AxPRticS7DhzxZwyYY3i7oZz1gvLcXSrx/qTEwdWZ8EpRVdozwOp
         Qsqg==
X-Gm-Message-State: APjAAAU1RKDgV88P5f6hbvStGOYu+3+o0kWc4xhSbgrRoQ1gs9HaJVyQ
        JKNmP53Ct1C1HayJfEEYQEJQ1okSZU0EvJ6Ib+HI5A==
X-Google-Smtp-Source: APXvYqxXV3R/Zi4kFrooN+hpXbYh2o3RSms9mH9Gj12I+kbq7RJ/M7P2L4mNNgnkyddh15kOxKMra+IHjVZ1C6wE1fM=
X-Received: by 2002:aca:b757:: with SMTP id h84mr2865688oif.175.1572505882857;
 Thu, 31 Oct 2019 00:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191028073713.25664-1-warthog618@gmail.com> <20191028073713.25664-3-warthog618@gmail.com>
In-Reply-To: <20191028073713.25664-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 31 Oct 2019 08:11:12 +0100
Message-ID: <CAMpxmJXMS6PG3EH_SQmYUBvQ4uB4zMtkaFCRfCEkiAQTYLYUhA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] gpiolib: add support for pull up/down to lineevent_create
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>, drew@pdp7.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 28 pa=C5=BA 2019 o 08:38 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> Add support for pull up/down to lineevent_create.
> Use cases include receiving asynchronous presses from a
> push button without an external pull up/down.
>
> Also restrict the application of bias to lines
> explicitly requested as inputs to prevent bias being applied
> to as-is line requests.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e80e689be2cc..7dfbb3676ee0 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -554,6 +554,12 @@ static int linehandle_create(struct gpio_device *gde=
v, void __user *ip)
>              (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
>                 return -EINVAL;
>
> +       /* PULL_UP and PULL_DOWN flags only make sense for input mode. */
> +       if (!(lflags & GPIOHANDLE_REQUEST_INPUT) &&
> +           ((lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP) ||
> +            (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)))
> +               return -EINVAL;
> +

This is not part of this patch - this must go into 1/5.

Bart

>         lh =3D kzalloc(sizeof(*lh), GFP_KERNEL);
>         if (!lh)
>                 return -ENOMEM;
> @@ -944,6 +950,10 @@ static int lineevent_create(struct gpio_device *gdev=
, void __user *ip)
>
>         if (lflags & GPIOHANDLE_REQUEST_ACTIVE_LOW)
>                 set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> +       if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_DOWN)
> +               set_bit(FLAG_PULL_DOWN, &desc->flags);
> +       if (lflags & GPIOHANDLE_REQUEST_BIAS_PULL_UP)
> +               set_bit(FLAG_PULL_UP, &desc->flags);
>

Bart.


>         ret =3D gpiod_direction_input(desc);
>         if (ret)
> --
> 2.23.0
>
