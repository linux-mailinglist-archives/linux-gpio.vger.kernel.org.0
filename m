Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE68D7780E1
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 20:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbjHJS6C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 14:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235542AbjHJS6C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 14:58:02 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F672703
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 11:58:01 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-447684c4283so508003137.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 11:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691693880; x=1692298680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBcaDmG9GElDKvgYP5g9p26P5cd3rS64+1fSo4sJGek=;
        b=TfvuXCv84DE36Y3AcXMMOxwZIJYcdF2L9ZvPiHq3yL1AuucKV8kZ7eeWPnD9TX6QHq
         u/ud3nNogsJDs+CgOvCBsohN9gJ5oZOCJttF2caAAatFcKvs7Na/9ex1pdZG3cMbfGoP
         reZuJDeQtvHLrO8eWou2t/T7DUM6aQY7i8rnhvCU/PWT2m3VkCvoHQHz20YsHAgQU3t6
         WbdxZKjHHXmK0CzV6W/MeUaNs3aDoBKBnUn6rFUKhze/kyEKtfyoOmQfhtvt4aLvhtN8
         Pc0sWYxXTRuD/5dp8PCAUXVhL8OGKvuvAe0wdN30yw9YSGmL3+daMoyC2Wbfabv5VuJr
         H+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691693880; x=1692298680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBcaDmG9GElDKvgYP5g9p26P5cd3rS64+1fSo4sJGek=;
        b=CUaQ+d773lweuM5/NG8WBRL5j6k4dcWB8lBiNhMyfX2Xppbh9WOOS2WZh7qFOQg+Dz
         6+99BmO/O8PzHmktpWrkvTqxPkm8Dt20oDdPwsQOiRilUEn4StrK1A1lh9EwXsqZjQ4L
         jp3uRAQ4C7F7/fj0yK2jodGKCknrMB7ykFCcUUVzDfXNdgAlO4NGg3cSatxCc/JHgHLE
         BMmnKQfeTN7lrw9gm5DkyT4V008reHo7VWULjLVDrv21po+fCFilaIGe53SyplGPyfsC
         NkTgssiciAoAdNNBfkUlk1OufMBJzFrWryHOzxUixAVxd0XD0Cjw7cuVVVAd0qCfeMDz
         z1PA==
X-Gm-Message-State: AOJu0YxEXXd6XmDeuDTA29v8ykuTRfHEm2WQwCDCy9x6L0qXU7erT8dZ
        PZwrTH9XbBypWzLoHTuEMyUYahRvPFcPBWViDTVu7A==
X-Google-Smtp-Source: AGHT+IFJhRABTcEYer5K3yzhPqNC5GRRHdRjrjdNp4zC6Di1sUyCRO4O0Fdx+dNuDxhAyEAnpvjPaF6E4h+ntu8JIjE=
X-Received: by 2002:a67:b401:0:b0:445:23e7:767f with SMTP id
 x1-20020a67b401000000b0044523e7767fmr2437188vsl.28.1691693880661; Thu, 10 Aug
 2023 11:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230810184846.22144-1-brgl@bgdev.pl>
In-Reply-To: <20230810184846.22144-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 10 Aug 2023 20:57:49 +0200
Message-ID: <CAMRc=Mf8g0JV0QQgpiTS2i+y68NVW-97vOMt+0389++wB1swqw@mail.gmail.com>
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
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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

I forgot to pick up Linus' tag. I'll do it when applying. I should
really start using b4...

Bart

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
