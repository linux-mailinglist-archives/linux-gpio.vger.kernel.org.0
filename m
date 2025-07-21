Return-Path: <linux-gpio+bounces-23598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B7AB0C85F
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 18:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E0BA16F762
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 16:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3359D2DFF04;
	Mon, 21 Jul 2025 16:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bBZ5mVls"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69892D9489;
	Mon, 21 Jul 2025 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753113673; cv=none; b=U9D3tng4rhxF/RPUEz4mOOETGhW2zHQuuDxwYnJfImMC9r/52lx/4wPaoQjI1DWXn+41fkk85b/PELu+noQHKuNTVwQO6NZ0itGNV/O4nA7+/gMeBqSMcSg5VKO+QoAryHTcQVf04pug30VZ62SMGrHOXjl5HXDOrH84wrRuarU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753113673; c=relaxed/simple;
	bh=2utxpoucflcWLv6syaderiMGBaEAVdo65KQebvXa+QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9uLqo45wRITJvdnVW8bveZaI6Am075zGKM6541U6VriPo3IoLTkx0bwe0hBxTzndNYteoBRy4WXX4lakuLiwLTlzT1yb95lphrbrK7J7tOf14OK9Ykv46BJwI2Xa4Po14+igBRAWncVurTcDmtCeheGfsHk4D9BQBv3tjvRH0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bBZ5mVls; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E047BC4CEED;
	Mon, 21 Jul 2025 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753113672;
	bh=2utxpoucflcWLv6syaderiMGBaEAVdo65KQebvXa+QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBZ5mVls/nzNF94Y+TQc7EMUqY5xSuJ7pr3Ax0yjdTyAU3wfMj/4RduJZ2gZB1zf7
	 qDoK1fPHlzFo1yzG6Wl+LlqJ1x9cFuz6gsvpSmi3HnOHjRrmeqoMX/X12yyetpKayR
	 6QOclH6vv/d5yH1i0+0goIXaRrRve10K4WZokEzc=
Date: Mon, 21 Jul 2025 18:01:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Thompson <davthompson@nvidia.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, davem@davemloft.net,
	asmaa@nvidia.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Shravan Kumar Ramani <shravankr@nvidia.com>
Subject: Re: [PATCH v2] gpio-mlxbf2: only get IRQ for device instances 0 and 3
Message-ID: <2025072158-backpedal-immortal-9dfe@gregkh>
References: <20250721155513.29636-1-davthompson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721155513.29636-1-davthompson@nvidia.com>

On Mon, Jul 21, 2025 at 11:55:13AM -0400, David Thompson wrote:
> The gpio-mlxbf2 driver interfaces with four GPIO controllers,
> device instances 0-3. There are two IRQ resources shared between
> the four controllers, and they are found in the ACPI table for
> device instances 0 and 3.  The driver should not attempt to get
> an IRQ resource when probing device instance 1 or 2, otherwise
> the following error is logged:
>   mlxbf2_gpio MLNXBF22:01: error -ENXIO: IRQ index 0 not found
> 
> Fixes: 2b725265cb08 ("gpio: mlxbf2: Introduce IRQ support")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Thompson <davthompson@nvidia.com>
> Reviewed-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> ---
>  drivers/gpio/gpio-mlxbf2.c | 56 ++++++++++++++++++++++++--------------
>  1 file changed, 36 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
> index 6f3dda6b635f..fc56ac81e344 100644
> --- a/drivers/gpio/gpio-mlxbf2.c
> +++ b/drivers/gpio/gpio-mlxbf2.c
> @@ -353,7 +353,9 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
>  	struct gpio_chip *gc;
>  	unsigned int npins;
>  	const char *name;
> +	char *colon_ptr;
>  	int ret, irq;
> +	long num;
>  
>  	name = dev_name(dev);
>  
> @@ -397,26 +399,40 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
>  	gc->ngpio = npins;
>  	gc->owner = THIS_MODULE;
>  
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq >= 0) {
> -		girq = &gs->gc.irq;
> -		gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
> -		girq->handler = handle_simple_irq;
> -		girq->default_type = IRQ_TYPE_NONE;
> -		/* This will let us handle the parent IRQ in the driver */
> -		girq->num_parents = 0;
> -		girq->parents = NULL;
> -		girq->parent_handler = NULL;
> -
> -		/*
> -		 * Directly request the irq here instead of passing
> -		 * a flow-handler because the irq is shared.
> -		 */
> -		ret = devm_request_irq(dev, irq, mlxbf2_gpio_irq_handler,
> -				       IRQF_SHARED, name, gs);
> -		if (ret) {
> -			dev_err(dev, "failed to request IRQ");
> -			return ret;
> +	colon_ptr = strchr(dev_name(dev), ':');
> +	if (!colon_ptr) {
> +		dev_err(dev, "invalid device name format\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = kstrtol(++colon_ptr, 16, &num);
> +	if (ret) {
> +		dev_err(dev, "invalid device instance\n");
> +		return ret;
> +	}
> +
> +	if (!num || num == 3) {
> +		irq = platform_get_irq(pdev, 0);
> +		if (irq >= 0) {
> +			girq = &gs->gc.irq;
> +			gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
> +			girq->handler = handle_simple_irq;
> +			girq->default_type = IRQ_TYPE_NONE;
> +			/* This will let us handle the parent IRQ in the driver */
> +			girq->num_parents = 0;
> +			girq->parents = NULL;
> +			girq->parent_handler = NULL;
> +
> +			/*
> +			 * Directly request the irq here instead of passing
> +			 * a flow-handler because the irq is shared.
> +			 */
> +			ret = devm_request_irq(dev, irq, mlxbf2_gpio_irq_handler,
> +					       IRQF_SHARED, name, gs);
> +			if (ret) {
> +				dev_err(dev, "failed to request IRQ");
> +				return ret;
> +			}
>  		}
>  	}
>  
> -- 
> 2.30.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

