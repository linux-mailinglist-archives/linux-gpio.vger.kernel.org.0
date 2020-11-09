Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A82D2AB7EF
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 13:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgKIMMu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 07:12:50 -0500
Received: from mga06.intel.com ([134.134.136.31]:20208 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbgKIMMu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 07:12:50 -0500
IronPort-SDR: 5BEb/MiP1d0MqWiUvMPYdoqSpdBKKehA7uupXVr7YqT0kUlEsw0Wryz3hm6Hx+z/4d2wk/E7mE
 GuuHOt0d7tFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="231422102"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="231422102"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 04:12:49 -0800
IronPort-SDR: hPyI91GEaAu14A+OU9orFoNwPeWGyErcjF9K/pCij7ADKyEkijvShlKGdYFcfbT72g+C/Z+vVw
 mrcZeQIq5EcA==
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="322419857"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 04:12:48 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kc63S-005AmY-Jd; Mon, 09 Nov 2020 14:13:50 +0200
Date:   Mon, 9 Nov 2020 14:13:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1] ARM: Drop ARCH_NR_GPIOS definition
Message-ID: <20201109121350.GD4077@smile.fi.intel.com>
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

Any comment on this?

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


