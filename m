Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6723E3BE969
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jul 2021 16:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbhGGOLk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jul 2021 10:11:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:36218 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231472AbhGGOLj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Jul 2021 10:11:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="231049368"
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; 
   d="scan'208";a="231049368"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 07:08:59 -0700
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; 
   d="scan'208";a="427950393"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 07:08:57 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1m18EO-009pXG-5J; Wed, 07 Jul 2021 17:08:52 +0300
Date:   Wed, 7 Jul 2021 17:08:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Alexandru Ardelean <aardelean@deviqon.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org,
        sathyanarayanan.kuppuswamy@linux.intel.com, andy@kernel.org
Subject: Re: [PATCH] gpio: wcove: remove platform_set_drvdata() + cleanup
 probe
Message-ID: <YOW1dKIpXa1GXyXh@smile.fi.intel.com>
References: <20210707135226.191988-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707135226.191988-1-aardelean@deviqon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 07, 2021 at 04:52:26PM +0300, Alexandru Ardelean wrote:
> The platform_set_drvdata() call is only useful if we need to retrieve back
> the private information.
> Since the driver doesn't do that, it's not useful to have it.

This is fine.

> This change also changes the probe order a bit, moving the
> devm_gpiochip_add_data() as the last call. This means that when the
> gpiochip is registered [and available to consumers], it should be
> initialized.
> 
> It's still possible that the devm_gpiochip_add_data() call could fail,
> leaving the chip in a partially initialized state, but that was possible
> even before this change; it was just some other partially initialized
> state.

...

>  	/* Enable GPIO0 interrupts */

^^^^^

> +	return devm_gpiochip_add_data(dev, &wg->chip, wg);

This is dangerous change. How did you test it?

The handler now can be called before chip and actual handling code is
registered. It means at least two possible (bad) scenarios:
 1) the handler may dereference dangling or NULL pointer;
 2) the IRQ may be level interrupt and we may got 100000 IRQs and
    IRQ core will disable it leaving device completely unfunctional.

-- 
With Best Regards,
Andy Shevchenko


