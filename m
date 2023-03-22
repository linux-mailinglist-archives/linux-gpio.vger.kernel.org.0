Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 198E36C50FE
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Mar 2023 17:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjCVQmh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Mar 2023 12:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbjCVQme (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Mar 2023 12:42:34 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A5064204
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 09:42:32 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id i10so1381558vss.5
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679503351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmnnMMvSLOdA65bN5I8O3X2sjkCjbZFK9esp/HZ4bO0=;
        b=K1X5LlHD1KTJx0CtsGxmvT1jE0SyIa+A1BAiMv9cuDnLDanH5SXhjPHHh9Xtr5jp6F
         nVHCZPDozIw3JZGlsg++BV692DK6olE41R2lKzV2VJHsbav2rzbmnS4ippdZ4czCAOTU
         DsoN4AIA5q2ltgI9R3GWi5nS59j9fC54oVN1ukEXlnsw/ecAq1BTY+b2EhsxT7YaV7+R
         ACL+wGuTiYlkUacdKR2fB6rtRYC6WAWZAiPoAExnbRgfzDIn+9xmNUmJgO6fMa7JAKY7
         PVxN0Jpfrrlwu9OCzuEhOwDUqv0CYGtGqFGhUwlCu9h0rCrpK808feWrv8akmGxgohTP
         oHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679503351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmnnMMvSLOdA65bN5I8O3X2sjkCjbZFK9esp/HZ4bO0=;
        b=45VX8xNsGl3BiHeEYhcLkoPRHsWCi6oBzYFBMuHVYI3FhqZZtY+vEoL10T4QRAWfCM
         eGdXe5+VynOJIAlpqXAsX95boTim8hzyPLfz6Toy/EjF5Aa3Hbqt7/Ou7P9NQl3TK61w
         t1bFbFzqVDFiV6ytLNB6mwRWvlqTJ3l93J2g82i6AwqKRaq6GyojLHa2y6+qV6JEMSuk
         5JaaM3V0/74rYB0Zd3ORGIr48U6PBuheavqlRoPSk5jTRZAI9PxxO7OaibCtzrsEj3YG
         9drL+uwewn/uwnUXRdQh+BEZF/deyibBO50prOTGPG1e2aS7UcwniJZkjh//G239iHmc
         b46w==
X-Gm-Message-State: AO0yUKWAsrYFXJNK3G+FLxnGecBatSrdtEc55gqrxqWUPj4nCXuEqNq3
        IzmYzsn3qVCSuGTzVAUFlbWa8SUfh2dXN5QkbZoV5A==
X-Google-Smtp-Source: AK7set/RWj8MjG2qYfMV5NINsPkCRSFEKkqgR6XZHjCzh22PdBgdXg7kYsGksZ26QMzp8O/PYzJ6qyyWSjXqVS6WxWQ=
X-Received: by 2002:a05:6102:4751:b0:425:dd2d:1c0 with SMTP id
 ej17-20020a056102475100b00425dd2d01c0mr75732vsb.0.1679503351764; Wed, 22 Mar
 2023 09:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230315110650.142577-1-keguang.zhang@gmail.com> <20230315110650.142577-2-keguang.zhang@gmail.com>
In-Reply-To: <20230315110650.142577-2-keguang.zhang@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 22 Mar 2023 17:42:21 +0100
Message-ID: <CAMRc=Megxi64KcDsaj+FEtzbLK8ohT9D8g_p-kWrKjXc89t5yQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] gpio: loongson1: Convert to SPDX identifier
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 15, 2023 at 12:07=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail=
.com> wrote:
>
> Use SPDX-License-Identifier instead of the license text.
>
> The current author name is unofficial, change it to my real name.
>
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> V2 -> V3: Explain the reason for changing the author name in commit messa=
ge
> V1 -> V2: Keep GPLv2, just convert to SPDX identifier
> ---
>  drivers/gpio/gpio-loongson1.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.=
c
> index 5d90b3bc5a25..8862c9ea0d41 100644
> --- a/drivers/gpio/gpio-loongson1.c
> +++ b/drivers/gpio/gpio-loongson1.c
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * GPIO Driver for Loongson 1 SoC
>   *
> - * Copyright (C) 2015-2016 Zhang, Keguang <keguang.zhang@gmail.com>
> - *
> - * This file is licensed under the terms of the GNU General Public
> - * License version 2. This program is licensed "as is" without any
> - * warranty of any kind, whether express or implied.
> + * Copyright (C) 2015-2023 Keguang Zhang <keguang.zhang@gmail.com>
>   */
>
>  #include <linux/module.h>
> @@ -90,6 +87,6 @@ static struct platform_driver ls1x_gpio_driver =3D {
>
>  module_platform_driver(ls1x_gpio_driver);
>
> -MODULE_AUTHOR("Kelvin Cheung <keguang.zhang@gmail.com>");
> +MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
>  MODULE_DESCRIPTION("Loongson1 GPIO driver");
>  MODULE_LICENSE("GPL");
> --
> 2.34.1
>

Applied, thanks!

Bart
