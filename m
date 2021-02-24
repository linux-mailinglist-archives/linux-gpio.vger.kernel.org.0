Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DACB323FB2
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Feb 2021 16:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbhBXORQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Feb 2021 09:17:16 -0500
Received: from mga06.intel.com ([134.134.136.31]:6956 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236533AbhBXNVS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Feb 2021 08:21:18 -0500
IronPort-SDR: o0K6BObR6st8y1uf3LcnZrI6lnXTXHTJtW8yXY8GrCuEiEzg251wiLuiu9DH8AWCkTf1fx2am3
 NwLuUcXuvA5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9904"; a="246569900"
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; 
   d="scan'208";a="246569900"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2021 05:14:59 -0800
IronPort-SDR: BviNf1teYLcxlXJy+VsxD6xV+Brrp51P6xuZYYxpXGkOOeBDDcUPjZMTWE7QAUsCJ/Ggzw+rVj
 CfUA5uXF2SZA==
X-IronPort-AV: E=Sophos;i="5.81,203,1610438400"; 
   d="scan'208";a="499574629"
Received: from unknown (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2021 05:14:57 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lEu0E-007mBJ-Ff; Wed, 24 Feb 2021 15:14:54 +0200
Date:   Wed, 24 Feb 2021 15:14:54 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1] ARM: Drop ARCH_NR_GPIOS definition
Message-ID: <YDZRTiQ3pLfk1/Z0@smile.fi.intel.com>
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

Any comment on this anybody?

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


