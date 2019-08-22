Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 127B298E5D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2019 10:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731774AbfHVIvJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Aug 2019 04:51:09 -0400
Received: from mga05.intel.com ([192.55.52.43]:4795 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730488AbfHVIvJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Aug 2019 04:51:09 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 01:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; 
   d="scan'208";a="203320074"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 01:51:07 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i0ioD-0006KF-AQ; Thu, 22 Aug 2019 11:51:05 +0300
Date:   Thu, 22 Aug 2019 11:51:05 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dave Hansen <dave.hansen@intel.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1] MAINTAINERS: Remove staled record for gpio-intel-mid.c
Message-ID: <20190822085105.GH30120@smile.fi.intel.com>
References: <20190822084252.61856-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822084252.61856-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 22, 2019 at 11:42:52AM +0300, Andy Shevchenko wrote:
> David Cohen seems left Intel few years back. Remove the staled record in
> MAINTAINERS data base. The file is anyway listed under my maintainership.

This is supposed to go via gpio-intel tree.

> 
> Reported-by: Dave Hansen <dave.hansen@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  MAINTAINERS | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 33e6b9e2da9e..3c8cc45c3cc7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8446,12 +8446,6 @@ F:	Documentation/x86/intel_txt.rst
>  F:	include/linux/tboot.h
>  F:	arch/x86/kernel/tboot.c
>  
> -INTEL-MID GPIO DRIVER
> -M:	David Cohen <david.a.cohen@linux.intel.com>
> -L:	linux-gpio@vger.kernel.org
> -S:	Maintained
> -F:	drivers/gpio/gpio-intel-mid.c
> -
>  INTERCONNECT API
>  M:	Georgi Djakov <georgi.djakov@linaro.org>
>  L:	linux-pm@vger.kernel.org
> -- 
> 2.23.0.rc1
> 

-- 
With Best Regards,
Andy Shevchenko


