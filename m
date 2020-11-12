Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8DD2B071C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 14:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgKLN6R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 08:58:17 -0500
Received: from mga18.intel.com ([134.134.136.126]:45950 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727796AbgKLN6Q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 08:58:16 -0500
IronPort-SDR: n7UE1+LgsOfTbvHFAvyklBoPT9Ryj1+HfsAhaxRyoqSY+17UQdnwy5E2kzXK4bBjuklx05aysw
 9+MFKkqFcv9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="158088307"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; 
   d="scan'208";a="158088307"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 05:58:15 -0800
IronPort-SDR: ZlBoVtUt2of8WDpN8aCuBbDNC5av1g5DI+b/mnfit8C9iDLeqeCZds9PXIxvskXyCJ9AjRSTXl
 R/f8ieaEW1uQ==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; 
   d="scan'208";a="532173948"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 05:58:14 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kdD88-006DZ2-Fs; Thu, 12 Nov 2020 15:59:16 +0200
Date:   Thu, 12 Nov 2020 15:59:16 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: merrifield: Set default bias in case no
 particular value given
Message-ID: <20201112135916.GF4077@smile.fi.intel.com>
References: <20201111120605.50881-1-andriy.shevchenko@linux.intel.com>
 <20201112080650.GU2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112080650.GU2495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 10:06:50AM +0200, Mika Westerberg wrote:
> On Wed, Nov 11, 2020 at 02:06:05PM +0200, Andy Shevchenko wrote:
> > When GPIO library asks pin control to set the bias, it doesn't pass
> > any value of it and argument is considered boolean (and this is true
> > for ACPI GpioIo() / GpioInt() resources, by the way). Thus, individual
> > drivers must behave well, when they got the resistance value of 1 Ohm,
> > i.e. transforming it to sane default.
> > 
> > In case of Intel Merrifield pin control hardware the 20 kOhm sounds plausible
> > because it gives a good trade off between weakness and minimization of leakage
> > current (will be only 50 uA with the above choice).
> > 
> > Fixes: 4e80c8f50574 ("pinctrl: intel: Add Intel Merrifield pin controller support")
> > Depends-on: 2956b5d94a76 ("pinctrl / gpio: Introduce .set_config() callback for GPIO chips")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


