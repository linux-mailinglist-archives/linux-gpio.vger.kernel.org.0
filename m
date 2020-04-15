Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928321AA29B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 14:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505614AbgDOM6X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 08:58:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2505605AbgDOM5u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 08:57:50 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4518C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:57:49 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q19so3513564ljp.9
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kD4qqW2kJKRYepjOgQ3e/6IsRwOq3O6XyIxD6kmiNls=;
        b=giKKFtR/Q6fmKT88RuPkWGPoI3aMvQsdx802xCX2x9mhuXVG/JcD+FTJEGIlLcQXJL
         buHLHxJhBGfcnqwscCQlWFGcQNfqzDuONP6NstkHdBbkUtyiEj+gAbtG8h5FvQN6sP+L
         udwysT6ZoL5pVNU9/CmfmH2WEUttThLqat54tvUSQg0EmwjueyIhxM2BoTzP6DXI8q47
         ciTtibaX8F+Hrmq1nWcMOauFoahvqAI3tmxuijjNeh7JZs6g1tZDGhdkrqDWCeS8d/Eg
         cbhd1nmtQFWxHlOTkmUyRaYghx9wLSIYfjnhuFwkSBHVyF++V8ISJ0hRQRU3j9YjnlqL
         nW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kD4qqW2kJKRYepjOgQ3e/6IsRwOq3O6XyIxD6kmiNls=;
        b=BGJHJCPEcHMbGVW6wIs2seiFb3QIppGA7VTdt3y054hlI4WXcDQ1cekGlzuck2Lnvm
         obSzFHzoSecMQMDQkEvPJIhh/Qx/0jxTOaufJGatufLTuCPw2e2dwA4mng5d/WZ5SHj9
         1Ii7uOODMSLKxnQLf0Krx85swkG11vYaUYKY43SjBH9NMMVx0jr131ERXLJdTFV0BZef
         IkWTqlc2pJkdOtpwSJSjESW8oath6bgnkwa+wZyxPzmiWCgsRecDbhZTla99A8++mNfN
         ae5rcqIbZvMfioasOwjUNcqS3EKq/38FTAiYI7gSQHspA/zJTx+bvYyXR9DrkwfSdIUv
         nHow==
X-Gm-Message-State: AGi0PubrUQx6U7gTsd411+NrdCvxiLx10zJs4cRkHxdmkbi/Xtp1oljP
        J9Q+oOY0FqnZn39JmLnFEsQ=
X-Google-Smtp-Source: APiQypIIByb9UQQDvY6fh/aBHPQ+DiQwrjLVFxNUw7trEegleveoPtt0DSzukCDjOq8kE05Z8T6ofA==
X-Received: by 2002:a2e:a36c:: with SMTP id i12mr3082902ljn.24.1586955468259;
        Wed, 15 Apr 2020 05:57:48 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id s10sm11672195ljp.87.2020.04.15.05.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:57:47 -0700 (PDT)
Date:   Wed, 15 Apr 2020 15:57:45 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 07/13] gpio: dwapb: Convert to use IRQ core provided
 macros
Message-ID: <20200415125745.ab4ehxz22dovcuwy@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141228.49561-8-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:12:22PM +0300, Andy Shevchenko wrote:
> IRQ core provides macros such as IRQ_RETVAL().
> Convert code to use them.

Looks good. Thanks.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index a0a0288bb73e..916a42fea456 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -258,8 +258,7 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
>  	unsigned long level, polarity, flags;
>  	u32 bit = irqd_to_hwirq(d);
>  
> -	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING |
> -		     IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
> +	if (type & ~IRQ_TYPE_SENSE_MASK)
>  		return -EINVAL;
>  
>  	spin_lock_irqsave(&gc->bgpio_lock, flags);
> @@ -351,12 +350,7 @@ static int dwapb_gpio_set_config(struct gpio_chip *gc, unsigned offset,
>  
>  static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
>  {
> -	u32 worked;
> -	struct dwapb_gpio *gpio = dev_id;
> -
> -	worked = dwapb_do_irq(gpio);
> -
> -	return worked ? IRQ_HANDLED : IRQ_NONE;
> +	return IRQ_RETVAL(dwapb_do_irq(dev_id));
>  }
>  
>  static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
> -- 
> 2.25.1
> 
