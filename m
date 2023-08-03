Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6276976EB80
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 16:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235362AbjHCOBJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 10:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236263AbjHCOAr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 10:00:47 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8004C2684
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 07:00:26 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-447be69ae43so351007137.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 07:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691071225; x=1691676025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjrJvLUs+zmIwV48g7/upiWCWVN7RxNzQgQkQQACevk=;
        b=3i6AxyAW8dkIOg/2bDq5/oh3V/vOqk2mfZcqSQ7bEqYHN3fPKr/j2e5lI//2tcxO0f
         YJsyGOSq0dVuEv2J3A+mRyARx51ZccbmU5fXZo5ekh0FGqhbWQq69kqfrxFU8gDLcXGq
         Y9VGee6rf0kLEFszWeuekIqn1Q+xUuJkQohKHNMX0jXNhHdVU3WRPpu9qqNFC4aaFXk1
         TdoEIyKucrB/xn8EdmRYjOb1JeqrOTZSOYK0+nldfHRGn/ToC9m0N7blKp7b2ZVwiACd
         upd1aMygAJ4jE/+1XM3Iy20hFtPC2JNdFLmNQrxhjfNHBgYMHvZxBjqz6nIT9QB6GeqA
         0dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071225; x=1691676025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjrJvLUs+zmIwV48g7/upiWCWVN7RxNzQgQkQQACevk=;
        b=fY1cGNISZdKEEFRzO720wMVkY6ADluBfArmn5WL7J4dX+3y8r6Comz8EbX4zMya/Ec
         n2CLrhg8NcXDHngCaymJEsENsN6Y2hFgxUTA8GMkPRejUoCKVqdoxBlES3KmdxafPxma
         +0T/WE3zf2WxDH83WXHNwAf7uAirEfFE//JK4he3ypfX5pwB81KiNX08N8mjB82ldAu/
         XM4e/1I/ZTDJ1hLazZ8307+yB0mhbHmyKK6ILf9gcK0+togu587MjOYpqxLYwjwnaWLo
         yipHM64+/3RI3X/Lm+Ad26NR9nPJqevQO0j+Hc/NhFIRMocU6/R5eI+0tPFkN7lKOnQc
         ZgaA==
X-Gm-Message-State: ABy/qLbhh6jL7qPOj0bQSIrLJ7vwStJUVuUOQ0tfccXffAPXu7buYB6i
        SwuSQo05MSAaKgkSL52/Uw7/09rEPUdaXPmOMa3uCw==
X-Google-Smtp-Source: APBJJlFApf4I8e567JtJ7Q0Cr7dbeQ3Ob1PD208nl5WrTotdut8WhVz8ldRjb3Rc6gQIOigEW3+9WMzhoR8mfSW7r7Q=
X-Received: by 2002:a05:6102:20b:b0:445:20ba:fb16 with SMTP id
 z11-20020a056102020b00b0044520bafb16mr4782350vsp.25.1691071225555; Thu, 03
 Aug 2023 07:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230802031749.16061-1-wangzhu9@huawei.com>
In-Reply-To: <20230802031749.16061-1-wangzhu9@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 16:00:10 +0200
Message-ID: <CAMRc=MfDtxxJ81AEx50_9i2Cy3MFVqwht5kHcrvPXDYVYPveJA@mail.gmail.com>
Subject: Re: [PATCH -next v2] gpio: lpc32xx: remove redundant CONFIG_OF and of_match_ptr()
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     linus.walleij@linaro.org, andy@kernel.org, vz@mleia.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        andriy.shevchenko@linux.intel.com
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

On Wed, Aug 2, 2023 at 5:18=E2=80=AFAM Zhu Wang <wangzhu9@huawei.com> wrote=
:
>
> The driver depends on CONFIG_OF, so it is not necessary to use
> CONFIG_OF and of_match_ptr() here, so we remove them all.
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
>  drivers/gpio/gpio-lpc32xx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
> index d2b65cfb336e..5ef8af824980 100644
> --- a/drivers/gpio/gpio-lpc32xx.c
> +++ b/drivers/gpio/gpio-lpc32xx.c
> @@ -525,17 +525,15 @@ static int lpc32xx_gpio_probe(struct platform_devic=
e *pdev)
>         return 0;
>  }
>
> -#ifdef CONFIG_OF
>  static const struct of_device_id lpc32xx_gpio_of_match[] =3D {
>         { .compatible =3D "nxp,lpc3220-gpio", },
>         { },
>  };
> -#endif
>
>  static struct platform_driver lpc32xx_gpio_driver =3D {
>         .driver         =3D {
>                 .name   =3D "lpc32xx-gpio",
> -               .of_match_table =3D of_match_ptr(lpc32xx_gpio_of_match),
> +               .of_match_table =3D lpc32xx_gpio_of_match,
>         },
>         .probe          =3D lpc32xx_gpio_probe,
>  };
> --
> 2.17.1
>

Applied, thanks!

Bart
