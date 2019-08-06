Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF0583038
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 13:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731426AbfHFLBa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 07:01:30 -0400
Received: from mga14.intel.com ([192.55.52.115]:55295 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730844AbfHFLBa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Aug 2019 07:01:30 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Aug 2019 04:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; 
   d="scan'208";a="192638972"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 06 Aug 2019 04:01:27 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 06 Aug 2019 14:01:26 +0300
Date:   Tue, 6 Aug 2019 14:01:26 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Allow to request locked pins
Message-ID: <20190806110126.GR2548@lahna.fi.intel.com>
References: <20190726200830.52728-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190726200830.52728-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 26, 2019 at 11:08:30PM +0300, Andy Shevchenko wrote:
> Some firmwares would like to protect pins from being modified by OS
> and at the same time provide them to OS as a resource. So, the driver
> in such circumstances may request pin and may not change its state.

This is definitely good idea.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 55 +++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 3a945997b8eb..567fe43b238f 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -220,22 +220,30 @@ static bool intel_pad_acpi_mode(struct intel_pinctrl *pctrl, unsigned int pin)
>  	return !(readl(hostown) & BIT(gpp_offset));
>  }
>  
> -static bool intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
> +enum {
> +	PAD_UNLOCKED	= 0,
> +	PAD_LOCKED	= 1,
> +	PAD_LOCKED_TX	= 2,
> +	PAD_LOCKED_FULL	= PAD_LOCKED | PAD_LOCKED_TX,
> +};
> +
> +static int intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
>  {
>  	struct intel_community *community;
>  	const struct intel_padgroup *padgrp;
>  	unsigned int offset, gpp_offset;
>  	u32 value;
> +	int ret = PAD_UNLOCKED;
>  
>  	community = intel_get_community(pctrl, pin);
>  	if (!community)
> -		return true;
> +		return PAD_LOCKED_FULL;
>  	if (!community->padcfglock_offset)
> -		return false;
> +		return PAD_UNLOCKED;
>  
>  	padgrp = intel_community_get_padgroup(community, pin);
>  	if (!padgrp)
> -		return true;
> +		return PAD_LOCKED_FULL;
>  
>  	gpp_offset = padgroup_offset(padgrp, pin);
>  
> @@ -244,23 +252,27 @@ static bool intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
>  	 * the pad is considered unlocked. Any other case means that it is
>  	 * either fully or partially locked and we don't touch it.

I think you should update the above comment as well.

>  	 */
> -	offset = community->padcfglock_offset + padgrp->reg_num * 8;
> +	offset = community->padcfglock_offset + 0 + padgrp->reg_num * 8;
>  	value = readl(community->regs + offset);
>  	if (value & BIT(gpp_offset))
> -		return true;
> +		ret |= PAD_LOCKED;
>  
>  	offset = community->padcfglock_offset + 4 + padgrp->reg_num * 8;
>  	value = readl(community->regs + offset);
>  	if (value & BIT(gpp_offset))
> -		return true;
> +		ret |= PAD_LOCKED_TX;
>  
> -	return false;
> +	return ret;
> +}
> +
> +static bool intel_pad_is_unlocked(struct intel_pinctrl *pctrl, unsigned int pin)
> +{
> +	return (intel_pad_locked(pctrl, pin) & PAD_LOCKED) == PAD_UNLOCKED;
>  }
>  
>  static bool intel_pad_usable(struct intel_pinctrl *pctrl, unsigned int pin)
>  {
> -	return intel_pad_owned_by_host(pctrl, pin) &&
> -		!intel_pad_locked(pctrl, pin);
> +	return intel_pad_owned_by_host(pctrl, pin) && intel_pad_is_unlocked(pctrl, pin);
>  }
>  
>  static int intel_get_groups_count(struct pinctrl_dev *pctldev)
> @@ -294,7 +306,8 @@ static void intel_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
>  	struct intel_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>  	void __iomem *padcfg;
>  	u32 cfg0, cfg1, mode;
> -	bool locked, acpi;
> +	int locked;
> +	bool acpi;
>  
>  	if (!intel_pad_owned_by_host(pctrl, pin)) {
>  		seq_puts(s, "not available");
> @@ -322,11 +335,16 @@ static void intel_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
>  
>  	if (locked || acpi) {
>  		seq_puts(s, " [");
> -		if (locked) {
> +		if (locked)
>  			seq_puts(s, "LOCKED");
> -			if (acpi)
> -				seq_puts(s, ", ");
> -		}
> +		if ((locked & PAD_LOCKED_FULL) == PAD_LOCKED_TX)
> +			seq_puts(s, " TX");
> +		else if ((locked & PAD_LOCKED_FULL) == PAD_LOCKED_FULL)
> +			seq_puts(s, " FULL");
> +
> +		if (locked && acpi)
> +			seq_puts(s, ", ");
> +
>  		if (acpi)
>  			seq_puts(s, "ACPI");
>  		seq_puts(s, "]");
> @@ -448,11 +466,16 @@ static int intel_gpio_request_enable(struct pinctrl_dev *pctldev,
>  
>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>  
> -	if (!intel_pad_usable(pctrl, pin)) {
> +	if (!intel_pad_owned_by_host(pctrl, pin)) {
>  		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>  		return -EBUSY;
>  	}
>  
> +	if (!intel_pad_is_unlocked(pctrl, pin)) {
> +		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +		return 0;

Hmm, if I'm reading this right it still does not allow requesting locked
pins. What I'm missing here?

> +	}
> +
>  	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
>  	intel_gpio_set_gpio_mode(padcfg0);
>  	/* Disable TX buffer and enable RX (this will be input) */
> -- 
> 2.20.1
