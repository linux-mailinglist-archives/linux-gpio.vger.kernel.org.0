Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD33358A2B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 18:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbhDHQxK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 12:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbhDHQxK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Apr 2021 12:53:10 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66608C061760;
        Thu,  8 Apr 2021 09:52:57 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id y5so2873404qkl.9;
        Thu, 08 Apr 2021 09:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Peqg9+DN2xDTvABOSV5xd4jxeGrojR9AJ8MkT215+f8=;
        b=Av0kWGFRKustfWNyGATPKHlwJJNxZerOktWVJZcex6eUn6KJvEXoDhrgg5vmVzclOa
         om2btBkdBjUj5Jta+3Szk0J33+LQqYj5oIscDrVrHK5VxfdUAYN/I0MGuHSlVcfhUuFa
         kcon9cLCCG1VDIx4vVeQqG1OWIGR8Ottb2clg4XB9kv1VFwCNhDnYuaZL0ktGS7gVrBe
         CpbOH1SoGPn/APrNUKF1q14u7MQ5juQk9iD/dN+pwdLoFKlSG8MIAlM2R8x2Qd3eEFjD
         mbPJam+u6UDFCUdha22S/Bk2Dov9zv5nZQ2v8LKA0bSqVrnamGuPGsorP1P4VgW41tYA
         Y0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Peqg9+DN2xDTvABOSV5xd4jxeGrojR9AJ8MkT215+f8=;
        b=H3uBwbwSkZg9hsCG2TXKQlb/UE1r/o3NW1XsyNeCXVfm58tlptjyqhGCM7BEkPoD3i
         VBB3mJjIF4cqeB0hDliJ2PXSNGL2LXuswp/+kKYjR8if5PntUDxGLKp1WClZSGk5zLDm
         HG5z1IGpHFO4SBOGRY4w+TLEyoW+IXHGiEv3BofATX7XYteyITJFEXhdyC7+tLcR3KQ9
         v3VjxCTVb3+0JXYeN7RhFofTJYeMp+JtYxSIBMsbiEgY+lD0+AhQ8ctNEo+17nQb4PUK
         0J1J79EXrVl/21WxMmU92/NznNqPx97J4Bwf29G5eaa+Hrdx6ZjVjv6eede2XaS9hvcz
         wquQ==
X-Gm-Message-State: AOAM532kjR1uGePBbR0uYCHbtmhcHrsyrNs4yw2dhvjHnu+Tp+E6jwoh
        qTQXyHuCfxVEOx3cxapmoHA=
X-Google-Smtp-Source: ABdhPJxrxGlmXWR0qPQZrPJ3seGTzEpltbmaw7AEilMnmCNaLg7YMvIBQRnLkQyb/bXOKO/TMgmSoQ==
X-Received: by 2002:a05:620a:2095:: with SMTP id e21mr9454310qka.135.1617900776480;
        Thu, 08 Apr 2021 09:52:56 -0700 (PDT)
Received: from localhost ([73.19.182.124])
        by smtp.gmail.com with ESMTPSA id e3sm7506qtj.28.2021.04.08.09.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:52:55 -0700 (PDT)
Date:   Thu, 8 Apr 2021 09:52:54 -0700
From:   Yury Norov <yury.norov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        vilhelm.gray@gmail.com
Subject: Re: [PATCH v1 1/5] bitmap: Make bitmap_remap() and bitmap_bitremap()
 available to users
Message-ID: <20210408165254.GA1186882@yury-ThinkPad>
References: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
 <20210408145601.68651-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408145601.68651-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 08, 2021 at 05:55:57PM +0300, Andy Shevchenko wrote:
> Currently the bitmap_remap() and bitmap_bitremap() are available
> only for CONFIG_NUMA=y case, while some users may benefit out of it
> and being independent to NUMA code. Make them available to users
> by moving out of ifdeffery and exporting for modules.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  lib/bitmap.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/bitmap.c b/lib/bitmap.c
> index 74ceb02f45e3..7b6b2a67a6a6 100644
> --- a/lib/bitmap.c
> +++ b/lib/bitmap.c
> @@ -784,8 +784,6 @@ int bitmap_parse(const char *start, unsigned int buflen,
>  }
>  EXPORT_SYMBOL(bitmap_parse);
>  
> -
> -#ifdef CONFIG_NUMA
>  /**
>   * bitmap_pos_to_ord - find ordinal of set bit at given position in bitmap
>   *	@buf: pointer to a bitmap
> @@ -894,6 +892,7 @@ void bitmap_remap(unsigned long *dst, const unsigned long *src,
>  			set_bit(bitmap_ord_to_pos(new, n % w, nbits), dst);
>  	}
>  }
> +EXPORT_SYMBOL(bitmap_remap);
>  
>  /**
>   * bitmap_bitremap - Apply map defined by a pair of bitmaps to a single bit
> @@ -931,7 +930,9 @@ int bitmap_bitremap(int oldbit, const unsigned long *old,
>  	else
>  		return bitmap_ord_to_pos(new, n % w, bits);
>  }
> +EXPORT_SYMBOL(bitmap_bitremap);
>  
> +#ifdef CONFIG_NUMA
>  /**
>   * bitmap_onto - translate one bitmap relative to another
>   *	@dst: resulting translated bitmap
> -- 
> 2.30.2

Acked-by: Yury Norov <yury.norov@gmail.com>
