Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0245628B96B
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Oct 2020 16:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390734AbgJLOAX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Oct 2020 10:00:23 -0400
Received: from mga04.intel.com ([192.55.52.120]:59139 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390201AbgJLN77 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Oct 2020 09:59:59 -0400
IronPort-SDR: EzaL8ft27VfyYgqDKD10V4sA9apwrd8g442u3EdfcMTo0LvNkNH3qbcAAbwet47DEWuu6WaVHr
 loh6cYzlIjZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="163103608"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="163103608"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 06:59:57 -0700
IronPort-SDR: eCwynhWKRzxkwi3Pw+Zc4cbu5IU0H/Y7DTiXCZ4Cw5dTuCmXKasIOOWUQ37y2aV9ybWEl29e02
 mhbSkUCQ9Zrw==
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; 
   d="scan'208";a="317932492"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 06:59:56 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kRyNn-0053MB-4g; Mon, 12 Oct 2020 17:00:59 +0300
Date:   Mon, 12 Oct 2020 17:00:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: Switch to use
 compat_need_64bit_alignment_fixup() helper
Message-ID: <20201012140059.GY4077@smile.fi.intel.com>
References: <20201008134105.51387-1-andriy.shevchenko@linux.intel.com>
 <20201012130741.GA58711@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012130741.GA58711@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 12, 2020 at 09:07:41PM +0800, Kent Gibson wrote:
> On Thu, Oct 08, 2020 at 04:41:05PM +0300, Andy Shevchenko wrote:
> > The new compat_need_64bit_alignment_fixup() helper allows to avoid
> > ugly ifdeffery in IOCTL compatible code. Use it in GPIO cdev code.

> I'd re-arrange that checkin comment to
> 
> "Use the new compat_need_64bit_alignment_fixup() helper to avoid
> ugly ifdeffery in IOCTL compatibility code."

OK!

> but otherwise all good.
> 
> +1 on the deuglification, and it still works too.
> 
> Tested-by: Kent Gibson <warthog618@gmail.com>

Thanks.

> > Depends-on: 527c412519eb ("compat: add a compat_need_64bit_alignment_fixup() helper")

> > Depends-on: cc7886d25bca ("compat: lift compat_s64 and compat_u64 to <asm-generic/compat.h>")

I'll also drop this one, since former is dependent on latter.

-- 
With Best Regards,
Andy Shevchenko


