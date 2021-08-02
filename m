Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23DDE3DDAD6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 16:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbhHBOWc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 10:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234867AbhHBOW0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 10:22:26 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF0EC08EAF5;
        Mon,  2 Aug 2021 07:07:25 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id l4so24085667ljq.4;
        Mon, 02 Aug 2021 07:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QSRmyGOQKi26XFJcHlkzbFSHx2fpkufJxW98dYtkbJM=;
        b=u0Y9ayklqAWjyoyQ60wihHL84rHSb1g62wltZ0Iwp5Qd83r7B9QQs+EV54HcOVA/ul
         kOLj+m6FA4Dv5tFupwjD4Blybv3lMbku6KWYfSXUo2GIRL8NZN0U5oAzrG2IhoioUBNQ
         G0nx5OvEa57rhD4p9HOD5q7ADJoBK6uOW0Tjil92uzefZ56DDwn2yBS54fKgxtga4kq6
         THp49KV9AYDMKnKJHT8ubp+6XkppSgozjTfCz19+BUk4BRBETAdDUzh8iSyVopVsfNuk
         PmES+9USYeUprBPpfgf3FdjU5uPdasTPrPfcxdAspZZ7YbEbJGzHH4UrGUZnS2gHkW/u
         OoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QSRmyGOQKi26XFJcHlkzbFSHx2fpkufJxW98dYtkbJM=;
        b=nZKnVLzKonDphSM2i7S/AoQBnxeUiPsl/345CqmveVxXSBJ+OcbaBLZi7pCm7JTNMb
         FUQFjqSX4fWxJyMbPdJfqMAO6V/YzTAWrTQ4EX6DP+Dc+NH1pjHKbrxnalQUacgp91c3
         vttH6EN3Qj0ex6MixFCxs8tK3M9vydgD08GlyG9bKBD2NVKY46GyQEZ/GpqgeWzhqfvX
         KTW4qM7kUAoRTDYMxxJ7TGt5QpWBsLkNizLJZmRPYvdYvpHsyMBat41s//B4RFxVUfNI
         7Jrrh4oWsa/rOaA4AphEkyullOSFID32y2N4NkF2Zk5XU4jpVzYb+c0bnoK5Zk0QJG5o
         orrw==
X-Gm-Message-State: AOAM532bKwbKSKHj8UlWeIeqQexC9pf8Jhr8gUv2mKxZmpM7PPHg6yLf
        p8/3ZdDARW3e1XkNv9nWPfM=
X-Google-Smtp-Source: ABdhPJz+OFyTx3UdWqBUphRa9VvAMkkbPhcsHju7u0s9/D1D4dhNHRLtgWWgqzFVJMtDcasY9YnF+w==
X-Received: by 2002:a2e:98d1:: with SMTP id s17mr10996439ljj.457.1627913243692;
        Mon, 02 Aug 2021 07:07:23 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id q66sm884304ljb.83.2021.08.02.07.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 07:07:23 -0700 (PDT)
Date:   Mon, 2 Aug 2021 17:07:21 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 4/4] gpio: dwapb: Get rid of legacy platform data
Message-ID: <20210802140721.vxhqidrkcxo3ex53@mobilestation>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726125436.58685-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 26, 2021 at 03:54:36PM +0300, Andy Shevchenko wrote:
> Platform data is a legacy interface to supply device properties
> to the driver. In this case we don't have anymore in-kernel users
> for it. Just remove it for good.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c                | 28 +++++++++++++++---------
>  include/linux/platform_data/gpio-dwapb.h | 24 --------------------
>  2 files changed, 18 insertions(+), 34 deletions(-)
>  delete mode 100644 include/linux/platform_data/gpio-dwapb.h
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index e3011d4e17b0..b9dd0ba812dc 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -16,7 +16,6 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> -#include <linux/platform_data/gpio-dwapb.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/reset.h>
> @@ -48,6 +47,7 @@
>  
>  #define DWAPB_DRIVER_NAME	"gpio-dwapb"
>  #define DWAPB_MAX_PORTS		4
> +#define DWAPB_MAX_GPIOS		32
>  
>  #define GPIO_EXT_PORT_STRIDE	0x04 /* register stride 32 bits */
>  #define GPIO_SWPORT_DR_STRIDE	0x0c /* register stride 3*32 bits */
> @@ -63,6 +63,19 @@
>  
>  #define DWAPB_NR_CLOCKS		2
>  

> +struct dwapb_port_property {
> +	struct fwnode_handle *fwnode;
> +	unsigned int idx;
> +	unsigned int ngpio;
> +	unsigned int gpio_base;
> +	int irq[DWAPB_MAX_GPIOS];
> +};
> +
> +struct dwapb_platform_data {
> +	struct dwapb_port_property *properties;
> +	unsigned int nports;
> +};
> +
>  struct dwapb_gpio;

If you need to resend the series anyway could you please move the
structures declarations to being below the forward declaration of the
dwapb_gpio structure? Of course it's not that critical, but for the
sake of just not to have the later one left somewhere in the middle of
the unrelated structures and for at least to keep some order in the
declarations.

Then feel free to add:
Acked-by: Serge Semin <fancer.lancer@gmail.com>

The whole series has been tested on Baikal-T1 SoC:
Tested-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

>  
>  #ifdef CONFIG_PM_SLEEP
> @@ -670,17 +683,12 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
>  	unsigned int i;
>  	struct dwapb_gpio *gpio;
>  	int err;
> +	struct dwapb_platform_data *pdata;
>  	struct device *dev = &pdev->dev;
> -	struct dwapb_platform_data *pdata = dev_get_platdata(dev);
> -
> -	if (!pdata) {
> -		pdata = dwapb_gpio_get_pdata(dev);
> -		if (IS_ERR(pdata))
> -			return PTR_ERR(pdata);
> -	}
>  
> -	if (!pdata->nports)
> -		return -ENODEV;
> +	pdata = dwapb_gpio_get_pdata(dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
>  
>  	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>  	if (!gpio)
> diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
> deleted file mode 100644
> index 535e5ed549d9..000000000000
> --- a/include/linux/platform_data/gpio-dwapb.h
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright(c) 2014 Intel Corporation.
> - */
> -
> -#ifndef GPIO_DW_APB_H
> -#define GPIO_DW_APB_H
> -
> -#define DWAPB_MAX_GPIOS		32
> -
> -struct dwapb_port_property {
> -	struct fwnode_handle *fwnode;
> -	unsigned int	idx;
> -	unsigned int	ngpio;
> -	unsigned int	gpio_base;
> -	int		irq[DWAPB_MAX_GPIOS];
> -};
> -
> -struct dwapb_platform_data {
> -	struct dwapb_port_property *properties;
> -	unsigned int nports;
> -};
> -
> -#endif
> -- 
> 2.30.2
> 
