Return-Path: <linux-gpio+bounces-350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC5A7F44DC
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 12:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BFBF1F21DAA
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 11:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F023D98F;
	Wed, 22 Nov 2023 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06AF312A;
	Wed, 22 Nov 2023 03:23:10 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5226945"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="5226945"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 03:23:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857687253"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="857687253"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 03:23:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1r5lJv-0000000G4f6-40Kl;
	Wed, 22 Nov 2023 13:23:03 +0200
Date: Wed, 22 Nov 2023 13:23:03 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v5 01/39] gpio: ep93xx: split device in multiple
Message-ID: <ZV3kl6spXpF5c6Bg@smile.fi.intel.com>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
 <20231122-ep93xx-v5-1-d59a76d5df29@maquefel.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122-ep93xx-v5-1-d59a76d5df29@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 22, 2023 at 11:59:39AM +0300, Nikita Shubin wrote:
> Prepare ep93xx SOC gpio to convert into device tree driver:
> - dropped banks and legacy defines
> - split AB IRQ and make it shared
> 
> We are relying on IRQ number information A, B ports have single shared
> IRQ, while F port have dedicated IRQ for each line.
> 
> Also we had to split single ep93xx platform_device into multiple, one
> for each port, without this we can't do a full working transition from
> legacy platform code into device tree capable. All GPIO_LOOKUP were
> change to match new chip namings.

...

> @@ -335,9 +430,9 @@ static struct gpiod_lookup_table ep93xx_i2c_gpiod_table = {
>  	.dev_id		= "i2c-gpio.0",
>  	.table		= {
>  		/* Use local offsets on gpiochip/port "G" */
> -		GPIO_LOOKUP_IDX("G", 1, NULL, 0,
> +		GPIO_LOOKUP_IDX("gpio-ep93xx.6", 1, NULL, 0,
>  				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN),
> -		GPIO_LOOKUP_IDX("G", 0, NULL, 1,
> +		GPIO_LOOKUP_IDX("gpio-ep93xx.6", 0, NULL, 1,
>  				GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN),
>  	},

Before doing this patch, please fix the bug, i.e. missing terminator entry here.
If elsewhere the same, fix all of them at once.

>  };

...

> +	gc->label = dev_name(&pdev->dev);
> +	if (platform_irq_count(pdev) > 0) {
> +		dev_dbg(&pdev->dev, "setting up irqs for %s\n", dev_name(&pdev->dev));
> +		ret = ep93xx_setup_irqs(pdev, egc);
> +		if (ret)
> +			dev_err_probe(&pdev->dev, ret, "setup irqs failed");

Non-fatal?

>  	}

...

This change LGTM (assuming the bug is fixed),
Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



