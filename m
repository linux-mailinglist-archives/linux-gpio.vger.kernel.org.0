Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509C4278375
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 11:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727728AbgIYJBV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 05:01:21 -0400
Received: from mga04.intel.com ([192.55.52.120]:53043 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727151AbgIYJBV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Sep 2020 05:01:21 -0400
IronPort-SDR: /ziFW8/sy44UrqsvZq9firh6laii8Y2a9Pfbmd7VAxBLEbHfknmZSYc3OaZMQDW4EW2OPWxkv5
 f1B272sfcy+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="158862138"
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; 
   d="scan'208";a="158862138"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 02:01:15 -0700
IronPort-SDR: WtDjBDZw9ILlb8YX/w+CSIOvwchv1nsR1Te2v1UfJNWODRlYIWQO05RANq7/RojLKP10+R1YYU
 DKG+YXxXWR7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; 
   d="scan'208";a="339421535"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 25 Sep 2020 02:01:12 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kLjOe-001sMU-17; Fri, 25 Sep 2020 11:48:04 +0300
Date:   Fri, 25 Sep 2020 11:48:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 1/9] lib: string_helpers: provide kfree_strarray()
Message-ID: <20200925084804.GX3956970@smile.fi.intel.com>
References: <20200924113842.11670-1-brgl@bgdev.pl>
 <20200924113842.11670-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924113842.11670-2-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 01:38:34PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> There's a common pattern of dynamically allocating an array of char
> pointers and then also dynamically allocating each string in this
> array. Provide a helper for freeing such a string array with one call.

For consistency I would like to provide kalloc_strarray(), but it seems a bit
ambiguous. So I'm fine with this going alone.

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  include/linux/string_helpers.h |  2 ++
>  lib/string_helpers.c           | 22 ++++++++++++++++++++++
>  2 files changed, 24 insertions(+)
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
> index 963050c0283e..56c01ec8a076 100644
> --- a/lib/string_helpers.c
> +++ b/lib/string_helpers.c
> @@ -649,3 +649,25 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp)
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

Can we use same names as done for other string array related functions, i.e.
str_array -> array
num_str -> n

?

(See *match_string() APIs)

> + *
> + * Passing a non-null str_array and num_str == 0 as well as NULL str_array and
> + * num_str == 0 are valid use-cases.

You still may refer to the parameters in the description using @param notation,
like @str_array.

> + */
> +void kfree_strarray(char **str_array, size_t num_str)
> +{
> +	unsigned int i;
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


