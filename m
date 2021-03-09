Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7B23329BC
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 16:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhCIPIJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 10:08:09 -0500
Received: from mga09.intel.com ([134.134.136.24]:14999 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231663AbhCIPHf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Mar 2021 10:07:35 -0500
IronPort-SDR: HTYDzeoDiUFX8/0F1wlnkYZdRuiz+Hl3Bot9JdJv6Wv0ckvgIy+LzF85OrE10QAFrIRm1BvZoK
 wih5F+XxvV2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9918"; a="188355402"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="188355402"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 07:07:34 -0800
IronPort-SDR: 26Yo36mi4f4gzu3MzlDuzncUBKTNl377bLSXAnYVbcTSmNxtEshFs24npcwdTyNiDj0qo3Ih/Z
 FRNtJuT180gQ==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; 
   d="scan'208";a="403263835"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2021 07:07:33 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJdxK-00B5iX-K4; Tue, 09 Mar 2021 17:07:30 +0200
Date:   Tue, 9 Mar 2021 17:07:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH 6/6] core: hide the GPIOD_API symbol
Message-ID: <YEePMkDDZA2Jxurr@smile.fi.intel.com>
References: <20210309132639.29069-1-brgl@bgdev.pl>
 <20210309132639.29069-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309132639.29069-7-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 09, 2021 at 02:26:39PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> GPIOD_API is unneccesarily polluting the user-facing headers. There's no
> advantage to having it in public files. Let's make them internal to the
> library. Upcoming modifications will also make GPIOD_BIT() redundant so
> we'll be able to remove all macros unrelated to the main functionality
> from gpiod.h.

> -libgpiodcxx_la_SOURCES = chip.cpp iter.cpp line.cpp line_bulk.cpp
> +libgpiodcxx_la_SOURCES = chip.cpp internal.h iter.cpp line.cpp line_bulk.cpp

Don't we have something like _HEADERS ?

...

> +#include "internal.hpp"

I forgot C++ approximately when I tried it first time :-)
But I'm confused between this and above file name. Do we have *.h and *.hpp
with the same name?

...

> -libgpiod_la_SOURCES = core.c helpers.c misc.c uapi/gpio.h
> +libgpiod_la_SOURCES = core.c helpers.c internal.h misc.c uapi/gpio.h

As above.

-- 
With Best Regards,
Andy Shevchenko


