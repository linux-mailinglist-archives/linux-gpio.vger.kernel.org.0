Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF8C27C2C6
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 12:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbgI2KvV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 06:51:21 -0400
Received: from mga06.intel.com ([134.134.136.31]:2315 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727805AbgI2KvU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 29 Sep 2020 06:51:20 -0400
IronPort-SDR: Aovzsf9EfG5I1Y+5bv4Q8K/vkloJXOWoFNgB8yC08O/LYhcQUff7pp07HT6HtGF16B9IprB35/
 0e3fn+Bdhyew==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="223751836"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="223751836"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 03:51:18 -0700
IronPort-SDR: m7YTCmM6M/QGObEMbEHU6QfWwNVc8JeUX0ChNt8Sqt1suczlWWqNkpjKd36p3ztns3mZcm64mE
 1uruo9GX0arA==
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; 
   d="scan'208";a="514632702"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 03:51:16 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kNDDx-002lyH-CE; Tue, 29 Sep 2020 13:51:09 +0300
Date:   Tue, 29 Sep 2020 13:51:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 01/10] lib: string_helpers: provide kfree_strarray()
Message-ID: <20200929105109.GE3956970@smile.fi.intel.com>
References: <20200929101004.20288-1-brgl@bgdev.pl>
 <20200929101004.20288-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929101004.20288-2-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 12:09:55PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> There's a common pattern of dynamically allocating an array of char
> pointers and then also dynamically allocating each string in this
> array. Provide a helper for freeing such a string array with one call.

Thanks! Below couple of nits you may address during applying phase.

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/string_helpers.h |  2 ++
>  lib/string_helpers.c           | 24 ++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
> index 86f150c2a6b6..fa06dcdc481e 100644
> --- a/include/linux/string_helpers.h
> +++ b/include/linux/string_helpers.h
> @@ -94,4 +94,6 @@ char *kstrdup_quotable(const char *src, gfp_t gfp);
>  char *kstrdup_quotable_cmdline(struct task_struct *task, gfp_t gfp);
>  char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
>  
> +void kfree_strarray(char **array, size_t n);
> +
>  #endif
> diff --git a/lib/string_helpers.c b/lib/string_helpers.c
> index 963050c0283e..efeee2353613 100644
> --- a/lib/string_helpers.c
> +++ b/lib/string_helpers.c
> @@ -649,3 +649,27 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
>  	return pathname;
>  }
>  EXPORT_SYMBOL_GPL(kstrdup_quotable_file);
> +
> +/**
> + * kfree_strarray - free a number of dynamically allocated strings contained
> + *                  in an array and the array itself

> + * @array: Dynamically allocated array of strings to free. If NULL - the
> + *         function does nothing.

I would rather move second sentence to the description below.

> + * @n: Number of strings (starting from the beginning of the array) to free.
> + *

> + * Passing a non-null @array and @n == 0 as well as NULL @array  are valid

non-null -> non-NULL, and extra space before 'are'.

> + * use-cases.
> + */
> +void kfree_strarray(char **array, size_t n)
> +{
> +	unsigned int i;
> +
> +	if (!array)
> +		return;
> +
> +	for (i = 0; i < n; i++)
> +		kfree(array[i]);
> +	kfree(array);
> +}
> +EXPORT_SYMBOL_GPL(kfree_strarray);
> -- 
> 2.26.1
> 

-- 
With Best Regards,
Andy Shevchenko


