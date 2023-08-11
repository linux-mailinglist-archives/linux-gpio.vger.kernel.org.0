Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED771778E68
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Aug 2023 13:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236247AbjHKL5U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Aug 2023 07:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235975AbjHKL5R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Aug 2023 07:57:17 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690F03580
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 04:57:15 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-79a31d66002so609497241.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Aug 2023 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691755034; x=1692359834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fwd/GQaC5Var2VRAIYUUNIOAcVCAPS6jdx6HEHhIjcY=;
        b=Brd8oVXG1yHwigSlT4kv+EMSbguhXvboqzLE7ncaOnEpxbR9cJqg2EZSkA/GvDdHLj
         MidfJcuJvgGDQKyg6fx4MTw3zj09XzSaTjZk/fwODibCS3/AFpjgaAyR+yCVx4x/mHrp
         hSHRVNbom1ncvwC0reF3Y6U6L4nuWiKxEGHPIUrlaX+xfTeCmVImxopmz/f3uwOnvuNz
         lCXndhDA4ciTxvLZpoc7nlq4uH/TPweQxPDVWKn2gM37YGPoBJ4yUYO60cn8UktLoYgq
         n55AeNTMgIXRdF09L4ZPaUfs9MahczMYwENwtBC41Wt80JRTKlDhghh4AmspgS5gI3BO
         +TKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691755034; x=1692359834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fwd/GQaC5Var2VRAIYUUNIOAcVCAPS6jdx6HEHhIjcY=;
        b=Bf3PKlgWB0KaYgphp70QbPYH4Ed2TnYsJeykGP2JcBikhhPLm801ih+n+i+fcNSlum
         wNsosk09FG8jcwb8yOK9mDVJ6OGUTzB8eIAENoxJ2sFQqNRZU37dUo7afExmOagEYo2f
         KiJ0AB38IXq6fyWE5qIU3u1xHYVGyAJKoPL02zniols6b4Vq+aAv3lm0VU4iipO0iaYp
         bbNo8MZrfE9D+8NC9VTLHrlSYBFUEfbX+luaTMBqyM1rRHemuYwFDQOIeuOx/anR0x0o
         KD4hBKe7miN86gYl1KZf7Tk/nt5ABCw8f1hAanE+BSNIy+eyom2eQ/cuQfo6BYcviE4a
         0BfA==
X-Gm-Message-State: AOJu0Yzk3cQrPlI8Yyo+4646XojtdV74pW6RzjETp7TbXBbg32QN554S
        +Jdp+kTGcqh8p218lNS1bdALU6GwPSswKunkm4Bvzg==
X-Google-Smtp-Source: AGHT+IEIKMN6wZE6v8RZjzlZTGlau0HLXsoO9zD0l9PA87cP0lwE4EYGwQ/psNRx+5R/UicyQ3W4mLFeF/7bWPyXewo=
X-Received: by 2002:a67:f753:0:b0:443:6457:101 with SMTP id
 w19-20020a67f753000000b0044364570101mr1311370vso.7.1691755034555; Fri, 11 Aug
 2023 04:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230810184846.22144-1-brgl@bgdev.pl>
In-Reply-To: <20230810184846.22144-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 11 Aug 2023 13:57:03 +0200
Message-ID: <CAMRc=MdOFpyz8u6xnPtB7+Q0qzq_JqZwaS3=yACAEJzLh60r-g@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: fix reference leaks when removing GPIO chips
 still in use
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 10, 2023 at 8:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> After we remove a GPIO chip that still has some requested descriptors,
> gpiod_free_commit() will fail and we will never put the references to the
> GPIO device and the owning module in gpiod_free().
>
> Rework this function to:
> - not warn on desc =3D=3D NULL as this is a use-case on which most free
>   functions silently return
> - put the references to desc->gdev and desc->gdev->owner unconditionally
>   so that the release callback actually gets called when the remaining
>   references are dropped by external GPIO users
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> v1 -> v2:
> - add a comment about why we can't use VALIDATE_DESC_VOID()
>
>  drivers/gpio/gpiolib.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 251c875b5c34..2158067c4fd2 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2167,12 +2167,18 @@ static bool gpiod_free_commit(struct gpio_desc *d=
esc)
>
>  void gpiod_free(struct gpio_desc *desc)
>  {
> -       if (desc && desc->gdev && gpiod_free_commit(desc)) {
> -               module_put(desc->gdev->owner);
> -               gpio_device_put(desc->gdev);
> -       } else {
> +       /*
> +        * We must not use VALIDATE_DESC_VOID() as the underlying gdev->c=
hip
> +        * may already be NULL but we still want to put the references.
> +        */
> +       if (!desc)
> +               return;
> +
> +       if (!gpiod_free_commit(desc))
>                 WARN_ON(extra_checks);
> -       }
> +
> +       gpio_device_put(desc->gdev);
> +       module_put(desc->gdev->owner);
>  }
>
>  /**
> --
> 2.39.2
>

Queued for fixes.

Bartosz
