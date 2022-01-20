Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9359D49564A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jan 2022 23:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378049AbiATWSU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jan 2022 17:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347534AbiATWST (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jan 2022 17:18:19 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314E7C061574
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jan 2022 14:18:19 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id g11-20020a17090a7d0b00b001b2c12c7273so4958169pjl.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jan 2022 14:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wVOZzCzGpEdtOd+FTezfSlqQaw5q5Hd5LY0crUyIEek=;
        b=O/vaM5fMEo+j++sv/E59/NoptqCIR9A67sXRVfsZshL0ZyzgNbjKlZpK5WAynAAG4n
         4mJXFq4W+CsSRNLS0TbeGK4iaXYR42sjchUNNQBMA2UsVqCEcN+lbtTzO4mKJYamjjzO
         TUMK7EfcysHRfGNCCKPhgiwfU94Ym0SdjIW2Say6OV/IluDtdEl9hZfqVsf2U840XIZy
         hiGgZ4IfT7VJhXgVNhEDS8OjPKN22cXpMd1SydU4D+xCiAoGxsAJHhn79kMPonPahs/H
         RGUO/lMJ8YerSSUxX22dTZjW6NT5GZSg30ivWmboor2hSRBhGj0Qi9kCtne5GkNQxcKl
         PP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wVOZzCzGpEdtOd+FTezfSlqQaw5q5Hd5LY0crUyIEek=;
        b=g6iy/UMSddViHqIAgufno/1wgCiQYxNxRccYQDaBo0w6AATQvQZks63tvCOrMHv85i
         DSqQAsFvOncOLOI7EwrIdWoziE2ns+Vd5dY3bLkZ7HU9wdz/iW88uii6apdiT3LJ3igf
         QtYYqrrnT1Rugiq1+LzXQJCdAVJGw/qAzkJHN7BXlD4Vb51K+cy8nsVbYgwQMWUFEZeL
         Bn6CnkdVwjg1RvQ6KazyLYraY24kxdPLmPiOwxD5lBpB1oW1SuPhOsKfRDLx6szseeSE
         w6K1s7SaNC0f1m9tcRzzoNoIxirDx6TOpPV/hmWvS7lBcsIMeMyAp4Mp/aar6HteHz2z
         gYHw==
X-Gm-Message-State: AOAM532nVejZ8lqqS8VUbV6yGHnRVFcQRLSqQVneQjCXiGfqE95llL7M
        aR1tTCdj63jXmlbH5jogvjA=
X-Google-Smtp-Source: ABdhPJy58+hEH4vw509cA4RFJIymX6QPQ+mqU+Cyxxt9kR+bOcMZ5aryzKL8rPS6qa3r5idsxC6ksg==
X-Received: by 2002:a17:902:7c97:b0:14a:62ed:c296 with SMTP id y23-20020a1709027c9700b0014a62edc296mr848391pll.42.1642717098574;
        Thu, 20 Jan 2022 14:18:18 -0800 (PST)
Received: from sol (110-174-161-167.tpgi.com.au. [110.174.161.167])
        by smtp.gmail.com with ESMTPSA id u8sm4618052pfi.150.2022.01.20.14.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 14:18:17 -0800 (PST)
Date:   Fri, 21 Jan 2022 06:18:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: sim: check the label length when setting up device
 properties
Message-ID: <20220120221812.GA8128@sol>
References: <20220120194948.1138813-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120194948.1138813-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 20, 2022 at 08:49:48PM +0100, Bartosz Golaszewski wrote:
> If the user-space sets the chip label to an empty string - we should
> check the length and assign the default name or otherwise line hogs
> will not be properly attached.
> 

"assign" -> "not override"?

Cheers,
Kent.

> Fixes: cb8c474e79be ("gpio: sim: new testing module")
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  drivers/gpio/gpio-sim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 838bbfed11d3..04b137eca8da 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -816,7 +816,7 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
>  
>  	properties[prop_idx++] = PROPERTY_ENTRY_U32("ngpios", bank->num_lines);
>  
> -	if (bank->label)
> +	if (bank->label && (strlen(bank->label) > 0))
>  		properties[prop_idx++] = PROPERTY_ENTRY_STRING("gpio-sim,label",
>  							       bank->label);
>  
> -- 
> 2.30.1
> 
