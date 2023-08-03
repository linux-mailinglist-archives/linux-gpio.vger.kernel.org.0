Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7EB76EB87
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 16:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236416AbjHCOBZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 10:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236095AbjHCOBI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 10:01:08 -0400
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EF219A0
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 07:00:41 -0700 (PDT)
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-7948c329363so370331241.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691071240; x=1691676040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKnMGV/rNlTTSszugdC04pEHRs/IxOc40G8p180pTzQ=;
        b=FwFGbLtBzyiaImuMaI23pAxgOIMQreMHQK7P0pWaC8/cqn778EpXPZ5TuAY5o42daz
         4eni11z+o57mUVCH+VC+v0P757gG8YKU6PraYOOycLt4L3D6MxhnhBdUzs8/bECp3kNB
         mrVw9KMKY6pXDgxwrqS0/etJfASFgKWnnbmwun5EB1mrUIEJwkD0lmlEDp2FowVlzwf8
         8wTYXxfPMrprOV6Z9FZy/QsRcaB0TClmRe5fiZbq8Kf1e3uaiulHOgSr5ZZBPlLH16VL
         X1ZznOCWbX3OqvPOSl1b+ZBzyRb10xtdbmjsjQ4xBFzYyU0cSazD6tmCuiDbs3ThzH4s
         NL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071240; x=1691676040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKnMGV/rNlTTSszugdC04pEHRs/IxOc40G8p180pTzQ=;
        b=BfI82QpzplYrxnqMqAE5xGZRlF6fXQNwZPdH9euX3sSVGahA88ov+FnVyaQSE+5oYg
         Y23bouujR2QJDDA+0RL5k7UL1HL/ya1WgVgx53b9YblGvYyMZndU6BKKhJIFwWqrJn84
         BNN4++PJLDxg86FvBpAg2bW3mngZ4gTpV9IQYFe3oq+YlUfNyjFOi2G8yZmfALMa0ZkO
         uOpYDFUWyE+iOK8RhKhr70IWS037OczA3aeG1WCrQfm8PeSgmdhywMeMQYS/2+KP0GuF
         abZ/rERpDgLUAlIkQY7EE4zaRLNK9QRhiNLwrZqGIjMLKj45vsl6gUvQELW3kP6MHEl2
         IKaw==
X-Gm-Message-State: ABy/qLZ77NjeaPH8hop7Bv1qZUm9+cI3h6+mTnh/jFtuI+his8RTnHW+
        OIIOgdkevsc5SDwGTftHoqTEc2t01mJeVQuTWO0dsA==
X-Google-Smtp-Source: APBJJlGYwSDCQrQjIzNUYJ/345qTZh2ENVpCzjkGgB+IaMTAqNaEHCfOKKUzkpQEUxRJchSAk2IIkGTDJALZ/z1hBBY=
X-Received: by 2002:a67:ec58:0:b0:443:7170:b048 with SMTP id
 z24-20020a67ec58000000b004437170b048mr7482723vso.27.1691071240359; Thu, 03
 Aug 2023 07:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230802022403.146920-1-wangzhu9@huawei.com>
In-Reply-To: <20230802022403.146920-1-wangzhu9@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 16:00:27 +0200
Message-ID: <CAMRc=McSFehmAFmkN1qffY3VYGHqsqyGsKzZg2uViNBcJT69pQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] gpio: altera-a10sr: remove redundant of_match_ptr
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     thor.thayer@linux.intel.com, linus.walleij@linaro.org,
        andy@kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com
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

On Wed, Aug 2, 2023 at 4:24=E2=80=AFAM Zhu Wang <wangzhu9@huawei.com> wrote=
:
>
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr() here.
>
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr().
>
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ---
> Changes in v2:
> - Change of_match_ptr to of_match_ptr()
> - Include mod_devicetable.h
> ---
>  drivers/gpio/gpio-altera-a10sr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-altera-a10sr.c b/drivers/gpio/gpio-altera-=
a10sr.c
> index be1ed7ee5225..11edf1fe6c90 100644
> --- a/drivers/gpio/gpio-altera-a10sr.c
> +++ b/drivers/gpio/gpio-altera-a10sr.c
> @@ -9,6 +9,7 @@
>
>  #include <linux/gpio/driver.h>
>  #include <linux/mfd/altera-a10sr.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/property.h>
>
> @@ -104,7 +105,7 @@ static struct platform_driver altr_a10sr_gpio_driver =
=3D {
>         .probe =3D altr_a10sr_gpio_probe,
>         .driver =3D {
>                 .name   =3D "altr_a10sr_gpio",
> -               .of_match_table =3D of_match_ptr(altr_a10sr_gpio_of_match=
),
> +               .of_match_table =3D altr_a10sr_gpio_of_match,
>         },
>  };
>  module_platform_driver(altr_a10sr_gpio_driver);
> --
> 2.17.1
>

Applied, thanks!

Bart
