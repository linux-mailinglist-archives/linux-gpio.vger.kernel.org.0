Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 244BD4D0152
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Mar 2022 15:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237783AbiCGOe0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Mar 2022 09:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243231AbiCGOeX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2022 09:34:23 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979B13AA41
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 06:33:28 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id d10so32339641eje.10
        for <linux-gpio@vger.kernel.org>; Mon, 07 Mar 2022 06:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gX0VA6G+m/fx1Btx4oSZIKt5x8VtazQqeF2Zzwz+qYc=;
        b=iJUIDDKLOPdWItQyphmj7LpSXG3tIZGArCCQOTt4CF1F3NN2giBXuKYzQjlJZs7kZ9
         meBzE/SjbB8h8M/YdAFwDzFL/eYOitVpCEfgCkC224Dgiq61z8wp91/fxMhW7bkJSkdj
         OBPeEkKgzX/nc+xQcYXesC+k1Uv6lfoShTkYnxReVlKcsEY1ELEj3w7APsQ1Qle7lcAs
         jGsaRA28GMkAQmsorSXNryFcywNrpHgTAucrKq7t1Sdi8LSsi39lP5phf0+o+72ASTk0
         qtTbS+7sNhB/dD7bDctWC6ee8LvUecpoLgTpwvpLYTyjeb9D3eHGkLv1D5je4snKxxQ+
         ZD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gX0VA6G+m/fx1Btx4oSZIKt5x8VtazQqeF2Zzwz+qYc=;
        b=ilahAgbhqJrvsm84u26dnNAV1arBkHQrtMrSgtXHbHc+n/YRwzRvP4vWe+ehVWQZn2
         AatFRZxqhLAmY1EdSp9TzzyEpAvaJ1g9BkOqkRT/1OCeocdRw0YZ/XgMJ27G8AQVCQlO
         5sG7rmm5D+ZMK/qmOnHmC6sskgQf9DAtulBPbAj4G9HJ0ik5zA1c8vjOlRcGuiGPpq8i
         Brw8yktzMhdLKusr4mISOR0+Ie3dm4K66PWtjuNrLS5QFdt3/iO+259qZqOYVF+SXc+y
         3SpubhVTCbwyeiti9Qbvx77jNd+3SzH2NgxVH0lL9QmF8W/ogGQoIWE8E52+YKc9aGM2
         X3og==
X-Gm-Message-State: AOAM533VFwzGEDML4ycY1hYeLW0MUQfN5LwdIN7ZsTdkIRKrH/YBPMFD
        6qUXa1bCG0Wz0Jk6P5qec30leYN1XmNUubwUVuByJSHy7cI+Bw==
X-Google-Smtp-Source: ABdhPJzj/3liPkwVOlu1feutaA0UkA9vnyA93ILCkc0CWbYLSnerDF1GMcEzni9G0ChIMAqxXzMw8R2BawsGlDWAVCw=
X-Received: by 2002:a17:907:72c3:b0:6ce:5256:1125 with SMTP id
 du3-20020a17090772c300b006ce52561125mr9575123ejc.697.1646663607082; Mon, 07
 Mar 2022 06:33:27 -0800 (PST)
MIME-Version: 1.0
References: <20220307141955.28040-1-alifer.m@variscite.com>
In-Reply-To: <20220307141955.28040-1-alifer.m@variscite.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 7 Mar 2022 15:33:16 +0100
Message-ID: <CAMRc=Mf0uBOHe=Ff6_1GcpEPX4d4wYJsnBBE=Mri-Um_sq2nog@mail.gmail.com>
Subject: Re: [PATCH] driver: pca953x: avoid error message when resuming
To:     Alifer Moraes <alifer.m@variscite.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        eran.m@variscite.com, Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        pierluigi.p@variscite.com,
        FrancescoFerraro <francesco.f@variscite.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 7, 2022 at 3:20 PM Alifer Moraes <alifer.m@variscite.com> wrote:
>
> From: FrancescoFerraro <francesco.f@variscite.com>
>
> Avoids the error messages "pca953x 1-0020: failed reading register"
> when resuming from suspend using gpio-key attached to pca9534.
>

The commit message should read: "gpio: pca953x: ..."

> Signed-off-by: Francesco Ferraro <francesco.f@variscite.com>
> Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index d2fe76f3f34f..4f35b75dcbb1 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -211,6 +211,7 @@ struct pca953x_chip {
>         struct regulator *regulator;
>
>         const struct pca953x_reg_config *regs;
> +       int is_in_suspend;

Something like this is not needed because we already have
pm_runtime_status_suspended().

>  };
>
>  static int pca953x_bank_shift(struct pca953x_chip *chip)
> @@ -412,7 +413,8 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *
>
>         ret = regmap_bulk_read(chip->regmap, regaddr, value, NBANK(chip));
>         if (ret < 0) {
> -               dev_err(&chip->client->dev, "failed reading register\n");
> +               if (!chip->is_in_suspend)
> +                       dev_err(&chip->client->dev, "failed reading register\n");
>                 return ret;
>         }
>
> @@ -954,6 +956,7 @@ static int pca953x_probe(struct i2c_client *client,
>         chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
>         if (chip == NULL)
>                 return -ENOMEM;
> +       chip->is_in_suspend = 0;
>
>         pdata = dev_get_platdata(&client->dev);
>         if (pdata) {
> @@ -1161,6 +1164,8 @@ static int pca953x_suspend(struct device *dev)
>         else
>                 regulator_disable(chip->regulator);
>
> +       chip->is_in_suspend = 1;
> +
>         return 0;
>  }
>
> @@ -1189,6 +1194,8 @@ static int pca953x_resume(struct device *dev)
>                 return ret;
>         }
>
> +       chip->is_in_suspend = 0;
> +
>         return 0;
>  }
>  #endif
> --
> 2.25.1
>

Can you elaborate more on the circumstances in which you're seeing this?

Bart
