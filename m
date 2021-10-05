Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6685B422248
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 11:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbhJEJ3v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 05:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232658AbhJEJ3u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Oct 2021 05:29:50 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6105EC061745;
        Tue,  5 Oct 2021 02:28:00 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id oa6-20020a17090b1bc600b0019ffc4b9c51so1478643pjb.2;
        Tue, 05 Oct 2021 02:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CA5ma1syhGxnu+EE+5GSn6LcOZlUj8lR5fWg3Na+rYQ=;
        b=oXcAbu54Crk148KxoltKOF3Mts3dCD1+cYPLs4Y5rUOR9qdfOiqAabkdsEjYWh8lHP
         GHCWhW5Fq2USULD53W+J19cf2xPyMP/zIuCoSmmM2lQuuXFi3sekSCYQCYI9EMkMVjlf
         zrk561/cxdC0jWuYFsjZLO8SYcLNcCIqeblBVQMnwBE3l5yaR+3hYfjmV5mZen8SLGHM
         HiiOza/OOZtD5ocVyEuLpeNEmyPCYD2aKE6ery7vt6weVD7WoM2vBNhBrntoIsDExTFi
         VArBxO647XVliqU9kw+pTfPYeeOYWqixTUzw+kXGGWjVT91U1JcI1A/7dVwBKhvGzPay
         4PAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CA5ma1syhGxnu+EE+5GSn6LcOZlUj8lR5fWg3Na+rYQ=;
        b=Aka8VlBYdDCdfnwtLLu+KnFF8snu/9dp7QA8EMIe9nIrHd7Sg1CKYr5BvvS/w8Cfc/
         Jphpa2125OI9+rLmMGpXFzEcEdaJAyzHVtKqHI8z2OQlmEHN0MUq5S4sKZR4ZcxAYkM7
         4S7dp9HcuZJvRa8l8MQaLqRnnNBOv7CgyO9Y9lt4sWjQyAZQOib/Ro9WbROY1pJxe1hY
         OJUz+wvRuQEY2fWz4DceijR4RHD4Ts2kehb1Si1/5JvbYayU1vdh+d7ygpZafgwodxWZ
         WL6Zemddn9Z2EHFycgf5W85Pbg1sCWavkWmPdfOSSihB/S5ffSrnIbViTk/kKCEQUnVh
         uSzw==
X-Gm-Message-State: AOAM533XM4NmNzExSQAIkhs+8JlpS8SztKdKwwZvwOn0tQnxMUvqm1pN
        7zUPCbl8Pj8Sdcj3cgCS4Ee/skcZpU4=
X-Google-Smtp-Source: ABdhPJzTKgnppHous94XwPJDH++/9/+YbdbHkbadGt4XfTAtHA4LT+n6BH0mUiispxPM3Tfs1Gw0rQ==
X-Received: by 2002:a17:90a:ead3:: with SMTP id ev19mr2553572pjb.136.1633426079712;
        Tue, 05 Oct 2021 02:27:59 -0700 (PDT)
Received: from sol (106-69-170-56.dyn.iinet.net.au. [106.69.170.56])
        by smtp.gmail.com with ESMTPSA id z3sm18950473pfe.78.2021.10.05.02.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 02:27:59 -0700 (PDT)
Date:   Tue, 5 Oct 2021 17:27:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpio: mockup: Convert to use software nodes
Message-ID: <20211005092753.GA911482@sol>
References: <20211005091016.18519-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005091016.18519-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 05, 2021 at 12:10:16PM +0300, Andy Shevchenko wrote:
> The gpio-mockup driver creates a properties that are shared between
> platform and GPIO devices. Because of that, the properties may not
> be removed at the proper point of time without provoking use-after-free
> as shown in the backtrace:
> 
>   refcount_t: underflow; use-after-free.
>   WARNING: CPU: 0 PID: 103 at lib/refcount.c:28 refcount_warn_saturate+0xd1/0x120
>   ...
>   Call Trace:
>   kobject_put+0xdc/0xf0
>   software_node_notify_remove+0xa8/0xc0
>   device_del+0x15a/0x3e0
> 
> That's why the driver has to manage lifetime of the software nodes by itself.
> 
> The problem originates by the old device_add_properties() API, but has been
> only revealed after the commit 5aeb05b27f81 ("software node: balance refcount
> for managed software nodes"). Hence, it's used as landmark for the backporting.
> 
> Fixes: 5aeb05b27f81 ("software node: balance refcount for managed software nodes")

Shouldn't that be:
Fixes: bd1e336aa853 ("driver core: platform: Remove platform_device_add_properties()")

> Reported-by: Kent Gibson <warthog618@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Other than that, looks good and works for me.

Tested-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.

> ---
>  drivers/gpio/gpio-mockup.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 0a9d746a0fe0..8b147b565e92 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -478,8 +478,18 @@ static void gpio_mockup_unregister_pdevs(void)
>  {
>  	int i;
>  
> -	for (i = 0; i < GPIO_MOCKUP_MAX_GC; i++)
> -		platform_device_unregister(gpio_mockup_pdevs[i]);
> +	for (i = 0; i < GPIO_MOCKUP_MAX_GC; i++) {
> +		struct platform_device *pdev;
> +		struct fwnode_handle *fwnode;
> +
> +		pdev = gpio_mockup_pdevs[i];
> +		if (!pdev)
> +			continue;
> +
> +		fwnode = dev_fwnode(&pdev->dev);
> +		platform_device_unregister(pdev);
> +		fwnode_remove_software_node(fwnode);
> +	}
>  }
>  
>  static __init char **gpio_mockup_make_line_names(const char *label,
> @@ -508,6 +518,7 @@ static int __init gpio_mockup_register_chip(int idx)
>  	struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
>  	struct platform_device_info pdevinfo;
>  	struct platform_device *pdev;
> +	struct fwnode_handle *fwnode;
>  	char **line_names = NULL;
>  	char chip_label[32];
>  	int prop = 0, base;
> @@ -536,13 +547,18 @@ static int __init gpio_mockup_register_chip(int idx)
>  					"gpio-line-names", line_names, ngpio);
>  	}
>  
> +	fwnode = fwnode_create_software_node(properties, NULL);
> +	if (IS_ERR(fwnode))
> +		return PTR_ERR(fwnode);
> +
>  	pdevinfo.name = "gpio-mockup";
>  	pdevinfo.id = idx;
> -	pdevinfo.properties = properties;
> +	pdevinfo.fwnode = fwnode;
>  
>  	pdev = platform_device_register_full(&pdevinfo);
>  	kfree_strarray(line_names, ngpio);
>  	if (IS_ERR(pdev)) {
> +		fwnode_remove_software_node(fwnode);
>  		pr_err("error registering device");
>  		return PTR_ERR(pdev);
>  	}
> -- 
> 2.33.0
> 
