Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89ABC75943A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 13:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjGSLeg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 07:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjGSLef (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 07:34:35 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB84EE69
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 04:34:34 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4438f623370so2284602137.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 04:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689766474; x=1690371274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6kFCvZuAtJxtCzbBq5Rx1xFoh1CSYnns+Sus9XxflY=;
        b=KdUeFTZcx9OttG1smUd/JWkPt+gQxVP2EIOPer+jrZw5GZziqd2DuMZI+/hcVNJ+Hc
         RyKGwS7MlqxE/28f6I93S3EnHePhcbw5mch/Wv3FLfncBObQkh+CLf7L0djeDaVlWgm1
         U+qeiY8RRxaujQb8PfOLxB+tTfYJkfnIrwvg/LHW0O1NkZ8O2UqeXkr5pBm2KMHV9gSc
         KL9ArZXfSLvHKFH+vs5obRy0WFA7m2xvI3BUrTt2CFjxi1VH4PEG70YYCs0vUnbaABJ8
         Sl7TtdjrwaSECN/DQOQZEmhZTnK6zi2xe4i6DHswV/7Au+s02JcKWfbhc/uTsP8r/VvL
         BIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766474; x=1690371274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6kFCvZuAtJxtCzbBq5Rx1xFoh1CSYnns+Sus9XxflY=;
        b=PJxPP11/mFaLS7FklmYSRG87JBSkD1XIyQxnPzWnhZsgLQma8VM0SsDwYMT4WG3226
         8xp0ZObQ+SmCZ4VLEh17UVvGcWa1QotfZKZPC87f88srtqB5Od7RiFBdk/4QogGW8gN/
         EUyJF/r/xtP8QI1bNEgHSlby1vMHwhn5CXalqxBerB+6e8DccCvBIhNZMxbbSBbEkJ/J
         zG4dq1P5p4WZQI3hEdJ4q2pM4JJKZj1iGj9iV5tUv26DxjisruZ7lbxe4oz0nloXCxtb
         m9cyTGeWk4UA31JaEoyT6pI859pwxJgPKceAzIp8n8CB/RtwlO+upDy5o6WtzA+fVZRg
         YWfQ==
X-Gm-Message-State: ABy/qLYgylgXzz8oCFX7Vn3i2VSxcT6gBBuSw9wW/M9xeCBZ4b8gqwpe
        TUISGuECz044zHb83CHhpbgvW4yJmrYRgbO+U+vou9N7taKObTRm
X-Google-Smtp-Source: APBJJlH2sQXQH8x/3Qq72MFuEZKAm9WxXfKZq1eO8V/dKYjTEzHkF5bFPZBCNUHtfwM8zCm9L1vDWeF3XLIh9yHyCZg=
X-Received: by 2002:a67:ea4a:0:b0:444:9c6d:41c6 with SMTP id
 r10-20020a67ea4a000000b004449c6d41c6mr1088791vso.0.1689766473822; Wed, 19 Jul
 2023 04:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230717142743.2555739-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230717142743.2555739-1-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 19 Jul 2023 13:34:23 +0200
Message-ID: <CAMRc=MddbeLzuY06jGDU6gYEu8H7ZRhWOKdCahwQY0OTmG6yLQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: Make use of devm_pwmchip_add
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>,
        Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
        Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
        Ralph Sennhauser <ralph.sennhauser@gmail.com>,
        linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
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

On Mon, Jul 17, 2023 at 4:27=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> This allows to get rid of a call to pwmchip_remove() in the error path. T=
here
> is no .remove function for this driver, so this change fixes a resource l=
eak
> when a gpio-mvebu device is unbound.
>
> Fixes: 757642f9a584 ("gpio: mvebu: Add limited PWM support")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> Note that irq_domain_remove() also isn't called so there is another
> resource leak introduced by 812d47889a8e ("gpio/mvebu: Use
> irq_domain_add_linear")
>
>  drivers/gpio/gpio-mvebu.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index a68f682aec01..a35958e7adf6 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -874,7 +874,7 @@ static int mvebu_pwm_probe(struct platform_device *pd=
ev,
>
>         spin_lock_init(&mvpwm->lock);
>
> -       return pwmchip_add(&mvpwm->chip);
> +       return devm_pwmchip_add(dev, &mvpwm->chip);
>  }
>
>  #ifdef CONFIG_DEBUG_FS
> @@ -1243,8 +1243,7 @@ static int mvebu_gpio_probe(struct platform_device =
*pdev)
>         if (!mvchip->domain) {
>                 dev_err(&pdev->dev, "couldn't allocate irq domain %s (DT)=
.\n",
>                         mvchip->chip.label);
> -               err =3D -ENODEV;
> -               goto err_pwm;
> +               return -ENODEV;
>         }
>
>         err =3D irq_alloc_domain_generic_chips(
> @@ -1296,9 +1295,6 @@ static int mvebu_gpio_probe(struct platform_device =
*pdev)
>
>  err_domain:
>         irq_domain_remove(mvchip->domain);
> -err_pwm:
> -       pwmchip_remove(&mvchip->mvpwm->chip);
> -
>         return err;
>  }
>
>
> base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> --
> 2.39.2
>

Applied, thanks!

Bart
