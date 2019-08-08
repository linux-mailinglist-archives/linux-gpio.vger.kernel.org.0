Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61733863A4
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 15:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733208AbfHHNtD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 09:49:03 -0400
Received: from mga04.intel.com ([192.55.52.120]:30857 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732727AbfHHNtD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Aug 2019 09:49:03 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Aug 2019 06:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,361,1559545200"; 
   d="scan'208";a="199050275"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2019 06:49:01 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hvimp-0003t8-N8; Thu, 08 Aug 2019 16:48:59 +0300
Date:   Thu, 8 Aug 2019 16:48:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
Message-ID: <20190808134859.GY30120@smile.fi.intel.com>
References: <20190808132543.26274-1-sr@denx.de>
 <20190808132543.26274-2-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808132543.26274-2-sr@denx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 08, 2019 at 03:25:43PM +0200, Stefan Roese wrote:
> This patch fixes a backward compatibility issue, when boards use the
> old style GPIO suffix "-gpio" instead of the new "-gpios". This
> potential problem has been introduced by commit d99482673f95 ("serial:
> mctrl_gpio: Check if GPIO property exisits before requesting it").
> 
> This patch now fixes this issue by iterating over all supported GPIO
> suffixes by using the newly introduced for_each_gpio_suffix() helper.
> 
> Also, the string buffer is now allocated on the stack to avoid the
> problem of allocation in a loop and its potential failure.

>  	for (i = 0; i < UART_GPIO_MAX; i++) {
>  		enum gpiod_flags flags;
> -		char *gpio_str;
> +		const char *suffix;
> +		char gpio_str[32];	/* 32 is max size of property name */

Hmm... don't we have some define for the maximum length of property?

Or maybe we can still continue using kasprintf() approach?

>  		bool present;
> +		int k;
> +
> +		/*
> +		 * Check if GPIO property exists and continue if not. Iterate
> +		 * over all supported GPIO suffixes (foo-gpios vs. foo-gpio).
> +		 */
> +		for_each_gpio_suffix(k, suffix) {
> +			snprintf(gpio_str, sizeof(gpio_str), "%s-%s",
> +				 mctrl_gpios_desc[i].name, suffix);
> +
> +			present = device_property_present(dev, gpio_str);
> +			if (present)
> +				break;
> +		}
>  
> -		/* Check if GPIO property exists and continue if not */
> -		gpio_str = kasprintf(GFP_KERNEL, "%s-gpios",
> -				     mctrl_gpios_desc[i].name);
> -		if (!gpio_str)
> -			continue;
> -

> -		present = device_property_present(dev, gpio_str);

Because there is no more explicit assignment of present outside of the loop,
the compiler may warn about uninitialized variable in use...

> -		kfree(gpio_str);

>  		if (!present)

...here.

>  			continue;

-- 
With Best Regards,
Andy Shevchenko


