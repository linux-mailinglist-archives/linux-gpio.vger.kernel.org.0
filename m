Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 882A6732B3B
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jun 2023 11:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241686AbjFPJSR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jun 2023 05:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbjFPJSQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2023 05:18:16 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3D9EA
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 02:18:15 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-46df719f192so162496e0c.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 02:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686907094; x=1689499094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4AKZRXve667oLj8CAtkvZ+RAYg3SFdHAX1mcXkM6/s=;
        b=xCwypRowXG41H659OKQxQZvHa6WyThv2nB5OIZoLSYnDnTnpH1n7+xz+C45GdaLUaF
         Mp8s/q6mt81Gg0+VtyYylZKrSNYDdOgScZyi9FxJKZNnFEcVORgg10aV2lN6NHGpIn1G
         yVFnwTLoEChjq6YY9KPU3YfWB27ZENHdYwYsoawUKppwsB0Zjv/bbkh5MHTJU844fp9I
         a1khOdbkda4BrZKTBEWm7MQ+P28ZpIyMs2tau6WxsPzMO4FQam6UM8O5Ql3/K1z6o6ds
         +6XdOJ5xmhwkgA99U3+mG/7umM3SqGS97r7u6MTMNBUvM8ySbsKpxePvf9cIy7GSx+Ii
         9t8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686907094; x=1689499094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4AKZRXve667oLj8CAtkvZ+RAYg3SFdHAX1mcXkM6/s=;
        b=hRvm+lIMklXBc96zUKHCj3mGcuB3QtjUACnMAYAIZP7lEA01s3H8MsxEDak+oDCv79
         eAKTWLId26paYiUZ7ZRAZHq/cq59cQY/N6iN77OmBNEvi1gyk+wZYkieJj2pKsKc+znV
         iGLtjAA/Louoot1s1dEd4jv6rbQI0cZVVOIXHggkJh8HPdPuq6/gh6HHm5S90L6iy21m
         ZSxVkdBXr7me7nIFWanxpocehSmpCSkazFxiZuq7dQZG643QxVyWFiGh9j/fxgtr92CL
         BfUvIK2TCqdoQGeYFTI4The6UZw8LQKkcuxORL4/cut2AzhzQTrZ7KAaEUWns7we9PaR
         RItA==
X-Gm-Message-State: AC+VfDzeUSte/k2BF0CeWytr0dayI/ockQ3xmTkdYiGfnk5xarMMUi76
        5FiAYl2tY5qP3rTuMLXwYRHEmugbcxLe7pDbtZiTJA==
X-Google-Smtp-Source: ACHHUZ7N9LTL8DCJc4iJxOzhxvh1dd5C7nxDe6B763VLWjVF+P8LL9lt643mZ6SeiOO9JOwfn9yWPVO66A4EWbBiIKo=
X-Received: by 2002:a1f:4307:0:b0:46e:72c6:3369 with SMTP id
 q7-20020a1f4307000000b0046e72c63369mr1174732vka.11.1686907094243; Fri, 16 Jun
 2023 02:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230424123522.18302-1-nikita.shubin@maquefel.me> <20230424123522.18302-34-nikita.shubin@maquefel.me>
In-Reply-To: <20230424123522.18302-34-nikita.shubin@maquefel.me>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 16 Jun 2023 11:18:03 +0200
Message-ID: <CAMRc=Mf1UYEBrGYic7VxzaqHcydHaOnH7MN49c6_B6tnu=pYpg@mail.gmail.com>
Subject: Re: [PATCH 33/43] gpio: ep93xx: add DT support for gpio-ep93xx
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Apr 24, 2023 at 11:36=E2=80=AFAM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:
>
> Add match table.
>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> ---
>  drivers/gpio/gpio-ep93xx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> index ca508c7c4f2f..4e3d01fab012 100644
> --- a/drivers/gpio/gpio-ep93xx.c
> +++ b/drivers/gpio/gpio-ep93xx.c
> @@ -363,9 +363,15 @@ static int ep93xx_gpio_probe(struct platform_device =
*pdev)
>         return devm_gpiochip_add_data(&pdev->dev, gc, egc);
>  }
>
> +static const struct of_device_id ep93xx_gpio_match[] =3D {
> +       { .compatible =3D "cirrus,ep9301-gpio" },
> +       { /* end of table */ },
> +};
> +
>  static struct platform_driver ep93xx_gpio_driver =3D {
>         .driver         =3D {
>                 .name   =3D "gpio-ep93xx",
> +               .of_match_table =3D ep93xx_gpio_match,
>         },
>         .probe          =3D ep93xx_gpio_probe,
>  };
> --
> 2.39.2
>

I guess this depends on patch 1/43 from this series? Are you going to send =
a v2?

Bart
