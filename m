Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85192A7A15
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730209AbgKEJJM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:09:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730061AbgKEJJK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:09:10 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B802DC0613D4
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:09:08 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id w1so715816edv.11
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DAVVTcqOtshkqa//jG0tMqJnAZn8lkJ/jC3ZQlpD4iI=;
        b=gnCWxb3A2YT1XunheHSuiLH9SajfLtYxFoSSt/SMRqAjsx1al/ZDjdmGmdcaRCgATD
         VjIP7kiSbjNExGEXiLiKkUKac6IoHWJ/Fimd03ck22Y3TV8a4rMz01X4WGQkmlH9oyFA
         9esubFwVfP/2m1vKPl5C03O/MKjH3usvIu/M/u1jCtkmZsVaRlPUI4GOMG2G25yqE1WE
         FkwCiZzuIp80ijwg2sDMrq/aDxArFsCDn2GSr7ejg4GkjzXoXRmPg7sE+KMD8rfx5UT2
         P0rDV2vx/4uXjrJDE1VHH5s96ArZURV9t0QiVse/pLv22O/+my2jfZQspbaaigUdqAgS
         xSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DAVVTcqOtshkqa//jG0tMqJnAZn8lkJ/jC3ZQlpD4iI=;
        b=EurwjJ+AOPVi1vgrU4QmHb8lDohkPkt/rseQW70aCdPiqxuQatfw/sA2SWk7x21hs4
         JexLC9ZGDA3rXgJ4DdvfQlC6olQiT3zSBqA/6P4osCklshPsVRmEAh+tiaVhwTJfKPqI
         JhJc0RcGjVBJuRtBYA3mFZQMVNnp6vRQvPIuQkijQm67/WaKfon8UF0N8BDzHpTS6/gd
         xBUAZkWvekk79JwHeQ4ROJEJJbF0TWBQkhqsmn2+YTnIfug6do0SM4N6q5d/qRY7iINh
         EAegpyljLO3uQaCnpw/WLFboQWfQvltSm6w5MAotqjNtk/r511+8h+R+6/yU0sW+3PT3
         jxQg==
X-Gm-Message-State: AOAM532uwZBIHpLUrZEihkHCS5ZUaMf5qyXh+0McyTM3ga0ezzBRl+Qq
        YIb5cgX6DcN5q9rOhpswpflFA2agcmA9p7gwrJbbUg==
X-Google-Smtp-Source: ABdhPJyqANWyJ3aSTbJtEhMCIaR58Dz9yl2OLSrIAItWEawq6opjRvdm8/eux/hxk+LAgMAS7EPN7dAVW7T2X8+w+iU=
X-Received: by 2002:a05:6402:283:: with SMTP id l3mr1593849edv.232.1604567347374;
 Thu, 05 Nov 2020 01:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20201104103938.1286-1-nsaenzjulienne@suse.de> <20201104103938.1286-4-nsaenzjulienne@suse.de>
In-Reply-To: <20201104103938.1286-4-nsaenzjulienne@suse.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 5 Nov 2020 10:08:56 +0100
Message-ID: <CAMpxmJWv3nfD2xpS4jEq+vJvr=+cD7BV3AFDnsRjCG5qB60c-A@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] gpio: raspberrypi-exp: Release firmware handle
 on unbind
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-pwm@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>, wahrenst@gmx.net,
        Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, Philipp Zabel <p.zabel@pengutronix.de>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 4, 2020 at 11:39 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Use devm_rpi_firmware_get() so as to make sure we release RPi's firmware
> interface when unbinding the device.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>
> ---
>
> Changes since v2:
>  - Use devm_rpi_firmware_get(), instead of remove function
>
>  drivers/gpio/gpio-raspberrypi-exp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-raspberrypi-exp.c b/drivers/gpio/gpio-raspberrypi-exp.c
> index bb100e0124e6..64a552ecc2ad 100644
> --- a/drivers/gpio/gpio-raspberrypi-exp.c
> +++ b/drivers/gpio/gpio-raspberrypi-exp.c
> @@ -208,7 +208,7 @@ static int rpi_exp_gpio_probe(struct platform_device *pdev)
>                 return -ENOENT;
>         }
>
> -       fw = rpi_firmware_get(fw_node);
> +       fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
>         of_node_put(fw_node);
>         if (!fw)
>                 return -EPROBE_DEFER;
> --
> 2.29.1
>

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
