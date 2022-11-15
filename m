Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13804629C3B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 15:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbiKOOjO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 09:39:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbiKOOjJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 09:39:09 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33B21DF1B
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 06:39:08 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id 128so14817059vsz.12
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 06:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=82y7Gjoh2vK/1hHEVfyS2/5SQLrPaHEAMPh1kMxO3wM=;
        b=mqJ1+QmOHWvrC0IxHuIXatvVLI93FpamLigCyK+aAt/S5wbZNxxCTLQxMfPWSWLdn9
         BajYVIAO4kGz8zNkLDVJEL+oJ0K7+Pp2QaRmcENFaHXwj3/c3GToSV9BpHwxrZKSDg2K
         BNalKlNy2yFpj5iIFDc/ADGChLxrVkl8YSxaAJYS9UysM0GFWaKibFADjnWmTY5qbpYV
         /8/b084DDBSoBsHF8nh73cRR9ThrtAF8A9Q2uIKa09uiYd7yL3ov9lrgsBX8Kejq++fo
         kRFGUaTz+tyXfotujUk3HK4DBZvokrgjzfO/kB7KMnRyqtqEjn3sqA59IErx+xqnjh7h
         sugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82y7Gjoh2vK/1hHEVfyS2/5SQLrPaHEAMPh1kMxO3wM=;
        b=cBpt1E8NxxwoCt82/+8U/2QP7n+mUvwgSlt+VYjAMjbZJrr9KoMyEXiTdjzNkr6RkJ
         yI0N3XVe034s86Kj8vKKmvcwlr/0Xiwc7DPWoX5UZwRgvkRPRZsKtJKIJ1pmJF6QedCI
         uFfA4lZ4m1idGlh/hZndPETSQsi7OYi9ysO1JvyOY8WiigxYPObVJ1HFLnZlIYkR8wRU
         akY8pnFbEXH751imHDb/JZ/B8WMsG8lwn0uJN/GtOMu2nJW6y/HutN7xti4sAyg6Awhh
         OTc7lU+LEyAqfvWCDROaC50bwpjeRSwNVzanfYgDr6av3Du10RQq6u9xawMPbbltDnlG
         GSHA==
X-Gm-Message-State: ANoB5pnvTsek8FY1UNvxbm/XT7l7TJDBsIo3fm0tvHaN56y6KaeLn9/9
        w7h0WxMCeRlB2rO2EWOA+0lKktA9Bv4Qrpm9/iFLWM05LdY=
X-Google-Smtp-Source: AA0mqf5wQmk1dnhyYOMbsRbwTOYYUMqp2dVn2qBKxjyAGgyzV3SUejNPUFC1JBbWy2ZAwOhdWipJwmoKEn1mkMtANKI=
X-Received: by 2002:a05:6102:488:b0:3ac:38c7:1bdd with SMTP id
 n8-20020a056102048800b003ac38c71bddmr8814757vsa.9.1668523148092; Tue, 15 Nov
 2022 06:39:08 -0800 (PST)
MIME-Version: 1.0
References: <20221111113732.461881-1-thierry.reding@gmail.com>
In-Reply-To: <20221111113732.461881-1-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Nov 2022 15:38:57 +0100
Message-ID: <CAMRc=MfTCb5G0OHxnW=wwpP2u=VbhS_-dH=N7vdY8pq6U030jg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: of: Use correct fwnode for DT-probed chips
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 11, 2022 at 12:37 PM Thierry Reding
<thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> The OF node store in chip->fwnode is used to explicitly override the FW
> node for a GPIO chip. For chips that use the default FW node (i.e. that
> of their parent device), this will be NULL and cause the chip not to be
> fully registered.
>
> Instead, use the GPIO device's FW node, which is set to either the node
> of the parent device or the explicit override in chip->fwnode.
>
> Fixes: 8afe82550240 ("gpiolib: of: Prepare of_gpiochip_add() / of_gpiochip_remove() for fwnode")
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpio/gpiolib-of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 4be3c21aa718..55c3712592db 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -1067,7 +1067,7 @@ int of_gpiochip_add(struct gpio_chip *chip)
>         struct device_node *np;
>         int ret;
>
> -       np = to_of_node(chip->fwnode);
> +       np = to_of_node(dev_fwnode(&chip->gpiodev->dev));
>         if (!np)
>                 return 0;
>
> --
> 2.38.1
>

Applied, thanks!

Bart
