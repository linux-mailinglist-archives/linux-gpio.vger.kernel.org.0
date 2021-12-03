Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258C24679E6
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 16:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234124AbhLCPEo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 10:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbhLCPEo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 10:04:44 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56017C061751
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 07:01:20 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id y13so12540054edd.13
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 07:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=21uBl/sv63xveuZI5bBgWtKNSIXTCPilEYmni9/xwP4=;
        b=8WPzyjlvMDGqS2eu+kmWIpa9KmHzUwgzZk8kk55VVqL6OUdl6Z0LI9SkGKxp2C8DB/
         KsKxngQL3Za+JPzbxHjaq5bs7hEEVDPLcMQKGG1vvTM0tshXflmuD8I4ujWqEcPZVxk3
         BcjVh6qX0C752e4EQcAiu1ounZnf5aeXg1V392iWxnwYxqchxGEqNCzE4Vvei9vr3yeL
         JyRwwm6vzLp6l4e0APQYp0UxXmSe9tS6Dp9QMeUrXSLZQHBfCE/Rb5NJXw931Gz+TWdt
         34EyK/gdWe+inf1ByX6fOUw3xvxdI8P9ab/t0Gagi814uGDzdAFKHU+9/jljmVtxQgRo
         DXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=21uBl/sv63xveuZI5bBgWtKNSIXTCPilEYmni9/xwP4=;
        b=edSx76z6VuX/SUZ/ia3rNKngyesJRSWaJJUlXeHUOahLshcn5NZ7o+u6BavSrz5mho
         NdgtGgGSD5415meEKkBbQp95nTrcfYNmh2VBGpPX2hqY9UiCAdOTrUKn4AZAL2yeF8Ly
         KBitKlW3bFCe7h5SMzvAF4SVnAXexrNgkCheepXOPg7DFJb9rokcXnPVjNRHWdoSniVl
         pVQ4CmbkD3ZQ/D8PXwuJbxWbysJjAziaqk6DtwEufF+zQ12JbWwzhKpSGDy8jOVIMWFQ
         nhOaTrXG+ggazKzPVuAhmPb/WV3nNVMH4ktMDScbG5f/PVkHzUCTVDEBBdWuVGA4qpVp
         NAaw==
X-Gm-Message-State: AOAM532bftG2iqPu48VdJAvg91K5pkd49D0E1ptwFr8D4noZgQtk4rWn
        DlOriwfweT0vMOZWR9WZxNcTNrji69AbM4ClSMOPvSH3RsFp6g==
X-Google-Smtp-Source: ABdhPJzUtz+Fmlc0XLD//MekyqoNW0qMaiKONPhku6jODQx87mcrhEmQ+liWOyuxOJVGzYfAXXN9WRTMUSLct/c/ARQ=
X-Received: by 2002:a50:e611:: with SMTP id y17mr27557284edm.270.1638543675563;
 Fri, 03 Dec 2021 07:01:15 -0800 (PST)
MIME-Version: 1.0
References: <20211201214305.2725271-1-robh@kernel.org>
In-Reply-To: <20211201214305.2725271-1-robh@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Dec 2021 16:01:04 +0100
Message-ID: <CAMRc=MdqzxOQ+pDz821PJ9pBr=TLviND3HPd_=P1Pk_CUXkf4Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: xlp: Fix build errors from Netlogic XLP removal
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kernel test robot <lkp@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 1, 2021 at 10:43 PM Rob Herring <robh@kernel.org> wrote:
>
> Commit ea708ac5bf41 ("gpio: xlp: Remove Netlogic XLP variants") has
> build errors with CONFIG_ACPI:
>
> drivers/gpio/gpio-xlp.c:300:23: error: 'GPIO_VARIANT_VULCAN' undeclared here (not in a function)
>
> and !CONFIG_OF:
>
> drivers/gpio/gpio-xlp.c:267:11: error: 'struct gpio_chip' has no member named 'of_node'
>
> Fix these errors.
>
> Fixes: ea708ac5bf41 ("gpio: xlp: Remove Netlogic XLP variants")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpio/gpio-xlp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
> index 814cc34aef97..0199f545335f 100644
> --- a/drivers/gpio/gpio-xlp.c
> +++ b/drivers/gpio/gpio-xlp.c
> @@ -264,7 +264,6 @@ static int xlp_gpio_probe(struct platform_device *pdev)
>         gc->base = 0;
>         gc->parent = &pdev->dev;
>         gc->ngpio = 70;
> -       gc->of_node = pdev->dev.of_node;
>         gc->direction_output = xlp_gpio_dir_output;
>         gc->direction_input = xlp_gpio_dir_input;
>         gc->set = xlp_gpio_set;
> @@ -297,8 +296,8 @@ static int xlp_gpio_probe(struct platform_device *pdev)
>
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id xlp_gpio_acpi_match[] = {
> -       { "BRCM9006", GPIO_VARIANT_VULCAN },
> -       { "CAV9006",  GPIO_VARIANT_VULCAN },
> +       { "BRCM9006" },
> +       { "CAV9006" },
>         {},
>  };
>  MODULE_DEVICE_TABLE(acpi, xlp_gpio_acpi_match);
> --
> 2.32.0
>

Applied, thanks!

Bart
