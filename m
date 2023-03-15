Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F38956BAC62
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 10:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbjCOJnr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 05:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbjCOJnp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 05:43:45 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D605F5982A
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 02:43:38 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id i22so7877355uat.8
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678873418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTtKGVeuEHMrYg13TNyf9R53hVye1Y0vpvf1Wvwm7HU=;
        b=Xj6mQE/Pr1Rd5YFFkXms0/AyM4MQENCL+DTgTaCzwFtqOvOuqhtTgErSEj8DIL794t
         PCQXgdfDPWI1BT9SaBzRZGzjdhIRBjqV3i3RY2nClm+KLDB4PfLl0Qdv3UGC+2vUViz3
         y7HjHkeuR2uiyXRWkW9CZeQw8XA9DG63Bst+9ukEdhC33GcL3JD1dG6EH1HUK4Kwhjpn
         wybrGb20WebnHp4MjntTXZSCw936FAVK5qpemPhOi1v0jkR6gG2TWMlYeLJaqZUZVgB4
         CFM6q6Cpx53SVZ4S0CfCpYTboIjh+fAb6mUNP5jidwapdrJ0/zZCxx0yrX2t93yGDMLC
         7buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678873418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTtKGVeuEHMrYg13TNyf9R53hVye1Y0vpvf1Wvwm7HU=;
        b=izpPn+upj5G0a2Pf/shSrWXAjpTNvtQibomZuAqRLBLI+vlZMWtHQ4p5nk/TEjdoTY
         tBI1w0ExHO/cyYVOwhSYfCTDsShNc0Ia/xC5X0iJFcu4CWdTa9+vYYuGL5Pu53X/+CgG
         C1ZvfrBRsqFQt5LA42MxVMiibLMtnadAtjn1/mUikgLX2o9njvWhkysSl5InpWdCW6hc
         s2OcQeC11h/Zz8pCLYD+qyoXdLy2lBuQx/aL9zNQ1/90wSnZreawkjxY9gD64HUtsq3P
         Ib+Bc4fzngmwgKNe7uy2d7GPi/muiVLP3r77Q5dT1Ewjd3au2+jvfzl2xlfo10C/reYL
         qS+A==
X-Gm-Message-State: AO0yUKVlR5xjMlafJYnapdLT3hKTQUjKR2lqLX//lauLWroOhDVR2DHS
        0YQc7nLOiwFfxBcJAX7eeMsMNCVHIrALLoYIaUzIwQ==
X-Google-Smtp-Source: AK7set8FSxyZZaIso/tWBv3CENtctb/nWA57Qr9Zusy6Ky+n7Gd6MoMUAQSOII99qCXvGMw99h7IiQ8lqW/juLWorwY=
X-Received: by 2002:a1f:b292:0:b0:42d:18f9:d0b6 with SMTP id
 b140-20020a1fb292000000b0042d18f9d0b6mr14862782vkf.2.1678873417982; Wed, 15
 Mar 2023 02:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230314154117.477138-1-robh@kernel.org>
In-Reply-To: <20230314154117.477138-1-robh@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 15 Mar 2023 10:43:27 +0100
Message-ID: <CAMRc=McZvrubmeWTyE7Wpjz2ZtZFdVDKrzxB6yBtGiSU=mW9Pw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: Use of_property_read_bool() for boolean properties
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Mar 14, 2023 at 4:41=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Actually use of_property_read_bool() as the commit msg says instead
>    of of_property_present()
> ---
>  drivers/gpio/gpio-stp-xway.c | 2 +-
>  drivers/gpio/gpio-tb10x.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
> index 0ce1543426a4..4750ea34204c 100644
> --- a/drivers/gpio/gpio-stp-xway.c
> +++ b/drivers/gpio/gpio-stp-xway.c
> @@ -292,7 +292,7 @@ static int xway_stp_probe(struct platform_device *pde=
v)
>         }
>
>         /* check which edge trigger we should use, default to a falling e=
dge */
> -       if (!of_find_property(pdev->dev.of_node, "lantiq,rising", NULL))
> +       if (!of_property_read_bool(pdev->dev.of_node, "lantiq,rising"))
>                 chip->edge =3D XWAY_STP_FALLING;
>
>         clk =3D devm_clk_get(&pdev->dev, NULL);
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index de6afa3f9716..78f8790168ae 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -167,7 +167,7 @@ static int tb10x_gpio_probe(struct platform_device *p=
dev)
>
>         platform_set_drvdata(pdev, tb10x_gpio);
>
> -       if (of_find_property(np, "interrupt-controller", NULL)) {
> +       if (of_property_read_bool(np, "interrupt-controller")) {
>                 struct irq_chip_generic *gc;
>
>                 ret =3D platform_get_irq(pdev, 0);
> --
> 2.39.2
>

Applied, thanks!

Bart
