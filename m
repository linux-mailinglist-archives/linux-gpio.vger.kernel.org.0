Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF8F3E15AE
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 15:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241009AbhHENat (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 09:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236413AbhHENas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 09:30:48 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB996C061765
        for <linux-gpio@vger.kernel.org>; Thu,  5 Aug 2021 06:30:33 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id c16so6530293wrp.13
        for <linux-gpio@vger.kernel.org>; Thu, 05 Aug 2021 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=o6l+0HCVwdFKPSNGNpE45TSpWyYqq7pqwi1msZsfIig=;
        b=M9QIG2V7JgG78B/X57JWy1N8s0g/1+U6ccvpCIp/upwAWwlUGgmnijeHzpYk16lEfw
         Sf4A19gK+4bXBUs7sGL/q6l+0Vhsf18ZVamPFW51XFa3hSMDGRb2+kezWbnolUhEfCVw
         PTwK5MWaG/zeFry/2ZKdhESqHGiFUJOGHIDYHik2guD3iqdRRWDKV6PsZqTRbTftxyw9
         m1yFhOkrfj8xIY4v95aoc0RAkUkY8Y0mc3hh8csCJZ20FY8Dt3U8Y3nFsyTc4Y/yem9K
         chAW0/SpSurhniDIoDasXRs9RP26YCbpMG6o6qSqH44XqqMi9EpYj2y48jOuiygytyVY
         nmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=o6l+0HCVwdFKPSNGNpE45TSpWyYqq7pqwi1msZsfIig=;
        b=J3QD57T+bJm+GbcVyFbnQrgMVbQTFUHNGQn0si74rtJTgH8tx93Rr1IAMrQgc+Y0y9
         8CMvJ4aGVIql+q9czMPxjCj20FZAffJHkZfYAiXx8ZNljcMiBYV8o9URDJ3T8Xti7S/x
         T4PHJj+n0l2uZ90Z5GW8COnCCsmFTGXPmS/npRpcgLNkqHcD08NUzaZ37Hm/X+rC8F6n
         FZiSDAxU0ICgTPggN4fS/o5zCLQIVmzil9G3zv3lCzCBO6xvbYxoKDIw6EfKrQaJPCUY
         wxdE5Dzx+4O00fvI5jNlk1RlZ5OiOOcDnkkWQ+F07OZGS5oS9W4526j47+Wr4ZAHZ0qe
         0i9w==
X-Gm-Message-State: AOAM530dfBEjLbGV6qXfS0oOjeztwXtWnlRtudftlkcVyByD9ukNjdas
        AEZaMlRyz7uUAq3EuLquo5h9mA==
X-Google-Smtp-Source: ABdhPJzYlh4/9sfnKY5UbgWzbhLA45kdhKY857jCGGTCK+evpxcyd9EYCUKCbixblA6+Va4eYWemIA==
X-Received: by 2002:a5d:6ac4:: with SMTP id u4mr5361971wrw.166.1628170232208;
        Thu, 05 Aug 2021 06:30:32 -0700 (PDT)
Received: from google.com ([109.180.115.228])
        by smtp.gmail.com with ESMTPSA id x16sm6353936wru.40.2021.08.05.06.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 06:30:31 -0700 (PDT)
Date:   Thu, 5 Aug 2021 14:30:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] mfd: tqmx86: clear GPIO IRQ resource when no IRQ
 is set
Message-ID: <YQvn9dkFluRYj80r@google.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
 <65f9787ebd6725e90fad9ea7f936ee0d5712da94.1626429286.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65f9787ebd6725e90fad9ea7f936ee0d5712da94.1626429286.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 16 Jul 2021, Matthias Schiffer wrote:

> The driver was registering IRQ 0 when no IRQ was set. This leads to
> warnings with newer kernels.
> 
> Clear the resource flags, so no resource is registered at all in this
> case.
> 
> Fixes: 2f17dd34ffed ("mfd: tqmx86: IO controller with I2C, Wachdog and GPIO")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> 
> v2: add Fixes line
> v3: no changes
> 
>  drivers/mfd/tqmx86.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
> index ddddf08b6a4c..732013f40e4e 100644
> --- a/drivers/mfd/tqmx86.c
> +++ b/drivers/mfd/tqmx86.c
> @@ -209,6 +209,8 @@ static int tqmx86_probe(struct platform_device *pdev)
>  
>  		/* Assumes the IRQ resource is first. */
>  		tqmx_gpio_resources[0].start = gpio_irq;
> +	} else {
> +		tqmx_gpio_resources[0].flags = 0;

Strange - why is this !0 in the first place?

>  	}
>  
>  	ocores_platfom_data.clock_khz = tqmx86_board_id_to_clk_rate(board_id);

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
