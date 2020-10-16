Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352512909D2
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 18:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408904AbgJPQjn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 12:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408887AbgJPQjm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 12:39:42 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FF3C061755;
        Fri, 16 Oct 2020 09:39:43 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id i2so3177847ljg.4;
        Fri, 16 Oct 2020 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=synglPHi+2c/KfgNQX/THCsSkCYm8hlWpcFqdpvQGo8=;
        b=LKUqBQoZowgNYEKG3eaOpp9YDpZFOOOIjBRBFw7Lz8Hc5n6FzV32nAgetFJCOckMZE
         xauJTcwQt64wFNycxaKKqeymVlV+8jrmNYAayIdvnQCpGmSuPunToiZYSneCGY9NGHiX
         AfSRPRzwCiEf6eOYJ6iQuMKKe4XkTJwkK2ibeGwABERAFDYDB4oVK0h4+rlL8jWOLaDt
         1csIbP8niiTxgT1elRN7+isZMHZkBYAGGt0QaC/uxW6wbZA2YCcb+Tqr7PGR3yVT7kYe
         567npPkbKcDaceGCJ2ZXbdd3oNj/pS42/a/p6yjsGsBiadvc5Y7kMu0kyocoXk7ytMnX
         4tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=synglPHi+2c/KfgNQX/THCsSkCYm8hlWpcFqdpvQGo8=;
        b=YgH0YrNYjfg8Zk45D6RW8yCIumLtnd1ErdBLtAMgXMvYSYpJrrH8Kv567TRRtSJt8T
         bA7wJ/ByjYEduabVHVkLoFj7b9lVOSF0Xq0s2DP1FeFUAMKofPY7O+VPdzYF3aGLL+M8
         EeRZIR4gbqDUGkuF7dsf1TnPPwYYWXWxhX4j4nCBikv1A+o5YqYnCLzb2fi2Pd15cUdo
         zZN6fGwfdwhUVfhWYJohNYEcXfW2ElXRAzGK0TizbYk6sfldgUlxVzUARlmVpv4XioNg
         PrBHRf+gD4nAjOMHJO6G9vBP5VBueH7ZOe3r50qgJY78p6cgAZ8Ap+/dGQZ7y50ZnMQs
         pwaQ==
X-Gm-Message-State: AOAM531VdRmCSeUJ1orZz5i9TrCiSikY6yx3ICxJW+GT3RL8w5FXR1nQ
        UNJv51kgnXxVg4i1bWirbzg=
X-Google-Smtp-Source: ABdhPJzAWF2wGa64QsDT11JmsDcjsqicC0sCfUHdy++DzLQT7n8UJ3yBvuj/pCD5qPZGO8pYzsatig==
X-Received: by 2002:a2e:7014:: with SMTP id l20mr2026574ljc.91.1602866382034;
        Fri, 16 Oct 2020 09:39:42 -0700 (PDT)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id z14sm1048450lji.84.2020.10.16.09.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 09:39:41 -0700 (PDT)
Date:   Fri, 16 Oct 2020 19:39:39 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jia He <justin.he@arm.com>
Cc:     Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: dwapb: Fix missing conversion to GPIO-lib-based
 IRQ-chip
Message-ID: <20201016163939.ouxuphconlmlfze3@mobilestation>
References: <20201016153544.162611-1-justin.he@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016153544.162611-1-justin.he@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Fri, Oct 16, 2020 at 11:35:44PM +0800, Jia He wrote:
> Commit 0ea683931adb ("gpio: dwapb: Convert driver to using the
> GPIO-lib-based IRQ-chip") missed the case in dwapb_irq_set_wake().
> 
> Without this fix, probing the dwapb gpio driver will hit a error:
> "address between user and kernel address ranges" on a Ampere armv8a
> server and cause a panic.

It's strange I didn't get the same panic. Anyway, good catch! Certainly:
Acked-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Fixes: 0ea683931adb ("gpio: dwapb: Convert driver to using the
> GPIO-lib-based IRQ-chip")
> Signed-off-by: Jia He <justin.he@arm.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index a5b326754124..2a9046c0fb16 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -343,8 +343,8 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  #ifdef CONFIG_PM_SLEEP
>  static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>  {
> -	struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
> -	struct dwapb_gpio *gpio = igc->private;
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
>  	struct dwapb_context *ctx = gpio->ports[0].ctx;
>  	irq_hw_number_t bit = irqd_to_hwirq(d);
>  
> -- 
> 2.17.1
> 
