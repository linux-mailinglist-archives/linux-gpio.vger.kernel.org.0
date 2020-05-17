Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D101D67F6
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2020 14:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgEQMW4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 May 2020 08:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbgEQMW4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 May 2020 08:22:56 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D60C061A0C
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2020 05:22:54 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id e125so4796479lfd.1
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2020 05:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TtgG0avlL6NDCbZXqof7Go3TXCYHGmELpiK3GfOhkmc=;
        b=D4O5vizMtqCoBQOzOW/yXN0WoNEUeJ8BVCLl8KGh6XnUlUxWwzTQBouQPYxD+Ofy6v
         5lUsv90zt34Jyz0zyfwb7iHqOitqJ2YZx1FQm4BQGzzmtwbDLJDQQG79md9lkcBI0UlY
         yCKq5yiteOLDUPpij6G24wT15C5YHhB9yYvNBIat4GDR5ps75Rrkyad41ijtw7Tcnrax
         k4O06FB7J9ugKVTk8yPmHdlW5LhfhX1Ly1RcktRzKTiVwBgHE3DKl+ou4ZIOsBLrvuVA
         Ni+hNlmZbQf1f/gc3P/3o/w+597V7ypp4sxYcLVsqh9B4Bg26ERSjfNBM+tmqI54EBPd
         4TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TtgG0avlL6NDCbZXqof7Go3TXCYHGmELpiK3GfOhkmc=;
        b=VvW36kiQSoz49DWPbVDR98cCxTQy3vXH7OsVkw/BnnUC8qnC4zdWFxHTO2sGh0Ogw1
         fnUL6h6bBDBpVl/lfMJ2CQyH/arSiEsWMkIngVDmhYKtLusD3ZMtVfsH2OWAYSgrxFcF
         OQXKwy2ryv5x4OBsDv6d8KXCp7uMmA0OQZDiyS0Yl6rOMLz2V+jC9+MH0ZtAcUuftqLl
         BF+HPNr8PjymK/1zVTCVxZprczV2+sdYBezIl6l4gMPN3X71PLSBC73HPC/s4q+yA9B/
         NVHhpO6hgL6vYBv45nHAcmrZp+pbBo8DaK0bCVvFLkgOziuxmbm3iQ0raiqNBt+5FGiJ
         +4hw==
X-Gm-Message-State: AOAM530ZIQukF0Cnzal8d2wcXCE82LUBjUmS63MFe0+hQYRHiELcpuP6
        B/gdOhojyBCFuSIdY9a+7IE=
X-Google-Smtp-Source: ABdhPJxMBW2jPaUABaKnLGMRLAxywKB32EEP8lNnU9qGzysDyRqdCaUea2NEAsQblYmrIHfK9gQ+nw==
X-Received: by 2002:a19:c6c2:: with SMTP id w185mr6740593lff.69.1589718172932;
        Sun, 17 May 2020 05:22:52 -0700 (PDT)
Received: from mobilestation ([95.79.192.151])
        by smtp.gmail.com with ESMTPSA id j29sm5679544lfp.90.2020.05.17.05.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 05:22:51 -0700 (PDT)
Date:   Sun, 17 May 2020 15:22:49 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/4] gpio: dwapb: avoid error message for optional IRQ
Message-ID: <20200517122249.mpkw4tnpfraqttbk@mobilestation>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andy,

Thanks for sending this cleanup series. By comments are below and inlined in the
individual patches further in the patchset.

On Tue, May 12, 2020 at 09:45:10PM +0300, Andy Shevchenko wrote:
> platform_get_irq() will generate an error message if the requested IRQ
> is not present. Use platform_get_irq_optional() to avoid the error message
> being generated.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 8639c4a7f46974..5bc5057f071f37 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -542,7 +542,7 @@ static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
>  		if (np)
>  			pp->irq[j] = of_irq_get(np, j);
>  		else if (has_acpi_companion(dev))
> -			pp->irq[j] = platform_get_irq(to_platform_device(dev), j);
> +			pp->irq[j] = platform_get_irq_optional(to_platform_device(dev), j);

If only we didn't have sub-nodes describing the GPIO ports, we could have used
the platform_get_irq_optional() here for both DT and ACPI based devices...
Since we do, there is no way but to have the "if (np) else if(has_acpi_companion())"
conditional statement here. Thanks for sending this patch.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

>  
>  		if (pp->irq[j] >= 0)
>  			pp->has_irq = true;
> -- 
> 2.26.2
> 
