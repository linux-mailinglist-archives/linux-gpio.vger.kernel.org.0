Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37F865B882A
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Sep 2022 14:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiINMY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Sep 2022 08:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiINMYz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2022 08:24:55 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02775E084
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 05:24:52 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id dv25so34242015ejb.12
        for <linux-gpio@vger.kernel.org>; Wed, 14 Sep 2022 05:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=dp8v8j3jVFgioN3doGrFi86sq8MJxVA0G0CW4bzQVC8=;
        b=XlU50h5k3mfN+63k8WVAOUF5Y/nxel50rNZG/+MR3G3jTiG0JfwkN7GGMw0tCu1YDI
         RMYHlBth/oZb2NrQ6TzRsx/lNWUnhGc6IFJI6Sv5WDuFNzHnYujaRBAJa/13hYuCHnSi
         REzlHLZ1pnJXPvU3AZhmh0XWqTxeQhO+uLQyT9tM7c6qp7uCbh3gX+kjhCMcbjvyXRl8
         0X8fyLqlVz5AeL1InNz/ppbAm+eOzS8VT63MI1MyXHbAIbe4MKYruoN01s7LdXoS2jX2
         zF9E32z8GnI7lVWnKq1r0Jv3u9PS5Uofo8QS+5QT7JQ18+Wu6QQM/oRe6huRarsegDs6
         q7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dp8v8j3jVFgioN3doGrFi86sq8MJxVA0G0CW4bzQVC8=;
        b=OVSMeBjWxdVztZmrtgBbFOzP8iipyRTUJQuWVnhxEHAgFWJoAZWAfA6vVFwMO6OScN
         hvMXV2ks0MgY7pEovggHT6z0ygdBi3rqp/5a4NUDxaO3MgpN2xpva3+ZPbHjaB0FsiId
         O/FKHj8fU67WQOz7fnQDTkf1yovMxGuWrH6Ajsrdg08zGVv9yD9hEMxg7KnlxRsSVft1
         Xt+GW7a6vWoe37SHWME0dP2j55+fCNqF2svO53hlBeQ9Jjh61AG8YSUestWMX+9PL6Rj
         Pbg9CF0Gn3o5GaOe7W0JAsrYqb7PnB5v41Jf52jDfVI++9gAFrYKWIvxfaQ1IPnDiJwW
         pyzg==
X-Gm-Message-State: ACgBeo1p0/WWmnv0yxd26ff2OSABfSMd1lkDtZNOg4yDyNzoAZOnZqoo
        mp1rfGRt5eOfliiquQ9EbpTRjJkdOPInQvpgukb9HA==
X-Google-Smtp-Source: AA6agR7Qj+8+6rghj+DhrIzy5c/ptXNUZbJDAD2tTJu8U6/Ho80b0aelfMQGDfpABREMoT4uvxFdF4x3cJbyyL3HTw8=
X-Received: by 2002:a17:906:6a0f:b0:779:2fc:9a51 with SMTP id
 qw15-20020a1709066a0f00b0077902fc9a51mr20071666ejc.101.1663158291216; Wed, 14
 Sep 2022 05:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220913164639.403025-1-sergio.paracuellos@gmail.com> <20220913164639.403025-2-sergio.paracuellos@gmail.com>
In-Reply-To: <20220913164639.403025-2-sergio.paracuellos@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 14 Sep 2022 14:24:40 +0200
Message-ID: <CAMRc=Me2EzOTVcpJojG3VgDd164rDZdTVaQXqrB7YFyhYD-K0w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: Switch to use platform_get_irq() function
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        arinc.unal@arinc9.com, matthias.bgg@gmail.com, neil@brown.name
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

On Tue, Sep 13, 2022 at 6:46 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Mt7621 SoC GPIO driver is a platform driver so we can directly use
> 'platform_get_irq' instead of 'irq_of_parse_and_map'.
>
> Tested-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
> Change in v2:
> - Make independent PATCH since this must go to next branch.
>
>  drivers/gpio/gpio-mt7621.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index f163f5ca857b..93facbebb80e 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -9,7 +9,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> -#include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
>
> @@ -299,7 +298,6 @@ static int
>  mediatek_gpio_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> -       struct device_node *np =3D dev->of_node;
>         struct mtk *mtk;
>         int i;
>         int ret;
> @@ -312,7 +310,10 @@ mediatek_gpio_probe(struct platform_device *pdev)
>         if (IS_ERR(mtk->base))
>                 return PTR_ERR(mtk->base);
>
> -       mtk->gpio_irq =3D irq_of_parse_and_map(np, 0);
> +       mtk->gpio_irq =3D platform_get_irq(pdev, 0);
> +       if (mtk->gpio_irq < 0)
> +               return mtk->gpio_irq;
> +
>         mtk->dev =3D dev;
>         platform_set_drvdata(pdev, mtk);
>
> --
> 2.25.1
>

Applied, thanks!

Bart
