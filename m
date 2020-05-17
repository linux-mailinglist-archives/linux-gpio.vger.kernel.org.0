Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8124F1D67FE
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2020 14:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgEQMwv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 May 2020 08:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727893AbgEQMwv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 May 2020 08:52:51 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CA1C061A0C
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2020 05:52:49 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id c21so5614075lfb.3
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2020 05:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uB1jG63W7Cp1ecScOF+aprB3eZpA77tRCncXlSJlqoM=;
        b=Ewn9P0CPEHbFcPHNQzzSzc1iD3ZPHfAI03N2qYsLMOR9RnOd1IUxZbUgXE1OiRdPGw
         rQfzqZOkUUCEEMfn/BXPl6U8jKZ9QrzAnO5J8RrwjmWenPw6Qzp4Ca/bcSXTuRRT5nJx
         P5XKYhYMbuPA3thM3z+YTNsSChTzf/RZcGXNkfYR9lrO6m+26mTCDbOQKMbAk5oNo4tI
         BLRHucweS0OqlWIe25VUTNsevh5inO5+BdmASmlOfpP2PZDRH0Ic75gLDz8qPbQk5jwl
         mnmlWRHz3xY9txcQDUxAeB6l66hetvsLUPgmYuRt7sVn6h3rGQaaFWfxBrx3zIZa9Iz/
         WsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uB1jG63W7Cp1ecScOF+aprB3eZpA77tRCncXlSJlqoM=;
        b=M3u5pcAUBVTByGFzldsAWZzWrvu6M/MoQGZQP2XpAHLeeRrAdZNQziF6D+EhL27aym
         pLOe/G0+D24iZbeW8jxTKC4734k96EF+XIrkybWZtxcs6Jj3DMaaqp/oDizdGS10aRCX
         qLaPm0MqmAlFvKevFLozZdLXElHqL9qEqwDwgSAmnzDQ5ZTgL8y4ymDihQr7gzDh0vaz
         9ELKBuJGMTtkAzsJNU97ZuLKbeTHPpUlCdEgit6iohdSTjand21yPbdPuYv/+E1akR3Z
         0cX0YDF9oXCs3WGyiiaan1LBDDduW1zVwgWgkd7/o2+h8PzBx17mrfuKFOQ1OSk9qPQb
         RJzA==
X-Gm-Message-State: AOAM532e7Xz8W6Wf4jZXqMjuaPn73TauSJ2zXtRfBlkJAUWqyVElkwRe
        Wm11nAFoCBQMPLDZpVTxS+U=
X-Google-Smtp-Source: ABdhPJz2ABUy7xZ7JgyJzUEsqaulQv4SSeFfgkyaOd+ukduYR8VXh3cVJVxTBq+gULlu347nTPTLGg==
X-Received: by 2002:ac2:5a11:: with SMTP id q17mr8137711lfn.44.1589719967809;
        Sun, 17 May 2020 05:52:47 -0700 (PDT)
Received: from mobilestation ([95.79.192.151])
        by smtp.gmail.com with ESMTPSA id g1sm4927819lfb.85.2020.05.17.05.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 05:52:47 -0700 (PDT)
Date:   Sun, 17 May 2020 15:52:44 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 2/4] gpio: dwapb: Don't use 0 as valid Linux interrupt
 number
Message-ID: <20200517125244.oayqjhhq5755b4cg@mobilestation>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
 <20200512184513.86883-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200512184513.86883-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 12, 2020 at 09:45:11PM +0300, Andy Shevchenko wrote:
> 0 is not valid IRQ number in Linux interrupt number space.
> Refactor the code with this kept in mind.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 5bc5057f071f37..78662d6d73634e 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -417,7 +417,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  		int i;
>  
>  		for (i = 0; i < pp->ngpio; i++) {
> -			if (pp->irq[i] >= 0)
> +			if (pp->irq[i])
>  				irq_set_chained_handler_and_data(pp->irq[i],
>  						dwapb_irq_handler, gpio);
>  		}
> @@ -531,23 +531,23 @@ static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
>  			  struct dwapb_port_property *pp)
>  {
>  	struct device_node *np = NULL;
> -	int j;
> +	int err, j;

Err might be used uninitialized here. The compiler also says so:

drivers/gpio/gpio-dwapb.c:560:14: warning: ‘err’ may be used uninitialized in this function [-Wmaybe-uninitialized]
   pp->irq[j] = err;

drivers/gpio/gpio-dwapb.c:547:6: note: ‘err’ was declared here
  int err, j;

Could you please make it initialized with error number like -ENXIO by default?

Also if it was just a single issue in my mind, I wouldn't have probably payed
much attention to this. But since you need to send v2 anyway, I'd prefer to have
a positive naming here since normally both of_irq_get() and
platform_get_irq_optional() return IRQ number, and error is returned only on
failure. So checking an erroneous value of a positively named variable seems
more natural, rather than copying an error-named variable to a normal variable.
To cut it short could you please rename err to something like irq?

>  
>  	if (fwnode_property_read_bool(fwnode, "interrupt-controller"))
>  		np = to_of_node(fwnode);
>  
>  	for (j = 0; j < pp->ngpio; j++) {
> -		pp->irq[j] = -ENXIO;
> -
>  		if (np)
> -			pp->irq[j] = of_irq_get(np, j);
> +			err = of_irq_get(np, j);
>  		else if (has_acpi_companion(dev))
> -			pp->irq[j] = platform_get_irq_optional(to_platform_device(dev), j);
> +			err = platform_get_irq_optional(to_platform_device(dev), j);
> +		if (err < 0)
> +			continue;
>  
> -		if (pp->irq[j] >= 0)
> -			pp->has_irq = true;
> +		pp->irq[j] = err;
>  	}
>  

> +	pp->has_irq = memchr_inv(pp->irq, 0, sizeof(pp->irq)) != NULL;

Sorry, but I don't see why is setting the has_irq flag in the loop above worse than
using memchr_inv()? As I see it since we need to perform the loop above anyway, it
would be normal to update the flag synchronously there instead of traversing the
irq's array byte-by-byte again in the memchr_inv() method. Moreover
(memchr_inv() != NULL) seems harder to read. A kernel hacker needs to keep in
mind the method semantics, that it returns non-null if unmatched character found
in the array, to get the line logic. Setting "has_irq = true" is straightforward -
if IRQ's found then set the flag to true. So if you don't have a strong opinion
against my reasoning could you please get the setting the has_irq flag back in to
the loop above?

-Sergey

>  	if (!pp->has_irq)
>  		dev_warn(dev, "no irq for port%d\n", pp->idx);
>  }
> -- 
> 2.26.2
> 
