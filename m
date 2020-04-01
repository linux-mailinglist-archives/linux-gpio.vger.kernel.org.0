Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE2719A8E7
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 11:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgDAJvq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 05:51:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:60356 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgDAJvq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Apr 2020 05:51:46 -0400
IronPort-SDR: GzX20qMFKnkbAvJlmcEFmjFs1rznxDCDvv4jIO2Ju7qoE2AjUhcKB24rEybexKl17tPqsQD+qA
 FvMQ4fl68DVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 02:51:45 -0700
IronPort-SDR: W4VICr+o2OAdDbFCRTGiDj9zOVu6UoBwBMEzgCoyx70SX+NTBAMkBpK6/dQn9ZQUhL0YN03R8L
 1QXoEJZx0aAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,331,1580803200"; 
   d="scan'208";a="359810528"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 01 Apr 2020 02:51:43 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 01 Apr 2020 12:51:43 +0300
Date:   Wed, 1 Apr 2020 12:51:42 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/4] pinctrl: intel: Introduce common flags for GPIO
 mapping scheme
Message-ID: <20200401095142.GS2564@lahna.fi.intel.com>
References: <20200331152547.34044-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200331152547.34044-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 31, 2020 at 06:25:44PM +0300, Andy Shevchenko wrote:
> Few drivers are using the same flag to tell Intel pin control core
> how to interpret GPIO base.
> 
> Provide a generic flags so all drivers can use.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 19 +++++++++++++------
>  drivers/pinctrl/intel/pinctrl-intel.h |  5 +++--
>  2 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 74fdfd2b9ff5..a1b286dc7008 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -798,7 +798,7 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
>  		for (j = 0; j < comm->ngpps; j++) {
>  			const struct intel_padgroup *pgrp = &comm->gpps[j];
>  
> -			if (pgrp->gpio_base < 0)
> +			if (pgrp->gpio_base == INTEL_GPIO_BASE_NOMAP)
>  				continue;
>  
>  			if (offset >= pgrp->gpio_base &&
> @@ -1138,7 +1138,7 @@ static int intel_gpio_add_community_ranges(struct intel_pinctrl *pctrl,
>  	for (i = 0; i < community->ngpps; i++) {
>  		const struct intel_padgroup *gpp = &community->gpps[i];
>  
> -		if (gpp->gpio_base < 0)
> +		if (gpp->gpio_base == INTEL_GPIO_BASE_NOMAP)
>  			continue;
>  
>  		ret = gpiochip_add_pin_range(&pctrl->chip, dev_name(pctrl->dev),
> @@ -1180,7 +1180,7 @@ static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
>  		for (j = 0; j < community->ngpps; j++) {
>  			const struct intel_padgroup *gpp = &community->gpps[j];
>  
> -			if (gpp->gpio_base < 0)
> +			if (gpp->gpio_base == INTEL_GPIO_BASE_NOMAP)
>  				continue;
>  
>  			if (gpp->gpio_base + gpp->size > ngpio)
> @@ -1276,8 +1276,15 @@ static int intel_pinctrl_add_padgroups(struct intel_pinctrl *pctrl,
>  		if (gpps[i].size > 32)
>  			return -EINVAL;
>  
> -		if (!gpps[i].gpio_base)
> -			gpps[i].gpio_base = gpps[i].base;
> +		/* Special treatment for GPIO base */
> +		switch (gpps[i].gpio_base) {
> +			case INTEL_GPIO_BASE_MATCH:
> +				gpps[i].gpio_base = gpps[i].base;
> +				break;
> +			case INTEL_GPIO_BASE_NOMAP:
> +			default:
> +				break;
> +		}
>  
>  		gpps[i].padown_num = padown_num;
>  
> @@ -1596,7 +1603,7 @@ static void intel_restore_hostown(struct intel_pinctrl *pctrl, unsigned int c,
>  	struct device *dev = pctrl->dev;
>  	u32 requested;
>  
> -	if (padgrp->gpio_base < 0)
> +	if (padgrp->gpio_base == INTEL_GPIO_BASE_NOMAP)
>  		return;
>  
>  	requested = intel_gpio_is_requested(&pctrl->chip, padgrp->gpio_base, padgrp->size);
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
> index c6f066f6d3fb..df11bd6e4a80 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.h
> +++ b/drivers/pinctrl/intel/pinctrl-intel.h
> @@ -53,8 +53,7 @@ struct intel_function {
>   * @reg_num: GPI_IS register number
>   * @base: Starting pin of this group
>   * @size: Size of this group (maximum is 32).
> - * @gpio_base: Starting GPIO base of this group (%0 if matches with @base,
> - *	       and %-1 if no GPIO mapping should be created)
> + * @gpio_base: Starting GPIO base of this group
>   * @padown_num: PAD_OWN register number (assigned by the core driver)
>   *
>   * If pad groups of a community are not the same size, use this structure
> @@ -64,6 +63,8 @@ struct intel_padgroup {
>  	unsigned int reg_num;
>  	unsigned int base;
>  	unsigned int size;
> +#define INTEL_GPIO_BASE_MATCH	0	/* matches with @base */
> +#define INTEL_GPIO_BASE_NOMAP	(-1)	/* no GPIO mapping should be created */

Maybe use enum and add kernel-doc there?

>  	int gpio_base;
>  	unsigned int padown_num;
>  };
> -- 
> 2.25.1
