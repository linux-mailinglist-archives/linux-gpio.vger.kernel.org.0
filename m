Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB711AA005
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 14:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369131AbgDOMWh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 08:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369120AbgDOMWR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 08:22:17 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35E2C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:22:12 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r24so3436116ljd.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QV2GUGRRb0bR5elUgwxfO93XCtnEtS1YXGti93Wqa8o=;
        b=sooWwYtmC9Ahxj6tH1ufF+oTmpyC676qDRJO67vhBPnc0H+OidRRUI7+Fffv2bAXrt
         HmtdA7GAb2ldVhwrMmbq2+ExzofPLrz808inRnUwSqps3jXEGqNguTo+/Xl+N+Gjd7YX
         4nmbn0J48pmVOaxT+9pETBvTLU7VALniw8SKhRNJSW0/ZHIHEpepF9qZw1PCEBDOHm6I
         eGB6eBYjq+wFy9iMsOsKluYl+tbzQtsJE0u/S0sID7J75JttNVJ3GlGo+qOXZOOKjFxa
         4qBWe/lgKv6Ntfc3MrdBY0w9HyoF6PHWv7xD+I6FigPBc7B4Fw2W3VUCnhESHvfcIzGF
         kEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QV2GUGRRb0bR5elUgwxfO93XCtnEtS1YXGti93Wqa8o=;
        b=ADgeomudnkS3sMJSN6Xkzkncw0ar7fq9pY3mKLe4XTfwUdauWuyr0A+PjCuLbnJ8tO
         5OAuI0EIhFyKCnuyRfHzM8T7T6uB1CyCSEWz6cZSOPQfYFE5MicF88qLv6HxwtrsggsX
         n7buNwHfLdnZGgID7rYl/Fu1LSjFRwIab1NfWE6G366lxbMuSVCYRG2EbJo6ZfVINcVO
         4T4IT0tU2MDOBSq2Zhar/y9dxiAqGhqQAyEAhH+4hrv7VudOI8xACUtHZvOTzjFKPdaT
         T/h91dW+pBf+Beoa2GWNkK4McYmxIAndAHnca+3kzcNJS3lECOZiHq5DsYEq6FnU8rN3
         b+zQ==
X-Gm-Message-State: AGi0PubhKpVdEwA+lW/wkSKZJNdUnJ3oBxCRRvGdjzOB8LuMv6P65alp
        vlBKXD+Owq7ePggIkBxr5Jw/IAGO
X-Google-Smtp-Source: APiQypLZBxxbPUsI2GncWBJPhMumkJzERHJ0Zmt77S9zmZ+srf3KWnqwI64ORP0cVtHgva55tabMXQ==
X-Received: by 2002:a2e:3012:: with SMTP id w18mr3273063ljw.100.1586953331365;
        Wed, 15 Apr 2020 05:22:11 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id a28sm12316378lfr.4.2020.04.15.05.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:22:10 -0700 (PDT)
Date:   Wed, 15 Apr 2020 15:22:08 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 03/13] gpio: dwapb: set default handler to be
 handle_bad_irq()
Message-ID: <20200415122208.wp7ah6nxwhph4wi5@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141228.49561-4-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:12:18PM +0300, Andy Shevchenko wrote:
> We switch the default handler to be handle_bad_irq() instead of
> handle_level_irq(), though for now apply it later in the code,
> to make the difference between IRQ chips more visible.

s/IRQ chips/IRQ types ?

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Note though I'd better refactored the whole dwapb_configure_irqs()
method with using GPIOlib irqchip API, which is preferred by the current
GPIO subsystem. This isn't a subject for this series. Just to note, that
such change is very actual.

-Sergey

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index f61139f787d9..588d5c61ae42 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -400,7 +400,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  		return;
>  
>  	err = irq_alloc_domain_generic_chips(gpio->domain, ngpio, 2,
> -					     DWAPB_DRIVER_NAME, handle_level_irq,
> +					     DWAPB_DRIVER_NAME, handle_bad_irq,
>  					     IRQ_NOREQUEST, 0,
>  					     IRQ_GC_INIT_NESTED_LOCK);
>  	if (err) {
> @@ -439,6 +439,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  	}
>  
>  	irq_gc->chip_types[0].type = IRQ_TYPE_LEVEL_MASK;
> +	irq_gc->chip_types[0].handler = handle_level_irq;
>  	irq_gc->chip_types[1].type = IRQ_TYPE_EDGE_BOTH;
>  	irq_gc->chip_types[1].handler = handle_edge_irq;
>  
> -- 
> 2.25.1
> 
