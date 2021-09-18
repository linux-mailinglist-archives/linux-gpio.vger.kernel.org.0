Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD5841034A
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Sep 2021 05:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhIREAw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Sep 2021 00:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhIREAu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Sep 2021 00:00:50 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF5DC061574;
        Fri, 17 Sep 2021 20:59:24 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id n10so36599619eda.10;
        Fri, 17 Sep 2021 20:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RvIfA1jKzZq8tQ3PkBW8ktWY5qn/89gtlprkorG0YDk=;
        b=Mnyce7F9rT52/hbDgIB/IQ3bVD8xFGL7opn3piP3RC9rdutWUoLOC0DLruqGDx9DT2
         kjd1VPrYuE3ocRg/Ogd6x9ZPQ8L6ctIgysnB75NTgIdgrKd1+NjCNco4IA6yHsv2seP5
         4EYeHFBQKKIlJIaCAnZa9bghzt4/HU2NU3HMInoZUdIg42WopSDh7PCMxD4iOIB/X/SS
         hqkSnC2E857PRCD80aq2GHFkVbeOIphgIQgtwt1lat954rL74UAWKKcuVJS1gfm9IL/r
         3YExsIhu0VqXT3cEL9YAYUiUOXuZI7AQ5PtkddNB/lxIdmSG0UJGGnRwrbMv1bn4iaMU
         Zd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RvIfA1jKzZq8tQ3PkBW8ktWY5qn/89gtlprkorG0YDk=;
        b=2zPMJVLtacIFGf1+Idy4FFabZLREJ+RZfNz2J6r2Oyp/RkwqpnSaYN/pIn9vWevWEb
         TKvVr9EWjDQcaYHTLXzL+H3NwgFdh4hxsUvVhWgCmTN6lxbQVpW7/s3uQV5V2qG2OOAr
         ITmBLTpXqbNVpDiEhEjAi3xg4qfcUwucgmuoCOr6nvQ8A8ZXr9pNa5eFtGes1i1mKCf9
         KVWpwkZCanJ5TX0XYdtZjmtyvNU9Ddn9vEP/n2RGHwZIXBG0E3grQrqc9di0UaajwSbq
         xoI4bDVDn6sbDedVLyTL0Td3abSMZVidgZbO30KE+A4A8U1ZiMRMZZNnGa/LQdlK4dSQ
         OE7g==
X-Gm-Message-State: AOAM530mGS6JyoUYoC88FEKqea2ObBQpp/kSpfGhVLeBfpJuMY3Pl9/I
        0Ej+9TsO8oVV5cVag6LlbMaEKG02NObhsEZYwp4=
X-Google-Smtp-Source: ABdhPJy1bAh5D8VgBuYgxc7fp7Ne9VkGcqeRRwbrywvMXFUbQD2ZTfnPhlvZpbyBh083O7m0TY3BJZHRE2vPokfoHmA=
X-Received: by 2002:a17:906:90c9:: with SMTP id v9mr15476722ejw.356.1631937562900;
 Fri, 17 Sep 2021 20:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210918031717.18297-1-caihuoqing@baidu.com>
In-Reply-To: <20210918031717.18297-1-caihuoqing@baidu.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 18 Sep 2021 06:58:45 +0300
Message-ID: <CAHp75Vc4Qdhqu4bZ11t8c3zFQJPpcMrdAHGU6pZ=B_gCTFhFRw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: intel: Kconfig: Add config menu to intel pinctrl
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 18, 2021 at 6:17 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> Adding a config menu to hold many intel pinctrl drivers

configuration
Intel
pin control

> helps to make the display more concise.

After above addressed,
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
> v1->v2: Revert to "select PINCTRL_INTE" for PINCTRL_TIGERLAKE config.
>
>  drivers/pinctrl/intel/Kconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
> index fb1495bd77c4..64f8b37fd705 100644
> --- a/drivers/pinctrl/intel/Kconfig
> +++ b/drivers/pinctrl/intel/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Intel pin control drivers
> -
> -if (X86 || COMPILE_TEST)
> +menu "Intel pinctrl drivers"
> +       depends on X86 || COMPILE_TEST
>
>  config PINCTRL_BAYTRAIL
>         bool "Intel Baytrail GPIO pin control"
> @@ -168,4 +168,5 @@ config PINCTRL_TIGERLAKE
>           This pinctrl driver provides an interface that allows configuring
>           of Intel Tiger Lake PCH pins and using them as GPIOs.
>
> -endif
> +endmenu
> +
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
