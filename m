Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC28F5688A2
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 14:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbiGFMr2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 08:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbiGFMrX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 08:47:23 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0F017074
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 05:47:21 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id r3so27122291ybr.6
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 05:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P2po2ucNxJ6VuSoLGjxJMNOM8yOAR4F+G95zImPRegw=;
        b=ItQ30KxgJ4/Jpc9l78KMy6sKRsaL/8rBu7hxmTYeFlljMjm0M5+dcq0/6J2rGpuc65
         Iv0Uok9EGX+waHkLiCQduOaNAMpjM0zKexdkjWtA63Syd9w0L3L/ZSUvfiVinMYyRqby
         eHGc/VbfUu8x7FpGsAtyaXI6Q4mDnUEmJ/jCmUw91JF5Y9SGIi2kJrbn2d3MSp/OTdRR
         KnQcJ5iWo6zLnYEh3NwHrCTV5GpgRXy/a+V4T1zOx5SduSS3FiNFeWN6NOG5Ny3e7wEF
         Ulc8U6tWmIYVZo5yV4V8CK076nr0XIZmSn0K5AupHI41iPDMzqXkgyMe3TE18svvkZ/j
         4Y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P2po2ucNxJ6VuSoLGjxJMNOM8yOAR4F+G95zImPRegw=;
        b=Swy69ebQIgZ10X8BIbDVLoO7C9bG96Me7rl1nLlYeSScaRMR8NJBotZshmEixMvzfe
         sSMG9YhW0nsZlCughAI6somcPAtJZjNyWOWwk0XoGJqsB9MbeDNwVw3ohhJIPqrbVZEn
         u5YUL7LLIHIfOJ5t+bl5Gseb9My9AKSlBW/KqTakmX1E3zrBa8yRsHjNjlZLcDmcYztU
         yboGjdMDAKv2QtQGdX/TQJP/v1u1t13rVY5pYrz8Pig6Y9NG/1WSgvqjnnvzZJFmISLe
         W9gytRmXfkB4stxd5uLrzZ5pdzyiRoM8vOlGnihH7ml8xpg4fG3GwRf34LQwPmIKTsHF
         fjzw==
X-Gm-Message-State: AJIora+Dix7fGySqlEfTXDflrKNZ0waueP7eTZGQ2favEKwQfz2w6HL4
        fm0tNlx0ZYFYxXkUzPbCdXx61HsfH5CbQwmTluA1NvjFDC7Fyg==
X-Google-Smtp-Source: AGRyM1vbmbi+VvAONuBmFZ+KzJYxk4g/XNz2EKSsjYM47ss9D3Qo9i4L/EojA0if+s6jmskPeb5UVaeD1a4/wd/6OQ8=
X-Received: by 2002:a25:d07:0:b0:66e:6c0e:a2d1 with SMTP id
 7-20020a250d07000000b0066e6c0ea2d1mr9711160ybn.369.1657111640697; Wed, 06 Jul
 2022 05:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220704091313.277567-1-windhl@126.com>
In-Reply-To: <20220704091313.277567-1-windhl@126.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 Jul 2022 14:47:08 +0200
Message-ID: <CACRpkdZWEC2jtCk0Xjcq9HOWAbSQvqU7EQiwhbg2bJCVjy+WbQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib-of: Fix refcount bugs in of_mm_gpiochip_add_data()
To:     Liang He <windhl@126.com>
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Liang,

thanks for your patch!

On Mon, Jul 4, 2022 at 11:13 AM Liang He <windhl@126.com> wrote:

> We should use of_node_get() when a new reference of device_node
> is created. It is noted that the old reference stored in
> 'mm_gc->gc.of_node' should also be decreased.
>
> Fixes: f141ed65f256 ("gpio: Move DT support code into drivers/gpio")

I doubt this is fixing that commit since it is only moving code?

> -       mm_gc->gc.of_node = np;
> +       of_node_put(mm_gc->gc.of_node);
> +       mm_gc->gc.of_node = of_node_get(np);

Aha


> This patch is based on the fact that there is a call site in function 'qe_add_gpiochips()'
> of src file 'drivers\soc\fsl\qe\gpio.c'.
>
> In that function, of_mm_gpiochip_add_data() is contained in a iteration of for_each_compatible_node(),
> which will automatically increase and decrease the refcount.

Put this into the commit log message!

I guess it solves the immediate problem, but the real solution is to
get rid of of_mm_gpiochip_add_data() and struct of_mm_gpio_chip
and replace all calls with instances of proper gpiochips using
[devm_]gpiochip_add_data().

Which is in our TODO file.

It's not very much using this old helper:

$ git grep of_mm_gpiochip_add_data
arch/powerpc/platforms/4xx/gpio.c:              ret =
of_mm_gpiochip_add_data(np, mm_gc, ppc4xx_gc);
arch/powerpc/platforms/8xx/cpm1.c:      return
of_mm_gpiochip_add_data(np, mm_gc, cpm1_gc);
arch/powerpc/platforms/8xx/cpm1.c:      return
of_mm_gpiochip_add_data(np, mm_gc, cpm1_gc);
arch/powerpc/sysdev/cpm_common.c:       return
of_mm_gpiochip_add_data(np, mm_gc, cpm2_gc);
drivers/gpio/gpio-altera.c:     ret = of_mm_gpiochip_add_data(node,
&altera_gc->mmchip, altera_gc);
drivers/gpio/gpio-mm-lantiq.c:  return
of_mm_gpiochip_add_data(pdev->dev.of_node, &chip->mmchip, chip);
drivers/gpio/gpio-mpc5200.c:    ret =
of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
drivers/gpio/gpio-mpc5200.c:    ret =
of_mm_gpiochip_add_data(ofdev->dev.of_node, &chip->mmchip, chip);
drivers/soc/fsl/qe/gpio.c:              ret =
of_mm_gpiochip_add_data(np, mm_gc, qe_gc);

Those are all.

They all seem like they can be simplified a lot by using select GPIO_GENERIC
and bgpio_init() in the manner of eg drivers/gpio/gpio-ftgpio010.c replacing
a lot of boilerplate code.

If you have access to the FSL board and can test this, please consider doing
this bigger change instead, at least for that board. It is certainly making
the world a much better place than reparing the mistakes in code
using of_mm_gpio_chip.

Yours,
Linus Walleij
