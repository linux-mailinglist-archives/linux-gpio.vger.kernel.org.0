Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71E364E041
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2019 08:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbfFUGHU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Jun 2019 02:07:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:46856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfFUGHU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 Jun 2019 02:07:20 -0400
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06D5B214AF;
        Fri, 21 Jun 2019 06:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561097239;
        bh=KknwHMJjpccYcMKRX360itgyWBoFtU2UT6fvF1AkfDU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L3MFdCX86vWeynVoGWGNcPpAS78gc+tmRnnlnkI1YNI5zGKILWM3jBxqYT1z4zBg+
         5vReH/ZO+ExLGw2/DR2MGqlnNQb7uIvGScFBJo0/baPxnlf6pNdcePW5AmUh3iyQKj
         je4zrMBD+kaWif/fmCm6QHEs1d8L3O2ctu1m7+hI=
Received: by mail-lf1-f45.google.com with SMTP id z15so4090981lfh.13;
        Thu, 20 Jun 2019 23:07:18 -0700 (PDT)
X-Gm-Message-State: APjAAAV3u7TTushMNhAKLmglA0llpDZmanRyqRkJh+B/Nv5ccb7Hz4+O
        PJlKWCoJBHAHSB/KnrRI806d78zS5dEjtZA7V1c=
X-Google-Smtp-Source: APXvYqz6uGTo2fBNH4dZ7z5NTpj+FDvFjriFcekrS3PTjDclP8VyU5ySdzE/tfmn9/UrGCzgW1Jygo0TAB3o4pqxQ8I=
X-Received: by 2002:ac2:4d1c:: with SMTP id r28mr28515447lfi.159.1561097237252;
 Thu, 20 Jun 2019 23:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <1560938081892.33415@sensor-technik.de> <CAJKOXPej57MJKe6ShinG+VJdG+XM4qhpeD3rQ2ZHzRTmO43+GA@mail.gmail.com>
 <1561066629320.13520@sensor-technik.de>
In-Reply-To: <1561066629320.13520@sensor-technik.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 21 Jun 2019 08:07:06 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfW40SwW8oMp+sFfc2K2nBn4sB=BDVPRZPMU1dQPzyBrg@mail.gmail.com>
Message-ID: <CAJKOXPfW40SwW8oMp+sFfc2K2nBn4sB=BDVPRZPMU1dQPzyBrg@mail.gmail.com>
Subject: Re: [PATCH V2] gpio: Fix return value mismatch of function gpiod_get_from_of_node()
To:     Waibel Georg <Georg.Waibel@sensor-technik.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 20 Jun 2019 at 23:37, Waibel Georg
<Georg.Waibel@sensor-technik.de> wrote:
>
> In case the requested gpio property is not found in the device tree, some
> callers of gpiod_get_from_of_node() expect a return value of NULL, others
> expect -ENOENT.
> In particular devm_fwnode_get_index_gpiod_from_child() expects -ENOENT.
> Currently it gets a NULL, which breaks the loop that tries all
> gpio_suffixes. The result is that a gpio property is not found, even
> though it is there.
>
> This patch changes gpiod_get_from_of_node() to return -ENOENT instead
> of NULL when the requested gpio property is not found in the device
> tree. Additionally it modifies all calling functions to properly
> evaluate the return value.
>
> Another approach would be to leave the return value of
> gpiod_get_from_of_node() as is and fix the bug in
> devm_fwnode_get_index_gpiod_from_child(). Other callers would still need
> to be reworked. The effort would be the same as with the chosen solution.
>
> Signed-off-by: Georg Waibel <georg.waibel@sensor-technik.de>
> ---
>
> V2: Rebased on top of [PATCH] regulator: s2mps11: Fix ERR_PTR dereference on GPIO lookup failure
>
> ---
>  drivers/gpio/gpiolib.c                 | 6 +-----
>  drivers/regulator/da9211-regulator.c   | 2 ++
>  drivers/regulator/s2mps11.c            | 4 +++-
>  drivers/regulator/s5m8767.c            | 4 +++-
>  drivers/regulator/tps65090-regulator.c | 7 ++++---
>  5 files changed, 13 insertions(+), 10 deletions(-)

You missed my tag from v1:

For s2mps11 and s5m8767 bits:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e013d41..be1d1d2 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4244,8 +4244,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_index);
>   *
>   * Returns:
>   * On successful request the GPIO pin is configured in accordance with
> - * provided @dflags. If the node does not have the requested GPIO
> - * property, NULL is returned.
> + * provided @dflags.
>   *
>   * In case of error an ERR_PTR() is returned.
>   */
> @@ -4267,9 +4266,6 @@ struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
>                                         index, &flags);
>
>         if (!desc || IS_ERR(desc)) {
> -               /* If it is not there, just return NULL */
> -               if (PTR_ERR(desc) == -ENOENT)
> -                       return NULL;
>                 return desc;
>         }
>
> diff --git a/drivers/regulator/da9211-regulator.c b/drivers/regulator/da9211-regulator.c
> index da37b4c..0309823 100644
> --- a/drivers/regulator/da9211-regulator.c
> +++ b/drivers/regulator/da9211-regulator.c
> @@ -289,6 +289,8 @@ static struct da9211_pdata *da9211_parse_regulators_dt(
>                                   0,
>                                   GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
>                                   "da9211-enable");
> +               if (IS_ERR(pdata->gpiod_ren[n]))
> +                       pdata->gpiod_ren[n] = NULL;
>                 n++;
>         }
>
> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
> index af9bf10..209d1ff 100644
> --- a/drivers/regulator/s2mps11.c
> +++ b/drivers/regulator/s2mps11.c
> @@ -821,7 +821,9 @@ static void s2mps14_pmic_dt_parse_ext_control_gpio(struct platform_device *pdev,
>                                 0,
>                                 GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
>                                 "s2mps11-regulator");
> -               if (IS_ERR(gpio[reg])) {
> +               if (PTR_ERR(gpio[reg]) == -ENOENT)
> +                       gpio[reg] = NULL;
> +               else if (IS_ERR(gpio[reg])) {
>                         dev_err(&pdev->dev, "Failed to get control GPIO for %d/%s\n",
>                                 reg, rdata[reg].name);
>                         gpio[reg] = NULL;
> diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
> index bb9d1a0..6ca27e9 100644
> --- a/drivers/regulator/s5m8767.c
> +++ b/drivers/regulator/s5m8767.c
> @@ -574,7 +574,9 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
>                         0,
>                         GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
>                         "s5m8767");
> -               if (IS_ERR(rdata->ext_control_gpiod))
> +               if (PTR_ERR(rdata->ext_control_gpiod) == -ENOENT)
> +                       rdata->ext_control_gpiod = NULL;
> +               else if (IS_ERR(rdata->ext_control_gpiod))
>                         return PTR_ERR(rdata->ext_control_gpiod);
>
>                 rdata->id = i;
> diff --git a/drivers/regulator/tps65090-regulator.c b/drivers/regulator/tps65090-regulator.c
> index ca39b3d..10ea4b5 100644
> --- a/drivers/regulator/tps65090-regulator.c
> +++ b/drivers/regulator/tps65090-regulator.c
> @@ -371,11 +371,12 @@ static struct tps65090_platform_data *tps65090_parse_dt_reg_data(
>                                                                     "dcdc-ext-control-gpios", 0,
>                                                                     gflags,
>                                                                     "tps65090");
> -                       if (IS_ERR(rpdata->gpiod))
> -                               return ERR_CAST(rpdata->gpiod);
> -                       if (!rpdata->gpiod)
> +                       if (PTR_ERR(rpdata->gpiod) == -ENOENT) {
>                                 dev_err(&pdev->dev,
>                                         "could not find DCDC external control GPIO\n");
> +                               rpdata->gpiod = NULL;
> +                       } else if (IS_ERR(rpdata->gpiod))
> +                               return ERR_CAST(rpdata->gpiod);
>                 }
>
>                 if (of_property_read_u32(tps65090_matches[idx].of_node,
> --
> 2.7.4
>
