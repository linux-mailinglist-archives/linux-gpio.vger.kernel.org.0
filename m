Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C16978856A
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Aug 2023 13:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239477AbjHYLOB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Aug 2023 07:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244513AbjHYLN7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 07:13:59 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163DE1BD4
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 04:13:58 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-44e8ddf1f1aso1150389137.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692962037; x=1693566837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zen7peyChUcOOjx95uzAjQLL/qr990ssbbyR06E/zbw=;
        b=uDxVRqSxWY/VwMvIdQCTKPTLD1KFq1JQwC+J8qFbE1/wK6FgstTwnYI1u933aL5oQR
         V1TnswaQkoRVRc6KHNnbWcXbORir28Itsa4yPX2uqKr92uMZP5d5Nzm36Ja0OqwyNHUr
         FkX8EtGaPsM5QQ48E30qXmSjUKPP7Wv1j2kWv+P1F3JD522m6QmWn5jPDGErkoc5LD4k
         eGHU8fX0aTcCXRAQk8Qay4Id/53gnDvLLCi9kyj82CXn4u4N6LqrrobGt+9+6J6xBnWL
         e53I4PqfbvfT/UJcsqXDylgZjGtvgyw31LLKtMTJdUAI5Zyik3++U+YK9KpFe4HV0Lem
         cWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692962037; x=1693566837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zen7peyChUcOOjx95uzAjQLL/qr990ssbbyR06E/zbw=;
        b=b2fTQP2JZuyh2JdSbDWLdpK/l7+LQS87AGTpDWGTq7XgLGQxJqhfHbQRFc31tStfLO
         Roch1vganAcG1QDMrRdJaxGTzv0A5hwm7GKMM1W6GHQ8hTsho10GVqXrj4eFsR1vLj7s
         D3cX7MzY8brXVYCgdqhqeIIoL/RP7GC4zvpej70Xl6vmBzOuMBbpUyxBx6CvEN07i1nN
         ZOqaHJbjmckqBr9aQrSVU7WLeyt6l0O6LQEpZF5VPAkxNeGb2B8ntIydWdqhrUFuWFVS
         F7wYpSBTtbvJ3wL3jT6FsQ+mGJz9BU/0S0CiNE9UC0fPPl0Nc44hHflYL0a9qMnBloNH
         gu3Q==
X-Gm-Message-State: AOJu0Yzspjr5x0uWdMpk6L63B0y3OBH08hrOjkzGzAZ1Yvl/SbE/MB4A
        m9ktFF4OM4ehywNLekVI+8s4Dd0FUfc/PKg5CpSHXg==
X-Google-Smtp-Source: AGHT+IHzgfofw/PTgO9XWq2HEls/SuyKirBEcYV6hHZAadFf1hkicM5Wyq73fsWmn6R3GVZvRFt95zGufCTf17QJNSc=
X-Received: by 2002:a05:6102:3c88:b0:44d:6281:4fc2 with SMTP id
 c8-20020a0561023c8800b0044d62814fc2mr5493656vsv.3.1692962037195; Fri, 25 Aug
 2023 04:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230824160017.368517-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230824160017.368517-1-biju.das.jz@bp.renesas.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 25 Aug 2023 13:13:46 +0200
Message-ID: <CAMRc=MeG6-7YwHsc++ZjaB+v4MJF_bsepJ+X--BBxs0+XZ_uYA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: Use i2c_get_match_data()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 6:00=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Replace device_get_match_data() and id lookup for retrieving match data
> by i2c_get_match_data().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Moved i2c_get_match_data() to be called before devm_regulator_get() as
>    it doesn't require regulator to be enabled for functioning.
> ---
>  drivers/gpio/gpio-pca953x.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index a806a3c1b801..929a2d075fe4 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1051,7 +1051,6 @@ static int device_pca957x_init(struct pca953x_chip =
*chip, u32 invert)
>
>  static int pca953x_probe(struct i2c_client *client)
>  {
> -       const struct i2c_device_id *i2c_id =3D i2c_client_get_device_id(c=
lient);
>         struct pca953x_platform_data *pdata;
>         struct pca953x_chip *chip;
>         int irq_base =3D 0;
> @@ -1090,6 +1089,9 @@ static int pca953x_probe(struct i2c_client *client)
>         }
>
>         chip->client =3D client;
> +       chip->driver_data =3D (uintptr_t)i2c_get_match_data(client);
> +       if (!chip->driver_data)
> +               return -ENODEV;
>
>         reg =3D devm_regulator_get(&client->dev, "vcc");
>         if (IS_ERR(reg))
> @@ -1102,20 +1104,6 @@ static int pca953x_probe(struct i2c_client *client=
)
>         }
>         chip->regulator =3D reg;
>
> -       if (i2c_id) {
> -               chip->driver_data =3D i2c_id->driver_data;
> -       } else {
> -               const void *match;
> -
> -               match =3D device_get_match_data(&client->dev);
> -               if (!match) {
> -                       ret =3D -ENODEV;
> -                       goto err_exit;
> -               }
> -
> -               chip->driver_data =3D (uintptr_t)match;
> -       }
> -
>         i2c_set_clientdata(client, chip);
>
>         pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
> --
> 2.25.1
>

Applied, thanks!

Bart
