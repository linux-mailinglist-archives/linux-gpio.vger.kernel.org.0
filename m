Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22BD132D3C5
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 14:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240316AbhCDNBH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 08:01:07 -0500
Received: from mga04.intel.com ([192.55.52.120]:11881 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239330AbhCDNAp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 08:00:45 -0500
IronPort-SDR: aAFXd8LnZIpOYVKetIh9Kr9hjRSGb2S2EgPcpblRRze9kBHaDm5BEl0cY7sE91ZQSOHyuERnvk
 rmK9NC88KOcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="184997457"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="184997457"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:58:59 -0800
IronPort-SDR: ZZZ7kEP9y3axdZgEWfJ6N+AEIkqRNw1rEYbOirvsuFx78i3F73BDRCFNhnjHVuB84ghGHp+vYv
 Sgpl+OihZBqg==
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="507370733"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:58:55 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lHnZ6-009sbW-EF; Thu, 04 Mar 2021 14:58:52 +0200
Date:   Thu, 4 Mar 2021 14:58:52 +0200
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
Subject: Re: [PATCH v2 05/12] lib: bitmap: remove the 'extern' keyword from
 function declarations
Message-ID: <YEDZjM5kTJPgx1WU@smile.fi.intel.com>
References: <20210304102452.21726-1-brgl@bgdev.pl>
 <20210304102452.21726-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304102452.21726-6-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 11:24:45AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The 'extern' keyword doesn't have any benefits in header files. Remove it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
A few nitpicks below.

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  include/linux/bitmap.h | 115 ++++++++++++++++++++---------------------
>  1 file changed, 57 insertions(+), 58 deletions(-)
> 
> diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> index 70a932470b2d..6939a8983026 100644
> --- a/include/linux/bitmap.h
> +++ b/include/linux/bitmap.h
> @@ -118,54 +118,53 @@
>   * Allocation and deallocation of bitmap.
>   * Provided in lib/bitmap.c to avoid circular dependency.
>   */
> -extern unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
> -extern unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
> -extern void bitmap_free(const unsigned long *bitmap);
> +unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
> +unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
> +void bitmap_free(const unsigned long *bitmap);
>  
>  /*
>   * lib/bitmap.c provides these functions:
>   */
>  
> -extern int __bitmap_equal(const unsigned long *bitmap1,
> -			  const unsigned long *bitmap2, unsigned int nbits);
> -extern bool __pure __bitmap_or_equal(const unsigned long *src1,
> -				     const unsigned long *src2,
> -				     const unsigned long *src3,
> -				     unsigned int nbits);
> -extern void __bitmap_complement(unsigned long *dst, const unsigned long *src,
> -			unsigned int nbits);
> -extern void __bitmap_shift_right(unsigned long *dst, const unsigned long *src,
> -				unsigned int shift, unsigned int nbits);
> -extern void __bitmap_shift_left(unsigned long *dst, const unsigned long *src,
> -				unsigned int shift, unsigned int nbits);
> -extern void bitmap_cut(unsigned long *dst, const unsigned long *src,
> -		       unsigned int first, unsigned int cut,
> -		       unsigned int nbits);
> -extern int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
> +int __bitmap_equal(const unsigned long *bitmap1,
> +		   const unsigned long *bitmap2, unsigned int nbits);

Logically better to have

int __bitmap_equal(const unsigned long *bitmap1, const unsigned long *bitmap2,
		   unsigned int nbits);

> +bool __pure __bitmap_or_equal(const unsigned long *src1,
> +			      const unsigned long *src2,
> +			      const unsigned long *src3,
> +			      unsigned int nbits);
> +void __bitmap_complement(unsigned long *dst, const unsigned long *src,
> +			 unsigned int nbits);
> +void __bitmap_shift_right(unsigned long *dst, const unsigned long *src,
> +			  unsigned int shift, unsigned int nbits);
> +void __bitmap_shift_left(unsigned long *dst, const unsigned long *src,
> +			 unsigned int shift, unsigned int nbits);
> +void bitmap_cut(unsigned long *dst, const unsigned long *src,
> +		unsigned int first, unsigned int cut, unsigned int nbits);
> +int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
> +		 const unsigned long *bitmap2, unsigned int nbits);
> +void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
> +		 const unsigned long *bitmap2, unsigned int nbits);
> +void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
> +		  const unsigned long *bitmap2, unsigned int nbits);
> +int __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
> +		    const unsigned long *bitmap2, unsigned int nbits);
> +void __bitmap_replace(unsigned long *dst,
> +		      const unsigned long *old, const unsigned long *new,
> +		      const unsigned long *mask, unsigned int nbits);
> +int __bitmap_intersects(const unsigned long *bitmap1,
>  			const unsigned long *bitmap2, unsigned int nbits);
> -extern void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
> -			const unsigned long *bitmap2, unsigned int nbits);
> -extern void __bitmap_xor(unsigned long *dst, const unsigned long *bitmap1,
> -			const unsigned long *bitmap2, unsigned int nbits);
> -extern int __bitmap_andnot(unsigned long *dst, const unsigned long *bitmap1,
> -			const unsigned long *bitmap2, unsigned int nbits);
> -extern void __bitmap_replace(unsigned long *dst,
> -			const unsigned long *old, const unsigned long *new,
> -			const unsigned long *mask, unsigned int nbits);
> -extern int __bitmap_intersects(const unsigned long *bitmap1,
> -			const unsigned long *bitmap2, unsigned int nbits);
> -extern int __bitmap_subset(const unsigned long *bitmap1,
> -			const unsigned long *bitmap2, unsigned int nbits);
> -extern int __bitmap_weight(const unsigned long *bitmap, unsigned int nbits);
> -extern void __bitmap_set(unsigned long *map, unsigned int start, int len);
> -extern void __bitmap_clear(unsigned long *map, unsigned int start, int len);
> -
> -extern unsigned long bitmap_find_next_zero_area_off(unsigned long *map,
> -						    unsigned long size,
> -						    unsigned long start,
> -						    unsigned int nr,
> -						    unsigned long align_mask,
> -						    unsigned long align_offset);
> +int __bitmap_subset(const unsigned long *bitmap1,
> +		    const unsigned long *bitmap2, unsigned int nbits);
> +int __bitmap_weight(const unsigned long *bitmap, unsigned int nbits);
> +void __bitmap_set(unsigned long *map, unsigned int start, int len);
> +void __bitmap_clear(unsigned long *map, unsigned int start, int len);
> +
> +unsigned long bitmap_find_next_zero_area_off(unsigned long *map,
> +					     unsigned long size,
> +					     unsigned long start,
> +					     unsigned int nr,
> +					     unsigned long align_mask,
> +					     unsigned long align_offset);
>  
>  /**
>   * bitmap_find_next_zero_area - find a contiguous aligned zero area
> @@ -190,33 +189,33 @@ bitmap_find_next_zero_area(unsigned long *map,
>  					      align_mask, 0);
>  }
>  
> -extern int bitmap_parse(const char *buf, unsigned int buflen,
> +int bitmap_parse(const char *buf, unsigned int buflen,
>  			unsigned long *dst, int nbits);

Can be

int bitmap_parse(const char *buf, unsigned int buflen, unsigned long *dst,
		 int nbits);

And I wonder why nbits here is signed.

> -extern int bitmap_parse_user(const char __user *ubuf, unsigned int ulen,
> +int bitmap_parse_user(const char __user *ubuf, unsigned int ulen,
>  			unsigned long *dst, int nbits);

Ditto.

> -extern int bitmap_parselist(const char *buf, unsigned long *maskp,

> +int bitmap_parselist(const char *buf, unsigned long *maskp,
>  			int nmaskbits);

Now can be one line.

> -extern int bitmap_parselist_user(const char __user *ubuf, unsigned int ulen,
> +int bitmap_parselist_user(const char __user *ubuf, unsigned int ulen,
>  			unsigned long *dst, int nbits);
> -extern void bitmap_remap(unsigned long *dst, const unsigned long *src,
> +void bitmap_remap(unsigned long *dst, const unsigned long *src,
>  		const unsigned long *old, const unsigned long *new, unsigned int nbits);
> -extern int bitmap_bitremap(int oldbit,

> +int bitmap_bitremap(int oldbit,
>  		const unsigned long *old, const unsigned long *new, int bits);

More logical

int bitmap_bitremap(int oldbit, const unsigned long *old,
		    const unsigned long *new, int bits);

Or even

int bitmap_bitremap(int oldbit, const unsigned long *old, const unsigned long *new,
		    int bits);

> -extern void bitmap_onto(unsigned long *dst, const unsigned long *orig,
> +void bitmap_onto(unsigned long *dst, const unsigned long *orig,
>  		const unsigned long *relmap, unsigned int bits);
> -extern void bitmap_fold(unsigned long *dst, const unsigned long *orig,
> +void bitmap_fold(unsigned long *dst, const unsigned long *orig,
>  		unsigned int sz, unsigned int nbits);
> -extern int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, int order);
> -extern void bitmap_release_region(unsigned long *bitmap, unsigned int pos, int order);
> -extern int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos, int order);
> +int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, int order);
> +void bitmap_release_region(unsigned long *bitmap, unsigned int pos, int order);
> +int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos, int order);
>  
>  #ifdef __BIG_ENDIAN
> -extern void bitmap_copy_le(unsigned long *dst, const unsigned long *src, unsigned int nbits);
> +void bitmap_copy_le(unsigned long *dst, const unsigned long *src, unsigned int nbits);
>  #else
>  #define bitmap_copy_le bitmap_copy
>  #endif
> -extern unsigned int bitmap_ord_to_pos(const unsigned long *bitmap, unsigned int ord, unsigned int nbits);
> -extern int bitmap_print_to_pagebuf(bool list, char *buf,
> +unsigned int bitmap_ord_to_pos(const unsigned long *bitmap, unsigned int ord, unsigned int nbits);
> +int bitmap_print_to_pagebuf(bool list, char *buf,
>  				   const unsigned long *maskp, int nmaskbits);
>  
>  #define BITMAP_FIRST_WORD_MASK(start) (~0UL << ((start) & (BITS_PER_LONG - 1)))
> @@ -265,9 +264,9 @@ static inline void bitmap_copy_clear_tail(unsigned long *dst,
>   * therefore conversion is not needed when copying data from/to arrays of u32.
>   */
>  #if BITS_PER_LONG == 64
> -extern void bitmap_from_arr32(unsigned long *bitmap, const u32 *buf,
> +void bitmap_from_arr32(unsigned long *bitmap, const u32 *buf,
>  							unsigned int nbits);

One line?

> -extern void bitmap_to_arr32(u32 *buf, const unsigned long *bitmap,
> +void bitmap_to_arr32(u32 *buf, const unsigned long *bitmap,
>  							unsigned int nbits);

Ditto.

>  #else
>  #define bitmap_from_arr32(bitmap, buf, nbits)			\
> -- 
> 2.29.1
> 

-- 
With Best Regards,
Andy Shevchenko


