Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B6135000D
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 14:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235321AbhCaMTE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 08:19:04 -0400
Received: from mga18.intel.com ([134.134.136.126]:27840 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235317AbhCaMTD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 08:19:03 -0400
IronPort-SDR: kwy2amS+hSM3ZNORopxylCFtyqZfgxokFgfXYrM6EW8ZUgZX4j+TktExE/XN95Q/v0wiH9L7fp
 X+YBnKNsY4jg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179530433"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="179530433"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 05:19:02 -0700
IronPort-SDR: 6EXU4U+SwW6oR+3zp/iIycc7OQ1NNJn/fel7IcUWVHUJqRel2ffxzp4Sgpz8iA9ZWQ46lN088n
 /dIjf3OnAhbQ==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="377243340"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 05:19:01 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lRZoI-00Hb39-9S; Wed, 31 Mar 2021 15:18:58 +0300
Date:   Wed, 31 Mar 2021 15:18:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux GPIO <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] intel-gpio for 5.13-1
Message-ID: <YGRosmEYNj7v3chV@smile.fi.intel.com>
References: <YGHhPlK5Ej4QywNH@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGHhPlK5Ej4QywNH@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 05:16:30PM +0300, Andy Shevchenko wrote:
> Hi Linux GPIO  maintainers,
> 
> So far collected stuff for Intel GPIO drivers (including aggregator clean up).
> No conflicts are expected.

Bart, please tell me if I need to redone this.

> Thanks,
> 
> With Best Regards,
> Andy Shevchenko
> 
> The following changes since commit b41ba2ec54a70908067034f139aa23d0dd2985ce:
> 
>   gpiolib: Read "gpio-line-names" from a firmware node (2021-03-08 11:59:17 +0100)
> 
> are available in the Git repository at:
> 
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.13-1
> 
> for you to fetch changes up to 6c46215d6b626cb0981f8332da506b69b98c4b49:
> 
>   gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events (2021-03-27 23:48:55 +0200)
> 
> ----------------------------------------------------------------
> intel-gpio for v5.13-1
> 
> * Implement event support (GPE) in Intel SCH GPIO driver
> * Clean up GPIO aggregator driver to use more of the generic code
> 
> The following is an automated git shortlog grouped by driver:
> 
> aggregator:
>  -  Replace custom get_arg() with a generic next_arg()
> 
> lib/cmdline:
>  -  Export next_arg() for being used in modules
> 
> sch:
>  -  Hook into ACPI GPE handler to catch GPIO edge events
>  -  Add edge event support
> 
> ----------------------------------------------------------------
> Andy Shevchenko (3):
>       lib/cmdline: Export next_arg() for being used in modules
>       gpio: aggregator: Replace custom get_arg() with a generic next_arg()
>       gpio: sch: Hook into ACPI GPE handler to catch GPIO edge events
> 
> Jan Kiszka (1):
>       gpio: sch: Add edge event support
> 
>  drivers/gpio/Kconfig           |   3 +-
>  drivers/gpio/gpio-aggregator.c |  39 ++------
>  drivers/gpio/gpio-sch.c        | 198 +++++++++++++++++++++++++++++++++++++++--
>  lib/cmdline.c                  |   1 +
>  4 files changed, 198 insertions(+), 43 deletions(-)
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
With Best Regards,
Andy Shevchenko


