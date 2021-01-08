Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1382EEDB5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 08:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbhAHHJN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 02:09:13 -0500
Received: from mga03.intel.com ([134.134.136.65]:47120 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725308AbhAHHJN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 02:09:13 -0500
IronPort-SDR: LRWgFORruseEZOzT0g+WhrnU3wkeWEEtPDH2/UK+XglX7uWqB7QCB8oL94nSn3pxfosbD0GYP1
 02I3YCBC5Ekg==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="177653003"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="177653003"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 23:07:27 -0800
IronPort-SDR: +9P4YpwQAqIAK530dbLVS57f3mK5OpjycAUi19osMcqYKh5c5AGuIFekIoPvNlCKbY3Sco4X+A
 Ih8Up7EmktaQ==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="380025505"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 23:07:25 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 08 Jan 2021 09:07:22 +0200
Date:   Fri, 8 Jan 2021 09:07:22 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 4/4] pinctrl: intel: Convert capability list to
 features
Message-ID: <20210108070722.GX968855@lahna.fi.intel.com>
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
 <20210107190200.41221-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107190200.41221-4-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 07, 2021 at 09:02:00PM +0200, Andy Shevchenko wrote:
> Communities can have features provided in the capability list.
> Traverse the list and convert to respective features.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 41 +++++++++++++++++++++++++--
>  drivers/pinctrl/intel/pinctrl-intel.h |  4 +++
>  2 files changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 00979acb0203..3d9f22ee987a 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -29,6 +29,16 @@
>  #define REVID_SHIFT			16
>  #define REVID_MASK			GENMASK(31, 16)
>  
> +#define CAPLIST				0x004
> +#define CAPLIST_ID_SHIFT		16
> +#define CAPLIST_ID_MASK			GENMASK(23, 16)
> +#define CAPLIST_ID_GPIO_HW_INFO		1
> +#define CAPLIST_ID_PWM			2
> +#define CAPLIST_ID_BLINK		3
> +#define CAPLIST_ID_EXP			4
> +#define CAPLIST_NEXT_SHIFT		0
> +#define CAPLIST_NEXT_MASK		GENMASK(15, 0)
> +
>  #define PADBAR				0x00c
>  
>  #define PADOWN_BITS			4
> @@ -1472,7 +1482,7 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
>  	for (i = 0; i < pctrl->ncommunities; i++) {
>  		struct intel_community *community = &pctrl->communities[i];
>  		void __iomem *regs;
> -		u32 padbar;
> +		u32 offset;
>  		u32 value;
>  
>  		*community = pctrl->soc->communities[i];
> @@ -1492,11 +1502,36 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
>  			break;
>  		}
>  
> +		/* Determine community features based on the capabilities */
> +		offset = CAPLIST;
> +		do {
> +			value = readl(regs + offset);
> +			switch ((value & CAPLIST_ID_MASK) >> CAPLIST_ID_SHIFT) {
> +			case CAPLIST_ID_GPIO_HW_INFO:
> +				community->features |= PINCTRL_FEATURE_GPIO_HW_INFO;
> +				break;
> +			case CAPLIST_ID_PWM:
> +				community->features |= PINCTRL_FEATURE_PWM;
> +				break;
> +			case CAPLIST_ID_BLINK:
> +				community->features |= PINCTRL_FEATURE_BLINK;
> +				break;
> +			case CAPLIST_ID_EXP:
> +				community->features |= PINCTRL_FEATURE_EXP;
> +				break;
> +			default:
> +				break;
> +			}
> +			offset = (value & CAPLIST_NEXT_MASK) >> CAPLIST_NEXT_SHIFT;

I suggest adding some check, like that we visited the previous offset
already, so that we do not loop here forever if we find wrongly
formatted capability list.

Otherwise looks good.

> +		} while (offset);
