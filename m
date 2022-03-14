Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0C54D87A1
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Mar 2022 16:02:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbiCNPDX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 11:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242364AbiCNPCx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 11:02:53 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A069419B5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 08:01:42 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id h13so20323931ede.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 08:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sDbB5ttwC5zs8tGCg8StLORKGzic+0zDsHvDFd64VD0=;
        b=zD6QgQosP2Yt8LezeDqwPxX/Rmrqv0jH+q9iKfFnJOHGVV/nZRbEgUFO/FbBU8si+w
         KVNQhkNhziWFp+G4S/kR/Dx55Mb3qPq1dB6bvUgYx2qOVc8PIitCPWYFsRfEbKHsQVzA
         OquDpBOnmf25Fo6LUqt24/4dau24+dQGHc9cMb46gori13pqUynUMkMBfAUQD1fa4JoM
         aU9m3iM5ADOUMUs8zg2xotD92gmSKFPESF1ORdex7WxYD1cTyL+O0R4dMlGT2MlxUhag
         33hnrWnstphS8niiT0Q9bTlv5SWjVA4lpFbQvwRTlfFZMx/HntxbLf30la6IeClEY4Fz
         Ok4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sDbB5ttwC5zs8tGCg8StLORKGzic+0zDsHvDFd64VD0=;
        b=mhAqSosu7LOxY7+BHLlss4qumQdKA0OLLNsE7kjKntKPw779Ri+Qepw/qtoycKmYyB
         rVNgrS65KLawW2rPUP5yHUtzB9EF7Wx22oLfKK2+38geKaI5qM9E2flcTdLlHQEUQOoV
         q5EY20xWgANtREJ/fQFavySlKj4px6DwauwsSycnOW/8ea3O6TKOJXwiyQeLOpu+e3/r
         3LQkwBYffs5ImceTqNoOAmT8w1U5J5qAG7SNMKi4d47I3LRcfOEyHCG8w2EUO+aWxfqY
         2Ik87fbDVw/uCbDoc0oh19SAmO6HyXx9QMMp+/JFtOgUMJYKSXjLh13kuRegepIqGg2d
         i5XQ==
X-Gm-Message-State: AOAM5328URaeBWPALm8tPS8Gw/iQIjRKIwW5TjRli67d+1ZG9h6VpU7l
        FsQ2JK1d07r7WBUQmVZ8kGCi2dRyHz4agk9vQIEDHA==
X-Google-Smtp-Source: ABdhPJyOmWNJXp9JdafV1pGswb/BIFRtCQSDlaxyOCsZUfo6wmsMsDdncdEchVCW9VFhyvRMzif9bK6ckKZG2iWQQ1Y=
X-Received: by 2002:a05:6402:3715:b0:410:a415:fd95 with SMTP id
 ek21-20020a056402371500b00410a415fd95mr20843527edb.288.1647270101193; Mon, 14
 Mar 2022 08:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de> <20220314141643.22184-8-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220314141643.22184-8-u.kleine-koenig@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Mar 2022 16:01:30 +0100
Message-ID: <CAMRc=MeJLrfzNhPHRjg06qMC45fZ97RDrDwn6mRrzqK7zxUa2A@mail.gmail.com>
Subject: Re: [PATCH v8 07/16] gpio: vf610: Simplify error handling in probe
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 14, 2022 at 3:17 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Instead of manually enabling and registering a devm cleanup handler that
> disables the clock, use devm_clk_get_enabled(). Also replace the handling
> of the optional clocks by using a variant of clk_get_optional().
>
> The resulting code is a tad stricter than the previous code as errors fro=
m
> clk_get() (apart from -ENOENT) make vf610_gpio_probe() return an error.
> This is however an improvement.
>
> Also make the clock pointers local variables instead of a member of drive=
r
> data, as they are only used in .probe().
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-vf610.c | 45 +++++++--------------------------------
>  1 file changed, 8 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index 20780c35da1b..4a6ad2e8d1a1 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -34,8 +34,6 @@ struct vf610_gpio_port {
>         void __iomem *gpio_base;
>         const struct fsl_gpio_soc_data *sdata;
>         u8 irqc[VF610_GPIO_PER_PORT];
> -       struct clk *clk_port;
> -       struct clk *clk_gpio;
>         int irq;
>  };
>
> @@ -232,11 +230,6 @@ static int vf610_gpio_irq_set_wake(struct irq_data *=
d, u32 enable)
>         return 0;
>  }
>
> -static void vf610_gpio_disable_clk(void *data)
> -{
> -       clk_disable_unprepare(data);
> -}
> -
>  static int vf610_gpio_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -245,6 +238,8 @@ static int vf610_gpio_probe(struct platform_device *p=
dev)
>         struct gpio_chip *gc;
>         struct gpio_irq_chip *girq;
>         struct irq_chip *ic;
> +       struct clk *clk_port;
> +       struct clk *clk_gpio;
>         int i;
>         int ret;
>
> @@ -265,37 +260,13 @@ static int vf610_gpio_probe(struct platform_device =
*pdev)
>         if (port->irq < 0)
>                 return port->irq;
>
> -       port->clk_port =3D devm_clk_get(dev, "port");
> -       ret =3D PTR_ERR_OR_ZERO(port->clk_port);
> -       if (!ret) {
> -               ret =3D clk_prepare_enable(port->clk_port);
> -               if (ret)
> -                       return ret;
> -               ret =3D devm_add_action_or_reset(dev, vf610_gpio_disable_=
clk,
> -                                              port->clk_port);
> -               if (ret)
> -                       return ret;
> -       } else if (ret =3D=3D -EPROBE_DEFER) {
> -               /*
> -                * Percolate deferrals, for anything else,
> -                * just live without the clocking.
> -                */
> -               return ret;
> -       }
> +       clk_port =3D devm_clk_get_optional_enabled(dev, "port");
> +       if (IS_ERR(clk_port))
> +               return PTR_ERR(clk_port);
>
> -       port->clk_gpio =3D devm_clk_get(dev, "gpio");
> -       ret =3D PTR_ERR_OR_ZERO(port->clk_gpio);
> -       if (!ret) {
> -               ret =3D clk_prepare_enable(port->clk_gpio);
> -               if (ret)
> -                       return ret;
> -               ret =3D devm_add_action_or_reset(dev, vf610_gpio_disable_=
clk,
> -                                              port->clk_gpio);
> -               if (ret)
> -                       return ret;
> -       } else if (ret =3D=3D -EPROBE_DEFER) {
> -               return ret;
> -       }
> +       clk_gpio =3D devm_clk_get_optional_enabled(dev, "gpio");
> +       if (IS_ERR(clk_gpio))
> +               return PTR_ERR(clk_gpio);
>
>         gc =3D &port->gc;
>         gc->parent =3D dev;
> --
> 2.35.1
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
