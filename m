Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE4976EB4D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 15:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235645AbjHCN5F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 09:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbjHCN5E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 09:57:04 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD6810EA
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 06:57:02 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-794c5f60479so308646241.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691071021; x=1691675821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFwxIoqXrz8hyZQ07M+1DVvVfKY3uaBgIwn9qkHTGHo=;
        b=VrPLzWseD/llgCu1q1EDw6jhqM+xy5PdQKY7b4kreo7IAX7U6LrGAdDK5UNjlLLgOu
         mIw5QoxmdjaLfrS3E3Y1YaV5fqsEKBmgiOxVlp+kjSFVPqQK1OV4k/sYDdJXC6+njEE3
         CVGsKf4dwYK2OtnKiGmibl0THE0C6pSf25Daw/HR0gfAg8RnqKSk3XiVZgBTspwPl64G
         NVl/CnXaBmp4kBjFsCuN5fVXYys/C3rvvpfjxyJ2mSy3zqi7CeyBhFoIB1HKJqVREdWJ
         dBEiGcZLVImyBur/dpZpPLbzQWuDRA+qPiHqtjW4RAOz7ROkvw14hAKp/LTY1zmeHItm
         kBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071021; x=1691675821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFwxIoqXrz8hyZQ07M+1DVvVfKY3uaBgIwn9qkHTGHo=;
        b=hduBvuBBmUY/ADrW9X6CRUmQv3O2P40e5/32aZsE5X8k0kF8UIP6kPB9uvLTW9Z3iu
         Sd8R+dcyCqevR7AD8sRzv4taoA4zhHiA3xIncB5kUEjRqoHjehQVqJ8ILsBQ8HWoKhAm
         W6eW49bKnIrgqRzcppD+sMQUIHOnPAibya6wNadBTyXxIb6sShHuW+s+IrTETzqv3Qu+
         /pAlmixV3ePYDvcYMXqT3flcUSh5CqTOOYjNP4stwv/i1togmy2VXYOyHE6vS1odsXR2
         tr+N9HQyAEEbC71K79gzFaxqmv0aO4Vst8+AOudkJaTLszrSFNrrCMn6WaxVsdurDRWn
         Dl/w==
X-Gm-Message-State: ABy/qLYkZ1SgfUl6wIRn4/VUBm153G9H2hK9tVBdcflEbLf9mWppE+8n
        FJVMVooVZIiD5VKNjCwTMjmcnE1Y7jkaOY6oa6mnSg==
X-Google-Smtp-Source: APBJJlEiNGXVVTLCfoynD/9ovBkXBFLzQV3ZQJWq3u6JWM9FYbJOzJ+KQsSdbyalWxAkh6uribalClhYccM9FG7GX8Y=
X-Received: by 2002:a67:e2d7:0:b0:443:8034:be4b with SMTP id
 i23-20020a67e2d7000000b004438034be4bmr4360015vsm.35.1691071021385; Thu, 03
 Aug 2023 06:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230803022056.1633-1-wangzhu9@huawei.com>
In-Reply-To: <20230803022056.1633-1-wangzhu9@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 15:56:50 +0200
Message-ID: <CAMRc=MerwqoMJ8XwA15jMxa6USu+b7vX85teMPxLy1NtddVSJQ@mail.gmail.com>
Subject: Re: [PATCH -next v3] gpio: max732x: remove redundant CONFIG_OF and of_match_ptr()
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     linus.walleij@linaro.org, andy@kernel.org,
        linux-gpio@vger.kernel.org, andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 3, 2023 at 4:21=E2=80=AFAM Zhu Wang <wangzhu9@huawei.com> wrote=
:
>
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr() here. We remove both CONFIG_OF and of_match_ptr() here.
>
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it.
>
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ---
> Changes in v2:
> - Change of_match_ptr to of_match_ptr() in the commit message.
> - Drop of.h which is not needed anymore.
>
> ---
> Changes in v3:
> - Drop the extra blank line below the #include statement.
> ---
>  drivers/gpio/gpio-max732x.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> index fca9ca68e387..49d362907bc7 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -18,8 +18,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/i2c.h>
>  #include <linux/platform_data/max732x.h>
> -#include <linux/of.h>
> -
>
>  /*
>   * Each port of MAX732x (including MAX7319) falls into one of the
> @@ -114,7 +112,6 @@ static const struct i2c_device_id max732x_id[] =3D {
>  };
>  MODULE_DEVICE_TABLE(i2c, max732x_id);
>
> -#ifdef CONFIG_OF
>  static const struct of_device_id max732x_of_table[] =3D {
>         { .compatible =3D "maxim,max7319" },
>         { .compatible =3D "maxim,max7320" },
> @@ -128,7 +125,6 @@ static const struct of_device_id max732x_of_table[] =
=3D {
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, max732x_of_table);
> -#endif
>
>  struct max732x_chip {
>         struct gpio_chip gpio_chip;
> @@ -709,7 +705,7 @@ static int max732x_probe(struct i2c_client *client)
>  static struct i2c_driver max732x_driver =3D {
>         .driver =3D {
>                 .name           =3D "max732x",
> -               .of_match_table =3D of_match_ptr(max732x_of_table),
> +               .of_match_table =3D max732x_of_table,
>         },
>         .probe          =3D max732x_probe,
>         .id_table       =3D max732x_id,
> --
> 2.17.1
>

Applied, thanks!

Bart
