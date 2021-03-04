Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A182632D3CD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 14:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241046AbhCDNBj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 08:01:39 -0500
Received: from mga02.intel.com ([134.134.136.20]:44828 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241029AbhCDNB0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 08:01:26 -0500
IronPort-SDR: IoYt8sxBHQWAP7/05DA5PM8S3MzfT1GHJ2aykOo0yAvV5s/88AEggymMZMmhQR2U/J9KEgRyb1
 0yFcQOYKRlHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="174522763"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="174522763"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:59:34 -0800
IronPort-SDR: k2j+hBVdNsYKiTq+pJGL+2IceTMyHuIjVTCHuM2/U6sNs3dpQ6VoLXDwd6I30ctkD8WQRYW+7a
 iAItjbvShjag==
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="435790996"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:59:31 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lHnZg-009sbo-4n; Thu, 04 Mar 2021 14:59:28 +0200
Date:   Thu, 4 Mar 2021 14:59:28 +0200
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
Subject: Re: [PATCH v2 06/12] lib: bitmap: order includes alphabetically
Message-ID: <YEDZsMeyDgwU/O8X@smile.fi.intel.com>
References: <20210304102452.21726-1-brgl@bgdev.pl>
 <20210304102452.21726-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304102452.21726-7-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 11:24:46AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> For better readability and maintenance: order the includes in bitmap
> source files alphabetically.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  include/linux/bitmap.h | 4 ++--
>  lib/bitmap.c           | 9 +++++----
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 6939a8983026..3282db97e06c 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -4,10 +4,10 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -#include <linux/types.h>
>  #include <linux/bitops.h>
> -#include <linux/string.h>
>  #include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/types.h>
>  
>  /*
>   * bitmaps provide bit arrays that consume one or more unsigned
> diff --git a/lib/bitmap.c b/lib/bitmap.c
> index 75006c4036e9..78f70d9007ad 100644
> --- a/lib/bitmap.c
> +++ b/lib/bitmap.c
> @@ -3,17 +3,18 @@
>   * lib/bitmap.c
>   * Helper functions for bitmap.h.
>   */
> -#include <linux/export.h>
> -#include <linux/thread_info.h>
> -#include <linux/ctype.h>
> -#include <linux/errno.h>
> +
>  #include <linux/bitmap.h>
>  #include <linux/bitops.h>
>  #include <linux/bug.h>
> +#include <linux/ctype.h>
> +#include <linux/errno.h>
> +#include <linux/export.h>
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <linux/thread_info.h>
>  #include <linux/uaccess.h>
>  
>  #include <asm/page.h>
> -- 
> 2.29.1
> 

-- 
With Best Regards,
Andy Shevchenko


