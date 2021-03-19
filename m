Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B39B3416DF
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Mar 2021 08:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234023AbhCSHv7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Mar 2021 03:51:59 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:44167 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233819AbhCSHvl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Mar 2021 03:51:41 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 8FF2C22239;
        Fri, 19 Mar 2021 08:51:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1616140299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xPE75ypMFqVVpybthj8RHnplfS56SjWrWzo/EeOduNI=;
        b=mTZ/UTskjZ/nLqef7Ab0501ArRgZNOPeFz/Yz5p7wLMt3zEp/CzcEhIhphuOfXZN8utEoK
        7jcMvyN6ki04mG3uLHL1PNgV95GC9UFtFPdOLSqKMR61PxdqCJXQtjSadxQpp84mPQwi/R
        qegFICJQxsu2x29q9yldzOZm564NwYU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 19 Mar 2021 08:51:37 +0100
From:   Michael Walle <michael@walle.cc>
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mpc8xxx: Add ACPI support
In-Reply-To: <20210319025332.36659-1-ran.wang_1@nxp.com>
References: <20210319025332.36659-1-ran.wang_1@nxp.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ab9cca747b83ab1083b86d3aef9156ef@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-03-19 03:53, schrieb Ran Wang:
> Current implementation only supports DT, now add ACPI support.
> 
> Note that compared to device of 'fsl,qoriq-gpio', LS1028A and
> LS1088A's GPIO have no extra programming, so simplify related checking.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v2:
>  - Initialize devtype with NULL to fix compile warning.
>  - Replace of_device_get_match_data() and acpi_match_device with
> device_get_match_data().
>  - Replace acpi_match_device() with simpler checking logic per Andy's
> suggestion.
> 
>  drivers/gpio/gpio-mpc8xxx.c | 34 +++++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index 6dfca83bcd90..646225fa3e73 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -9,6 +9,7 @@
>   * kind, whether express or implied.
>   */
> 
> +#include <linux/acpi.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/spinlock.h>
> @@ -292,8 +293,6 @@ static const struct of_device_id mpc8xxx_gpio_ids[] 
> = {
>  	{ .compatible = "fsl,mpc5121-gpio", .data = &mpc512x_gpio_devtype, },
>  	{ .compatible = "fsl,mpc5125-gpio", .data = &mpc5125_gpio_devtype, },
>  	{ .compatible = "fsl,pq3-gpio",     },
> -	{ .compatible = "fsl,ls1028a-gpio", },
> -	{ .compatible = "fsl,ls1088a-gpio", },
>  	{ .compatible = "fsl,qoriq-gpio",   },
>  	{}
>  };
> @@ -303,8 +302,8 @@ static int mpc8xxx_probe(struct platform_device 
> *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct mpc8xxx_gpio_chip *mpc8xxx_gc;
>  	struct gpio_chip	*gc;
> -	const struct mpc8xxx_gpio_devtype *devtype =
> -		of_device_get_match_data(&pdev->dev);
> +	const struct mpc8xxx_gpio_devtype *devtype = NULL;
> +	struct fwnode_handle *fwnode;
>  	int ret;
> 
>  	mpc8xxx_gc = devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc), 
> GFP_KERNEL);
> @@ -315,14 +314,14 @@ static int mpc8xxx_probe(struct platform_device 
> *pdev)
> 
>  	raw_spin_lock_init(&mpc8xxx_gc->lock);
> 
> -	mpc8xxx_gc->regs = of_iomap(np, 0);
> +	mpc8xxx_gc->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (!mpc8xxx_gc->regs)
>  		return -ENOMEM;
> 
>  	gc = &mpc8xxx_gc->gc;
>  	gc->parent = &pdev->dev;
> 
> -	if (of_property_read_bool(np, "little-endian")) {
> +	if (device_property_read_bool(&pdev->dev, "little-endian")) {
>  		ret = bgpio_init(gc, &pdev->dev, 4,
>  				 mpc8xxx_gc->regs + GPIO_DAT,
>  				 NULL, NULL,
> @@ -345,6 +344,7 @@ static int mpc8xxx_probe(struct platform_device 
> *pdev)
> 
>  	mpc8xxx_gc->direction_output = gc->direction_output;
> 
> +	devtype = device_get_match_data(&pdev->dev);
>  	if (!devtype)
>  		devtype = &mpc8xxx_gpio_devtype_default;
> 
> @@ -369,9 +369,9 @@ static int mpc8xxx_probe(struct platform_device 
> *pdev)
>  	 * associated input enable must be set (GPIOxGPIE[IEn]=1) to 
> propagate
>  	 * the port value to the GPIO Data Register.
>  	 */
> +	fwnode = dev_fwnode(&pdev->dev);
>  	if (of_device_is_compatible(np, "fsl,qoriq-gpio") ||
> -	    of_device_is_compatible(np, "fsl,ls1028a-gpio") ||
> -	    of_device_is_compatible(np, "fsl,ls1088a-gpio"))

Again, please keep this. The DT bindings don't mention "fsl,qoriq-gpio"
is required. Alternatively, change the binding (ideally convert it to
YAML) and get an ack by Rob.

-michael
