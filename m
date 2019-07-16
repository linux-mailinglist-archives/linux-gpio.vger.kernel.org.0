Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20DA26AD49
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 19:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbfGPRA7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 13:00:59 -0400
Received: from mga12.intel.com ([192.55.52.136]:32297 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725926AbfGPRA7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Jul 2019 13:00:59 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Jul 2019 10:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,499,1559545200"; 
   d="scan'208";a="169984904"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga003.jf.intel.com with ESMTP; 16 Jul 2019 10:00:57 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hnQoy-0002qv-EE; Tue, 16 Jul 2019 20:00:56 +0300
Date:   Tue, 16 Jul 2019 20:00:56 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: of: Break out OF-only code
Message-ID: <20190716170056.GQ9224@smile.fi.intel.com>
References: <20190716123918.26004-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716123918.26004-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 16, 2019 at 02:39:18PM +0200, Linus Walleij wrote:
> The core gpiolib should not contain any OF/device tree-only
> code. Try to break out the main part of it and push it down
> into the optional gpiolib-of.c part of the library.
> 
> Create a local gpiolib-of.h header and move stuff around a
> bit to get a clean cut.

Good one!
One question below, though.

>  drivers/gpio/gpiolib-of.c | 114 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib.c    | 113 +++----------------------------------
>  drivers/gpio/gpiolib.h    |  27 ---------
>  3 files changed, 122 insertions(+), 132 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 2bc0bcd7a410..00ed60304cd4 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -21,6 +21,34 @@
>  #include <linux/gpio/machine.h>
>  
>  #include "gpiolib.h"
> +#include "gpiolib-of.h"

Did I miss something? Where is the file?

-- 
With Best Regards,
Andy Shevchenko


