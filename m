Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992BE35DC8D
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 12:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhDMKj4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Apr 2021 06:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbhDMKj4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Apr 2021 06:39:56 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E2CC061756
        for <linux-gpio@vger.kernel.org>; Tue, 13 Apr 2021 03:39:36 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id l14so11349821ybf.11
        for <linux-gpio@vger.kernel.org>; Tue, 13 Apr 2021 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lp0nhIkX91Pf3wD+SL7MH4/JR2CJldd70sy3TxSWViI=;
        b=x0PyFjK05EbY1X1JUnH1hArB1GU/uz9pcDBzZRy8YJHeH1Hr/dHCDfg7J2cFLLp4g5
         Q7iZ+V8HD5/SRfnDaLFgTXj2xownGN75yVvu3xsdF648PekGqDxQ3yflzlNOEQdwlc1H
         9AdwF6jsK2YTW4TMyOysJ1TFphQJxRgu+NI0gzBiahj3srfNrVIyiyW2OQesr4SdLxKa
         kolPkyZ/QEyFAIBI+6frBoL63EfQE6X+3uYe6Eafe/SjxpexRt/DlBrJGBnmiJFCEjrS
         Dm3NMTaejJb+rwgRX1uzvkN5T48jPsroCtv+U9d5o3RSX9MJA6QPaACd9zDOWjKC5AGL
         TmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lp0nhIkX91Pf3wD+SL7MH4/JR2CJldd70sy3TxSWViI=;
        b=FDtnQcWD6dY6T5X+275v1AfOsTFSt5d/NI5IBGspf3DtMDEIRwja8q8qr6DqoD398h
         e7dsiytLIMqxyV9MfiaWytZjxr+jehSwIPcBiCNmOuvbY+3q2pnd9gzxJ2zXmw9Yge98
         D9q77kYFoWnXnLosAXlmANaOfsY0VYcMWgFYZ9cCI5g3HAK/1PH79F8SjJWLryNuQ22a
         lPmsoCJ5U6lIORM5LNqATdjWeXM7tCkN/dfKiKGr1jn0NyZeDrKemGPXcisa52yovBli
         +3H+Vk72QjdT3WttNmbvFuBC/xuaG+wGDEGvW3Am8OREIbzMviChXPmqDSSPr3fr1f+w
         tuyw==
X-Gm-Message-State: AOAM531E3gV5UZjWxJq8upDjjJCkBBt2G/eHNyTrtH7D5D8Skh56CeLT
        erl5CNq5M0Yv68NR10KfoCd7zayYd3GdZPE2ClMEaA==
X-Google-Smtp-Source: ABdhPJzQbqVx4ODMB83g8cRs6khZm0cp+FJ0k8vqzdaQgqQIAMOjDdzI/4Pd7amvKUZf1EKL82VvC5rXBPrJbnGaou8=
X-Received: by 2002:a25:2351:: with SMTP id j78mr15135557ybj.312.1618310375999;
 Tue, 13 Apr 2021 03:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <1618193781-35329-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1618193781-35329-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 13 Apr 2021 12:39:25 +0200
Message-ID: <CAMpxmJUBPEC9mLCM9DgnMxRcY-H3gEXgcgw9Xp+TyEA7SUDQkw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxs: remove useless function
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 12, 2021 at 4:16 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following gcc warning:
>
> drivers/gpio/gpio-mxs.c:63:19: warning: kernel/sys_ni.cunused function
> 'is_imx28_gpio'.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpio/gpio-mxs.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
> index dfc0c1e..524b668 100644
> --- a/drivers/gpio/gpio-mxs.c
> +++ b/drivers/gpio/gpio-mxs.c
> @@ -60,11 +60,6 @@ static inline int is_imx23_gpio(struct mxs_gpio_port *port)
>         return port->devid == IMX23_GPIO;
>  }
>
> -static inline int is_imx28_gpio(struct mxs_gpio_port *port)
> -{
> -       return port->devid == IMX28_GPIO;
> -}
> -
>  /* Note: This driver assumes 32 GPIOs are handled in one register */
>
>  static int mxs_gpio_set_irq_type(struct irq_data *d, unsigned int type)
> --
> 1.8.3.1
>

Patch applied, thanks!

Bartosz
