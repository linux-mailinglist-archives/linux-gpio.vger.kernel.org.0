Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4949132D3DC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 14:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241124AbhCDNET (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 08:04:19 -0500
Received: from mga04.intel.com ([192.55.52.120]:12076 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241107AbhCDNEC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 08:04:02 -0500
IronPort-SDR: aBsC3JAZAeRfOTRJ+LdnPKDg6lIkJBH0EVLHPorzwuvwAgp1xHawMwtZVfyvp07dqU/+JSloPb
 iQovZHCuamlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="184997986"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="184997986"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 05:01:31 -0800
IronPort-SDR: rsBAzZMzBpokqlLFNORlDxZXjohLA7ZGTxLSmJFAxVgp6xQrEvaIk2BmGrEyiWDHSpMP+dowQU
 4/L1nh9T017Q==
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="507371623"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 05:01:26 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lHnbX-009sd7-E0; Thu, 04 Mar 2021 15:01:23 +0200
Date:   Thu, 4 Mar 2021 15:01:23 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 07/12] lib: bitmap: provide devm_bitmap_alloc() and
 devm_bitmap_zalloc()
Message-ID: <YEDaI/G+Qb9Q1dxR@smile.fi.intel.com>
References: <20210304102452.21726-1-brgl@bgdev.pl>
 <20210304102452.21726-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304102452.21726-8-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 11:24:47AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Provide managed variants of bitmap_alloc() and bitmap_zalloc().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
A few nit-picks below.

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  include/linux/bitmap.h | 10 ++++++++++
>  lib/bitmap.c           | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 3282db97e06c..e41c622db1b8 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -9,6 +9,8 @@
>  #include <linux/string.h>
>  #include <linux/types.h>
>  
> +struct device;
> +
>  /*
>   * bitmaps provide bit arrays that consume one or more unsigned
>   * longs.  The bitmap interface and available operations are listed
> @@ -122,6 +124,14 @@ unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
>  unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
>  void bitmap_free(const unsigned long *bitmap);

> +/*
> + * Managed variants of the above.
> + */

One line?

> +unsigned long *devm_bitmap_alloc(struct device *dev,
> +				 unsigned int nbits, gfp_t flags);
> +unsigned long *devm_bitmap_zalloc(struct device *dev,
> +				  unsigned int nbits, gfp_t flags);

Both can be oneliners.

>  /*
>   * lib/bitmap.c provides these functions:
>   */
> diff --git a/lib/bitmap.c b/lib/bitmap.c
> index 78f70d9007ad..b4fd7fd084c6 100644
> --- a/lib/bitmap.c
> +++ b/lib/bitmap.c
> @@ -8,6 +8,7 @@
>  #include <linux/bitops.h>
>  #include <linux/bug.h>
>  #include <linux/ctype.h>
> +#include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
> @@ -1263,6 +1264,38 @@ void bitmap_free(const unsigned long *bitmap)
>  }
>  EXPORT_SYMBOL(bitmap_free);
>  
> +static void devm_bitmap_free(void *data)
> +{
> +	unsigned long *bitmap = data;
> +
> +	bitmap_free(bitmap);
> +}

> +unsigned long *devm_bitmap_alloc(struct device *dev,
> +				 unsigned int nbits, gfp_t flags)

One line?

> +{
> +	unsigned long *bitmap;
> +	int ret;
> +
> +	bitmap = bitmap_alloc(nbits, flags);
> +	if (!bitmap)
> +		return NULL;
> +
> +	ret = devm_add_action_or_reset(dev, devm_bitmap_free, bitmap);
> +	if (ret)
> +		return NULL;
> +
> +	return bitmap;
> +}
> +EXPORT_SYMBOL(devm_bitmap_alloc);

> +unsigned long *devm_bitmap_zalloc(struct device *dev,
> +				  unsigned int nbits, gfp_t flags)

One line?

> +{
> +	return devm_bitmap_alloc(dev, nbits, flags | __GFP_ZERO);
> +}
> +EXPORT_SYMBOL(devm_bitmap_zalloc);
> +
>  #if BITS_PER_LONG == 64
>  /**
>   * bitmap_from_arr32 - copy the contents of u32 array of bits to bitmap
> -- 
> 2.29.1
> 

-- 
With Best Regards,
Andy Shevchenko


