Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D02DD66B9CB
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 10:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231946AbjAPJF0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 04:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232376AbjAPJEx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 04:04:53 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0781E9D2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:01:14 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id g12so1074394uae.6
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kQc0w7us/TAf4WWYBS/555b1Jab1SFMtLDV2690OauA=;
        b=70NKHVT+/6NrgRH1DrihWhy/e2cjaLfEbQL29M8XW1ZwbvXImHQSUZrm99GQ9mlmuh
         BqcVzk4ttQU+JBzc/mbrCQW8D0++tebQRpUJOhBGrGMYokJCtyMBPQHZ+9XD3T2cyg+Z
         OLQ2GElvM4tCAcomDmVIYBYnof7GG+Mle/7r1W4IiUbSQdC7IfAlbIgyFqH5C2+zuXfv
         9kDWTjLFjG8fdSSGvv7Nx0wOnpAFz075wyot4ycdWDH6MguXTlQOpRybiyuWGX3PQemN
         TmVcOTlUQG7Oij5r5qZtAp77xJLGoxTTDIAwT3q/FjUJbtAwlVG7bZ6FHbM5xDX585TT
         1zVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQc0w7us/TAf4WWYBS/555b1Jab1SFMtLDV2690OauA=;
        b=pxPt0VFHdaG8JCkTBRuoFSYiEi7+QPNo3CRz2ZehgYxNnIyCuMFB0XW+ifLEZSLoqV
         9xLBNbwA5vDzd0bPA2Uz/0LyqB116Hbb9TmNsiitlRVh0RFyNf8U7T3ZTrZu4BtfAQTF
         tXkkOLTGmA+Z12wUVEP/rmbcpCgqqMtMudJLoTDzDElytUbxrI401OKVUpGiMGvOhR9I
         5DZVKwp5x++LEm2k9BFMpw9Gjxxt/HTEu7HlhkOKbQAz1Kc64dpLFlAYaRPINe03/L67
         8O2ne33++CTA3B98Kb0vceGmpqBkfOBdoVvy9JG0IcyeZauWd/9n32PY//d8U1cL+r7Z
         yFmA==
X-Gm-Message-State: AFqh2kr1xIP/DI2ilfrkRJJ0yOsaG877WLE91Zby9Ob3IZqJci2u4rWg
        bFZI2FlIzXsFAXWGlVzn/yza7t9b1dJVP4wNoKLVcw==
X-Google-Smtp-Source: AMrXdXsYnbP6JMK2tSR6lKAJWigI0AO5xK40gA0uscxdSkP8glEwEdrPhr6Jix01RSyw4ZDGQg3gsnTue/ifGuZoo6o=
X-Received: by 2002:a05:6130:425:b0:5ed:8c3e:fc23 with SMTP id
 ba37-20020a056130042500b005ed8c3efc23mr1851672uab.87.1673859673642; Mon, 16
 Jan 2023 01:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20230112163941.73143-1-andriy.shevchenko@linux.intel.com> <20230112163941.73143-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112163941.73143-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 10:01:02 +0100
Message-ID: <CAMRc=McaLTaBv6oL-NM2ULFMLU79mJ_Zu6_2=wG=fhxotL7Y=A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: zevio: Use proper headers and drop OF_GPIO dependency
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Moses Christopher Bollavarapu <mosescb.dev@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 12, 2023 at 5:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The driver doesn't depend on the OF_GPIO to be compiled. Hence
> the proper header to use is mod_devicetable.h. Replace of*.h with
> the above mentioned and drop redundant dependency.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/Kconfig      | 2 +-
>  drivers/gpio/gpio-zevio.c | 7 ++++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 3b2078a654ce..a2f64f880163 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -751,7 +751,7 @@ config GPIO_XTENSA
>
>  config GPIO_ZEVIO
>         bool "LSI ZEVIO SoC memory mapped GPIOs"
> -       depends on ARM && OF_GPIO
> +       depends on ARM
>         help
>           Say yes here to support the GPIO controller in LSI ZEVIO SoCs.
>
> diff --git a/drivers/gpio/gpio-zevio.c b/drivers/gpio/gpio-zevio.c
> index c9f4c26cae3d..61e47456c33a 100644
> --- a/drivers/gpio/gpio-zevio.c
> +++ b/drivers/gpio/gpio-zevio.c
> @@ -5,13 +5,14 @@
>   * Author: Fabian Vogt <fabian@ritter-vogt.de>
>   */
>
> -#include <linux/spinlock.h>
> +#include <linux/bitops.h>
>  #include <linux/errno.h>
>  #include <linux/init.h>
> -#include <linux/bitops.h>
>  #include <linux/io.h>
> -#include <linux/of_device.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
>  #include <linux/gpio/driver.h>
>
>  /*
> --
> 2.39.0
>

Applied, thanks!

Bart
