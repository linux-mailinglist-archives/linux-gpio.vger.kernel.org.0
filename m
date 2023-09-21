Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE727A96B6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Sep 2023 19:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjIURIA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Sep 2023 13:08:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbjIURHa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2023 13:07:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A4B83A81;
        Thu, 21 Sep 2023 10:05:12 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466800441"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="466800441"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 04:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750351498"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="750351498"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 04:22:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andy@kernel.org>)
        id 1qjHla-0000000GsMn-22jB;
        Thu, 21 Sep 2023 14:22:42 +0300
Date:   Thu, 21 Sep 2023 14:22:42 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] gpio: ixp4xx: Handle clock output on pin 14 and 15
Message-ID: <ZQwngrU9fxdSGSKs@smile.fi.intel.com>
References: <20230921-ixp4xx-gpio-clocks-v1-0-574942bf944a@linaro.org>
 <20230921-ixp4xx-gpio-clocks-v1-2-574942bf944a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921-ixp4xx-gpio-clocks-v1-2-574942bf944a@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 21, 2023 at 12:23:46AM +0200, Linus Walleij wrote:
> This makes it possible to provide basic clock output on pins
> 14 and 15. The clocks are typically used by random electronics,
> not modeled in the device tree, so they just need to be provided
> on request.

...

> +	val = __raw_readl(g->base + IXP4XX_REG_GPCLK);

Do we need to read this...

>  	/*
>  	 * Make sure GPIO 14 and 15 are NOT used as clocks but GPIO on
>  	 * specific machines.
>  	 */
>  	if (of_machine_is_compatible("dlink,dsm-g600-a") ||
>  	    of_machine_is_compatible("iom,nas-100d"))
> -		__raw_writel(0x0, g->base + IXP4XX_REG_GPCLK);
> +		val = 0;

...if we are going to discard it anyway here?

Maybe

	if (...)
		val = 0;
	else
		val = readl();

?

...

> +	/*
> +	 * Enable clock outputs with default timings of requested clock.
> +	 * If you need control over TC and DC, add these to the device
> +	 * tree bindings and use them here.
> +	 */

Shouldn't this be integrated into PPS subsystem?

-- 
With Best Regards,
Andy Shevchenko


