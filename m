Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5DB566806
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 12:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbiGEKb5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 06:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbiGEKb4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 06:31:56 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9BE14D21
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 03:31:54 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-31c9b70c382so41688557b3.6
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jul 2022 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7VsJyHIDMj+7ohPJhI9Tfzd2eFr1mAJuWY/0l18eOeY=;
        b=dTRYmH82hjBBEXI+kC27bE4zYkKVwz7ewyGof1xbMN/qaivHEEopyPVsDgo/PsmP5F
         1cgE/e9N0JlVdB9DEYEFJNrndk0rr96Hl2S9yByHt2qXcW5ehYFEtjiU5F1CJAbh5uU8
         nuAji0qfF6PmQKUVj16bK/7pd7McBBrmLsvk3Lnid4v9I4+nv5XLto7+goYWwO7pHHdK
         bKxOlJHCC9zp4sBSSmDXedWAAF7B/TcvngE3KLk4u7QJau9wnLBj9XUQWOwEXSDtRIxt
         UpyiWLvIzuwloCdavNPOIKhsvfZCcA4IY2VkIjazz6T1ylwDbhfi5+Kpexy6lnRCagwk
         5A3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7VsJyHIDMj+7ohPJhI9Tfzd2eFr1mAJuWY/0l18eOeY=;
        b=RAhueJRp3kFJQKO6PX5anWEfhAm5o8IIJUuBaWrjzOn9TNOtHPVEKMngX9XV8pfzV+
         nMvTZWR/fwvbSjS2m0hJgrnOi/pUAGcon+P/akBTDLDcoTMdVjeXbqGEFnP+0FSQ6TJJ
         3pOwOkF7IGa/pMNxfnwLZf67slj7GKD2s+7KITbIVb8j7E7RWcTknfmp+AhUybDTJyGU
         aBRf3LS9FeDjBoIn75ycuDtcoFHA/bV/gOGIkVjb7iQ7iUTAN7U8UPnTfMCXuwJcxZGC
         qlQs/Hy+XvWSxEu5cZrP6TwVKaKAAYpkyKsxo+DZhfRGWDSgHPlpJWp2AfP+XtyxbV80
         nUdQ==
X-Gm-Message-State: AJIora+9SSJ0b9nfG5VX2sW25zLOUy22VtJOqHsArdpAb8sdCXYEkEJL
        +FOnI23/XiSIvoe1mJ2AOGyoU4Yy8CRdc9yhgT3MB/8IOLQVqA==
X-Google-Smtp-Source: AGRyM1sozxuWzrsRSsutDFTZrJBsCIORWsqw5hmxwCs3W24oppFeArRmmj2vg60aNWz739i/e3AcC5mOJyHSoHB1n/0=
X-Received: by 2002:a81:8397:0:b0:31c:8a02:3f6d with SMTP id
 t145-20020a818397000000b0031c8a023f6dmr14287547ywf.486.1657017113915; Tue, 05
 Jul 2022 03:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220705102114.2067-1-tariqt@nvidia.com>
In-Reply-To: <20220705102114.2067-1-tariqt@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 Jul 2022 12:31:17 +0200
Message-ID: <CAHp75Vdkfz9JSnEjaUAxMfVSQGP+eb04U1Nw3G7_8mRMN9SLWQ@mail.gmail.com>
Subject: Re: [PATCH gpio] gpio: vf610: fix compilation error
To:     Tariq Toukan <tariqt@nvidia.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peng Fan <peng.fan@nxp.com>, Ran Rozenstein <ranro@nvidia.com>,
        gal@nvidia.com, Leon Romanovsky <leonro@nvidia.com>,
        Saeed Mahameed <saeedm@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 5, 2022 at 12:21 PM Tariq Toukan <tariqt@nvidia.com> wrote:
>
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Fix compilation error by explicitly adding the missing include.
>
> drivers/gpio/gpio-vf610.c: In function =E2=80=98vf610_gpio_direction_inpu=
t=E2=80=99:
> drivers/gpio/gpio-vf610.c:120:9: error: implicit declaration of function =
=E2=80=98pinctrl_gpio_direction_input=E2=80=99; did you mean =E2=80=98vf610=
_gpio_direction_input=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>   120 |  return pinctrl_gpio_direction_input(chip->base + gpio);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |         vf610_gpio_direction_input


Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Fixes: 30a35c07d9e9 ("gpio: vf610: drop the SOC_VF610 dependency for GPIO=
_VF610")
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
> ---
>  drivers/gpio/gpio-vf610.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 23cddb265a0d..9db42f6a2043 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -19,6 +19,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
> +#include <linux/pinctrl/consumer.h>
>
>  #define VF610_GPIO_PER_PORT            32
>
> --
> 2.21.0
>


--=20
With Best Regards,
Andy Shevchenko
