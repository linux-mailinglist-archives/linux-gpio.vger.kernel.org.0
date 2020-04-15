Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5C31AA3DC
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 15:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504561AbgDONNU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 09:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2897078AbgDONNO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 09:13:14 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA91C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 06:13:14 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k21so3637969ljh.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KO04Y14+7FYs3TvpoWS5r0+mcpRQRw4cSzXechx6FIA=;
        b=ew4xvLIQOXGeRBfQ5o9bjJ6qyVhHcIEB0gv+fmQmVB+DtPeYSMLIShnEkkmQZHUJJg
         9fzlvPtaJoIxccorzjFBFxtWFR8aGjBBl7llWc4jPs23wtYXDo57agr5b2BCWm+gM8CZ
         maDF2QJeoXgEXgqsQ9Ltbh//inwj08igvIGApLHuDVFbwr2KKap44wV8leL4AljMFlAp
         +vncqTxqG+Q01bZSSQHfkubqrudqVyZ3mKUSbSiqwuL3RP91hZoH/c6VwMsxsD4oP5vr
         AHvQDGkQGvcfhl5suSAg2aJTteDqv67oaI3X/11lcB6L8YxUAkeSlGV2VVmx3n6OzFR4
         M/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KO04Y14+7FYs3TvpoWS5r0+mcpRQRw4cSzXechx6FIA=;
        b=O/8gOkInAeyvcdq/NUmLqvBKXBt8hWrDc1Y2xvDOclEpsgt3LxER88GZJtJ78qV6UE
         wdmVZ3D0sktfHJrZvnLIBpRJM7lsuUsItPwsyXuSlQ10daxilvUexb4u0sB9677C82n7
         er4PcDiIAGJA/Zhi166DtJt2viFPHT1SrrOlg7oSoQd97Hu15QdPHj6tkPynopz26GEX
         qsncGOMy2Ruiw912YJR4+IvJgtfbFR1ASTF/RRHXxh5JX2rbNcQaeyxU1XRo/Gkju63J
         REHBZPZHBaqSzevYDhJo6ZOoAdlnPLH8CgA1tKy5HdHhrL5YBR9cgHOK10rYXyod/Q9Z
         uUJA==
X-Gm-Message-State: AGi0PuZ43KUc3QH9GYjUSjTAXlDAA9WUupWN+M+Mv6UAUizPs2N+6s4Y
        Qpy76S4MTirAn2lrmE8hxsY=
X-Google-Smtp-Source: APiQypLBrToMv49o1xAxzKlNk9eFPXlOMv5jT/EeyuGGWXPUAgmazEeShqLvaAr4cyVdCWGEIZHIHQ==
X-Received: by 2002:a2e:870f:: with SMTP id m15mr3308599lji.16.1586956392876;
        Wed, 15 Apr 2020 06:13:12 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id l7sm13347455lfg.79.2020.04.15.06.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 06:13:11 -0700 (PDT)
Date:   Wed, 15 Apr 2020 16:13:09 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 11/13] gpio: dwapb: Split out dwapb_get_irq() helper
Message-ID: <20200415131309.ovs2ytq2tqdmuunm@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-12-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141228.49561-12-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:12:26PM +0300, Andy Shevchenko wrote:
> Split out dwapb_get_irq() helper for better readability and maintenance.

Seems appropriate. Thanks.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 56 ++++++++++++++++++++-------------------
>  1 file changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 5b93967a4c96..7789410fe15e 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -528,14 +528,38 @@ static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
>  			gpiochip_remove(&gpio->ports[m].gc);
>  }
>  
> -static struct dwapb_platform_data *
> -dwapb_gpio_get_pdata(struct device *dev)
> +static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
> +			  struct dwapb_port_property *pp)
> +{
> +	struct device_node *np = NULL;
> +	int j;
> +
> +	if (fwnode_property_read_bool(fwnode, "interrupt-controller"))
> +		np = to_of_node(fwnode);
> +
> +	for (j = 0; j < pp->ngpio; j++) {
> +		pp->irq[j] = -ENXIO;
> +
> +		if (np)
> +			pp->irq[j] = of_irq_get(np, j);
> +		else if (has_acpi_companion(dev))
> +			pp->irq[j] = platform_get_irq(to_platform_device(dev), j);
> +
> +		if (pp->irq[j] >= 0)
> +			pp->has_irq = true;
> +	}
> +
> +	if (!pp->has_irq)
> +		dev_warn(dev, "no irq for port%d\n", pp->idx);
> +}
> +
> +static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
>  {
>  	struct fwnode_handle *fwnode;
>  	struct dwapb_platform_data *pdata;
>  	struct dwapb_port_property *pp;
>  	int nports;
> -	int i, j;
> +	int i;
>  
>  	nports = device_get_child_node_count(dev);
>  	if (nports == 0)
> @@ -553,8 +577,6 @@ dwapb_gpio_get_pdata(struct device *dev)
>  
>  	i = 0;
>  	device_for_each_child_node(dev, fwnode)  {
> -		struct device_node *np = NULL;
> -
>  		pp = &pdata->properties[i++];
>  		pp->fwnode = fwnode;
>  
> @@ -581,28 +603,8 @@ dwapb_gpio_get_pdata(struct device *dev)
>  		 * Only port A can provide interrupts in all configurations of
>  		 * the IP.
>  		 */
> -		if (pp->idx != 0)
> -			continue;
> -
> -		if (dev->of_node && fwnode_property_read_bool(fwnode,
> -						  "interrupt-controller")) {
> -			np = to_of_node(fwnode);
> -		}
> -
> -		for (j = 0; j < pp->ngpio; j++) {
> -			pp->irq[j] = -ENXIO;
> -
> -			if (np)
> -				pp->irq[j] = of_irq_get(np, j);
> -			else if (has_acpi_companion(dev))
> -				pp->irq[j] = platform_get_irq(to_platform_device(dev), j);
> -
> -			if (pp->irq[j] >= 0)
> -				pp->has_irq = true;
> -		}
> -
> -		if (!pp->has_irq)
> -			dev_warn(dev, "no irq for port%d\n", pp->idx);
> +		if (pp->idx == 0)
> +			dwapb_get_irq(dev, fwnode, pp);
>  	}
>  
>  	return pdata;
> -- 
> 2.25.1
> 
