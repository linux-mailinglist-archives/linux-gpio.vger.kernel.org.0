Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51DE6398BEF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 16:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhFBOMa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 10:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbhFBOLW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 10:11:22 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172E3C061353;
        Wed,  2 Jun 2021 07:07:24 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id p20so2739155ljj.8;
        Wed, 02 Jun 2021 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z8hbjBK7j112IEgpMKXyOaZgsSb/pH89ZJTpUTkpOss=;
        b=W6B3KdY82r3xcjgNU6UXSMiKDnJ8J68vCs6Wbp3oZS0BP1N8YTztDR2uoGkzbFRXcm
         UJiGgDysGNfYiBKuZ80CF4vQCkI69Q0LFv83xeTxLEPi7qbYo6komXiYJF6G/6jKmz3D
         uWkAkReEaK1O1eecLDAlA7UelJmqpvjYPX0lKCykdpPZQsucmLd7iNtSObiVsGATd8t8
         qx0pZh4OCqbM7iiYeHvJdxp9Op9hN4I6miHLo7nvbKLyGMWTiIqhsUdZtnxLJV4rPiVy
         pJaN6Wbjmn6/Cs/rX3mYFxHTnh3oC1nqqTdwDCiFxbzVMiTGA0+L8XYPLgbkmAn6XNa0
         v4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z8hbjBK7j112IEgpMKXyOaZgsSb/pH89ZJTpUTkpOss=;
        b=oMeungAz9JqC2iCYXwYLLZDIgmxn1fH7kWqCUiCy1+yBNX+cmt/uNxo9g6i16Ig3Pa
         wZLvbHiJ1HvWKgLJAbctCX0URyMNX01GVLR+te1rgreTWQUoUKg93SHSjiIF/lxJ52zx
         Rx2xO59tbNKtDx+Giv+RSE7z+K2QyVVUTjFzQ7Z4ZY1jOCoX1DgY1xK9UMcoxtDSz/zc
         Hju2hnaAFQMmNE9lRfbHzHKNVRpY3tKxu0Kb/kns8GH5y6LuOduUteI7dfcHqKCUri1s
         DtBJrJbnDXm0gA4KeBYVxquLJTG2R7eySN0GGiyEFRLgDFBIInK8TuAX/akRigl9KSR6
         KdhQ==
X-Gm-Message-State: AOAM5309OGLdWQfXa+Ss3piPbrqvL18U1zqYj59GRy0JzptnnypGFSYJ
        U/ne7FZrPqjHHMRssv5hQH4=
X-Google-Smtp-Source: ABdhPJxLpbcOykqL4m+9pYr73IVufWicfc4V2JM/quQzjgJlLFnLplyOWc4OE80V16Lfp4namWY3RA==
X-Received: by 2002:a05:651c:292:: with SMTP id b18mr24596186ljo.456.1622642842106;
        Wed, 02 Jun 2021 07:07:22 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id j8sm2216251lfg.250.2021.06.02.07.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:07:21 -0700 (PDT)
Date:   Wed, 2 Jun 2021 17:07:19 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 1/2] gpio: dwapb: Drop redundant check in
 dwapb_irq_set_type()
Message-ID: <20210602140719.roop7gm6i56uagen@mobilestation>
References: <20210601162128.35663-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601162128.35663-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 01, 2021 at 07:21:27PM +0300, Andy Shevchenko wrote:
> For more than 15 years we may not get into ->irq_set_type()
> without any meaningful type provided.
> 
> Drop redundant check in dwapb_irq_set_type().
> 
> See the commit e76de9f8eb67 ("[PATCH] genirq: add SA_TRIGGER support")
> out of curiosity.

Why not. Thanks for the patch.
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index d3233cc4b76b..939701c1465e 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -297,9 +297,6 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  	irq_hw_number_t bit = irqd_to_hwirq(d);
>  	unsigned long level, polarity, flags;
>  
> -	if (type & ~IRQ_TYPE_SENSE_MASK)
> -		return -EINVAL;
> -
>  	spin_lock_irqsave(&gc->bgpio_lock, flags);
>  	level = dwapb_read(gpio, GPIO_INTTYPE_LEVEL);
>  	polarity = dwapb_read(gpio, GPIO_INT_POLARITY);
> -- 
> 2.30.2
> 
