Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E530376BDB0
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 21:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbjHAT1U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 15:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjHAT1T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 15:27:19 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC8A199F
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 12:27:18 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-486486724e7so2176066e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2023 12:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690918037; x=1691522837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9v8j1gDl2yQFrNITrHHzLI7f+AvshVPungI27MCr48=;
        b=o4nxGXrWhh5P/sjYm9o3pPrsYG4DpAxwcAuOnckdTt2w72Z1g6HkP6k8NQfMAa+SwB
         jsPrCTdEOSTGt+BBFInyD4vMGUJokxvrxKfT1MvFtF9tXerlVWD2uS9Jx7LIRTYWedL/
         brNuLtHWN45UN2AuYmnjoYVnUTGXLZl9vRkOva1UCDiK9VdxgaEmL28P0ZyYp/IhvIMx
         1xJUGOK+LW78Fyacncom1/tAXwbb9dkVPvAF2r2l7mAzHhdvELNCfCHsWSyyRx/Eyk4V
         LLczbVLdz5Dy84ZP+gsMGe3N2SDggxUskkCcbAOeo7JKtfRTx9e03kdNurAewU73PGy0
         4XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690918037; x=1691522837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9v8j1gDl2yQFrNITrHHzLI7f+AvshVPungI27MCr48=;
        b=BNulSrigDmeDRqIi2ZQ0tJ1nP8Dh5/5hh4G2V9CZtu3+TOu58NM7Pzmz9+nf07oHya
         x0mTmC125gKkLNkhA0MbjKCoC/w2QgW0KKhrwxpgYkLgBaNLOupv8PG6G+zCVoZmK6oo
         qLAQZc8LRF5EZ/EIoSaRq1WLo9C2iMwsnFnXgjRK+JV2BYHwHtll27TaHyStOFazLKY9
         3ZqBY83HZLrDHpYJUQJJAffkm3VhtSfga/MIabLpO2MLUjrtk3FoSheq+xCLDitXTjLX
         hL7AAJkxoA/2P78d36hVHgoJEp0TMGw9jWClSfGhI8ni2rcG/9nIReqKGcrtlDmVy/eu
         bMmQ==
X-Gm-Message-State: ABy/qLbvh1lb66vKNsbGD+foviBTcZbTs9wxfaNszcj4obAlZBew2edr
        WnITuVTUfyW3QbAwd1YP7Whzi/MjUTHdYDt+5Y+vYQ==
X-Google-Smtp-Source: APBJJlFIxquZIRQBAQBXR7MAFOcvfcn1zEiWvBQvDYKkkz4H5OV4hxqlNfxzckNTSrUpPbddsCM+d24mAyKhTLLJaY4=
X-Received: by 2002:a67:e3b1:0:b0:443:9037:d8e4 with SMTP id
 j17-20020a67e3b1000000b004439037d8e4mr2803048vsm.8.1690918037521; Tue, 01 Aug
 2023 12:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230728182009.18445-1-aboutphysycs@gmail.com>
In-Reply-To: <20230728182009.18445-1-aboutphysycs@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 1 Aug 2023 21:27:06 +0200
Message-ID: <CAMRc=McrsV6LG10eC70aCrk6i3T=1kQN8DJNPLLa8HzHNjNQPg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rc5t583: remove unneeded call to platform_set_drvdata()
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        andy@kernel.org, linus.walleij@linaro.org,
        Alexandru Ardelean <alex@shruggie.ro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 28, 2023 at 8:20=E2=80=AFPM Andrei Coardos <aboutphysycs@gmail.=
com> wrote:
>
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Als=
o,
> the private data is defined in this driver, so there is no risk of it bei=
ng
> accessed outside of this driver file.
>
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>  drivers/gpio/gpio-rc5t583.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
> index 4fae3ebea790..c34dcadaee36 100644
> --- a/drivers/gpio/gpio-rc5t583.c
> +++ b/drivers/gpio/gpio-rc5t583.c
> @@ -121,8 +121,6 @@ static int rc5t583_gpio_probe(struct platform_device =
*pdev)
>         if (pdata && pdata->gpio_base)
>                 rc5t583_gpio->gpio_chip.base =3D pdata->gpio_base;
>
> -       platform_set_drvdata(pdev, rc5t583_gpio);
> -
>         return devm_gpiochip_add_data(&pdev->dev, &rc5t583_gpio->gpio_chi=
p,
>                                       rc5t583_gpio);
>  }
> --
> 2.34.1
>

Applied, thanks!

Bartosz
