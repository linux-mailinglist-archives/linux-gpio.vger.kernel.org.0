Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A6A2C89A4
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 17:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgK3QgM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 11:36:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgK3QgM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 11:36:12 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574B8C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 08:35:32 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id f9so20778676ejw.4
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 08:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IPvgzKD5vh/JDBkNRt1Gw/YkqJ5iuNUgq4ms3O6qORI=;
        b=h7ag0cE786+tOWe4GIfQmBaprFk7lYzHSdZgEUdEckRJAk3em/e5sL2xlMNvlirRoy
         8BhkCC2O2ZsDE7Oplc1fe6zrowvmRdTGY1xPyM1XGxrbYsg5jVIbUuFI3nTvxyd6mQSc
         Tgg/iayW+bc21j2igFUUiYriFODFyMTq7m7sit0T7EFPjTOVs0aIWE5PR/a98eku6J58
         V19YLsPFqcwSW+Z7/zbUVlybVIE+WmIM3/8hIfQo+UU+iylJ2mEsSaHCoWcxVNh1f7K6
         s0miEhN777LD9PXEMzMMxgCUkZiW60f1DmraxHfGWKfp8pC97HCj1bPXyDW/Q6YdO4JV
         3kfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IPvgzKD5vh/JDBkNRt1Gw/YkqJ5iuNUgq4ms3O6qORI=;
        b=omWp+RulOeuWGEm2A9OZs1et9BixV4f+yikZ2MnFO1YJWBt9B3kMjchPNQwQjbYuKS
         k2t//whTiyxTrRvgdHnpavulYphLPmRLzCiBtRbDeOsGqh2mIu/BR4PMPrB1q7eWZ184
         ob0fOzfW1Ic9OWhGmwJ31QmLhDVqXI2il+NEpRh+GwbQ2q368G+NHKpbEoj9Ah2YztuR
         xI7cmKTtzMzGGxT3LbpR/8wfiZhkGeNeUmbKAZGZz4UwQnfwGf6OMaKUtRriI7pMftDZ
         y6lcUDzvgNXoeyD+cewvQV7lWGl2qfkR5tcM70y9OOSFubg1ITdkw288YhJ35Opc3zAN
         2jAA==
X-Gm-Message-State: AOAM532qwn1m7lpVr+FP8XSpqjjI9rfA09HPM36UHbqvEk/+mn7bY/kL
        WeTKVfTIEfr7cTIbwHaor4gop4FPZjw1A7nVUJKKGQ==
X-Google-Smtp-Source: ABdhPJwFvLpQLnnUH4Ru7vXiOmsRDH9OHOXWGGfKjmcMf8Uy4b1ExDYaJ8opX2p6QsEwHnorCpsmZJ3Y5MWJ6Gi/MR8=
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr7144320ejl.155.1606754131105;
 Mon, 30 Nov 2020 08:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20201130105749.71659-1-damien.lemoal@wdc.com>
In-Reply-To: <20201130105749.71659-1-damien.lemoal@wdc.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 30 Nov 2020 17:35:20 +0100
Message-ID: <CAMpxmJW_C28jp4kuhoytEMsg+gN3vnVFPNThqbfF_nBBfqJ7aQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Remove unnecessary error message
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 30, 2020 at 11:57 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> In dwapb_get_reset(), if devm_reset_control_get_optional_shared() fails,
> an error message is printed even if the failure is the benign
> EPROBE_DEFER error due to the reset controller not yet being
> initialized. Use dev_err_probe() to handle
> devm_reset_control_get_optional_shared() errors to avoid unnecessarilly
> printing an error message for the deferred probe error.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 2a9046c0fb16..ec4f6ceaae68 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -616,10 +616,9 @@ static int dwapb_get_reset(struct dwapb_gpio *gpio)
>         int err;
>
>         gpio->rst = devm_reset_control_get_optional_shared(gpio->dev, NULL);
> -       if (IS_ERR(gpio->rst)) {
> -               dev_err(gpio->dev, "Cannot get reset descriptor\n");
> -               return PTR_ERR(gpio->rst);
> -       }
> +       if (IS_ERR(gpio->rst))
> +               return dev_err_probe(gpio->dev, PTR_ERR(gpio->rst),
> +                                    "Cannot get reset descriptor\n");
>
>         err = reset_control_deassert(gpio->rst);
>         if (err) {
> --
> 2.28.0
>

Applied, thanks!

Bartosz
