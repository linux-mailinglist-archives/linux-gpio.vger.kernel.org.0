Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16EA23A59E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 14:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729424AbgHCMdX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 08:33:23 -0400
Received: from mga06.intel.com ([134.134.136.31]:17590 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726847AbgHCMdW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Aug 2020 08:33:22 -0400
IronPort-SDR: 64/dWRwAVfGaNIFBw6l3XYwKOE0ZnpAiwYItsxMFtnG/kyhPmDSnoNe8unzh2wtkpB8AiJnsHb
 x1xVHEIY5hjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="213624281"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="213624281"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 05:33:21 -0700
IronPort-SDR: AUCvyW+haRetLrqyv19+QuQIBIvk0qHFb2I4h/6KRfAudmq2La4YdoAlDTLbYeALpSrUXT0oyP
 k4diVocW4TyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="396039047"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 03 Aug 2020 05:33:19 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 03 Aug 2020 15:33:18 +0300
Date:   Mon, 3 Aug 2020 15:33:18 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Extract
 intel_pinctrl_get_soc_data() helper for wider use
Message-ID: <20200803123318.GR1375436@lahna.fi.intel.com>
References: <20200729115708.38112-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729115708.38112-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 29, 2020 at 02:57:06PM +0300, Andy Shevchenko wrote:
> intel_pinctrl_get_soc_data() helper can be used in few driver instead of
> open-coded variants. Thus, extract it as a standalone API.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 24 ++++++++++++++++++------
>  drivers/pinctrl/intel/pinctrl-intel.h |  2 ++
>  2 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 5a39e6ce6786..6e11d16a8684 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1424,9 +1424,6 @@ static int intel_pinctrl_probe(struct platform_device *pdev,
>  	struct intel_pinctrl *pctrl;
>  	int i, ret, irq;
>  
> -	if (!soc_data)
> -		return -EINVAL;
> -
>  	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
>  	if (!pctrl)
>  		return -ENOMEM;
> @@ -1534,11 +1531,26 @@ int intel_pinctrl_probe_by_hid(struct platform_device *pdev)
>  	const struct intel_pinctrl_soc_data *data;
>  
>  	data = device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODATA;
> +
>  	return intel_pinctrl_probe(pdev, data);
>  }
>  EXPORT_SYMBOL_GPL(intel_pinctrl_probe_by_hid);
>  
>  int intel_pinctrl_probe_by_uid(struct platform_device *pdev)
> +{
> +	const struct intel_pinctrl_soc_data *data;
> +
> +	data = intel_pinctrl_get_soc_data(pdev);
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
> +	return intel_pinctrl_probe(pdev, data);
> +}
> +EXPORT_SYMBOL_GPL(intel_pinctrl_probe_by_uid);
> +
> +const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev)

Can we make this take const parameter as well?

>  {
>  	const struct intel_pinctrl_soc_data *data = NULL;
>  	const struct intel_pinctrl_soc_data **table;
> @@ -1561,15 +1573,15 @@ int intel_pinctrl_probe_by_uid(struct platform_device *pdev)
>  
>  		id = platform_get_device_id(pdev);
>  		if (!id)
> -			return -ENODEV;
> +			return ERR_PTR(-ENODEV);
>  
>  		table = (const struct intel_pinctrl_soc_data **)id->driver_data;
>  		data = table[pdev->id];
>  	}
>  
> -	return intel_pinctrl_probe(pdev, data);
> +	return data ?: ERR_PTR(-ENODATA);
>  }
> -EXPORT_SYMBOL_GPL(intel_pinctrl_probe_by_uid);
> +EXPORT_SYMBOL_GPL(intel_pinctrl_get_soc_data);
>  
>  #ifdef CONFIG_PM_SLEEP
>  static bool intel_pinctrl_should_save(struct intel_pinctrl *pctrl, unsigned int pin)
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
> index 2e283247f3ba..38a1d6af7427 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.h
> +++ b/drivers/pinctrl/intel/pinctrl-intel.h
> @@ -198,6 +198,8 @@ struct intel_pinctrl_soc_data {
>  	size_t ncommunities;
>  };
>  
> +const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev);
> +
>  struct intel_pad_context;
>  struct intel_community_context;
>  
> -- 
> 2.27.0
