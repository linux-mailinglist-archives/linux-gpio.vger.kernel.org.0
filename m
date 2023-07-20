Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C1E75B1BB
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 16:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbjGTOwn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 10:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjGTOwm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 10:52:42 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ADCC26BF
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:52:40 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-443571eda4dso387004137.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689864759; x=1690469559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0se/fiZTYQyvsUnNPmtkJSJYvLAJ5Jb+/5wZpSy5RKg=;
        b=ECpP9SgIhGTB9F0PFkqrngjAPCnh4+RpKJS05JQJS+MmSUALFt24TNaj6WT24u/RBx
         PzB+8Pa62aLb4qrb68NHsCJKPSQMvVQl4NzT8anLro5a5hbKsM5tKbEROgUK5jC0MHVn
         2xibNR8f93W/aGz3IWCi7TemFn9i09rFbR9mBviMbYBpjVyGI/Z3y27mLEJVPOwUFymL
         debaGdtTKAHVeYPW2AJHzvtovPcxuEdHp5z+ENerkutD1Jy7LXy0nrusrvZaKLKipUgj
         9bS/SwB2biOAhZlmZ4MOliEKL6PtQQyzcFdWLgdgYK6QBlFpmpngsVsylp9ASlk3QkZ2
         CxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864759; x=1690469559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0se/fiZTYQyvsUnNPmtkJSJYvLAJ5Jb+/5wZpSy5RKg=;
        b=NA6LM2vlMT4N/Xa0buHqKftN7RqPv98NAEQ/p+i3GrxGxiB0DSWPUnlKMjuU6S0rRn
         4j0GMySa5eEqPHUkZr/Jj0Vz0/ZmX7uiFOg+bgcIiP2iF3dv6WhWl35Qodu9RD8wwE9g
         AmlTvARUV/jiEuUnsE4F7xRYfsefSUOWjiHDBtQusJIh94DyPN1Y5mQi4b68OenkZhh9
         QBCBc/1KKW+TPH2Li2c1/Cz/eRymvzWFpwkHi2LVAsEU61DO1taIpG4qJWxXb5TS0r/Z
         IbYu8CmSKOEqASYubzhZubqBNJque5pzZOgOg1slA9xfPjhGJyvS5eLfOGkvj8VpsmZa
         riNg==
X-Gm-Message-State: ABy/qLbuV79qXcquAqpGxCWQl1DQ9NMJTxNg9UEcEgcBXL49+6dbScA2
        L+QNwJx/BjnczshFuLBU511jWp6xuZT+wdkgA/zJS4wMPhgUsVuK
X-Google-Smtp-Source: APBJJlEBQjWDQAcy1Rgnl2cOgFt6Q6Qzew81sNG8SyT2Z4sz6DY5xx5so3PsZTd81AmWwWnInZ7KcPEKGH3GFuhNHmI=
X-Received: by 2002:a67:e957:0:b0:443:d94e:c50b with SMTP id
 p23-20020a67e957000000b00443d94ec50bmr13021126vso.32.1689864759276; Thu, 20
 Jul 2023 07:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_E888A1BD4167B61E1D3EF3F8488A8B148A08@qq.com> <6c89e70749c462d441bd0c157d260570@208suo.com>
In-Reply-To: <6c89e70749c462d441bd0c157d260570@208suo.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jul 2023 16:52:28 +0200
Message-ID: <CAMRc=MfJbmJ7jkcZ-hQEpNKKtLJW7iU+AeZAWTHfnfn11J+aAg@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpio: Remove unnecessary spaces
To:     hanyu001@208suo.com
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 8:55=E2=80=AFAM <hanyu001@208suo.com> wrote:
>
> Fix checkpatch warnings:
>
> ./drivers/gpio/gpio-pca953x.c:1352: ERROR: space prohibited after that
> open parenthesis '('
> ./drivers/gpio/gpio-pca953x.c:1353: ERROR: space prohibited after that
> open parenthesis '('
> ./drivers/gpio/gpio-pca953x.c:1354: ERROR: space prohibited after that
> open parenthesis '('
> ./drivers/gpio/gpio-pca953x.c:1359: ERROR: space prohibited after that
> open parenthesis '('
> ./drivers/gpio/gpio-pca953x.c:1360: ERROR: space prohibited after that
> open parenthesis '('
>
> Signed-off-by: Yu Han <hanyu001@208suo.com>
> ---
>   drivers/gpio/gpio-pca953x.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index a806a3c..7f4f7ee 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1349,15 +1349,15 @@ static int pca953x_resume(struct device *dev)
>       { .compatible =3D "maxim,max7315", .data =3D OF_953X( 8, PCA_INT), =
},
>       { .compatible =3D "maxim,max7318", .data =3D OF_953X(16, PCA_INT), =
},
>
> -    { .compatible =3D "ti,pca6107", .data =3D OF_953X( 8, PCA_INT), },
> -    { .compatible =3D "ti,pca9536", .data =3D OF_953X( 4, 0), },
> -    { .compatible =3D "ti,tca6408", .data =3D OF_953X( 8, PCA_INT), },
> +    { .compatible =3D "ti,pca6107", .data =3D OF_953X(8, PCA_INT), },
> +    { .compatible =3D "ti,pca9536", .data =3D OF_953X(4, 0), },
> +    { .compatible =3D "ti,tca6408", .data =3D OF_953X(8, PCA_INT), },
>       { .compatible =3D "ti,tca6416", .data =3D OF_953X(16, PCA_INT), },
>       { .compatible =3D "ti,tca6424", .data =3D OF_953X(24, PCA_INT), },
>       { .compatible =3D "ti,tca9539", .data =3D OF_953X(16, PCA_INT), },
>
> -    { .compatible =3D "onnn,cat9554", .data =3D OF_953X( 8, PCA_INT), },
> -    { .compatible =3D "onnn,pca9654", .data =3D OF_953X( 8, PCA_INT), },
> +    { .compatible =3D "onnn,cat9554", .data =3D OF_953X(8, PCA_INT), },
> +    { .compatible =3D "onnn,pca9654", .data =3D OF_953X(8, PCA_INT), },
>       { .compatible =3D "onnn,pca9655", .data =3D OF_953X(16, PCA_INT), }=
,
>
>       { .compatible =3D "exar,xra1202", .data =3D OF_953X( 8, 0), },

This doesn't apply to my for-next tree. And the commit message should
be: "gpio: pca953x: ..."

Bart
