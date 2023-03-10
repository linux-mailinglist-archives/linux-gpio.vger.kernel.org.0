Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 772236B4B52
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Mar 2023 16:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbjCJPlo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Mar 2023 10:41:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbjCJPlY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2023 10:41:24 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D4020054
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 07:28:16 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id v48so3747026uad.6
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2023 07:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678462094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE8oKgAfKxMJqHJj3SLWLDD7fxQDQxShPcAFSDzkcdg=;
        b=7tFn7dlaCMSGtEmJH0lZ1Q1S6tbzEszDw8nGWbm2vst1EYH/Jq4MIuEaa38hyxfSbw
         xJ5z/5u2Tu0IVeJBbVvWPDhPA1rvHduZttpbw3pnRsx0HVZhV9hHlqIJF7GosxFQfh7Q
         2CXEg7Fb0EAox+o4uKJihWkmVX3Q+hZcNEfzi8Ai6P3w//1Hbym3/zjlYfHt9gE+hyS2
         AS4j8IvyR4JfE3wXbZdxclle0yc4QUjhwAtkdDv5Rm6a7ublziaSXpbKvlSgn9t4duIZ
         an/eI45s0fOqwjqsBkZN83ZPOZGkBHwKixp7I/aOp9qfbktSTVs0NnEP72Jm51S0U7fs
         tO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678462094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cE8oKgAfKxMJqHJj3SLWLDD7fxQDQxShPcAFSDzkcdg=;
        b=w6ACrJmOZXrm6+gN7IvWKKj33FDB5dmB3SXRyzXobtzkZMpeS9iiHOJVoJDjMkY4Sk
         zdw9kt7KFHyrJ0po0pD4UWtwqePdb6k7DZ6jtL4jM+Ci9b/gov25Gp5R5V0ww0VEX2CE
         VyloZnm7KhDAqcJdRsX6myaUebbZQw5oTks7e7SI5SqJC8VeiwgZ1dkiwiLahBQZFOuh
         eUH1v8KgWmB/Jc9QUTbUk/eDd9Ci5s6DbtA1p9LCo2uNSVj04kt7ZQW4eeJq3Xds4CyB
         AgOwimIAyPdEuo1HXUXSKLKKhK6FDCIhWJzKsLb9/CubB6jZwIMqosV2gH2eg0VgBzRd
         iHZw==
X-Gm-Message-State: AO0yUKWgVBCOcs/3/98B0+r7pm6PO6Ig0JteafoS6krs9BW1hUD8/4jO
        yQYx9lJ1334bRyyI6IUiJ3R70doQcrNNsaw+VxSPQLam0LRF9wDy
X-Google-Smtp-Source: AK7set+b8GW3CohEypYpFclkJbSoK3j2pazVHxiZ+au+wZOWgS2POhtshvSu4L+2cxG51w3WLyRW04Ci57Hvhrwg+hk=
X-Received: by 2002:a1f:c10d:0:b0:42d:6663:d32 with SMTP id
 r13-20020a1fc10d000000b0042d66630d32mr6197135vkf.1.1678462094113; Fri, 10 Mar
 2023 07:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20230309031755.38561-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230309031755.38561-1-jiapeng.chong@linux.alibaba.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Mar 2023 16:28:03 +0100
Message-ID: <CAMRc=MeKN_RWx6x7nu13Sib80sooT=s7ZuWhg6Cow18cuLwGsA@mail.gmail.com>
Subject: Re: [PATCH] gpio: loongson: Remove unnecessary .owner
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     zhuyinbo@loongson.cn, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2023 at 4:18=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Remove .owner field if calls are used which set it automatically.
>
> ./drivers/gpio/gpio-loongson-64bit.c:225:3-8: No need to set .owner here.=
 The core will do it.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D4450
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpio/gpio-loongson-64bit.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loong=
son-64bit.c
> index 20a68e5e66c1..06213bbfabdd 100644
> --- a/drivers/gpio/gpio-loongson-64bit.c
> +++ b/drivers/gpio/gpio-loongson-64bit.c
> @@ -222,7 +222,6 @@ MODULE_DEVICE_TABLE(acpi, loongson_gpio_acpi_match);
>  static struct platform_driver loongson_gpio_driver =3D {
>         .driver =3D {
>                 .name =3D "loongson-gpio",
> -               .owner =3D THIS_MODULE,
>                 .of_match_table =3D loongson_gpio_of_match,
>                 .acpi_match_table =3D loongson_gpio_acpi_match,
>         },
> --
> 2.20.1.7.g153144c
>

Applied, thanks!

Bart
