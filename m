Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F147076BD85
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 21:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbjHATRa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 15:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbjHATRa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 15:17:30 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2FEE57
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 12:17:29 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-486519e5da0so1971122e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2023 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690917448; x=1691522248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L+iOF5bSW6XdMXr9Ynnmz8LI7vyk2zp11eaz+tAs80=;
        b=eagdrB6ZvRLeLdZaZF2Sg2kaLOSwZXsd5kYPxMNni5EjIYRD8L8432yJpYrMLvp6QO
         b22FSIBAjBRQ+A90JVDxWSb4e1FSPLuWvfAeQaI+HmwZleAdbKPXhziIg8I49BLI5nL/
         IeSFDvJZcQ42dRl4sbr2SmbW4H+x51LyLJhsUhI7FN166bFGXHhDaZ626Q4qfHakwPTO
         I0M8Wwb0TUmNOY4r4rJNqvDJTLIYL0K3OpDX04JAd7LvP8hIHGUSXGaDhQVYQkKHMmb9
         AgENCoXZwh0vOLD5UxQONtdLv2TX4VaID7ug6hb4+zJX0U7em7Sf64k4QCkU7OIJUd9a
         tmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690917448; x=1691522248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6L+iOF5bSW6XdMXr9Ynnmz8LI7vyk2zp11eaz+tAs80=;
        b=Xf/Zj1Rn2LRYSPS+sn54y8IohMuplWu37Bxo+TSCzx2VPxOg1nlnpYNxCbM1ixPl65
         fOecsebCAwZHh899cLheSpQ03Xgl3jku6NNrRLiwsjh6lHm4eOvDNpny7MHgx0ofEy63
         /CiiBgogIg95YZsTJj5wTohk/WBnhR+mdqNGpoQDwQANzBA8Y6Mm3DbvYH6fjH4w5LQb
         nXg94pmY2VrZjiJCniQ/ITme3b+yfumVJ7F6sKjIpMIErS2HL9m2U1cMg2JldRbIEw1p
         mvd2zqgWKjohYx4uONnnLQ4KvJWVX+2X0IZcGEk0dGielJzCN8Xs8pfYwV57HUYiOMRt
         UlTA==
X-Gm-Message-State: ABy/qLYV9/pIRUEys0AKz3q3MpOYQdHASJcaoiFby8RGHyDfinY5+lc2
        8N23R63LKoR79q/Y0+IBJXadpAH7ftndmFIxDy7ZCw==
X-Google-Smtp-Source: APBJJlEj5FAIcIbHHwjpcQkQwYzzBjINvHE8qO4x9/jeGb0Jx2z0kGRwV1IM/nEP+tEip82RgYRot+fwhTcXjEWQDqo=
X-Received: by 2002:a1f:6015:0:b0:481:388e:b903 with SMTP id
 u21-20020a1f6015000000b00481388eb903mr2400679vkb.10.1690917444891; Tue, 01
 Aug 2023 12:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230725102532.3989-1-aboutphysycs@gmail.com>
In-Reply-To: <20230725102532.3989-1-aboutphysycs@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 1 Aug 2023 21:17:13 +0200
Message-ID: <CAMRc=MfvsRyAKnTUYZ-Xjq3mj_8XZHnLB9==AaxGpna7_jc2Sg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: lp3943: remove unneeded platform_set_drvdata() call
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

On Tue, Jul 25, 2023 at 12:25=E2=80=AFPM Andrei Coardos <aboutphysycs@gmail=
.com> wrote:
>
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call, to access the private data of the driver.
> Also, the private data is defined in this driver, so there is no risk of
> it being accessed outside of this driver file.
>
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>
> Changelog V1->V2:
> * https://lore.kernel.org/linux-gpio/CAHp75VdU1c1vUoRpbekPXoLg2DDcbSThwUm=
kdHRT2FaZ9kagRA@mail.gmail.com/T/#t
> * https://lore.kernel.org/linux-gpio/ZLpdOYxo2U+uO%2FH3@smile.fi.intel.co=
m/T/#t
> * fixed subject line: adjusted colons where needed
>
>  drivers/gpio/gpio-lp3943.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
> index 79edd5db49d2..8e58242f5123 100644
> --- a/drivers/gpio/gpio-lp3943.c
> +++ b/drivers/gpio/gpio-lp3943.c
> @@ -199,8 +199,6 @@ static int lp3943_gpio_probe(struct platform_device *=
pdev)
>         lp3943_gpio->chip =3D lp3943_gpio_chip;
>         lp3943_gpio->chip.parent =3D &pdev->dev;
>
> -       platform_set_drvdata(pdev, lp3943_gpio);
> -
>         return devm_gpiochip_add_data(&pdev->dev, &lp3943_gpio->chip,
>                                       lp3943_gpio);
>  }
> --
> 2.34.1
>

Applied, thanks!

Bartosz
