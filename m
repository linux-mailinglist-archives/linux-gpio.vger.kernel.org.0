Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4BC635829
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 10:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236290AbiKWJwN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 04:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235568AbiKWJvR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 04:51:17 -0500
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3585781B7
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 01:48:25 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id v28so1820424vkn.10
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 01:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f88snu3p0webz5UBHlBzwAVmN5kSFBR69MK9kMQS1Ic=;
        b=gcooN+/JRQanId9jsvnsdgu6s+eiHZGjolxeO3DzaycbLSXUIqzhXWDFFC9rrwkovV
         ki+EWjeEYvB6VNi1byc/Ark7ggyuD5YFHylEaH7VU42P9FYg19sx3aBQArviOkfAquhx
         J+17niz6uKSBs1Cf2P/yjZHTaafswOskrwFnvMSAMoNlO2RSA5DMsdj6LrvZmr6UAnH2
         jK3bdRDq07M9NOms01ow4vABqr10Swb4IHsVgSv/05MBKKktLOoHaPF41L8vvowBZEVG
         HJJy+R69R9V6U62Sqi2X5Y+Lmj9yREpbQX+3zkcL75DDy+KI0Q9jTmfeumVKtDn3/V6s
         16UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f88snu3p0webz5UBHlBzwAVmN5kSFBR69MK9kMQS1Ic=;
        b=oIunz0vJ7/qq3pnRej02BhMRHh2c3RDP+rXSU2wTh/a/Bk+fAOQvuV7ZM14MhxhiCK
         bBGJOS0p2Ep5CqqQZW2scxDWZHyv6Jzytgp6wg6JVCvwm0E9HPQ57SoRnNqYUUK88GuX
         2khiXIpSVRaacpf9gi2eDZ+GAu+mY2NWsOgE6qFx9cCnFWpkuwgcloD1vkmPQmktjXwc
         SpNq2U642/F8r3O2Pn/RpzRdrn+QwM7/T+dj5OA1tRq8qPNbwsx5+FrR9LvS3zZ5t0YB
         Sj9u0lFjrQlnFvg1vxAd2KGAtzLIYod+T4zR1px5BrP8e7Tc/nBR7RPycXy8txE2joa3
         gipA==
X-Gm-Message-State: ANoB5pm4Vm9iqxfdmyscqUTiFqbw3FlTtkmhRSqpYwxs8L/w3sZ621KA
        WZPEDpTCWoltyW6mfVaHaCqoIQMPoOGHuzgj3jFQ7Q==
X-Google-Smtp-Source: AA0mqf5VJAhVJgXKjuuGIdIv2OP/OUegIJlyQpYq1/H42Nb4U3SOj/Fh44vTTy3Lr4xABLQfC8QQDq3seEc1q/V/iR0=
X-Received: by 2002:ac5:c915:0:b0:3b8:7fbd:9554 with SMTP id
 t21-20020ac5c915000000b003b87fbd9554mr4786623vkl.27.1669196904910; Wed, 23
 Nov 2022 01:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-14-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-14-uwe@kleine-koenig.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 23 Nov 2022 10:48:14 +0100
Message-ID: <CAMRc=Mc8QByAUsp5N1mD+rs-BayHs3A9sjjivzX_jGP2oQfHPg@mail.gmail.com>
Subject: Re: [PATCH 013/606] gpio: pcf857x: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Fri, Nov 18, 2022 at 11:46 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.o=
rg> wrote:
>
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-pcf857x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
> index e98ea47d7237..cec2f2c78255 100644
> --- a/drivers/gpio/gpio-pcf857x.c
> +++ b/drivers/gpio/gpio-pcf857x.c
> @@ -247,9 +247,9 @@ static const struct irq_chip pcf857x_irq_chip =3D {
>
>  /*----------------------------------------------------------------------=
---*/
>
> -static int pcf857x_probe(struct i2c_client *client,
> -                        const struct i2c_device_id *id)
> +static int pcf857x_probe(struct i2c_client *client)
>  {
> +       const struct i2c_device_id *id =3D i2c_client_get_device_id(clien=
t);
>         struct pcf857x_platform_data    *pdata =3D dev_get_platdata(&clie=
nt->dev);
>         struct device_node              *np =3D client->dev.of_node;
>         struct pcf857x                  *gpio;
> @@ -422,7 +422,7 @@ static struct i2c_driver pcf857x_driver =3D {
>                 .name   =3D "pcf857x",
>                 .of_match_table =3D of_match_ptr(pcf857x_of_table),
>         },
> -       .probe  =3D pcf857x_probe,
> +       .probe_new =3D pcf857x_probe,
>         .remove =3D pcf857x_remove,
>         .shutdown =3D pcf857x_shutdown,
>         .id_table =3D pcf857x_id,
> --
> 2.38.1
>

Applied, thanks!

Bartosz
