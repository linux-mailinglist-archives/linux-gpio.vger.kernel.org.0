Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A92E76EB70
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 16:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbjHCOAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 10:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234858AbjHCOAg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 10:00:36 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35E61981
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 07:00:05 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-78a5384a5daso315835241.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 07:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691071205; x=1691676005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7a6ykH08/KxshkB9VpG96SLKTb2oFaK0ZMsjwEijPHY=;
        b=N+yLlG/fwNYmrhJFkGG0rVUWY60N5IRfpfnE+wF4JLgz5uOQvk82nVtfoFPNY2UA/9
         hrmtWZPWSc6PsXsUuP8/7MxeMRn0aLCCP6ckiirfSLhGsP87HbTBI2oKrXc29F6dA+hN
         IEPAA/ynRVXoTRbrYaF0LAnScANJE+lLX5Vk+6w2kYKdC8YaHV+u2kqeC70B5k5xJnX/
         3ZX3rwrUYsFlbigZjZzitbwmHYRwYCeLGM7yGxoNTa6xmsr6gnjT46DqHPZbkT50zWdn
         N75zlbkDfuOXcqblM4UDJELKVXpsJIHDCrKqQQcInGb7OBZQPMfPtJ1ndxbx99sHS2NP
         +uEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071205; x=1691676005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7a6ykH08/KxshkB9VpG96SLKTb2oFaK0ZMsjwEijPHY=;
        b=fO3lX8Gt72065QPnmjc/Ct8Ep3AI7OyUUeebIMrbxfNxsRFnkol0uHyq2AHfuESfZH
         zgQ2hYd7LHNMnkmt1paMLyFVgbRl+FcTLIDGoicLR3rH59mU0BLgDhmad6CPI5YG/4d7
         WSlQPDnEjbXGSwj0BFFV2IW2qCjRR7AaXcQQ8G3gB1g3CrLyJF1aN5epy8QOPqnv/EAS
         Ov4N3IiDZ/v7MP7NF1OOzHYXg0RXR+KIphFNnBXw16ckGiEZJrNOLrHiZz94mx2N6gRU
         v/R2W6oEWkz1Z3H7L1KXvVSo2JtBNjT9jrd3JIQYOB00qhqBYEI0p3BrSwDPGDoGIKFO
         b3aA==
X-Gm-Message-State: ABy/qLblp5So89rr+40avfsGnQ5i6tQsAAKaJVZ+vn2RQCXWBS1HRHhE
        mbwyXdNWN7D+Gb+sTAMyyPNXnUT4/o0Srts0ya7Khw==
X-Google-Smtp-Source: APBJJlHcs7ZEHLQl07PYKB/hunEqhd3g/0veNK3+6c0lz30gCnGBQAI69Ra8lN8SeGsezYroANgdY6HYg72+SfE1u6g=
X-Received: by 2002:a05:6102:243:b0:447:4cb2:74f6 with SMTP id
 a3-20020a056102024300b004474cb274f6mr4849901vsq.7.1691071204948; Thu, 03 Aug
 2023 07:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230802032957.18843-1-wangzhu9@huawei.com>
In-Reply-To: <20230802032957.18843-1-wangzhu9@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 15:59:51 +0200
Message-ID: <CAMRc=MdyWTCpX4vX0dfb9zuuyzuf==pSqvxV5gcsGj1CjaycAQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] gpio: max3191x: remove redundant of_match_ptr()
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     linus.walleij@linaro.org, andy@kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com
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

On Wed, Aug 2, 2023 at 5:30=E2=80=AFAM Zhu Wang <wangzhu9@huawei.com> wrote=
:
>
> The driver depends on CONFIG_OF, so it is not necessary to use CONFIG_OF
> and of_match_ptr() here, we remove them all.
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
> ---
>  drivers/gpio/gpio-max3191x.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
> index 161c4751c5f7..bbacc714632b 100644
> --- a/drivers/gpio/gpio-max3191x.c
> +++ b/drivers/gpio/gpio-max3191x.c
> @@ -457,7 +457,6 @@ static int __init max3191x_register_driver(struct spi=
_driver *sdrv)
>         return spi_register_driver(sdrv);
>  }
>
> -#ifdef CONFIG_OF
>  static const struct of_device_id max3191x_of_id[] =3D {
>         { .compatible =3D "maxim,max31910" },
>         { .compatible =3D "maxim,max31911" },
> @@ -468,7 +467,6 @@ static const struct of_device_id max3191x_of_id[] =3D=
 {
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, max3191x_of_id);
> -#endif
>
>  static const struct spi_device_id max3191x_spi_id[] =3D {
>         { "max31910" },
> @@ -484,7 +482,7 @@ MODULE_DEVICE_TABLE(spi, max3191x_spi_id);
>  static struct spi_driver max3191x_driver =3D {
>         .driver =3D {
>                 .name           =3D "max3191x",
> -               .of_match_table =3D of_match_ptr(max3191x_of_id),
> +               .of_match_table =3D max3191x_of_id,
>         },
>         .probe    =3D max3191x_probe,
>         .remove   =3D max3191x_remove,
> --
> 2.17.1
>

Applied, thanks!

Bart
