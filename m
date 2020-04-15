Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF911A9EA2
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 14:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368016AbgDOL6j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 07:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2898001AbgDOL6K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 07:58:10 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298F9C061A0C
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 04:58:08 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id f8so2361539lfe.12
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2020 04:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l0lo+62dREme6OEP4a24EejBEc6ZImG3C1yC8LNxna8=;
        b=BAbX06xuIoMOpYdkXpN8F00aOROD9ukeKH2uxLuCUM/BMeakSBCiDU/WL1TNAowfUL
         f99Hp7or3+42/NaBg+sV+L+mQMkwRz2JbtNPjZXCaa2DZuuY6ldQ2WJx0o77Hw4QH55A
         DSevJdYMZUBG3pe9OZUhX2bVOD9eSIkCcpdVn5OZcithevZ9H26r7H76NMyl9K9UNUDI
         mjP1jDkFWMmMA580F25QrvFR6rwSRgTIYMYqkAqf8QvrBjokn5Rq58pan5mEa83x05sS
         hGhv02GXvPzvE0q9roILw5VuOkR/QCbwI/QAibpJIkLOMsUPfThrOl93QkxNhzEFh/AT
         4HRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l0lo+62dREme6OEP4a24EejBEc6ZImG3C1yC8LNxna8=;
        b=e6IIoyKmZ1gF8Rp1Z6AStPAryntw5PvlYBf3RMwcJJP9B5T8yF5cT/t+heIiC/zzyY
         /A3Q6iELasH5yZP3i9eOaBYL4hAwgO0oBia96eRgeuie7LVX68+00sKV1ZJjURrhQZZ0
         i6cYXlctgMYQGMgAiDetlyIxpbmNNeHvzRf+7beYk1R7mhXLuMs9yQxxJ8yLf7c4GuMo
         nRMfQ68RZKsjI6Ymal3JAIBRSXrr6QFQgAVtlKCwz1QlACtjWVltagH7YoY4mK/T1Noi
         K2V1KTM0TacoV8ojix1u86BNSHorgFcKH+GYar216VaV4k3rycKD4kbzYluuclniACej
         TSJg==
X-Gm-Message-State: AGi0PuaTte3xqDnc78pc3kMagncDB4SYn2hbEzECJX9v9N9Nv18fUFiM
        xMZj+D6UZijpB+ob4bBtf80=
X-Google-Smtp-Source: APiQypKOJasEHpqwQtd96ln1/KpUAPZ6YStYDBW0i1xnROzruHv+4PUG8srrk3ThwKtusdvC8lTBFQ==
X-Received: by 2002:a05:6512:3049:: with SMTP id b9mr2987848lfb.176.1586951886567;
        Wed, 15 Apr 2020 04:58:06 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id l29sm58913ljb.95.2020.04.15.04.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 04:58:05 -0700 (PDT)
Date:   Wed, 15 Apr 2020 14:58:04 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 01/13] gpio: dwapb: Append MODULE_ALIAS for platform
 driver
Message-ID: <20200415115804.m3wx35zeqp5sbrpw@mobilestation>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
 <20200409141228.49561-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409141228.49561-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 09, 2020 at 05:12:16PM +0300, Andy Shevchenko wrote:
> The commit 3d2613c4289f
>   ("GPIO: gpio-dwapb: Enable platform driver binding to MFD driver")
> introduced a use of the platform driver but missed to add the following line
> to it:
>   MODULE_ALIAS("platform:gpio-dwapb");
> 
> Add this to get driver loaded automatically if platform device is registered.

Looks good. Thanks.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

> 
> Fixes: 3d2613c4289f ("GPIO: gpio-dwapb: Enable platform driver binding to MFD driver")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index d2ed11510f3c..c1b6d4f7307e 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -49,7 +49,9 @@
>  #define GPIO_EXT_PORTC		0x58
>  #define GPIO_EXT_PORTD		0x5c
>  
> +#define DWAPB_DRIVER_NAME	"gpio-dwapb"
>  #define DWAPB_MAX_PORTS		4
> +
>  #define GPIO_EXT_PORT_STRIDE	0x04 /* register stride 32 bits */
>  #define GPIO_SWPORT_DR_STRIDE	0x0c /* register stride 3*32 bits */
>  #define GPIO_SWPORT_DDR_STRIDE	0x0c /* register stride 3*32 bits */
> @@ -400,7 +402,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  		return;
>  
>  	err = irq_alloc_domain_generic_chips(gpio->domain, ngpio, 2,
> -					     "gpio-dwapb", handle_level_irq,
> +					     DWAPB_DRIVER_NAME, handle_level_irq,
>  					     IRQ_NOREQUEST, 0,
>  					     IRQ_GC_INIT_NESTED_LOCK);
>  	if (err) {
> @@ -457,7 +459,7 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  		 */
>  		err = devm_request_irq(gpio->dev, pp->irq[0],
>  				       dwapb_irq_handler_mfd,
> -				       IRQF_SHARED, "gpio-dwapb-mfd", gpio);
> +				       IRQF_SHARED, DWAPB_DRIVER_NAME, gpio);
>  		if (err) {
>  			dev_err(gpio->dev, "error requesting IRQ\n");
>  			irq_domain_remove(gpio->domain);
> @@ -847,7 +849,7 @@ static SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops, dwapb_gpio_suspend,
>  
>  static struct platform_driver dwapb_gpio_driver = {
>  	.driver		= {
> -		.name	= "gpio-dwapb",
> +		.name	= DWAPB_DRIVER_NAME,
>  		.pm	= &dwapb_gpio_pm_ops,
>  		.of_match_table = of_match_ptr(dwapb_of_match),
>  		.acpi_match_table = ACPI_PTR(dwapb_acpi_match),
> @@ -861,3 +863,4 @@ module_platform_driver(dwapb_gpio_driver);
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Jamie Iles");
>  MODULE_DESCRIPTION("Synopsys DesignWare APB GPIO driver");
> +MODULE_ALIAS("platform:" DWAPB_DRIVER_NAME);
> -- 
> 2.25.1
> 
