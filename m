Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5C2278385
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 11:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbgIYJEg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 05:04:36 -0400
Received: from mga17.intel.com ([192.55.52.151]:25042 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727044AbgIYJEg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Sep 2020 05:04:36 -0400
IronPort-SDR: Ko77/7VWl8Ge3ylZi6XnwDKcAWB0di8P7OJJ6H5/zFu2Pu/wxf9nSEap53Pf+dwyJR82UwL9ZG
 J3S29NE18U4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="141505289"
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; 
   d="scan'208";a="141505289"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 02:04:35 -0700
IronPort-SDR: Vwpendosfa5CB6S4bTUR6thPwO7n+FsFKeZMzYqAfVM5NajaY68GBcjeXF/mSK1y6WBh0R74uS
 ZdXltp1PDwcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; 
   d="scan'208";a="339425098"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 25 Sep 2020 02:04:32 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kLjeV-001sYF-KH; Fri, 25 Sep 2020 12:04:27 +0300
Date:   Fri, 25 Sep 2020 12:04:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 0/9] gpio: mockup: refactoring + documentation
Message-ID: <20200925090427.GA3956970@smile.fi.intel.com>
References: <20200924113842.11670-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924113842.11670-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 01:38:33PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> These patches were part of the bigger overhaul of gpio-mockup but since
> the initial idea was dropped in favor of using configfs + sysfs in the
> future I thought I'd resent just the refactoring of the existing code
> + documentation patches. I think it's good to apply them since we don't
> really know when the new interface will be ready (configfs needs a new
> functionality - commitable items - to support mockup chip instantiation).

For non-commented by me or others:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

> Bartosz Golaszewski (9):
>   lib: string_helpers: provide kfree_strarray()
>   Documentation: gpio: add documentation for gpio-mockup
>   gpio: mockup: drop unneeded includes
>   gpio: mockup: use KBUILD_MODNAME
>   gpio: mockup: use pr_fmt()
>   gpio: mockup: remove unneeded return statement
>   gpio: mockup: pass the chip label as device property
>   gpio: mockup: use the generic 'gpio-line-names' property
>   gpio: mockup: refactor the module init function
> 
>  .../admin-guide/gpio/gpio-mockup.rst          |  50 ++++++
>  drivers/gpio/gpio-mockup.c                    | 154 +++++++++---------
>  include/linux/string_helpers.h                |   2 +
>  lib/string_helpers.c                          |  22 +++
>  4 files changed, 152 insertions(+), 76 deletions(-)
>  create mode 100644 Documentation/admin-guide/gpio/gpio-mockup.rst
> 
> -- 
> 2.26.1
> 

-- 
With Best Regards,
Andy Shevchenko


