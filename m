Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88DB27063F6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 May 2023 11:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjEQJUI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 May 2023 05:20:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjEQJUG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 May 2023 05:20:06 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BAB10E6
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 02:20:05 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-783f7e82f28so118575241.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684315205; x=1686907205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z6JwyPkuBQnQHgg+4VNBJ35/lYcbwh0Sg62z2NRT+U=;
        b=OMn8yVkzKvguth5GpSMqqfT/SzxEtin+BTD/DWZPAeZ+9l7+h+JHRC6jQI4U8ft3s0
         9wdv8186gztOWk3saitIunadHwWmEo072dejrRkfzpkS9dZW/HD5+1WrQpZUS0bOtgJp
         dkyOTyoWZeHIfv93i3AaBG4MHDCMF45pAMdRwmj2yNLi5fZcYk3afEYLGXkXlgmQrSnq
         C0r03cqZm1XsuwJoqrWU33ud3HVaTdhqq7MsaYt8S1dN1Z6B0kpva42Dkai7UwTJmxjg
         2NSacngp5QUR2fUFfzdWD0HcxZi7WW0sCFFuViIlu++a5Wz2DFjMLHloPW2sLzQNZcFu
         KGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684315205; x=1686907205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1z6JwyPkuBQnQHgg+4VNBJ35/lYcbwh0Sg62z2NRT+U=;
        b=XPSMvNnmkxDutzuh846I0QIA05Ycm9m5eQC1/EXg7l+E1YwFIl/mfyEW0cLid/GIuJ
         DVildEfhiboTzvlaRv6Fy1FcvBm5fBVMwK92yw74VO9x/K5N+5qD1JhOeVAEB6urPpf1
         O/sMTxrBjJogNYHKjkJZE9PNiCTXDsjnAsRxLo6lukeLKTbKejOuB/zutGgUx3lrpWdh
         slfeQg19szlGc4lE954sOngN18ZsxrhpSqF5m2wN2MsrkrL32gfj6PGxKQjXWOk5cRWY
         xu+0VLF7uoYEwgPYxC1vh/MrT3lMarYwWQuFjVGvkTkhMXrtqfYD9bDRZyBn8mCdSptQ
         ymyQ==
X-Gm-Message-State: AC+VfDw985/VkXdU4tYr5NFb5eyOslwtspED5Pp+KaJY0oKt3yKFTowt
        B7jP5RLuxS9/rlhgH15jowR/L8bONxMeuxcexrI1tg==
X-Google-Smtp-Source: ACHHUZ6+pXVpcwCQE5BBPiJ4eI2bOgEbeA1GLlYrdadAe9NQEmPYBg49CeSAh5bvdAVAhUPZOdYwdE9TLWXOfIGlVHo=
X-Received: by 2002:a1f:59c4:0:b0:44f:a955:aaac with SMTP id
 n187-20020a1f59c4000000b0044fa955aaacmr13186873vkb.6.1684315204764; Wed, 17
 May 2023 02:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230517054756.11119-1-zev@bewilderbeest.net>
In-Reply-To: <20230517054756.11119-1-zev@bewilderbeest.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 17 May 2023 11:19:53 +0200
Message-ID: <CAMRc=MfuFJu=AJu6=3S64TvYwAY2enUafqCFat-j9G8O58UM4A@mail.gmail.com>
Subject: Re: [PATCH] gpio: mockup: Fix mode of debugfs files
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
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

On Wed, May 17, 2023 at 7:50=E2=80=AFAM Zev Weiss <zev@bewilderbeest.net> w=
rote:
>
> This driver's debugfs files have had a read operation since commit
> 2a9e27408e12 ("gpio: mockup: rework debugfs interface"), but were
> still being created with write-only mode bits.  Update them to
> indicate that the files can also be read.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
> Cc: stable@kernel.org # v5.1+
> ---
>  drivers/gpio/gpio-mockup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index e6a7049bef64..b32063ac845a 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -369,7 +369,7 @@ static void gpio_mockup_debugfs_setup(struct device *=
dev,
>                 priv->offset =3D i;
>                 priv->desc =3D gpiochip_get_desc(gc, i);
>
> -               debugfs_create_file(name, 0200, chip->dbg_dir, priv,
> +               debugfs_create_file(name, 0600, chip->dbg_dir, priv,
>                                     &gpio_mockup_debugfs_ops);
>         }
>  }
> --
> 2.40.1
>

Good catch, applied, thanks!

Bart
