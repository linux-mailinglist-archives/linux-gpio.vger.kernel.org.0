Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D54DC498278
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 15:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235136AbiAXOc3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 09:32:29 -0500
Received: from mga06.intel.com ([134.134.136.31]:20778 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238727AbiAXOc3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Jan 2022 09:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643034749; x=1674570749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7UhRNqgjwH3NI+xQ+K2TNQf1y9ukuXGO1vUaO4puHdw=;
  b=QYrQl1hutzmKgog2njZjhUUnpBM+70qqnPcCVoZw/ZZwicDbNjWfvbVk
   H4FzWrjsLFZJTvl5gAOfFKwxAiY5aInmCyrgtixqrqjEHw6Wog1gam0ML
   2ZCKwWT5k5ErsaqcLvWC9EmZEpaZR3wQy8yc0NswcXMoJsBBhw5XlP5Z3
   EcoZ3ERMRkkOTgUoJAECAx1tWxCO5pBjwSFKDv0Ug8cOm+Qa1rpqDfF1i
   +VtZ/fIpnvqkfLBz773lQsaX8id4qZhtBGV5muVEaZN/az90UYt0rbTZh
   XmDso728ZJHqLeyzZSuhdpD+h/7mqtrXeqbKHcM2CIleJTLqFzsSwYYWP
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="306770881"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="306770881"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 06:32:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="479095737"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 06:32:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1nC0NI-00DvKk-LY;
        Mon, 24 Jan 2022 16:31:16 +0200
Date:   Mon, 24 Jan 2022 16:31:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Message-ID: <Ye64NEhlqjMayuOa@smile.fi.intel.com>
References: <20220112210200.265429-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112210200.265429-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 12, 2022 at 10:02:00PM +0100, Hans de Goede wrote:
> Some boards set the direct_irq_en flag in the conf0 register without
> setting the correct trigger bits. The direct_irq_en flag just means that
> the GPIO will send IRQs directly to the APIC instead of going through
> the shared interrupt for the GPIO controller, in order for the pin to be
> able to actually generate IRQs the trigger flags must configure the IRQ
> as a level-high or level-low active IRQ.
> 
> Note testing shows that using edge trigger add the conf0 register level
> does NOT work, instead edge triggering should be set at the IO-APIC level.
> 
> I believe that the direct_irq_en flag connects the output of the GPIO's IRQ
> trigger block, which normally sets the status flag in the IRQ status reg at
> 0x800 to one of the IO-APIC pins according to the direct IRQ mux.
> 
> This means that the TRIG_LVL bit *must* be set, so that the GPIO's input
> value is directly passed (1:1 or inverted) to the IO-APIC pin, if TRIG_LVL
> is not set, selecting edge mode operation then on the first edge the
> selected IO-APIC pin goes high, but since no write-to-clear write will be
> done to the IRQ status reg at 0x800, the detected edge condition will never
> get cleared.
> 
> This APIC pin stuck high condition can be observed with the pin configured
> as level-high active, in the form of an interrupt storm. Clearing the
> TRIG_MASK bits of conf0 stops the storm, reconfiguring them as edge again
> results in a storm again as soon as the edge is triggered once.
> 
> Detect invalid trigger flags, log a FW_BUG warning when encountering this
> and clear the direct_irq_en flag so that a driver can actually use the pin
> as IRQ through gpiod_to_irq().
> 
> Specifically this allows the edt-ft5x06 touchscreen driver to use
> INT33FC:02 pin 3 as touchscreen IRQ on the Nextbook Ares 8 tablet,
> accompanied by the following new log message
> 
> byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger, clearing
> 
> The new byt_direct_irq_sanity_check() function also checks that the
> pin is actually appointed to one of the 16 direct-IRQs which the GPIO
> controller supports and on success prints debug messages like these:
> 
> byt_gpio INT33FC:02: Pin 0: uses direct IRQ 0 (IO-APIC 67)
> byt_gpio INT33FC:02: Pin 15: uses direct IRQ 2 (IO-APIC 69)
> 
> This is useful to figure out the GPIO pin belonging to ACPI
> resources like this one: "Interrupt () { 0x00000043 }" or
> the other way around.
> 
> The strict checking of valid trigger flags this introduces does result in
> FW_BUG messages on quite a few devices. E.g. on the Yoga Tablet 2 1051L:
>  byt_gpio INT33FC:00: [Firmware Bug]: pin 92: direct_irq_en set but no IRQ assigned, clearing
>  byt_gpio INT33FC:00: [Firmware Bug]: pin 93: direct_irq_en set but no IRQ assigned, clearing
>   These 2 also have mux set to 7 and fall + rise + level trigger bits set,
>   presumably something has written 0xffffffff to their conf0 registers
>  byt_gpio INT33FC:02: Pin 3: uses direct IRQ 1 (IO-APIC 68)
>  byt_gpio INT33FC:02: [Firmware Bug]: pin 3: direct_irq_en set without trigger (conf0: 2803cc00h), clearing
>   Most tablets seem to have this, looking at DSDTs this seems intended for
>   use with an I2C HID sensor-hub and is still set on devices without one.
> 
> To make sure this does not cause any regressions this has been tested,
> including checking disabled direct-IRQs are not used in the DSDT,
> on the following devices:
> 
> Asus ME176C
> Asus TF103C
> Chuwi Vi10 (with its Windows BIOS)
> HP x2 10-n000nd
> Lenovo Yoga Tablet 2 1050L (Android version, without EC, with buggy DSDT)
> Lenovo Yoga Tablet 2 1051L (Windows version, with EC)

Pushed to my review and testing queue, thanks!

> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - Only level-high or level-low active conf0 trigger settings are valid for
>   direct IRQs, make byt_direct_irq_sanity_check() check this
> - Add a comment explaining why this is done, and also update the commit msg
> 
> Changes in v3:
> - Rework code to check if the pin is assigned one of the 16 direct IRQs
>   (new code suggested-by Andy)
> - Drop dev_dbg of the (likely?) APIC IRQ, only log the direct IRQ index
> 
> Changes in v2:
> - Add "FW_BUG pin %i: direct_irq_en set but no IRQ assigned, clearing" warning
> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 55 +++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index 4c01333e1406..ceee6c65dbc1 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -32,6 +32,7 @@
>  #define BYT_VAL_REG		0x008
>  #define BYT_DFT_REG		0x00c
>  #define BYT_INT_STAT_REG	0x800
> +#define BYT_DIRECT_IRQ_REG	0x980
>  #define BYT_DEBOUNCE_REG	0x9d0
>  
>  /* BYT_CONF0_REG register bits */
> @@ -1465,6 +1466,51 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
>  	chip->irq_eoi(data);
>  }
>  
> +static bool byt_direct_irq_sanity_check(struct intel_pinctrl *vg, int pin, u32 conf0)
> +{
> +	int direct_irq, ioapic_direct_irq_base;
> +	u8 *match, direct_irq_mux[16];
> +	u32 trig;
> +
> +	memcpy_fromio(direct_irq_mux, vg->communities->pad_regs + BYT_DIRECT_IRQ_REG,
> +		      sizeof(direct_irq_mux));
> +	match = memchr(direct_irq_mux, pin, sizeof(direct_irq_mux));
> +	if (!match) {
> +		dev_warn(vg->dev, FW_BUG "pin %i: direct_irq_en set but no IRQ assigned, clearing\n", pin);
> +		return false;
> +	}
> +
> +	direct_irq = match - direct_irq_mux;
> +	/* Base IO-APIC pin numbers come from atom-e3800-family-datasheet.pdf */
> +	ioapic_direct_irq_base = (vg->communities->npins == BYT_NGPIO_SCORE) ? 51 : 67;
> +	dev_dbg(vg->dev, "Pin %i: uses direct IRQ %d (IO-APIC %d)\n", pin,
> +		direct_irq, direct_irq + ioapic_direct_irq_base);
> +
> +	/*
> +	 * Testing has shown that the way direct IRQs work is that the combination of the
> +	 * direct-irq-en flag and the direct IRQ mux connect the output of the GPIO's IRQ
> +	 * trigger block, which normally sets the status flag in the IRQ status reg at
> +	 * 0x800, to one of the IO-APIC pins according to the mux registers.
> +	 *
> +	 * This means that:
> +	 * 1. The TRIG_MASK bits must be set to configure the GPIO's IRQ trigger block
> +	 * 2. The TRIG_LVL bit *must* be set, so that the GPIO's input value is directly
> +	 *    passed (1:1 or inverted) to the IO-APIC pin, if TRIG_LVL is not set,
> +	 *    selecting edge mode operation then on the first edge the IO-APIC pin goes
> +	 *    high, but since no write-to-clear write will be done to the IRQ status reg
> +	 *    at 0x800, the detected edge condition will never get cleared.
> +	 */
> +	trig = conf0 & BYT_TRIG_MASK;
> +	if (trig != (BYT_TRIG_POS | BYT_TRIG_LVL) &&
> +	    trig != (BYT_TRIG_NEG | BYT_TRIG_LVL)) {
> +		dev_warn(vg->dev, FW_BUG "pin %i: direct_irq_en set without trigger (conf0: %xh), clearing\n",
> +			 pin, conf0);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static void byt_init_irq_valid_mask(struct gpio_chip *chip,
>  				    unsigned long *valid_mask,
>  				    unsigned int ngpios)
> @@ -1492,8 +1538,13 @@ static void byt_init_irq_valid_mask(struct gpio_chip *chip,
>  
>  		value = readl(reg);
>  		if (value & BYT_DIRECT_IRQ_EN) {
> -			clear_bit(i, valid_mask);
> -			dev_dbg(vg->dev, "excluding GPIO %d from IRQ domain\n", i);
> +			if (byt_direct_irq_sanity_check(vg, i, value)) {
> +				clear_bit(i, valid_mask);
> +			} else {
> +				value &= ~(BYT_DIRECT_IRQ_EN | BYT_TRIG_POS |
> +					   BYT_TRIG_NEG | BYT_TRIG_LVL);
> +				writel(value, reg);
> +			}
>  		} else if ((value & BYT_PIN_MUX) == byt_get_gpio_mux(vg, i)) {
>  			byt_gpio_clear_triggering(vg, i);
>  			dev_dbg(vg->dev, "disabling GPIO %d\n", i);
> -- 
> 2.33.1
> 

-- 
With Best Regards,
Andy Shevchenko


