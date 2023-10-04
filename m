Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58B757B7C4F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Oct 2023 11:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242052AbjJDJhS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Oct 2023 05:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242032AbjJDJhP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2023 05:37:15 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40FF6A7
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 02:37:09 -0700 (PDT)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E54C73FFEC
        for <linux-gpio@vger.kernel.org>; Wed,  4 Oct 2023 09:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1696412227;
        bh=UlzyPWI8qWZBcNbmieOr3BVk1gktgoZ26fzf7WupCLs=;
        h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Hb8GJ5bapUJ+1oSrsDDiP/doJGXC2OH/n+FE4X/s9jGGYeiS9YYeUGHI7BJhmNp8I
         YhPDRENkvO6j5XXuHy7obeRMNlKevJ0uG5/wGPeLcQu+C1/K/Oqo2cHFcugvihAXhl
         CUgCprKFCMwswH6Bm4kcNE1ITOp/rOcCfUZZWlMEivvbCcIvEb+zwH8mnudWujEGWq
         nSgR+x0bBxXH0UXO/uSy57xEY6kxM/NytTdINtYVNidfg9TsWX1DgmhwzRwEs5+TUL
         wxt1bR7d1+iR3eRyW37fPI81+OO3KdD7HuGvPyY1uvMpzyLC6F1vaGGAMX+6j5RFCr
         mrxXKippYLcrQ==
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7742bab9c0cso212154785a.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Oct 2023 02:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696412227; x=1697017027;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UlzyPWI8qWZBcNbmieOr3BVk1gktgoZ26fzf7WupCLs=;
        b=md3x0hzO485PXfHFfzoGbZRvnm9jPk5ZT4eZXjj/jRaUU4PdyVw4Jr5EzUMkLI9z5O
         pzz5bus5iY9RKLdhjGBxC84mdhY3JPm+L07HnR79BpfVJICe/rtI/n/HYYUEyA+BUepT
         9bgy0U4ggCFRfyTQJd+wd/NTgA+RA5avpIpMW5DEcbU3ynBjUl5en0qM4cAf3bwUoAAw
         jz4CSua0I07ivhhqob3QMxG+02pOdEZe5/EtYGixf1/1nR0xnMtNlNR2jWA3iCvpWZzK
         lGU5PceGYQLChS4L3NRh85r71XcKUk8+YBSAv0RMOVDRd+u20Skdn2FmCaXhuRfZOH/K
         gcXg==
X-Gm-Message-State: AOJu0YzRetZ6RtMBW8/R+6aNfH8trjifhOdLim/MSdlhL0hZ8YHgZ5Z/
        5vgFPgQVajISwFJyt0fuULrXaLy0qTZuREskjz00lBhEj73BiqarXvtBc4DIyiU3NICOpFA3uhH
        05oRweGA0T2VKvz0GxR/k7AjRsG5Br97oKo+LINkZJMoKjPQQURO8jcc=
X-Received: by 2002:a05:622a:105:b0:418:14ee:ac55 with SMTP id u5-20020a05622a010500b0041814eeac55mr1536957qtw.25.1696412226876;
        Wed, 04 Oct 2023 02:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUROpxIWaT7n1WPahi3nX20TV2/exAoVeIV9d0hQsY2h9AA9g+9PkkDCp26GV+2x4HCsso37GEcaHcGtLWEk0=
X-Received: by 2002:a05:622a:105:b0:418:14ee:ac55 with SMTP id
 u5-20020a05622a010500b0041814eeac55mr1536947qtw.25.1696412226601; Wed, 04 Oct
 2023 02:37:06 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Oct 2023 02:37:06 -0700
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231003145114.21637-19-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl> <20231003145114.21637-19-brgl@bgdev.pl>
Mime-Version: 1.0
Date:   Wed, 4 Oct 2023 02:37:06 -0700
Message-ID: <CAJM55Z8S_4OGM_-iEACLzZgwt6_KoYr56RbPn+4kx7Beu2WjUg@mail.gmail.com>
Subject: Re: [PATCH 18/36] pinctrl: starfive: use new pinctrl GPIO helpers
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Replace the pinctrl helpers taking the global GPIO number as argument
> with the improved variants that instead take a pointer to the GPIO chip
> and the controller-relative offset.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 4 ++--
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 530fe340a9a1..22a2db8fa315 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -918,12 +918,12 @@ static struct pinctrl_desc starfive_desc = {
>
>  static int starfive_gpio_request(struct gpio_chip *gc, unsigned int gpio)
>  {
> -	return pinctrl_gpio_request(gc->base + gpio);
> +	return pinctrl_gpio_request_new(gc, gpio);
>  }
>
>  static void starfive_gpio_free(struct gpio_chip *gc, unsigned int gpio)
>  {
> -	pinctrl_gpio_free(gc->base + gpio);
> +	pinctrl_gpio_free_new(gc, gpio);

Hi Bartosz,

Thank you for the patch. These new pinctrl_gpio_*_new() functions now seem to
have the same signature as the starfive_gpio_*() functions. Is there a reason
they can't be used as callbacks directly so we could just delete the
starfive_gpio_*() wrapppers?

Also it'd be great to be to be CC'd on at least the first generic patches where
the new functions are introduced to have some context without having to look it
up on lore.

/Emil

>  }
>
>  static int starfive_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> index 640f827a9b2c..5557ef3fbeb2 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
> @@ -547,12 +547,12 @@ static const struct pinconf_ops jh7110_pinconf_ops = {
>
>  static int jh7110_gpio_request(struct gpio_chip *gc, unsigned int gpio)
>  {
> -	return pinctrl_gpio_request(gc->base + gpio);
> +	return pinctrl_gpio_request_new(gc, gpio);
>  }
>
>  static void jh7110_gpio_free(struct gpio_chip *gc, unsigned int gpio)
>  {
> -	pinctrl_gpio_free(gc->base + gpio);
> +	pinctrl_gpio_free_new(gc, gpio);
>  }
>
>  static int jh7110_gpio_get_direction(struct gpio_chip *gc,
> --
> 2.39.2
