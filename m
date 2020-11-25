Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7D92C4970
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Nov 2020 22:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbgKYVBK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Nov 2020 16:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728529AbgKYVBJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Nov 2020 16:01:09 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86FB0C0613D4;
        Wed, 25 Nov 2020 13:00:59 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id s27so5054178lfp.5;
        Wed, 25 Nov 2020 13:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=33MMwLieI2V2yQwCKAVk1NOZsSvsfr90bXma9SI47/I=;
        b=JPbDomG2xzDK64lU7yF+er1tb6SVB26euJvleeDYEofNq0oLW+IRkEDUXfdvU3dU2u
         VqIw+h4ppyUGq9V6x7GFPGU7LkKO9RoMdhKj9VUygeTVItGQapggQKqBQo9bXBK3hDhi
         iE0LTXLgZEZXe3nr3/fi3NS1YOHVZZswCuNXmZvt8tc9Xd+fQFub8M4FS6stmPDqgB40
         Hrpz9NvLnxpBHo429iVpHr4VWjEk7rZsm3eePOC20EnKkfDJipBPrPWhoi+GqCxtFlC5
         e/BBwxEEG6yhKRaE2LZMm0xXX80vp9FwpAJKrC1pgk/wqjVDDGn1MVDVm2lBhycHdnjz
         rBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=33MMwLieI2V2yQwCKAVk1NOZsSvsfr90bXma9SI47/I=;
        b=G8ZkBBZywfwdcJZKYw7651lLQRNTe/q21CqNVlJffqWEs4ldXsqJFY7jBmgfsRTpDG
         vH6Rondw6JnBODJRnc9zxpqBhQdc8qdZJZXCBFUfpEoKr6s4lufa0C21HH0NkxhCFweJ
         GGDHerdCONF1nmlUIb3Lu0W5y6UmdL8mHnsxAX1Jktgvb2uVsCq9/PB/yHon0xudDu4m
         LlC/+QpTdStRElvbqg/ixqs4Zw/0Ug5FWnN6s0IZ4Pn4cxHjtpjXlTs6A2E47th5APkI
         q6VOYcJu42uixfRntWszy8CbF0fOiKBtRpFalkVNyjdIaN87v6f2clgG9Dr3z11m/M/U
         IRNQ==
X-Gm-Message-State: AOAM5339KVj/h25/AZ7E2I4T75G9cZsxn5MxWoFSACRW/vaWF5irK32z
        darkozOAG2W9mYExIH25wvw=
X-Google-Smtp-Source: ABdhPJwgCeujZ0KgI56cYo2zo+nF5jJaoz9UjvqOR/16hNHZKGDoTo3RTguAJ0ozckKwDe8hUNURPA==
X-Received: by 2002:a19:be8d:: with SMTP id o135mr26990lff.200.1606338058064;
        Wed, 25 Nov 2020 13:00:58 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id y23sm277492ljk.112.2020.11.25.13.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 13:00:57 -0800 (PST)
Date:   Thu, 26 Nov 2020 00:00:55 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpio: dwapb: warn about deprecated property use
Message-ID: <20201125210055.cautc4yfprybrr5i@mobilestation>
References: <20201119060921.311747-1-damien.lemoal@wdc.com>
 <20201119060921.311747-3-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119060921.311747-3-damien.lemoal@wdc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Damien

On Thu, Nov 19, 2020 at 03:09:21PM +0900, Damien Le Moal wrote:
> In dwapb_gpio_get_pdata(), add a warning to signal the fact that a
> device tree is using the deprecated "snps,nr-gpios" property instead of
> the standard "ngpios" property.

Instead of printing the warning from the driver I'd suggest to do that
from the quirk. That'd be better from maintainability point of view.
So when all the snps,nr-gpios properties are removed from dts'es,
we'll need to discard the quirk only. Otherwise if the warning and
quirk are separated, we may forget to remove the later.

-Sergey

> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 2a9046c0fb16..242b058e6630 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -553,7 +553,7 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
>  	struct dwapb_platform_data *pdata;
>  	struct dwapb_port_property *pp;
>  	int nports;
> -	int i;
> +	int i, ret;
>  
>  	nports = device_get_child_node_count(dev);
>  	if (nports == 0)
> @@ -582,8 +582,16 @@ static struct dwapb_platform_data *dwapb_gpio_get_pdata(struct device *dev)
>  			return ERR_PTR(-EINVAL);
>  		}
>  
> -		if (fwnode_property_read_u32(fwnode, "ngpios", &pp->ngpio) &&
> -		    fwnode_property_read_u32(fwnode, "snps,nr-gpios", &pp->ngpio)) {
> +		ret = fwnode_property_read_u32(fwnode, "ngpios", &pp->ngpio);
> +		if (ret) {
> +			ret = fwnode_property_read_u32(fwnode, "snps,nr-gpios",
> +						       &pp->ngpio);
> +			if (!ret) {
> +				dev_warn(dev,
> +					 "deprecated \"snps,nr-gpios\" property, update device tree to use \"ngpios\".\n");
> +			}
> +		}
> +		if (ret) {
>  			dev_info(dev,
>  				 "failed to get number of gpios for port%d\n",
>  				 i);
> -- 
> 2.28.0
> 
