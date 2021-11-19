Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399A7456B2B
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 08:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232944AbhKSIAT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 03:00:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:43122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229501AbhKSIAT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Nov 2021 03:00:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D29261B04;
        Fri, 19 Nov 2021 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637308638;
        bh=06f0t7T5g2+sFHylnxPjV+6gXXRZ9fVMkiz17s+krrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wo7IhRJbw0y02YDfkt1RvaFUyG5j0sT8NHgAdWfK942Tv2jPniUdWk5+SJZPzZlbc
         WCN5vZcPCRwiOQZiX9oKDSvVynzPdNQT7GIm8vUd3SSnSb/2LBFchwCt2fHerwiNxO
         yRx+xpktxSph4iZFa1m5ILxDkqacZT6oMkbjKwRvC2zRtTEM4kwiv1cHHkTZVVl3sT
         VMXs0mFFDJcyZUhEN6zF/dGePj71WaS6LKczBANuZisEtaS0R7awVPJNq0DKovRvxT
         WoAP6gxF5SnBDuouRFwjeo9jerD392jglMjrupvAHCWFJQLJhLV7mXrRPFAASjMcmc
         T+KrltudfHldw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mnylY-00088X-BK; Fri, 19 Nov 2021 08:57:01 +0100
Date:   Fri, 19 Nov 2021 08:57:00 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpiolib: improve coding style for local variables
Message-ID: <YZdYzLqQgvA96LoU@hovoldconsulting.com>
References: <20211118132317.15898-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118132317.15898-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 02:23:16PM +0100, Bartosz Golaszewski wrote:
> Drop unneeded whitespaces and put the variables of the same type
> together for consistency with the rest of the code.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index abfbf546d159..20d63028b85c 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -594,11 +594,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  			       struct lock_class_key *request_key)
>  {
>  	struct fwnode_handle *fwnode = gc->parent ? dev_fwnode(gc->parent) : NULL;
> -	unsigned long	flags;
> -	int		ret = 0;
> -	unsigned	i;
> -	int		base = gc->base;
> +	int ret = 0, base = gc->base;

This only makes the code harder to read for no good reason.

Keep declarations on separate lines, especially if also initialising.

Note that all but one function in this file initialises return value
variables on their own lines too (as they should).

>  	struct gpio_device *gdev;
> +	unsigned long flags;
> +	unsigned int i;

>  
>  	/*
>  	 * First: allocate and populate the internal stat container, and

Johan
