Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114711BD974
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 12:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgD2KVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 06:21:14 -0400
Received: from mga02.intel.com ([134.134.136.20]:51286 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgD2KVO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 06:21:14 -0400
IronPort-SDR: UQsTIgWKefsUMXqtPLXQxg6ouBAnKfC0T2foVfLRiD30WX95Ib0np7GaTcmizyElBwiCEyDIb7
 iFP1BcBj7tgg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 03:21:13 -0700
IronPort-SDR: ySQ0rVq4vj1Kw0NWsqMA+zUA61ak4m1l5gWDv1p/wODWBKx+zsg31IJqEqxh6l7ecsbszvc/KA
 dDhAkfJSz4uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,331,1583222400"; 
   d="scan'208";a="404999202"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 29 Apr 2020 03:21:11 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jTjq6-003hwH-5E; Wed, 29 Apr 2020 13:21:14 +0300
Date:   Wed, 29 Apr 2020 13:21:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     akpm@linux-foundation.org, vilhelm.gray@gmail.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <20200429102114.GF185537@smile.fi.intel.com>
References: <cover.1588112714.git.syednwaris@gmail.com>
 <80745504d15c87aa1da0d4be3c16d1279f48615b.1588112716.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80745504d15c87aa1da0d4be3c16d1279f48615b.1588112716.git.syednwaris@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 04:39:47AM +0530, Syed Nayyar Waris wrote:
> This patch reimplements the xgpio_set_multiple function in
> drivers/gpio/gpio-xilinx.c to use the new for_each_set_clump macro.
> Instead of looping for each bit in xgpio_set_multiple
> function, now we can check each channel at a time and save cycles.

> +	const unsigned long state_size = BITS_PER_TYPE(*state);

This '*state' is unneeded complication, use BITS_PER_U32.

> +#define TOTAL_BITS BITS_PER_TYPE(chip->gpio_state)

This macro makes code uglier, besides the fact of absence of #undef.
And also see above.

> +	DECLARE_BITMAP(old, TOTAL_BITS);
> +	DECLARE_BITMAP(new, TOTAL_BITS);
> +	DECLARE_BITMAP(changed, TOTAL_BITS);

-- 
With Best Regards,
Andy Shevchenko


