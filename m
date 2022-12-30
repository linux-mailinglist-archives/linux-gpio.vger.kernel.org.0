Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C581659770
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Dec 2022 11:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbiL3Kq5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Dec 2022 05:46:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiL3Kq4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2022 05:46:56 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 992171A069
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 02:46:54 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id m129so15094203vsc.11
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2022 02:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUYOOZ8LBLwFtX+7EAzxDq6pVogaDhHX3H7JwAK0omo=;
        b=rePMrUbzSxd+LrNEreI3Srr5ZOS+dZ163dMWxcm6nXj+QFgy0xw5f6XsS3QrP+BDGB
         lGyaCx3i3YYrFF/im19OG5k6oD6HrX1w0n0Smb5h4Q0/qEkhyuhCG/yOxAHZWLkjvkTq
         u6u7cbcoaI+nsabgTCvcgO8hn04Vx644360gs0Vln8055xBy/+HLx59mldD5WpplHm2d
         ngI3J4/urs1GKD2yXZzvRHBQu4vxvWCD4G9JoHW/JHicqAiV8+EIUxSegHzKEvWWGqE0
         XSG+fzMDPAcwqMnqxgkDyHNmt33m3/J/CzSYBV/dbmskEtRkQ6X/hq4VbAxT1kZ2vyKZ
         5Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUYOOZ8LBLwFtX+7EAzxDq6pVogaDhHX3H7JwAK0omo=;
        b=ilgLlKF1ibrpTBYdbiqnKZI1qCLCcqnlupwRMLLRMtMyyi68Oq0Mi/USnEM/E+2Kdw
         SsvEkX0yAJaikD/4vgJIrI+o1sehc0CusjvJkdL3OuWfT/wem0Cz+4uCeYRIOLTbooZT
         oXwQwKqgfi1rFL8Gfx3YtwjxbgK409O47+n0j4QwnB0OG8qOu/ROHh8lwTJgLTXVF0en
         8o2MEOJWHSmVqUvSDP03v30GnZpolyViqClRX2Vdw5br+cHzd0pKoFnDdoTmjLrC7mFS
         iuLT0HkYgQDhevsx2+GQDHxal24sGSzGqBtsA+Twmv8pm6bmSNTBGK2E+6gOSQQPktwy
         BTKA==
X-Gm-Message-State: AFqh2kpFG/FIv6nQe5+iFlMyR7KGE//JSXa2cMqrHLTyZT90dZCsovQN
        moj+SP82fpNYShatTkUNgOqvrpfRCnNBgVHZwhyPlg==
X-Google-Smtp-Source: AMrXdXsqoDOW+wG+9TepdlFGvE4UXo8vgs37MjARmdX+yAgu+H3RiNfeloDdzXO9w1SYtuuOvw7SojnhlmXHggIrFzY=
X-Received: by 2002:a67:f642:0:b0:3c4:ec4b:b943 with SMTP id
 u2-20020a67f642000000b003c4ec4bb943mr3151994vso.17.1672397213774; Fri, 30 Dec
 2022 02:46:53 -0800 (PST)
MIME-Version: 1.0
References: <20221212220457.3777685-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221212220457.3777685-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Dec 2022 11:46:42 +0100
Message-ID: <CAMRc=McOG5ozAPayO1o8nknEqLo3HMYX8kRhGmMoOWYFxDiuKg@mail.gmail.com>
Subject: Re: [PATCH] gpio: msc313: Drop empty platform remove function
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
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

On Mon, Dec 12, 2022 at 11:05 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-msc313.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
> index 52d7b8d99170..b0773e5652fa 100644
> --- a/drivers/gpio/gpio-msc313.c
> +++ b/drivers/gpio/gpio-msc313.c
> @@ -655,11 +655,6 @@ static int msc313_gpio_probe(struct platform_device =
*pdev)
>         return devm_gpiochip_add_data(dev, gpiochip, gpio);
>  }
>
> -static int msc313_gpio_remove(struct platform_device *pdev)
> -{
> -       return 0;
> -}
> -
>  static const struct of_device_id msc313_gpio_of_match[] =3D {
>  #ifdef CONFIG_MACH_INFINITY
>         {
> @@ -710,6 +705,5 @@ static struct platform_driver msc313_gpio_driver =3D =
{
>                 .pm =3D &msc313_gpio_ops,
>         },
>         .probe =3D msc313_gpio_probe,
> -       .remove =3D msc313_gpio_remove,
>  };
>  builtin_platform_driver(msc313_gpio_driver);
>
> base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
> --
> 2.38.1
>

Applied, thanks!

Bartosz
