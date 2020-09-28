Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCC227AE5E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 14:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgI1Mzs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 08:55:48 -0400
Received: from mga05.intel.com ([192.55.52.43]:46944 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgI1Mzs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 08:55:48 -0400
IronPort-SDR: inyh5kDXlsGzJwnnHUnWHf5uHJS4F6djxp+Bgt5BgAKqDScsri1dDhxdLWp7CFM7KCgQoKT0LH
 RusWN3JyZTKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="246727851"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="246727851"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 05:55:47 -0700
IronPort-SDR: mKCJBKZI9NNwz0s5WtvkbDmtw4AvxLXFN92cm8ENdBw+uwCbl3IZHkjsrp2fMY60xzozIb/7BW
 dC5vUs/9/Ggw==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="338170423"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 05:55:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kMsgu-002Z4Y-08; Mon, 28 Sep 2020 15:55:40 +0300
Date:   Mon, 28 Sep 2020 15:55:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 1/9] lib: string_helpers: provide kfree_strarray()
Message-ID: <20200928125539.GI3956970@smile.fi.intel.com>
References: <20200928104155.7385-1-brgl@bgdev.pl>
 <20200928104155.7385-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928104155.7385-2-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 12:41:47PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> There's a common pattern of dynamically allocating an array of char
> pointers and then also dynamically allocating each string in this
> array. Provide a helper for freeing such a string array with one call.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
But see below.

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  include/linux/string_helpers.h |  2 ++
>  lib/string_helpers.c           | 25 +++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
> index 86f150c2a6b6..55b25120a1c6 100644
> --- a/include/linux/string_helpers.h
> +++ b/include/linux/string_helpers.h
> @@ -94,4 +94,6 @@ char *kstrdup_quotable(const char *src, gfp_t gfp);
>  char *kstrdup_quotable_cmdline(struct task_struct *task, gfp_t gfp);
>  char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
>  
> +void kfree_strarray(char **str_array, size_t num_str);
> +
>  #endif
> diff --git a/lib/string_helpers.c b/lib/string_helpers.c
> index 963050c0283e..bfa4c9f3ca0a 100644
> --- a/lib/string_helpers.c
> +++ b/lib/string_helpers.c
> @@ -649,3 +649,28 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
>  	return pathname;
>  }
>  EXPORT_SYMBOL_GPL(kstrdup_quotable_file);
> +
> +/**
> + * kfree_strarray - free a number of dynamically allocated strings contained
> + *                  in an array and the array itself
> + *
> + * @str_array: Dynamically allocated array of strings to free. If NULL - the
> + *             function does nothing.
> + * @num_str: Number of strings (starting from the beginning of the array) to
> + *           free.
> + *
> + * Passing a non-null str_array and num_str == 0 as well as NULL str_array
> + * are valid use-cases.
> + */
> +void kfree_strarray(char **str_array, size_t num_str)

Hmm... I have missed your answer to 
 str_array -> array
 num_str -> n

The rationale behind dropping str is to avoid duplicates in the name of the
function and its parameters. 'array' is harder to avoid, but also possible,
though I leave it to you.

> +{
> +	unsigned int i;
> +
> +	if (!str_array)
> +		return;
> +
> +	for (i = 0; i < num_str; i++)
> +		kfree(str_array[i]);
> +	kfree(str_array);
> +}
> +EXPORT_SYMBOL_GPL(kfree_strarray);
> -- 
> 2.26.1
> 

-- 
With Best Regards,
Andy Shevchenko


