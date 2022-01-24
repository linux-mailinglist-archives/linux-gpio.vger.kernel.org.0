Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71070498113
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 14:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239973AbiAXNbM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 08:31:12 -0500
Received: from mga14.intel.com ([192.55.52.115]:35386 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239932AbiAXNbM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Jan 2022 08:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643031071; x=1674567071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nljVEhkih5xCs5llfVtKxuIr6PESSTjwpLOqMb3sa1U=;
  b=NFcDZ6uPv5vFeciG/YNIOm1xC+9ILOV/C3BaNmoNPmkfGudFIw1kHvqV
   6I/uYzANw2OIotnh8FQpmBIA6MlKazkCE76VbYYNgI19fsEoQb2hl3ZTx
   fXB7qXzwmnLkUEdHJ6BntpShRQjsXS+g2hJXUOSEV9bN6yHkrwIULnqP0
   PH26mx31I8K+5tGpZk+h3rV4NSSLMTW4cCr7wfaCjhQ29PRr+UNVTqExQ
   IVqWRdNMmxG3JJdxlDNrmm351kkf7U0PPGM7qiRCCLs2QzkAznoXlqi/3
   6WBfSkWNZojxyJou0BjzaLWSZRpbzQmCssd5pcepDa5R5wvDWDVLC9De+
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="246260542"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="246260542"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 05:31:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="494618526"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 05:31:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1nBzQ2-00Du1e-PT;
        Mon, 24 Jan 2022 15:30:02 +0200
Date:   Mon, 24 Jan 2022 15:30:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Lukasz Bartosik <lb@semihalf.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        upstream@semihalf.com
Subject: Re: [PATCH v2] pinctrl: intel: fix unexpected interrupt
Message-ID: <Ye6p2m9kIeC1Q461@smile.fi.intel.com>
References: <20220124125529.20432-1-lukasz.bartosik@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124125529.20432-1-lukasz.bartosik@semihalf.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 24, 2022 at 01:55:29PM +0100, Lukasz Bartosik wrote:
> From: Łukasz Bartosik <lb@semihalf.com>
> 
> ASUS Chromebook C223 with Celeron N3350 crashes sometimes during
> cold booot. Inspection of the kernel log showed that it gets into
> an inifite loop logging the following message:
> 
> ->handle_irq():  000000009cdb51e8, handle_bad_irq+0x0/0x251
> ->irq_data.chip(): 000000005ec212a7, 0xffffa043009d8e7
> ->action(): 00000
>    IRQ_NOPROBE set
> unexpected IRQ trap at vector 7c
> 
> The issue happens during cold boot but only if cold boot happens
> at most several dozen seconds after Chromebook is powered off. For
> longer intervals between power off and power on (cold boot) the issue
> does not reproduce. The unexpected interrupt is sourced from INT3452
> GPIO pin which is used for SD card detect. Investigation relevealed
> that when the interval between power off and power on (cold boot)
> is less than several dozen seconds then values of INT3452 GPIO interrupt
> enable and interrupt pending registers survive power off and power
> on sequence and interrupt for SD card detect pin is enabled and pending
> during probe of SD controller which causes the unexpected IRQ message.
> "Intel Pentium and Celeron Processor N- and J- Series" volume 3 doc
> mentions that GPIO interrupt enable and status registers default
> value is 0x0.
> The fix clears INT3452 GPIO interrupt enabled and interrupt pending
> registers in its probe function.

Pushed to my review and testing queue, thanks!

> Fixes: 7981c0015af2 ("pinctrl: intel: Add Intel Sunrisepoint pin controller and GPIO support")
> Signed-off-by: Łukasz Bartosik <lb@semihalf.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 54 +++++++++++++++++----------
>  1 file changed, 34 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index b6ef1911c1dd..12bad1a9aa9c 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1268,6 +1268,39 @@ static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
>  	return ngpio;
>  }
>  
> +static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < pctrl->ncommunities; i++) {
> +		const struct intel_community *community;
> +		void __iomem *base;
> +		unsigned int gpp;
> +
> +		community = &pctrl->communities[i];
> +		base = community->regs;
> +
> +		for (gpp = 0; gpp < community->ngpps; gpp++) {
> +			/* Mask and clear all interrupts */
> +			writel(0, base + community->ie_offset + gpp * 4);
> +			writel(0xffff, base + community->is_offset + gpp * 4);
> +		}
> +	}
> +}
> +
> +static int init_hw(struct gpio_chip *gc)
> +{
> +	struct intel_pinctrl *pctrl = container_of(gc, struct intel_pinctrl,
> +						   chip);
> +	/*
> +	 * Make sure the interrupt lines are in a proper state before
> +	 * further configuration
> +	 */
> +	intel_gpio_irq_init(pctrl);
> +
> +	return 0;
> +}
> +
>  static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
>  {
>  	int ret;
> @@ -1311,6 +1344,7 @@ static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
>  	girq->num_parents = 0;
>  	girq->default_type = IRQ_TYPE_NONE;
>  	girq->handler = handle_bad_irq;
> +	girq->init_hw = init_hw;
>  
>  	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
>  	if (ret) {
> @@ -1640,26 +1674,6 @@ int intel_pinctrl_suspend_noirq(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(intel_pinctrl_suspend_noirq);
>  
> -static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
> -{
> -	size_t i;
> -
> -	for (i = 0; i < pctrl->ncommunities; i++) {
> -		const struct intel_community *community;
> -		void __iomem *base;
> -		unsigned int gpp;
> -
> -		community = &pctrl->communities[i];
> -		base = community->regs;
> -
> -		for (gpp = 0; gpp < community->ngpps; gpp++) {
> -			/* Mask and clear all interrupts */
> -			writel(0, base + community->ie_offset + gpp * 4);
> -			writel(0xffff, base + community->is_offset + gpp * 4);
> -		}
> -	}
> -}
> -
>  static bool intel_gpio_update_reg(void __iomem *reg, u32 mask, u32 value)
>  {
>  	u32 curr, updated;
> -- 
> 2.35.0.rc0.227.g00780c9af4-goog
> 

-- 
With Best Regards,
Andy Shevchenko


