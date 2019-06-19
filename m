Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A886F4B8FA
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2019 14:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731328AbfFSMpq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jun 2019 08:45:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:37862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727244AbfFSMpq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Jun 2019 08:45:46 -0400
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C9052166E;
        Wed, 19 Jun 2019 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560948345;
        bh=sEeH2sT3LMrzoDDsjD18KBOTynl4B2h/n5bC8qrGlLA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lQOVQfiWVIDBuQhl4xvXos+TNmoQ7adeIRtMkpW81/tZxPOj1BLoQZhxT5c6NpWHr
         uTwCNObEalqCsDI5YLv2eEFgOIBSkBI2sLrpcX1uM/cbCKvklC0sOJ8vO6U8b14cio
         GT4s/wC0jxjpYxs+u9AlJPoa88tx+EniuYD45itQ=
Received: by mail-lj1-f172.google.com with SMTP id v24so3075100ljg.13;
        Wed, 19 Jun 2019 05:45:45 -0700 (PDT)
X-Gm-Message-State: APjAAAWvQ6+a7vQnbbC8ln9SQ6bVxcos+xsNAFhm0/fmg0uA8sJrkuDx
        tlQedkusEDiiQNv0nonUUOXlrIi70DErqqIrzNA=
X-Google-Smtp-Source: APXvYqyCd6gEigqXG0m6yG+w6Iq0Ycl9FJo+wIQEITv0L+zl4sCahXyDcYoY2flJBy9Y1rF+qCkEjR1aVh0+UC2VaDA=
X-Received: by 2002:a2e:12dc:: with SMTP id 89mr2724626ljs.40.1560948343329;
 Wed, 19 Jun 2019 05:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <1560938081892.33415@sensor-technik.de>
In-Reply-To: <1560938081892.33415@sensor-technik.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 19 Jun 2019 14:45:32 +0200
X-Gmail-Original-Message-ID: <CAJKOXPej57MJKe6ShinG+VJdG+XM4qhpeD3rQ2ZHzRTmO43+GA@mail.gmail.com>
Message-ID: <CAJKOXPej57MJKe6ShinG+VJdG+XM4qhpeD3rQ2ZHzRTmO43+GA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Fix return value mismatch of function gpiod_get_from_of_node()
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

On Wed, 19 Jun 2019 at 11:56, Waibel Georg
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
>  drivers/gpio/gpiolib.c                 | 6 +-----
>  drivers/regulator/da9211-regulator.c   | 2 ++
>  drivers/regulator/s2mps11.c            | 4 +++-
>  drivers/regulator/s5m8767.c            | 4 +++-
>  drivers/regulator/tps65090-regulator.c | 7 ++++---
>  5 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e013d417a936..be1d1d2f8aaa 100644
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
> index da37b4ccd834..0309823d2c72 100644
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
> index 134c62db36c5..b518a81f75a3 100644
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
>                         continue;
> diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
> index bb9d1a083299..6ca27e9d5ef7 100644
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

For s2mps11 and s5m8767 bits:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

The s2mps11 code brought a bug to my attention so you might rebase on top of it.

Best regards,
Krzysztof
