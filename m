Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8769078857B
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Aug 2023 13:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbjHYLSw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Aug 2023 07:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236902AbjHYLS0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Aug 2023 07:18:26 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F411FCA
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 04:18:23 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-791b8525b59so323711241.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Aug 2023 04:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692962302; x=1693567102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWKrrSx4g72KNJv8vfPkVXuC0ZK0bilFToBW/WhDgH4=;
        b=wiC2b2iY2ns4+6bRTnChH6buoE3SQC2PTPoPfFYKHSRyrP57WYUj2LzIOgkbHWC/77
         3qrlGvudaR8VbqxHQ5JGD6vA3ylBcrXbpcHFQTNVbAy5eNF8ijUfISdyvDCutxTsSnjX
         CNyjqgVv1VHLAa9aLbjTYPaN2iVck3ncthrz5jaDQDI7+G3GhwcjEn2dYr1TjtVBExEj
         3Tgv0HMjIIPztYVO5iyTNsr622TnEWM7ElTf9j9vIqvb26eFcr2h8Gm+ItOzcn0oqsh2
         phpjYPBnnyrSVhQ8AH76YC8KUHa1FDQeCp9RQP9MtSHJlxBg5smcdR+uk4HO+pwIt2qd
         hFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692962302; x=1693567102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWKrrSx4g72KNJv8vfPkVXuC0ZK0bilFToBW/WhDgH4=;
        b=gwlysDGYAUkWZFydCGhr+ZfRAIvGjyHhi5QgsUly1m0sEQLe4biVBwLYYH6E2k09CL
         QzlQH2NlxTx1tRGIgd9lF/REAJaryZLxaT2spG7swkhuDlO0T15jZD9Slsyd/h/2i4ot
         limatkLvDBd8GN4ptGPgmxQwHIzFZKw1Emwhu5vVbctgFV0sDbdRFezegtHEMd+TxMPf
         cd+noIHzkoHnbFj31u/PVzaPMoxgpQxVIw31pZU2/LHADt3uPSYid/rBXTpksNEYz5s1
         Kjqh2+Vh8ir6ns8iqZG014RzhjdCHfKBWHz0SF7LDPK4Aaef4zZhyya4akbj9a80C+d+
         uskw==
X-Gm-Message-State: AOJu0Yzmp5yWYdV/s+agUxlcWF3HzRq08cGnX2bKMcg5E6a5QLE6ivTF
        +5TZD035cvGmxDgGFj+GXxQ3Fjrsd61u9cjX+tAgGA==
X-Google-Smtp-Source: AGHT+IEgwcG3WQA8jodQelsSwZ3u6fbblw91gZ/1p6Qw3GMUPOQrKaehGcII9s0yiY9sRhqebF21IusxSGn2g8WR39I=
X-Received: by 2002:a67:fb99:0:b0:44d:626b:94da with SMTP id
 n25-20020a67fb99000000b0044d626b94damr8984206vsr.32.1692962302520; Fri, 25
 Aug 2023 04:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230824-tca9538-v1-0-ee3bf2065065@gmail.com> <20230824-tca9538-v1-1-ee3bf2065065@gmail.com>
In-Reply-To: <20230824-tca9538-v1-1-ee3bf2065065@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 25 Aug 2023 13:18:11 +0200
Message-ID: <CAMRc=MdmM8PgGUdaxCFQo_SJHKJ9CO3tRScY8XNcKc71BV_ZHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: pca953x: add support for TCA9538
To:     Liam Beguin <liambeguin@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 25, 2023 at 1:16=E2=80=AFAM Liam Beguin <liambeguin@gmail.com> =
wrote:
>
> The TCA9538 is an 8 bit version of the already supported TCA9539.
> This chip also has interrupt support.
>
> Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index a806a3c1b801..71a750363738 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -108,6 +108,7 @@ static const struct i2c_device_id pca953x_id[] =3D {
>         { "tca6408", 8  | PCA953X_TYPE | PCA_INT, },
>         { "tca6416", 16 | PCA953X_TYPE | PCA_INT, },
>         { "tca6424", 24 | PCA953X_TYPE | PCA_INT, },
> +       { "tca9538", 8  | PCA953X_TYPE | PCA_INT, },
>         { "tca9539", 16 | PCA953X_TYPE | PCA_INT, },
>         { "tca9554", 8  | PCA953X_TYPE | PCA_INT, },
>         { "xra1202", 8  | PCA953X_TYPE },
> @@ -1354,6 +1355,7 @@ static const struct of_device_id pca953x_dt_ids[] =
=3D {
>         { .compatible =3D "ti,tca6408", .data =3D OF_953X( 8, PCA_INT), }=
,
>         { .compatible =3D "ti,tca6416", .data =3D OF_953X(16, PCA_INT), }=
,
>         { .compatible =3D "ti,tca6424", .data =3D OF_953X(24, PCA_INT), }=
,
> +       { .compatible =3D "ti,tca9538", .data =3D OF_953X( 8, PCA_INT), }=
,
>         { .compatible =3D "ti,tca9539", .data =3D OF_953X(16, PCA_INT), }=
,
>
>         { .compatible =3D "onnn,cat9554", .data =3D OF_953X( 8, PCA_INT),=
 },
>
> --
> 2.39.0
>

Applied, thanks!

Bart
