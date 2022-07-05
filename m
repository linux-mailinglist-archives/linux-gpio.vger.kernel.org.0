Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C4C5665FA
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 11:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbiGEJUt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 05:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiGEJUs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 05:20:48 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D529C6566
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 02:20:47 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id c143so12211938ybf.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jul 2022 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6JIV7W11QgBgPs1EW6tkYKgrwr2bSpDGTJ9xExeHruY=;
        b=ZBy+gRsAQb4Pn/ha+/McmBMmlnuXxP9NugIb8a2STwByV7Tj+fPwU8uMRomzhXadcs
         DH61dfq5Ip57D1IWKnLRWqaV4tFapgwczO108tx94Tj8RF86uLrbooFWYfTztUy3c/zw
         XWQaNGwGqyZfdRFGffX7TXIqjSka/Ud/5zWUCrdrKH87FHE3PwgNgnE3PKlEQ2WVWG6b
         IkIaDiraaR3hL8jbj6LFSOe596Cl9NdCznJ/ENvBT1AVD09ay00kqa6xDAPqGeVDSGDr
         vNoYX5MyKRYxuC2/1Xeqrt8T7nfEGB5piSJJUgTBRRWGYGLVCaNvyMaJtTzrjEgCKVxz
         Rdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6JIV7W11QgBgPs1EW6tkYKgrwr2bSpDGTJ9xExeHruY=;
        b=K3jtolRmQAmCXNdfqYft3OaAP0KiHb9JQ3+XJAKEQ44YEuh+z0gqdkzySBHqhL1IsF
         cmpaTOvOFqwLfaxOEUtMVnfVSNbaRE2i9h6yb5K6K76bHHscaerFm5GnUXlMPzrrU2v4
         nyP4O8ffNsIjOu5ow0a+/8Nvnz7jYsqb//XjM9Ijaf1D7mk+o+FG69U5jWYUnoByU5PK
         7AmpfRRsXX4WyAwO6nTVkJxNd+NqBXve7Hr73T3bRgpjpb1U1JXXKYB4sfnWmOd1Ch6g
         KNAF0QlEBQG4vKzIv3dtqYIKzM7USjh5/MahBEGpDgHPzdkRKF0M2etv0jrWIEfw4gNM
         8Slg==
X-Gm-Message-State: AJIora8VCrazcUUsk3fYbDgL+yLHhrIKC+wKFLm4PJ/tkY9ok8Hlp7mA
        AAdI3SLNu2SHzPeHHbr2XnrylXQG7Dz4HsghCcU=
X-Google-Smtp-Source: AGRyM1vPrabd5Znwz5q9SPpD/itAJvwhlwUlHkY8Bpovdj8504qXzIpifYN7JPiwrOMA9nJHQl6oOcPJRckUUsIMwxQ=
X-Received: by 2002:a05:6902:154c:b0:66e:8254:146e with SMTP id
 r12-20020a056902154c00b0066e8254146emr591642ybu.570.1657012847107; Tue, 05
 Jul 2022 02:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <759f46a2-c376-17f3-30b5-ac2619e947e1@gmail.com>
In-Reply-To: <759f46a2-c376-17f3-30b5-ac2619e947e1@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 Jul 2022 11:20:10 +0200
Message-ID: <CAHp75VdSzQzCCZzpsRsdFCKx6jwJo5kBxwm+1DGjdh+NBebrcg@mail.gmail.com>
Subject: Re: Compilation failure in gpio-vf610.c
To:     Tariq Toukan <ttoukan.linux@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peng Fan <peng.fan@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
        Ran Rozenstein <ranro@nvidia.com>, gal@nvidia.com,
        Leon Romanovsky <leonro@nvidia.com>,
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

On Tue, Jul 5, 2022 at 9:01 AM Tariq Toukan <ttoukan.linux@gmail.com> wrote=
:

> Recently we started seeing the compilation error:
>
> drivers/gpio/gpio-vf610.c: In function =E2=80=98vf610_gpio_direction_inpu=
t=E2=80=99:
> drivers/gpio/gpio-vf610.c:120:9: error: implicit declaration of function
> =E2=80=98pinctrl_gpio_direction_input=E2=80=99; did you mean
> =E2=80=98vf610_gpio_direction_input=E2=80=99? [-Werror=3Dimplicit-functio=
n-declaration]
>    120 |  return pinctrl_gpio_direction_input(chip->base + gpio);
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |         vf610_gpio_direction_input
>
>
> Is it a known issue? Is there a fix we can cherry-pick?
>
> Offending patch:
>
> commit 30a35c07d9e9affaebd557c454df98e5ba269776
> Author: Peng Fan <peng.fan@nxp.com>
> Date:   Mon Apr 25 19:11:35 2022 +0800
>
>      gpio: vf610: drop the SOC_VF610 dependency for GPIO_VF610
>
>      i.MX7ULP, i.MX8 and i.MX9 use this driver, so drop
>      the SOC_VF610 dependcy to make the driver could be built
>      for i.MX platform.
>
>      Signed-off-by: Peng Fan <peng.fan@nxp.com>
>      Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> This seems to solve the issue.
> Is it the proper way for solving this?
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 23cddb265a0d..9db42f6a2043 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -19,6 +19,7 @@
>   #include <linux/of.h>
>   #include <linux/of_device.h>
>   #include <linux/of_irq.h>
> +#include <linux/pinctrl/consumer.h>
>
>   #define VF610_GPIO_PER_PORT            32

Missed header is an issue. The rule of thumb is to include headers we
are direct users of. Your fix is legit in my opinion. Can you submit a
formal patch with the Fixes tag added?


--=20
With Best Regards,
Andy Shevchenko
