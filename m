Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCD21F95C5
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 13:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729630AbgFOL7d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 07:59:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:47682 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728510AbgFOL7c (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 07:59:32 -0400
IronPort-SDR: nfKWF/+J/KYbkyN4PjO12ydvKEn+A8k63zPyvhxoIa/Ncq+JKpKCrD+LiFhOMDogfdJDZQueNG
 2cHIQzOHnSWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 04:59:30 -0700
IronPort-SDR: esiSmwWzV4RKau5yvwU632jeETKo/km2DKC/LXkZoGadiTV6hk5XyWmK7dwAb59tRKykHIacsH
 ndXSW2yXcktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="382523684"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 15 Jun 2020 04:59:28 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 15 Jun 2020 14:59:27 +0300
Date:   Mon, 15 Jun 2020 14:59:27 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/13] pinctrl: intel: Introduce
 for_each_requested_gpio() macro
Message-ID: <20200615115927.GG247495@lahna.fi.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
 <20200612145006.9145-8-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612145006.9145-8-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 12, 2020 at 05:50:01PM +0300, Andy Shevchenko wrote:
> Introduce for_each_requested_gpio() macro which helps to iterate
> over requested GPIO in a range.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
> index 4e17308d33e9..c1f312bc28eb 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.h
> +++ b/drivers/pinctrl/intel/pinctrl-intel.h
> @@ -249,4 +249,8 @@ const struct dev_pm_ops _name = {					\
>  				      intel_pinctrl_resume_noirq)	\
>  }
>  

kernel-doc would be good to have here.

> +#define for_each_requested_gpio(chip, i, base, size)			\
> +	for (i = 0; i < size; i++)					\
> +		if (!gpiochip_is_requested(chip, base + i)) {} else
> +
>  #endif /* PINCTRL_INTEL_H */
> -- 
> 2.27.0.rc2
