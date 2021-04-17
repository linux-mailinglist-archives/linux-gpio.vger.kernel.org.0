Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139DC3631CD
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Apr 2021 20:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236969AbhDQSX4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Apr 2021 14:23:56 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:50160 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236965AbhDQSX4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 17 Apr 2021 14:23:56 -0400
X-Greylist: delayed 1252 seconds by postgrey-1.27 at vger.kernel.org; Sat, 17 Apr 2021 14:23:55 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1618682549; bh=4eq0XB2PDXbqcR+ae3DKP4xFXNTYnqgh2PvlghKLwFY=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=V6Y9jZ/DTLcalqmW525qU29ePMjGNf1p/vF59r2xtVdlxhhBEP06+kvw1/n5gB3WP
         woER+FkPcNM43Q1GnCojoNgz1yJA9WTgONYARqIodAKS8qRd4iYWet8dcQXNfqR5+3
         VsczuQ5RNTzlmoCV+SvgNhrf4zQEg2kRpkXGSSxo=
Received: by 192.168.90.16 [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sat, 17 Apr 2021 20:02:29 +0200 (CEST)
X-EA-Auth: BGF3KMrn3vZeZ9Aq4VOlG2I3jc15d0iq3NyEkQNPoffhJN7IU74aAH3G3p7wPgRbAXVPQ9aD5LYJ5gcuBPLXPoNIvYnX6sO2
Date:   Sat, 17 Apr 2021 23:32:22 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, shubhrajyoti.datta@xilinx.com,
        sgoud@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: Re: [PATCH 3/3] gpio: zynq: Check return value of irq_get_irq_data
Message-ID: <20210417180222.GA112239@localhost>
References: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
 <20210409140806.31824-4-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409140806.31824-4-srinivas.neeli@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 09, 2021 at 07:38:06PM +0530, Srinivas Neeli wrote:
> In two different instances the return value of "irq_get_irq_data"
> API was neither captured nor checked.
> Fixed it by capturing the return value and then checking for any error.
> 
> Addresses-Coverity: "returned_null"
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
>  drivers/gpio/gpio-zynq.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index c91302a16c77..f0cb8ccd03ed 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -736,6 +736,11 @@ static int __maybe_unused zynq_gpio_suspend(struct device *dev)
>  	struct zynq_gpio *gpio = dev_get_drvdata(dev);
>  	struct irq_data *data = irq_get_irq_data(gpio->irq);
>  
> +	if (!data) {
> +		dev_err(dev, "irq_get_irq_data() failed\n");

It will be useful to include a tag such as "suspend: " in the error
message to uniquely identify where it failed from.

> +		return -EINVAL;
> +	}
> +
>  	if (!device_may_wakeup(dev))
>  		disable_irq(gpio->irq);
>  
> @@ -753,6 +758,11 @@ static int __maybe_unused zynq_gpio_resume(struct device *dev)
>  	struct irq_data *data = irq_get_irq_data(gpio->irq);
>  	int ret;
>  
> +	if (!data) {
> +		dev_err(dev, "irq_get_irq_data() failed\n");

Ditto. Suggest using "resume: " tag here.

> +		return -EINVAL;
> +	}
> +
>  	if (!device_may_wakeup(dev))
>  		enable_irq(gpio->irq);
>  
> -- 
> 2.9.1
> 


