Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77C137AD13C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Sep 2023 09:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjIYHTF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Sep 2023 03:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjIYHTE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Sep 2023 03:19:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06ADFC6;
        Mon, 25 Sep 2023 00:18:57 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="371508839"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="371508839"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 00:18:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="921880061"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="921880061"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 00:18:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andy@kernel.org>)
        id 1qkfrm-00000000HFH-3PQA;
        Mon, 25 Sep 2023 10:18:50 +0300
Date:   Mon, 25 Sep 2023 10:18:50 +0300
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
Subject: Re: [PATCH v3 2/2] gpio: ixp4xx: Handle clock output on pin 14 and 15
Message-ID: <ZRE0WgZ0v4/cMI/E@smile.fi.intel.com>
References: <20230923-ixp4xx-gpio-clocks-v3-0-66f8fe4e7f15@linaro.org>
 <20230923-ixp4xx-gpio-clocks-v3-2-66f8fe4e7f15@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230923-ixp4xx-gpio-clocks-v3-2-66f8fe4e7f15@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 23, 2023 at 06:02:29PM +0200, Linus Walleij wrote:
> This makes it possible to provide basic clock output on pins
> 14 and 15. The clocks are typically used by random electronics,
> not modeled in the device tree, so they just need to be provided
> on request.
> 
> In order to not disturb old systems that require that the
> hardware defaults are kept in the clock setting bits, we only
> manipulate these if either device tree property is present.
> Once we know a device needs one of the clocks we can set it
> in the device tree.

Given that cover letter implicitly explains why not PPS,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

Also see below.

...

>  	if (of_machine_is_compatible("dlink,dsm-g600-a") ||
>  	    of_machine_is_compatible("iom,nas-100d"))
> -		__raw_writel(0x0, g->base + IXP4XX_REG_GPCLK);
> +		val = 0;
> +	else
> +		val = __raw_readl(g->base + IXP4XX_REG_GPCLK);
> +
> +	/*
> +	 * If either clock output is enabled explicitly in the device tree
> +	 * we take full control of the clock by masking off all bits for
> +	 * the clock control and selectively enabling them. Otherwise
> +	 * we leave the hardware default settings.
> +	 *
> +	 * Enable clock outputs with default timings of requested clock.
> +	 * If you need control over TC and DC, add these to the device
> +	 * tree bindings and use them here.
> +	 */
> +	clk_14 = of_property_read_bool(np, "intel,ixp4xx-gpio14-clkout");
> +	clk_15 = of_property_read_bool(np, "intel,ixp4xx-gpio15-clkout");
> +	if (clk_14 || clk_15) {
> +		val &= ~(IXP4XX_GPCLK_MUX14 | IXP4XX_GPCLK_MUX15);
> +		val &= ~IXP4XX_GPCLK_CLK0_MASK;
> +		val &= ~IXP4XX_GPCLK_CLK1_MASK;
> +		if (clk_14) {
> +			val |= (0 << IXP4XX_GPCLK_CLK0DC_SHIFT);
> +			val |= (1 << IXP4XX_GPCLK_CLK0TC_SHIFT);
> +			val |= IXP4XX_GPCLK_MUX14;
> +		}
> +
> +		if (clk_15) {
> +			val |= (0 << IXP4XX_GPCLK_CLK1DC_SHIFT);
> +			val |= (1 << IXP4XX_GPCLK_CLK1TC_SHIFT);
> +			val |= IXP4XX_GPCLK_MUX15;
> +		}
> +	}
> +
> +	__raw_writel(val, g->base + IXP4XX_REG_GPCLK);

Can be optimized this way (not insisting, though):

	/*
	 * If either clock output is enabled explicitly in the device tree
	 * we take full control of the clock by masking off all bits for
	 * the clock control and selectively enabling them. Otherwise
	 * we leave the hardware default settings.
	 *
	 * Enable clock outputs with default timings of requested clock.
	 * If you need control over TC and DC, add these to the device
	 * tree bindings and use them here.
	 */
	clk_14 = of_property_read_bool(np, "intel,ixp4xx-gpio14-clkout");
	clk_15 = of_property_read_bool(np, "intel,ixp4xx-gpio15-clkout");

	if (of_machine_is_compatible("dlink,dsm-g600-a") ||
	    of_machine_is_compatible("iom,nas-100d")) {
		val = 0;
	} else {
		val = __raw_readl(g->base + IXP4XX_REG_GPCLK);
		if (clk_14 || clk_15) {

I'm wondering if it's fine to have them both to be cleared if not defined?
I.o.w. does it meant that appearance of one of the properties (to be set)
implies the other (to be not set)?

			val &= ~(IXP4XX_GPCLK_MUX14 | IXP4XX_GPCLK_MUX15);
			val &= ~IXP4XX_GPCLK_CLK0_MASK;
			val &= ~IXP4XX_GPCLK_CLK1_MASK;
		}
	}

	if (clk_14) {

		val |= (0 << IXP4XX_GPCLK_CLK0DC_SHIFT);

Wondering why you simply can't replace this...

		val |= (1 << IXP4XX_GPCLK_CLK0TC_SHIFT);
		val |= IXP4XX_GPCLK_MUX14;
	}

	if (clk_15) {
		val |= (0 << IXP4XX_GPCLK_CLK1DC_SHIFT);

...and this by a comment?

		val |= (1 << IXP4XX_GPCLK_CLK1TC_SHIFT);
		val |= IXP4XX_GPCLK_MUX15;
	}

	__raw_writel(val, g->base + IXP4XX_REG_GPCLK);

-- 
With Best Regards,
Andy Shevchenko


