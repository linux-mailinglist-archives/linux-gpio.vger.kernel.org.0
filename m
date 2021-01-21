Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B505B2FF191
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 18:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388595AbhAURPm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 12:15:42 -0500
Received: from mga04.intel.com ([192.55.52.120]:33953 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388314AbhAURON (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Jan 2021 12:14:13 -0500
IronPort-SDR: R9l9La4ycJtOEmcpdO1hw98PNOTAx30pCveRW81S9oeO5V7EohIViyUJMpXoI2S2raE5wUxP9U
 lLqIb+pbB/3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="176732649"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="176732649"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 09:12:11 -0800
IronPort-SDR: mIKet1+8IcYOTlRmDDhW94uFkLGpwIc6wlEOcgnRgXwgNNAsgyvzG1/LryQgw+RSzlM6Ui5nWa
 xvh8Y37twuyg==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="574330573"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 09:12:09 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2dWC-007mM7-Jh; Thu, 21 Jan 2021 19:13:12 +0200
Date:   Thu, 21 Jan 2021 19:13:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1] ARM: Drop ARCH_NR_GPIOS definition
Message-ID: <YAm2KDdGNWoACAQZ@smile.fi.intel.com>
References: <20201012154709.68521-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012154709.68521-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 12, 2020 at 06:47:09PM +0300, Andy Shevchenko wrote:
> The conditional by the generic header is the same,
> hence drop unnecessary duplication.

Can we get this proceed somehow?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/arm/include/asm/gpio.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/include/asm/gpio.h b/arch/arm/include/asm/gpio.h
> index c50e383358c4..f3bb8a2bf788 100644
> --- a/arch/arm/include/asm/gpio.h
> +++ b/arch/arm/include/asm/gpio.h
> @@ -2,10 +2,6 @@
>  #ifndef _ARCH_ARM_GPIO_H
>  #define _ARCH_ARM_GPIO_H
>  
> -#if CONFIG_ARCH_NR_GPIO > 0
> -#define ARCH_NR_GPIOS CONFIG_ARCH_NR_GPIO
> -#endif
> -
>  /* Note: this may rely upon the value of ARCH_NR_GPIOS set in mach/gpio.h */
>  #include <asm-generic/gpio.h>
>  
> -- 
> 2.28.0
> 

-- 
With Best Regards,
Andy Shevchenko


