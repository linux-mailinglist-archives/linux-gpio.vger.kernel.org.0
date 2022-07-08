Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39B956BBC7
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 16:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237866AbiGHOej (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 10:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbiGHOei (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 10:34:38 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7475222AD
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 07:34:36 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id b11so682108eju.10
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qLu6DxVJLcdKBrX7bULlQ+iHq32WbsP+AYikNaT1u5Y=;
        b=Oe6P6gt6yZEz1SZb/Xa9whyMeeS2Ef2wF7JwgS5mkui57HlF40pckuYxTOOEUAi17U
         oY64xmTha8RSHbCPGOg1o1uyXc7NqpmkLQCF9sA23QCBPcg5Sn/EMhSPnwwic9CrRdtX
         Ixbsk/8+Mg2gQN/NzfIah2n6nVTarxQi6m/spSH2SMJiErnBTZKwl4I1hO35QJNHalfH
         3yw8YdPNRhDBQd+kRpQspZyR/wi6y1nFJIxSgnQFYDIMJZpJ1T8KB8j/TYWe+Umwk3Zq
         m0qH7Y0TelyT7mN4Y6/o9eCm6zwlNFxTly62jXZAdaLiWTw/h95lmdLddcbhjj5PTrqW
         4cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qLu6DxVJLcdKBrX7bULlQ+iHq32WbsP+AYikNaT1u5Y=;
        b=MP/BIXnt6bQ0PthK/xRiHSSPxkyrqfzycWQnXQ45oY6nuNbdhzhs37B9qyc53vUxId
         aNPEd7asFnP257k0TvFQlyHxybz8BdliW3ymo8zACSizVVieUafOnMxArua1ES1SD07M
         jmE3aB6v5Apk45KwJwi2oRIsXn6e1hV9pgs3y3D1cW45ppmKp0CUjAPtJ5lB4dvMDp2I
         jrR3wcqHKU1dIGCw8fEL9dYX/huEoLSe0dzr6YDH2QK8xTMaB0OPGi2exut0WJpgiH8m
         74PTfa2btx1/uXn3UsJJ+Kx7ReXsqhQW/2L8a8K+D0SpCdFXuHYtFgeNBiWL5vvoEw4l
         Vl9A==
X-Gm-Message-State: AJIora8KTwwwoFQLckllB6d80hIed/YhnpW4x6r3qSHIPEQLWsa58hgd
        rCgWXkWcqGRnFv5UDjlnBv82ZpQ8l5FOQQdEIueRzA==
X-Google-Smtp-Source: AGRyM1vCpD3FJAAxAVHvRx4L1441GBsP/4h6bDjtzgce6Xe1z2HpKztPCEvJZJKyOxwiGyQS68UgwEqrnKAvuQB0euU=
X-Received: by 2002:a17:907:3e20:b0:726:2c09:3fa4 with SMTP id
 hp32-20020a1709073e2000b007262c093fa4mr3816780ejc.101.1657290875491; Fri, 08
 Jul 2022 07:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220629113058.79617-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220629113058.79617-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 8 Jul 2022 16:34:24 +0200
Message-ID: <CAMRc=McZaRBKP2P8zY3GjnvrDQnCELc+sa7Zp2wt_T57-i+hPQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: of: Use device_match_of_node() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 1:30 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Instead of open coding, use device_match_of_node() helper.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-of.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 3d6c3ffd5576..23b8de98bf7c 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -720,7 +720,7 @@ static void of_gpiochip_remove_hog(struct gpio_chip *chip,
>
>  static int of_gpiochip_match_node(struct gpio_chip *chip, void *data)
>  {
> -       return chip->gpiodev->dev.of_node == data;
> +       return device_match_of_node(&chip->gpiodev->dev, data);
>  }
>
>  static struct gpio_chip *of_find_gpiochip_by_node(struct device_node *np)
> --
> 2.35.1
>

Applied, thanks!

Bart
