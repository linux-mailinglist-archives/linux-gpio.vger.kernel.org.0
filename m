Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87B56FE22
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Apr 2019 18:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbfD3QsR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Apr 2019 12:48:17 -0400
Received: from mga04.intel.com ([192.55.52.120]:43074 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbfD3QsR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Apr 2019 12:48:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Apr 2019 09:48:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,414,1549958400"; 
   d="scan'208";a="147045559"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
  by orsmga003.jf.intel.com with ESMTP; 30 Apr 2019 09:48:14 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hLVvR-0007yC-Ab; Tue, 30 Apr 2019 19:48:13 +0300
Date:   Tue, 30 Apr 2019 19:48:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        hotwater438@tutanota.com, hdegoede@redhat.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: intel: Clear interrupt status in mask/unmask
 callback
Message-ID: <20190430164813.GP9224@smile.fi.intel.com>
References: <20190430083753.18197-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430083753.18197-1-kai.heng.feng@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 30, 2019 at 04:37:53PM +0800, Kai-Heng Feng wrote:
> Commit a939bb57cd47 ("pinctrl: intel: implement gpio_irq_enable") was
> added because clearing interrupt status bit is required to avoid
> unexpected behavior.
> 
> Turns out the unmask callback also needs the fix, which can solve weird
> IRQ triggering issues on I2C touchpad ELAN1200.

Pushed to my review and testing queue, thanks!

> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v2:
> - Clear interrupt status for both mask/umask cases.
> - Reduce calculation under irq spinlock.
> 
>  drivers/pinctrl/intel/pinctrl-intel.c | 37 +++++----------------------
>  1 file changed, 6 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 3b1818184207..717148d2818c 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -913,35 +913,6 @@ static void intel_gpio_irq_ack(struct irq_data *d)
>  	}
>  }
>  
> -static void intel_gpio_irq_enable(struct irq_data *d)
> -{
> -	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> -	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
> -	const struct intel_community *community;
> -	const struct intel_padgroup *padgrp;
> -	int pin;
> -
> -	pin = intel_gpio_to_pin(pctrl, irqd_to_hwirq(d), &community, &padgrp);
> -	if (pin >= 0) {
> -		unsigned int gpp, gpp_offset, is_offset;
> -		unsigned long flags;
> -		u32 value;
> -
> -		gpp = padgrp->reg_num;
> -		gpp_offset = padgroup_offset(padgrp, pin);
> -		is_offset = community->is_offset + gpp * 4;
> -
> -		raw_spin_lock_irqsave(&pctrl->lock, flags);
> -		/* Clear interrupt status first to avoid unexpected interrupt */
> -		writel(BIT(gpp_offset), community->regs + is_offset);
> -
> -		value = readl(community->regs + community->ie_offset + gpp * 4);
> -		value |= BIT(gpp_offset);
> -		writel(value, community->regs + community->ie_offset + gpp * 4);
> -		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> -	}
> -}
> -
>  static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
>  {
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> @@ -954,15 +925,20 @@ static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
>  	if (pin >= 0) {
>  		unsigned int gpp, gpp_offset;
>  		unsigned long flags;
> -		void __iomem *reg;
> +		void __iomem *reg, *is;
>  		u32 value;
>  
>  		gpp = padgrp->reg_num;
>  		gpp_offset = padgroup_offset(padgrp, pin);
>  
>  		reg = community->regs + community->ie_offset + gpp * 4;
> +		is = community->regs + community->is_offset + gpp * 4;
>  
>  		raw_spin_lock_irqsave(&pctrl->lock, flags);
> +
> +		/* Clear interrupt status first to avoid unexpected interrupt */
> +		writel(BIT(gpp_offset), is);
> +
>  		value = readl(reg);
>  		if (mask)
>  			value &= ~BIT(gpp_offset);
> @@ -1106,7 +1082,6 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
>  
>  static struct irq_chip intel_gpio_irqchip = {
>  	.name = "intel-gpio",
> -	.irq_enable = intel_gpio_irq_enable,
>  	.irq_ack = intel_gpio_irq_ack,
>  	.irq_mask = intel_gpio_irq_mask,
>  	.irq_unmask = intel_gpio_irq_unmask,
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


