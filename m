Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6D41671F8F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jan 2023 15:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbjARO2p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Jan 2023 09:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjARO2X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Jan 2023 09:28:23 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCDD717A3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 06:14:32 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id k6so26916816vsk.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jan 2023 06:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yplg9S1JhovxIGfaL6Q6VaDnzZMitHU7C7LFyjrBCuM=;
        b=mGOjDpy3dF95PKoyeVvrLC5FeH+PXh22DunupbTN82XxucIOoB9IfnAGgZWsA0bugk
         ghgVxgGaqxmR1Suz1X/FfKWLNnkW3ZVoxc9K0HMrtBSkHdXD8DVM7N1sJaasijyFGpnR
         L/1aqNTzRZrH3sdOcPKK1ofJQarqe9W68GcIg7QcyjwAzPuDPqSirGWp7t9mK1jTsa0i
         WSgvuq7Y96gAC3j8N+B+YTGhhCGZDenxGIp5XgUgDA6CxWmjlDdcPunypgl1EpnbTA1F
         yuNk7YZRFtrL0oFiPy1YRkh6kQwTk/WoF30VksoF4gQ7irgW1QWeXKd5LsQO9ulEYE34
         1QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yplg9S1JhovxIGfaL6Q6VaDnzZMitHU7C7LFyjrBCuM=;
        b=S08VG0ukFIH70gYvKHk713WkElXqd7ZhdXSfOqMXkoWWwAFUMpFNITTYbR3e0Cc1t8
         pUbEBRYfdua3tFQFIH8Epf9EycUijo5ULW5JssTsE6KKz7/zxFQrepHrjh3yJLKBSnyG
         mEae7INb7pRIOdC8esbCekeyaQJhHXhiIZ5ApplLdR4X1FkAM6bLPaq6k5oCJ35UNscL
         a/x4KIQiUEF4bWmuMbz94TwsftCFQf9ZoyuXaI2o+8929wl9v8Lu2gsLlG51JGglZ7nT
         ydBqNndeeBvShUcobldbF2uWdzv1Y6Z22jIh7yf7LZ4wsjErWnbsp17NkBbvxRd3sisC
         q97Q==
X-Gm-Message-State: AFqh2krL129sIer+a3hRdP8Du+3b+Irw+liCO/9T5ptk9lBPUUt03u3E
        GvqskNH0uXYb4OTOsSi2FjwvN1th2p6a4JGxAW4ZRw==
X-Google-Smtp-Source: AMrXdXsOVriRa6oQhyPR0ZpbJLJH4CUKQQvaM0V7d5YeQLv6Q29OqDl6sUg6xmxGgO5mtPbL0SJUElCeOqG5CnHMkcw=
X-Received: by 2002:a05:6102:3e08:b0:3c5:1ac1:bf38 with SMTP id
 j8-20020a0561023e0800b003c51ac1bf38mr1062676vsv.78.1674051271374; Wed, 18 Jan
 2023 06:14:31 -0800 (PST)
MIME-Version: 1.0
References: <08de3f4b-e33f-95c8-3297-814ea107272a@gmail.com> <1510c02c-f640-9924-e42e-fa34e28a580f@gmail.com>
In-Reply-To: <1510c02c-f640-9924-e42e-fa34e28a580f@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 18 Jan 2023 15:14:20 +0100
Message-ID: <CAMRc=Me2yj6A5ZvLXbWn8H0yuL5pUqOJ7B7kGaOyN=jLXGJEGQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] gpio: gpio-rockchip: add compatible string per SoC
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 18, 2023 at 1:14 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Currently all Rockchip gpio nodes have the same compatible.
> Replace all the compatibles in gpio nodes to be able to
> give them a consistent ID independent from probe order or alias.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>
> For now only add new compatibles.
> No changes to rockchip_gpio_probe() function yet.
> ---
>  drivers/gpio/gpio-rockchip.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index e5de15a2a..493207de1 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -790,7 +790,22 @@ static int rockchip_gpio_remove(struct platform_device *pdev)
>
>  static const struct of_device_id rockchip_gpio_match[] = {
>         { .compatible = "rockchip,gpio-bank", },
> +       { .compatible = "rockchip,px30-gpio-bank", },
> +       { .compatible = "rockchip,rk3036-gpio-bank", },
> +       { .compatible = "rockchip,rk3066a-gpio-bank", },
> +       { .compatible = "rockchip,rk3128-gpio-bank", },
> +       { .compatible = "rockchip,rk3188-gpio-bank", },
>         { .compatible = "rockchip,rk3188-gpio-bank0" },
> +       { .compatible = "rockchip,rk3228-gpio-bank", },
> +       { .compatible = "rockchip,rk3288-gpio-bank", },
> +       { .compatible = "rockchip,rk3328-gpio-bank", },
> +       { .compatible = "rockchip,rk3308-gpio-bank", },
> +       { .compatible = "rockchip,rk3368-gpio-bank", },
> +       { .compatible = "rockchip,rk3399-gpio-bank", },
> +       { .compatible = "rockchip,rk3568-gpio-bank", },
> +       { .compatible = "rockchip,rk3588-gpio-bank", },
> +       { .compatible = "rockchip,rv1108-gpio-bank", },
> +       { .compatible = "rockchip,rv1126-gpio-bank", },
>         { },
>  };
>
> --
> 2.20.1
>

If they don't have any additional data associated with each compatible
- why not just use "rockchip,gpio-bank" as the fallback in DT?

Bart
