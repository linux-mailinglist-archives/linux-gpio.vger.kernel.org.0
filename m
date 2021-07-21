Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BE83D0F54
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 15:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236970AbhGUMf6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 08:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236964AbhGUMf6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 08:35:58 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CBCC061574
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 06:16:34 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id p22so3216634yba.7
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 06:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IKJrexLnW7vtMVtnT0P0NrpurExWWFqAFNKELJtWKt4=;
        b=VcxuuEwbwdsJw2M45kM15U0QwW6FGzNjae+GhnBCC9hT12pjl/dhMYEd43QBL1CrOY
         qzmLSG+XIBN+9e44Y3c5tZkd34CihV3dfLXz49df8VSZCqTKhtka6OtDkvEhy/LUktJG
         H2GSuTC0/OAmoGVC8oqP6LkodfhTepbx7azO4umMAmY+/tw2KJMl2fr/QVdvP6REFrjV
         Km0Q4Wg45n2FHfi0wIdWb3F9Ip9qTDauG8LdTwhUnFAYISPLqjBnjCw/WP9cuhLgzSL2
         7lkGP/HUpT8JHkUOvtGpIBuobZJQrdm4lq+omVmiYiw06s77gC9vLzxQ6RMswkH2vuEE
         E8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IKJrexLnW7vtMVtnT0P0NrpurExWWFqAFNKELJtWKt4=;
        b=XnlevP8jRtBnUHYh1BCBpBtYkxTFN2IaGhU4pF0g26LBQN0s7uVpw29VIxdM08VOEg
         hzBv1XEu4sM601MQMg6l76PZQsUx+GJSGqzE9YNlaDgw01V9e8zh2/PU+5kCT5eD8Sjw
         1OFJtHkanv5HBQJaGTc60pqYRo3AsV2+75IG6ikf0aoHL/w4l8J4Re2u4xPma+QXFysl
         t49YpF/hzmJmm9ErAHpT1yvkZ6S9r6+YjrVY9xrdwGDhCRtD24yGxC9UZzu9Y6a7FlQF
         lPwnSHVkP31k/t+DRIunilbWlGllXb4o/rxpjUeHw4LAg4yPtovrZrX7zbvvLPjevyUq
         afjw==
X-Gm-Message-State: AOAM533/zKhk92/Aqvk9+BNxob5eP/006LNkyEU0+Zpu2sI6X50PjQ+n
        Pn4ELtHkr+mTCrws+I/mtw8Duc+POeeNlzN91ODqDA==
X-Google-Smtp-Source: ABdhPJz5Tbu0XjYRWiKI458AiUNnaAs8L2Cx+OYYKBjcor1lr5FVIiBgAn+rvGt5qjJQtjnk7eBPJ/y2n42zFtZa46E=
X-Received: by 2002:a25:cc04:: with SMTP id l4mr44007353ybf.312.1626873393677;
 Wed, 21 Jul 2021 06:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210707135144.191567-1-aardelean@deviqon.com>
In-Reply-To: <20210707135144.191567-1-aardelean@deviqon.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 21 Jul 2021 15:16:23 +0200
Message-ID: <CAMpxmJVBTqX_e6a7PjdNmwYN-SCgqXQ1WbfzZbRLBGvPSVHTFQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: viperboard: remove platform_set_drvdata() call in probe
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 7, 2021 at 3:51 PM Alexandru Ardelean <aardelean@deviqon.com> wrote:
>
> The platform_set_drvdata() call is only useful if we need to retrieve back
> the private information.
> Since the driver doesn't do that, it's not useful to have it.
>
> This change removes it.
>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  drivers/gpio/gpio-viperboard.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
> index c301c1d56dd2..98ddd6590362 100644
> --- a/drivers/gpio/gpio-viperboard.c
> +++ b/drivers/gpio/gpio-viperboard.c
> @@ -422,12 +422,8 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
>         vb_gpio->gpiob.direction_input = vprbrd_gpiob_direction_input;
>         vb_gpio->gpiob.direction_output = vprbrd_gpiob_direction_output;
>         ret = devm_gpiochip_add_data(&pdev->dev, &vb_gpio->gpiob, vb_gpio);
> -       if (ret < 0) {
> +       if (ret < 0)
>                 dev_err(vb_gpio->gpiob.parent, "could not add gpio b");
> -               return ret;
> -       }
> -
> -       platform_set_drvdata(pdev, vb_gpio);
>
>         return ret;
>  }
> --
> 2.31.1
>

The log is not really needed, we'll get an error message from gpiolib
core. Can you remove it while you're at it and just return the result
of devm_gpiochip_add_data()?

Bart
