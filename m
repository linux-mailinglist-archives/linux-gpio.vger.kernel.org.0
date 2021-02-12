Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588C831A30B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 17:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbhBLQns (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 11:43:48 -0500
Received: from mga09.intel.com ([134.134.136.24]:8334 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229674AbhBLQmz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Feb 2021 11:42:55 -0500
IronPort-SDR: /tMxmehfdHZ5ebAVnSh1O/PTYzXI9skL+tgMC+b9sBh+tfwbDMtGsUTpBk/ZLzXPBgbyA+Yj9v
 4+0xmIYsKlKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="182571478"
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; 
   d="scan'208";a="182571478"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 08:42:09 -0800
IronPort-SDR: EcxFHH/BHttIGhGD3tq9so/TUKuc48rvwPvtTVxe9iY+uTw2a1M6AGdkEwxUd3P60PgTb2qIFK
 br+GX8pXVa+w==
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; 
   d="scan'208";a="381504813"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 08:42:06 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lAbW6-004XZ9-TX; Fri, 12 Feb 2021 18:42:02 +0200
Date:   Fri, 12 Feb 2021 18:42:02 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Imre Deak <imre.deak@intel.com>
Subject: Re: Replace raw_spin_lock_irqsave with raw_spin_lock
Message-ID: <YCav2qVWsUKbrOK4@smile.fi.intel.com>
References: <YCauUncGVwYPfBfQ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCauUncGVwYPfBfQ@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 12, 2021 at 06:35:30PM +0200, Andy Shevchenko wrote:
> Hi, Mika!
> 
> There is an interesting discussion [1] going on about necessity of the
> _irqsave/_irqrestore variants of spin lock in the IRQ handler.
> 
> It appears that in our driver(s) we have also such variants of spin locks in
> use. Do you have any idea why is it so?

Okay, this is me, who did it in a copy'n'paste manner in the commit
e64fbfa51e8f ("pinctrl: intel: Protect IO in few call backs by lock").

> A bonus question, why do we use _NO_THREAD flag explicitly as per Thomas [2]
> this won't work well with RT kernels?

Okay, this part is explained in the commit 1a7d1cb81eb2 ("pinctrl: intel:
Prevent force threading of the interrupt handler").

> [1]: https://lore.kernel.org/linux-gpio/1612774577-55943-1-git-send-email-luojiaxing@huawei.com/T/#u
> [2]: https://lore.kernel.org/linux-i2c/87zh2s8buh.fsf@nanos.tec.linutronix.de/

-- 
With Best Regards,
Andy Shevchenko


