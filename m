Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBFE21B4A73
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 18:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgDVQ2N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 12:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbgDVQ2N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2020 12:28:13 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2913C03C1A9
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2020 09:28:12 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w20so3013283ljj.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2020 09:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jh34xQLAdLVa3Jb0cZAhcrfr5B2psBww6k3NySEC3Ic=;
        b=JLecEVlMkbymQSsiitD9WYTzaqLY/PdetekYqRGjDsWXcQMWW/8ljb+qNLKDXb65zR
         Z/0mbSfsW5Flg1CfnnObvDxc1gAwO9UebF4FcYA9B8aBVsoMmXscOgEWpSFFqAXuK4YA
         w6zLmPMoOtatUvDIqKas9uB5TBmV6MVF4XA77bbJdOQrb4EeOd9pKLbNQ2GZGgWzj9kE
         tyY/IBN0iXXRYMlMREWbXvmyRb2PbijUg0BNxi/VIRhWRlmBd//wvaQ+67JEoNVQF5Jw
         FjcgHq8vUmuxlkzPweZT2Ji9T3LIICECdX4ilm98U9ix8DknC5JtlFt1u/vrO0A4o9m+
         oU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jh34xQLAdLVa3Jb0cZAhcrfr5B2psBww6k3NySEC3Ic=;
        b=Jpr3b5zkWbNpeMJGXnft4oxoBuGekn1RLMLZubhN/hM1ZIMaXTbwoZKbsiI4JQTMIT
         +gM2GfSmX0vBDsjZg6F/xtqbZHHCCZfdpLz6wrNRElG5QamxIbYlupipXzg5cZphgOI4
         //HC4BZApprKSxZbsvC1wZ7f8GhjJK4GZzYcu+Z/hUgZTHJXp7G+NoLVLyyoCr4zaYyw
         2lrOnYk8MmwF+VNZVK3p0con4GYwwJtlsV5X/qItPKxlMf5cCh9n90ZvX+Gcx7tUyYeK
         utTmJtqFjv/hVZvEutChXooFIuZND5yifqCK81oppI1P8yxjNuyxH3Nrp6KjQOWN35Hy
         4/SA==
X-Gm-Message-State: AGi0PuZjeVKU4nxBYV4VFz4qBP1kR2zIJSd79vFlInfkrjMhvIcmNeFz
        783iZXVMPmcg6rtPLOgjZWIgk85+
X-Google-Smtp-Source: APiQypIgn7lk13lS/DuRJWWnWjH0d020qCWI/sDCR47x47fHaUWx+sAAjO5cO5Q2mTml10sH/E9yKA==
X-Received: by 2002:a2e:9e97:: with SMTP id f23mr14966249ljk.228.1587572891066;
        Wed, 22 Apr 2020 09:28:11 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id q6sm4975544ljp.21.2020.04.22.09.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 09:28:10 -0700 (PDT)
Date:   Wed, 22 Apr 2020 19:28:08 +0300
From:   Sergey Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/2] gpio: dwapb: Get rid of unnecessary conjunction
 over 32-bit value
Message-ID: <20200422162808.lezkix7i53bx35fs@mobilestation>
References: <20200422110654.23442-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422110654.23442-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 22, 2020 at 02:06:53PM +0300, Andy Shevchenko wrote:
> When we mask interrupts before sleep, there is no need to have a conjunction
> with 0xffffffff since the accepted by dwapb_write() value is 32-bit.

Thanks!

Acked-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Cc: Serge Semin <fancer.lancer@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 31d29ec6ab5c3..9d8476afaba3d 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -743,8 +743,7 @@ static int dwapb_gpio_suspend(struct device *dev)
>  			ctx->int_deb	= dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
>  
>  			/* Mask out interrupts */
> -			dwapb_write(gpio, GPIO_INTMASK,
> -				    0xffffffff & ~ctx->wake_en);
> +			dwapb_write(gpio, GPIO_INTMASK, ~ctx->wake_en);
>  		}
>  	}
>  	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> -- 
> 2.26.1
> 
