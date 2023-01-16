Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8408566B9D2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 10:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbjAPJG0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 04:06:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbjAPJGA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 04:06:00 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A1F166C6
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:03:59 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id t10so17790894vsr.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=seVHqJwTCmk7QfyUVH6PeouelwhKLpdl+HohUPVId6Q=;
        b=pH8NfO2cskT9CY9c04QhqFSvQQCqrlnzNw3KXalyemx4+TZ85rrtAZIcUVvE24GY28
         r53luaNZE/DRkuxrux5tTw1dHUXD7M3dth3Dl6WGIsg/TE7ToU6ifktNeRD9dVPYGejI
         DNI8zecz9bOx8q2OPXFCvFrjZPZF32L6nO5QLoaK0Ng+mSEHZlunJSyBsoo8tcHEiCCp
         W/pvQX3asZlfCT/0/Lg4/11aAq7KkD4SLIY4mkcug+pFrRpurgJfgA1gO1J85yELjHWU
         jVMgOfdrMvzMJIwScd2r3UoUQZLW/zT2BARBu7G/0utte+fPLWsDARqlkI9nIOA+Rewh
         Wc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=seVHqJwTCmk7QfyUVH6PeouelwhKLpdl+HohUPVId6Q=;
        b=HO3teHMz7g7844gCKTceMpQguAgrm5ooT0qUFXhV9zIyN62MlP7t2tWz8qJIPtD4YG
         3+0CRtgI3LoNfu39XbGwdI5L/2gqT8AEqC4J8d4gSQ7n13dzKpdcIWZudmEUz95OwCUw
         SkMHIHrTOYJBoNXXXDlhYeqiGSgN8FLYLjCg6gMq/mpoJAeiAV4tMU1i1l/rE+NlH7iU
         HTiHq5MEUKdK38glu7BpXL5ii+C9wMMTGRwLW2FvSxjb8aFlAVWWmCtateCTr01TyiMA
         kKRh6UUm2iFiRXkEKL4Re5g8K/xCnDwkrYiPC9lL3Z41v1zr+986uEBi4UVsDr3szwK6
         RP0A==
X-Gm-Message-State: AFqh2kpO4Gzj8/0S4RL54hq9aOErJyWHZexH0EcqzHS1Bs3pe4kz/be7
        094aJwR6BI9GcE3zpkJWFmAKiBOQDN8k3SUP4wYQcw==
X-Google-Smtp-Source: AMrXdXv15ogrjnOpxgcUjYul67D1fAEgI/tpgbYCTIA8NRaqR155cznnHbZaymfaq/VGrWVah2zSuckjU3YwnDZOvG4=
X-Received: by 2002:a67:df8c:0:b0:3c5:1ac1:bf38 with SMTP id
 x12-20020a67df8c000000b003c51ac1bf38mr13060875vsk.78.1673859838163; Mon, 16
 Jan 2023 01:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20230113182619.16800-1-andriy.shevchenko@linux.intel.com> <20230113182619.16800-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230113182619.16800-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 10:03:47 +0100
Message-ID: <CAMRc=MdkgWBb5XTSMEEUQQGCO_3x1a3KK0KbvW4GmAQX1XGbxg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: wcd934x: Use proper headers and drop OF_GPIO dependency
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 13, 2023 at 7:25 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The driver doesn't depend on the OF_GPIO to be complied. Hence
> the proper header to use is mod_devicetable.h. Replace of*.h with
> the above mentioned and drop redundant dependency.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: added one more missing header (LKP)
>  drivers/gpio/Kconfig        | 2 +-
>  drivers/gpio/gpio-wcd934x.c | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 9995e23673dd..a2f64f880163 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -700,7 +700,7 @@ config GPIO_VX855
>
>  config GPIO_WCD934X
>         tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
> -       depends on MFD_WCD934X && OF_GPIO
> +       depends on MFD_WCD934X
>         help
>           This driver is to support GPIO block found on the Qualcomm Technologies
>          Inc WCD9340/WCD9341 Audio Codec.
> diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
> index 817750e4e033..b999af6b900b 100644
> --- a/drivers/gpio/gpio-wcd934x.c
> +++ b/drivers/gpio/gpio-wcd934x.c
> @@ -1,11 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2019, Linaro Limited
>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> -#include <linux/gpio/driver.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> -#include <linux/of_device.h>
> +
> +#include <linux/gpio/driver.h>

Any reason for having it separately here?

Bart

>
>  #define WCD_PIN_MASK(p) BIT(p)
>  #define WCD_REG_DIR_CTL_OFFSET 0x42
> --
> 2.39.0
>
