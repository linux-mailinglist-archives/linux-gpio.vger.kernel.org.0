Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 224FF76EBB4
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 16:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbjHCOCw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 10:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236658AbjHCOCY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 10:02:24 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05A546B1
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 07:01:12 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-4866429924eso243890e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691071268; x=1691676068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mw3Mjb3AYwoDn7i7eLYMusW+775P9z2MeKOWgxLH+DQ=;
        b=goLo5FqPcsCmHUx6FLyzrE4KX/8ia+sAalwo++sIpMcPI42JYtJ0EeDbRIjHXBr9m/
         TvV05jciQw9vUsJ6lgoEVtRWFsANLTVLS2wGRAh+g1DzZly5YdV9D6ifDbOFqNAhBxf/
         dYAOLnSuINbdkQwa4bzJUrgdW8jEfiAI6WwiUTqWeOppb0AO5tV+lFK1jLxlHI0RiTz6
         DkVe5vlFXAQZ3NpcKQZ1GebN+3vMKFzxWpprKD3dct+d1hCcGkV+hC/N+ucM3E0CBcL3
         69TgAHj0e2HpQGGIscUylSCv7jFBYqXIEG5wOsEsMyeoIlzG9Rh/9+lX8X9iEdwV4xyz
         tvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071268; x=1691676068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mw3Mjb3AYwoDn7i7eLYMusW+775P9z2MeKOWgxLH+DQ=;
        b=b9uIZvpqyBDaicZDvpdTQ0UYm4xNatAz7QaVigzkF/338z0Mqz9Wa0LB57las4P0UU
         kiOfQvpXRNE0qIRcliJ/QSiqb3695XiyQS4W4hUOp8UWeXWEhKt+gysf/JublCZqq7oX
         9BETNqaSxTbbjoqi2JuS+VDq78PUN/lIALycswuXdquR9PJn2fdboSKLZuSA3RUo55VR
         f0aDVAzGbRb6Njnl9WLJTS2fyePs1RyGlELyeAsKFysl2GxHx2DsczVAS6AfoK4CkAug
         Gz7APjPzjzV4rXr8OFpvWnUgZov6xhd1vpF/4QReQWkAKOkReCFW7rGkJQJMdMWhtIuU
         nuxQ==
X-Gm-Message-State: ABy/qLZqlailts/6tE61Sdwx3GZb5yopARE9JMuBpUUbirweEstJrFuI
        Qytw6UqoM65yCaBxv64lkHyW6PzwKUyH9N4g/gVVLQ==
X-Google-Smtp-Source: APBJJlFcZZ+OBglPTMCfQyMix/S9KE9fNVDNqrTsAZXbYHUJYPJBDMcNj5hGnA0Oqt0AUTw4nmtL8JlbWoffhuQTlhA=
X-Received: by 2002:a1f:45c3:0:b0:486:4a16:63c6 with SMTP id
 s186-20020a1f45c3000000b004864a1663c6mr4621915vka.15.1691071268669; Thu, 03
 Aug 2023 07:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230802025431.213752-1-wangzhu9@huawei.com>
In-Reply-To: <20230802025431.213752-1-wangzhu9@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 16:00:57 +0200
Message-ID: <CAMRc=McH4cAGcBujkQEi92+_n2Xt7DVY9NzO2rRDW+kH+aZBcg@mail.gmail.com>
Subject: Re: [PATCH -next v2] gpio: clps711x: remove redundant of_match_ptr()
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     linus.walleij@linaro.org, andy@kernel.org, shc_work@mail.ru,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        andriy.shevchenko@linux.intel.com
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

On Wed, Aug 2, 2023 at 4:55=E2=80=AFAM Zhu Wang <wangzhu9@huawei.com> wrote=
:
>
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr() here.
>
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr().
>
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ---
> Changes in v2:
> - Change of_match_ptr to of_match_ptr() in the commit message.
> - Drop __maybe_unused.
> ---
>  drivers/gpio/gpio-clps711x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-clps711x.c b/drivers/gpio/gpio-clps711x.c
> index 75f6f8d4323e..d69a24dd4828 100644
> --- a/drivers/gpio/gpio-clps711x.c
> +++ b/drivers/gpio/gpio-clps711x.c
> @@ -67,7 +67,7 @@ static int clps711x_gpio_probe(struct platform_device *=
pdev)
>         return devm_gpiochip_add_data(&pdev->dev, gc, NULL);
>  }
>
> -static const struct of_device_id __maybe_unused clps711x_gpio_ids[] =3D =
{
> +static const struct of_device_id clps711x_gpio_ids[] =3D {
>         { .compatible =3D "cirrus,ep7209-gpio" },
>         { }
>  };
> @@ -76,7 +76,7 @@ MODULE_DEVICE_TABLE(of, clps711x_gpio_ids);
>  static struct platform_driver clps711x_gpio_driver =3D {
>         .driver =3D {
>                 .name           =3D "clps711x-gpio",
> -               .of_match_table =3D of_match_ptr(clps711x_gpio_ids),
> +               .of_match_table =3D clps711x_gpio_ids,
>         },
>         .probe  =3D clps711x_gpio_probe,
>  };
> --
> 2.17.1
>

Applied, thanks!

Bart
