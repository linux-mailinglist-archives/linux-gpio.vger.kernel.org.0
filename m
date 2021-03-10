Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62CE33392F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 10:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhCJJti (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 04:49:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:34828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232417AbhCJJtI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 04:49:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7765B64FBF;
        Wed, 10 Mar 2021 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615369717;
        bh=cbaXPFLPlfxO4DO+qzqvpj+RpO9wsmrj2KK3636FN+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qCgfX7gAmGPzDsZNVC9PSOTerA2i1LvJ0X4ipfELvEA3x6NA1BkNLkWNWQ/aFFSwh
         NNwTyvKLNcKy2imUpU4/IMpbZXbv+Z0XzsCwFQhsj3OZJZOD/4Vnxc9xwgrWQT4pjJ
         PHyTTAqCdsHBYp6R/WHPRSDOgozii7qXPYgFDULg=
Date:   Wed, 10 Mar 2021 10:48:34 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3 07/11] lib: bitmap: provide devm_bitmap_alloc() and
 devm_bitmap_zalloc()
Message-ID: <YEiV8gY/LJiwl10R@kroah.com>
References: <20210309205921.15992-1-brgl@bgdev.pl>
 <20210309205921.15992-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309205921.15992-8-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 09, 2021 at 09:59:17PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Provide managed variants of bitmap_alloc() and bitmap_zalloc().
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/bitmap.h |  8 ++++++++
>  lib/bitmap.c           | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 3282db97e06c..73d039476fa4 100644
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
> @@ -122,6 +124,12 @@ unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
>  unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
>  void bitmap_free(const unsigned long *bitmap);
>  
> +/* Managed variants of the above. */
> +unsigned long *devm_bitmap_alloc(struct device *dev,
> +				 unsigned int nbits, gfp_t flags);
> +unsigned long *devm_bitmap_zalloc(struct device *dev,
> +				  unsigned int nbits, gfp_t flags);
> +
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
> +
> +unsigned long *devm_bitmap_alloc(struct device *dev,
> +				 unsigned int nbits, gfp_t flags)
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
> +
> +unsigned long *devm_bitmap_zalloc(struct device *dev,
> +				  unsigned int nbits, gfp_t flags)
> +{
> +	return devm_bitmap_alloc(dev, nbits, flags | __GFP_ZERO);
> +}
> +EXPORT_SYMBOL(devm_bitmap_zalloc);

devm_* functions have been traditionally exported with
EXPORT_SYMBOL_GPL() due to the use of a struct device *.  Perhaps do
that here as well?

thanks,

greg k-h
