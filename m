Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAEF1AA1BF
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 14:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370226AbgDOMqk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 08:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S370219AbgDOMqY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 08:46:24 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B07C061A0E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:46:23 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r7so3449701ljg.13
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 05:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6kjQKnUTblLcL2Zle+JC9SvHL9WKxKI92l/gvZ03lJs=;
        b=jLYCZYTL8ocxZEOcvmqJ9mctaqz+SVTX6iqjI0nbRwoLTpk/K/QaFSsN8HAFBZp/ln
         s0v+OT6+0NdJaUtWCN+HFJsS6pJXLnLmMhzPDAuVEzy2uOe9XcCclWPPivjNytwNjeyi
         0Id/svspx+EIuxDtZ4gIK/kP03w726YHfsBXSoc7IDTcSNkCcxHnDWuGYzrkQ6SuLsze
         Rk50+RKdKHYXMQQ0/r8JqsCLDKyDNMumVH/ozq81qIn+bOea+Wo7gCah/u4ClkfK8tkB
         ktfRDV0Zgkf6+kZPEC1+G8qw4VXg0do2FnGPSSgDKF5kw4rAy0KZuuDT7P4+iH/tmXHz
         KJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6kjQKnUTblLcL2Zle+JC9SvHL9WKxKI92l/gvZ03lJs=;
        b=oJ4a/YzDZyQzlo4sQSnoGlcGpIfGUPyEu4NYoFuqdvfeSxQcKehfngSRHYSsK7XB0D
         VHBMyKDd4suZfzwoi33jpkPBGZJjG7m/ySL0zgD/bUkh0Jz7sf1K5j10+RJm+1gZm2rA
         B2xEuCwIyjbtvq9Fy1bpNljWiLe5vU8PbXF4YVtqeOzj7uURM5zY0aI6aIulY9FuuvVz
         WHEDptzG0PIiBErl89TOeD84KJTWLuAKVyq+Zn/s6KvJBuRmnnlSd7kiJiXnTGmIQZCG
         rRqy6kVvBqIc/fKlDC7uSz8Pcj+CrU+qbZeoqGohsS95SRz6gHlLsmuYIoBzq283/atn
         l1SQ==
X-Gm-Message-State: AGi0PubimJ7ntPcFV6u2LaK9jWl3LLYaQ4ZXF8jpTowYPO2J8h4hsawN
        X0JQBfk+m4W5kCKWwLUXMqg=
X-Google-Smtp-Source: APiQypJvJljWhQpj3vlDWFVFYQX9y5G0z8Dww0nRtLjm+cHlKCle0Ui80nPz/dCMfg3K/T4EU2JQMA==
X-Received: by 2002:a2e:8793:: with SMTP id n19mr3284701lji.46.1586954782094;
        Wed, 15 Apr 2020 05:46:22 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id m20sm2476736ljj.94.2020.04.15.05.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:46:21 -0700 (PDT)
Date:   Wed, 15 Apr 2020 15:46:19 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 06/13] gpio: dwapb: Use device_get_match_data() to
 simplify code
Message-ID: <20200415124619.w2pnwpgyhsvgqa7f@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-7-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141228.49561-7-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:12:21PM +0300, Andy Shevchenko wrote:
> Use device_get_match_data() here to simplify the code a bit.

Nice simplification. Thanks.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 3a1f3fae923f..a0a0288bb73e 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -683,18 +683,7 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	gpio->flags = 0;
> -	if (dev->of_node) {
> -		gpio->flags = (uintptr_t)of_device_get_match_data(dev);
> -	} else if (has_acpi_companion(dev)) {
> -		const struct acpi_device_id *acpi_id;
> -
> -		acpi_id = acpi_match_device(dwapb_acpi_match, dev);
> -		if (acpi_id) {
> -			if (acpi_id->driver_data)
> -				gpio->flags = acpi_id->driver_data;
> -		}
> -	}
> +	gpio->flags = (uintptr_t)device_get_match_data(dev);
>  
>  	for (i = 0; i < gpio->nr_ports; i++) {
>  		err = dwapb_gpio_add_port(gpio, &pdata->properties[i], i);
> -- 
> 2.25.1
> 
