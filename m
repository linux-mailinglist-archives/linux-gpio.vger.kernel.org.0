Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D572AD8B5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731949AbgKJOZa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:25:30 -0500
Received: from mga17.intel.com ([192.55.52.151]:27858 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730850AbgKJOZa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 09:25:30 -0500
IronPort-SDR: QzA3QmzmFLJLlJUfxkZYl7IgbaNylm7uRX4OFgq6N42qD0RApPHvHuu3GHZ7HF+dLChFE4iOPy
 X9elMPPXz2LA==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="149828463"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="149828463"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 06:25:26 -0800
IronPort-SDR: Z5BU9JB8aJAwr7+dl1qNAFm+zfoqECM4ktvmtgoWJhgIh0y2BNOi8NWKkkzwYZ+OWwfLY6BChN
 xCxNmLp3vGrw==
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="529817722"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 06:25:23 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kcUbI-005UuV-Kj; Tue, 10 Nov 2020 16:26:24 +0200
Date:   Tue, 10 Nov 2020 16:26:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 6/7] gpio: exar: switch to using regmap
Message-ID: <20201110142624.GT4077@smile.fi.intel.com>
References: <20201110123406.3261-1-brgl@bgdev.pl>
 <20201110123406.3261-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110123406.3261-7-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 01:34:05PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We can simplify the code in gpio-exar by using regmap. This allows us to
> drop the mutex (regmap provides its own locking) and we can also reuse
> regmap's bit operations instead of implementing our own update function.

...

> +	/*
> +	 * We don't need to check the return values of mmio regmap operations (unless
> +	 * the regmap has a clock attached which is not the case here).
> +	 */
> +	exar_gpio->regs = devm_regmap_init_mmio(dev, p, &exar_regmap_config);
> +	if (IS_ERR(exar_gpio->regs))
> +		return PTR_ERR(exar_gpio->regs);
>  
>  	index = ida_alloc(&ida_index, GFP_KERNEL);
> -	if (index < 0) {
> -		ret = index;
> -		goto err_mutex_destroy;
> -	}
> +	if (index < 0)
> +		return index;

And below you effectively use p as regmap!
That's what renaming of variable regs -> regmap or map can easily reveal.

	exar_gpio->regs = p;


-- 
With Best Regards,
Andy Shevchenko


