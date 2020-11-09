Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224C62AB7EE
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 13:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729571AbgKIMMd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 07:12:33 -0500
Received: from mga17.intel.com ([192.55.52.151]:60618 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbgKIMMd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 07:12:33 -0500
IronPort-SDR: w2wACq/m2/A9M5VqT4epykYmcMZZ6sDm5DLJU/nO6BNuKD5h6F8+fcnXPPAbRYJk//TAn+A9A6
 6JFAXpbw4iXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="149640248"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="149640248"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 04:12:32 -0800
IronPort-SDR: Ekipe2iDkRoRdWNMP2QDOb4fL2jlwXqvuCk3Q/MyXaGKaPg42KPkBjY9EqiUylmvb4kZn/nNtI
 GvKsEv0DOQVw==
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="530716991"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 04:12:31 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kc63B-005AmA-CX; Mon, 09 Nov 2020 14:13:33 +0200
Date:   Mon, 9 Nov 2020 14:13:33 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1] sh: Drop ARCH_NR_GPIOS definition
Message-ID: <20201109121333.GC4077@smile.fi.intel.com>
References: <20201012154050.68039-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012154050.68039-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 12, 2020 at 06:40:50PM +0300, Andy Shevchenko wrote:
> The default by generic header is the same, hence drop unnecessary definition.

Any comment on this?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/sh/include/asm/gpio.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/sh/include/asm/gpio.h b/arch/sh/include/asm/gpio.h
> index 351918894e86..d643250f0a0f 100644
> --- a/arch/sh/include/asm/gpio.h
> +++ b/arch/sh/include/asm/gpio.h
> @@ -16,7 +16,6 @@
>  #include <cpu/gpio.h>
>  #endif
>  
> -#define ARCH_NR_GPIOS 512
>  #include <asm-generic/gpio.h>
>  
>  #ifdef CONFIG_GPIOLIB
> -- 
> 2.28.0
> 

-- 
With Best Regards,
Andy Shevchenko


