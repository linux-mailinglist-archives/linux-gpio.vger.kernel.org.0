Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9F68635833
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 10:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236923AbiKWJwM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 04:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236897AbiKWJvM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 04:51:12 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FD5C4C3D
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 01:48:12 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id i2so16952197vsc.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 01:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNWMujDoE8kNxHJht66FEwgt8YaN3ef3GP1JbL99z40=;
        b=ozoa4aWdr/7k2FzQARebELuDZCvqRIX9Dbw+UBF3Xu8MqEqxdmyhN+6ct3REmZqb4O
         lxiTRxO6K+IruK9kEL8ZL9ns7i1mx1bHN7qSNWjL9QUFZD+QvHm8eYu+BJE/N8rErCUP
         7/zSVYtmAWi147tja25HDFUb8lM5Jz8/Vks5oBPwE8LIgnExyjHYkYQhZIQXB6S7ZtMP
         g1cltKVrr1XbC3AVs9OEHei6ibhz2t4ByEvLwl7hMYwln35oX53zwjn5wg200ITVxkfm
         njrtg6ivg4ijoFLBxuRS4t6LAcINZHT0TwKmm3ozUNRywqqiNVZ5oIg3sOgUiZtAcvUn
         fNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNWMujDoE8kNxHJht66FEwgt8YaN3ef3GP1JbL99z40=;
        b=WAfTi0UIKGAfaguAKUdW8tzzrJU3/UasFh525v5IW8bqeiatVaSobURUrUTtVgxiLX
         BDZ0F2HTDNepOExdh46DJKMGRD8I5K21uMArn5oC2S2+fMntfyZjQsLVJqPfgeiK+vKL
         jaJglD27eK71G/SWBTOn0xMo9vz96sV0no4ns8sH5kMAihyQ4jBUZWvjsqYX4cuToqPO
         HG577Yt+/MNh5MvCF086ge5IT7iZbAYi29GCi05NRdIDl42FqOLITxEKPKXrmh1cy/bP
         q6az4pw64+EHbKD0KA3jErCEOsQWU84AY9GKc/ucErIwI+fYdIOtZAFskfWg/oGqkDRA
         Muvg==
X-Gm-Message-State: ANoB5pmeRlAS7V2379tHceEDwLeWQ7RlqLWN7cuSDY5aUJ7Lg4z8AsX2
        iryRbuNvYadcTawdZfiQ4AZzyAMXy1HJs3O0fBkFjA==
X-Google-Smtp-Source: AA0mqf5I0O8l8ui+oblFnrzS//5FsMptKKMavXkWpJV3WBktCymIDfBBUw/R+2HD1hHUMlpQ5EQC4JJvbwRLg+uHQDY=
X-Received: by 2002:a67:f645:0:b0:3a7:769c:6dee with SMTP id
 u5-20020a67f645000000b003a7769c6deemr5271170vso.13.1669196891150; Wed, 23 Nov
 2022 01:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-13-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-13-uwe@kleine-koenig.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 23 Nov 2022 10:48:00 +0100
Message-ID: <CAMRc=McKJ1NY7Me2UbzaeBU8AAoAXOnOEp61fJjWLhMCuxZP8w@mail.gmail.com>
Subject: Re: [PATCH 012/606] gpio: pca953x: Convert to i2c's .probe_new()
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
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
>  drivers/gpio/gpio-pca953x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 6e67867e1dcd..a59d61cd44b2 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1050,9 +1050,9 @@ static int device_pca957x_init(struct pca953x_chip =
*chip, u32 invert)
>         return ret;
>  }
>
> -static int pca953x_probe(struct i2c_client *client,
> -                        const struct i2c_device_id *i2c_id)
> +static int pca953x_probe(struct i2c_client *client)
>  {
> +       const struct i2c_device_id *i2c_id =3D i2c_client_get_device_id(c=
lient);
>         struct pca953x_platform_data *pdata;
>         struct pca953x_chip *chip;
>         int irq_base =3D 0;
> @@ -1376,7 +1376,7 @@ static struct i2c_driver pca953x_driver =3D {
>                 .of_match_table =3D pca953x_dt_ids,
>                 .acpi_match_table =3D pca953x_acpi_ids,
>         },
> -       .probe          =3D pca953x_probe,
> +       .probe_new      =3D pca953x_probe,
>         .remove         =3D pca953x_remove,
>         .id_table       =3D pca953x_id,
>  };
> --
> 2.38.1
>

Applied, thanks!

Bartosz
