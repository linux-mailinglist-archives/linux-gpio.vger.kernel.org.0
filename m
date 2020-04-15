Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA9C1AA332
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 15:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505920AbgDONFj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 09:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2505912AbgDONFg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 09:05:36 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE6E3C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 06:05:35 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id f8so2524064lfe.12
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 06:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ISGEVSOrETsWHkJIVGiZIG2jGacSnkITAE+kUTUM36Q=;
        b=i02Bl01Y/J8+kq/qnd/Bz1v13ATR/mkxiLFSsv/KFPOcgDdmGVS1govvQWlvM+mwoQ
         lmXi7y77qagZL/kywZFh3+wVUTt4BcAAlITYqiugMmDZ1hw1HLP1UMWhSzQ6n5ifr4Og
         Pg2E53JE9TcpbDAp/ki/cNj9qozMhEbOmPS1P5RftsvHaWKtVd/hHsvmk/8sJDPoSX3v
         2kMHNXwMGTJvdzttJbBWid1VgVRmtKhovZIFcb5jfZzPr+vwM4UWH7+D8OXsc+V2GUpw
         LImjVHVZ/NG+YS+Hu5/9KFZPgWk/rVYIyEFLPg+6LSErOOdmm+iiLSlVVQ7ar+Gghqus
         g6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ISGEVSOrETsWHkJIVGiZIG2jGacSnkITAE+kUTUM36Q=;
        b=VrBVX2DmL5tDtEpNz9yWh/wbVGxysmQxWuFtsxG9x7PwysO8y6PFzfpFICVYKDsNVN
         5L6UG0GE1s0GseiQb/Qz79rS44ZiKF6iDlaSvhclfVnLls6AWVFTelJ2xI17WCVeg71Z
         QOCySEPgZpIYStnDVKY9+BvDYf7kzlJokwlO4BqFvtWLg7X6tHbw1uMNOIWmVGZFrYZD
         Hh3RLo7GoQaBHwnt6S2y+TEEqFw0oeGFoc0/NN2KA7v/paYUPDui4pHDPX7mC9herKWP
         mLz7R4n7wyU5gJrXOxwSeYm0YJZKASX7fRZDny5FdQlkVG3pgs5/lU+Ir17/rD12gatd
         yplg==
X-Gm-Message-State: AGi0PuZjtZumTdoKfoiP82wJ35W4mzORbnAlHCWxG7oimsIUgv8qdvub
        ayjRqfP0F5ayikMBw3zt7Ak=
X-Google-Smtp-Source: APiQypKrcMUiYhPgIixU3czxJlOwYqVqz12mXbhMqpAxk+Q8fOsHnJed68TWFehmOndh/x6887TfbA==
X-Received: by 2002:ac2:4546:: with SMTP id j6mr3119870lfm.203.1586955934486;
        Wed, 15 Apr 2020 06:05:34 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id p28sm11567823ljn.24.2020.04.15.06.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 06:05:33 -0700 (PDT)
Date:   Wed, 15 Apr 2020 16:05:32 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 09/13] gpio: dwapb: Drop bogus BUG_ON()s
Message-ID: <20200415130532.ribc7sv7unvjhww2@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-10-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141228.49561-10-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:12:24PM +0300, Andy Shevchenko wrote:
> There is no case when no context is provided in the ->suspend() and
> ->resume() hooks. Moreover, BUG_ON() is harmful to user and makes kernel
> inoperable after the crash. Drop the BUG_ON()s for good.

Right. Thanks. Though I wouldn't name them bogus, but redundant or
unnecessary instead.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index a15652ff9495..c03d856be703 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -723,8 +723,6 @@ static int dwapb_gpio_suspend(struct device *dev)
>  		unsigned int idx = gpio->ports[i].idx;
>  		struct dwapb_context *ctx = gpio->ports[i].ctx;
>  
> -		BUG_ON(!ctx);
> -
>  		offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
>  		ctx->dir = dwapb_read(gpio, offset);
>  
> @@ -773,8 +771,6 @@ static int dwapb_gpio_resume(struct device *dev)
>  		unsigned int idx = gpio->ports[i].idx;
>  		struct dwapb_context *ctx = gpio->ports[i].ctx;
>  
> -		BUG_ON(!ctx);
> -
>  		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
>  		dwapb_write(gpio, offset, ctx->data);
>  
> -- 
> 2.25.1
> 
