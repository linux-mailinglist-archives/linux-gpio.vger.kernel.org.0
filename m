Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27010487A97
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jan 2022 17:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239986AbiAGQmu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jan 2022 11:42:50 -0500
Received: from mga14.intel.com ([192.55.52.115]:37239 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239949AbiAGQmt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 Jan 2022 11:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641573769; x=1673109769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kbs5xRru6OG7wwLWVfqaaIyTU/WcyJAmRAcgEUD2+5A=;
  b=gT94S0mSEb/7v5fqOOp7f66zw+mDGt3byhJcva9A9iF5Tk+7UVZci+gO
   wroKpdOXNGflHC/SGTgzOIGHvPIbBGuh2Os2kQM4JAIeqocB14ry7rXOd
   khFVY306pHdFsJ6JGzdr4O6LQa7ZduisXKxjaV0HnJdL0VHnrSFdMrwdu
   yrwYRWn9kF52cGkej3f6VyWJnob7hB1sk5zmvQ0ljmenRYy77UgYrXcsr
   i7ogb8/GxI6KC2xnuYL3u7c/8ZvkvRElTuD0SZtY8SWsfPkDhLCj6A7yj
   jgi8dVAa+jFSYRhP63kvb5Xhm4dEQO5AoXSub8ULPh/8oL/Pzy4npy1w3
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="243093744"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="243093744"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 08:42:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="621968041"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 08:42:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1n5sJ1-007SuE-2Y;
        Fri, 07 Jan 2022 18:41:31 +0200
Date:   Fri, 7 Jan 2022 18:41:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Message-ID: <YdhtOrVjyx7k9nt4@smile.fi.intel.com>
References: <20220107142343.38560-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107142343.38560-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 07, 2022 at 03:23:43PM +0100, Hans de Goede wrote:
> Some boards set the direct_irq_en flag in the conf0 register without
> setting any of the trigger bits. The direct_irq_en flag just means that
> the GPIO will send IRQs directly to the APIC instead of going through
> the shared interrupt for the GPIO controller, in order for the pin to
> be able to actually generate IRQs the trigger flags must still be set.
> 
> So having the direct_irq_en flag set without any trigger flags is
> non-sense, log a FW_BUG warning when encountering this and clear the flag
> so that a driver can actually use the pin as IRQ through gpiod_to_irq().
> 
> Specifically this allows the edt-ft5x06 touchscreen driver to use
> INT33FC:02 pin 3 as touchscreen IRQ on the Nextbook Ares 8 tablet,
> accompanied by the following new log message:
> 
> byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger, clearing
> 
> The new byt_direct_irq_sanity_check() function also checks that the
> pin is actually appointed to one of the 16 direct-IRQs which the
> GPIO controller support and on success prints debug msg like these:

supports ?

> byt_gpio INT33FC:02: Pin 0: uses direct IRQ 0 (APIC 67)
> byt_gpio INT33FC:02: Pin 15: uses direct IRQ 2 (APIC 69)
> 
> This is useful to figure out the GPIO pin belonging to ACPI
> resources like this one: "Interrupt () { 0x00000043 }" or
> the other way around.

...

> +static bool byt_direct_irq_sanity_check(struct intel_pinctrl *vg, int pin, u32 value)
> +{
> +	void __iomem *reg;
> +	int i, j;
> +
> +	if (!(value & (BYT_TRIG_POS | BYT_TRIG_NEG))) {
> +		dev_warn(vg->dev,
> +			 FW_BUG "pin %i: direct_irq_en set without trigger, clearing\n", pin);
> +		return false;
> +	}
> +
> +	reg = vg->communities->pad_regs + BYT_DIRECT_IRQ_REG;

> +	for (i = 0; i < 16; i += 4) {
> +		value = readl(reg + i);
> +		for (j = 0; j < 4; j++) {
> +			if (((value >> j * 8) & 0xff) == pin) {

Can it be like

	u32 direct_irq[16];
	void __iomem *reg;
	void *match;


	memcpy_fromio(...);
	match = memchr(...);
	if (match)
		dev_dbg();
	else
		dev_warn();

	return !!match;

?

> +				dev_dbg(vg->dev, "Pin %i: uses direct IRQ %d (APIC %d)\n",
> +					pin, i + j, 0x43 + i + j);
> +				return true;
> +			}
> +		}
> +	}
> +
> +	dev_warn(vg->dev,
> +		 FW_BUG "pin %i: direct_irq_en set but no IRQ assigned, clearing\n", pin);
> +	return false;
> +}

-- 
With Best Regards,
Andy Shevchenko


