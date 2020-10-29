Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8520429EA2C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 12:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgJ2LLo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 07:11:44 -0400
Received: from mga09.intel.com ([134.134.136.24]:48192 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbgJ2LLo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 07:11:44 -0400
IronPort-SDR: JY/B79WMgQTCj4fwSyyqT/39EsPG+LjPDO1az31FzQy7KSR9FOTiY7w2juajqAqsNsj863KamU
 OaJSwwHBMuMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="168544870"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="168544870"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 04:11:43 -0700
IronPort-SDR: LitQxgqvZHmverg19PlJPHPtKDZ6uX7YOEXryfFMzDO6ix98A74zoiyZsuXj5KCB7Or6K5k1oR
 p3nhKLi3JIPA==
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="469099146"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 04:11:42 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kY5rJ-001CNG-B0; Thu, 29 Oct 2020 13:12:45 +0200
Date:   Thu, 29 Oct 2020 13:12:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Subject: Re: [PATCH v1] pinctrl: intel: Add Intel Lakefield pin controller
 support
Message-ID: <20201029111245.GJ4077@smile.fi.intel.com>
References: <20201026192325.20813-1-andriy.shevchenko@linux.intel.com>
 <20201029080042.GL2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029080042.GL2495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2020 at 10:00:42AM +0200, Mika Westerberg wrote:
> On Mon, Oct 26, 2020 at 09:23:25PM +0200, Andy Shevchenko wrote:
> > This driver adds pinctrl/GPIO support for Intel Lakefield SoC. The
> > GPIO controller is based on the next generation GPIO hardware but still
> > compatible with the one supported by the Intel core pinctrl/GPIO driver.
> > 
> > Cc: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

Ricardo, there is still a chance to do modifications before I move this to our
for-next branch. Can you confirm it works for you?

-- 
With Best Regards,
Andy Shevchenko


