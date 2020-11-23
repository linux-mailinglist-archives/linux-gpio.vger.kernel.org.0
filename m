Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51EC2C0BFC
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 14:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731825AbgKWNel (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 08:34:41 -0500
Received: from mga06.intel.com ([134.134.136.31]:17839 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732491AbgKWNek (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Nov 2020 08:34:40 -0500
IronPort-SDR: SJWVQd30A8Ly3+QlfF8WSze7M0dCLN30G0e7J2DOhwm4PQfunUDRYijbYE4i6zoPmsEIURiNJU
 u67Q9e7Z/+ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="233375200"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="233375200"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 05:34:37 -0800
IronPort-SDR: lDBoM4lugsyVQEIUrMaezDzm9IeNjqXN9hybpDy4AsmPZ+/rQo78mwSoEQDw1xescTgE3Aknwg
 1u+R1xcJ7/5Q==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="536099207"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 05:34:34 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1khC0G-009AMH-BF; Mon, 23 Nov 2020 15:35:36 +0200
Date:   Mon, 23 Nov 2020 15:35:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     caizhaopeng@uniontech.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Zhangyueqian <zhangyueqian@uniontech.com>,
        Zhangshuang <zhangshuang@uniontech.com>,
        Hualet Wang <wangyaohua@uniontech.com>,
        Zhanglei <zhanglei@uniontech.com>
Subject: Re: [PATCH 1/1] pinctrl: add IRQF_EARLY_RESUME flags with gpio irq
 for elan touchpad.
Message-ID: <20201123133536.GC4077@smile.fi.intel.com>
References: <20200424091201.568-1-caizhaopeng@uniontech.com>
 <20201112135221.GC4077@smile.fi.intel.com>
 <1e67c040-2aff-65bd-188a-bacf9a7fd7c4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e67c040-2aff-65bd-188a-bacf9a7fd7c4@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 23, 2020 at 01:46:50PM +0100, Hans de Goede wrote:
> On 11/12/20 2:52 PM, Andy Shevchenko wrote:
> > 
> > +Cc: Hans.
> > 
> > I can't speak for AMD, but I think it may be useful for Intel pin control.
> > However, I didn't check what may be the side effects of this change and neither
> > contributor answered to my comments...
> 
> AFAICT setting IRQF_EARLY_RESUME causes it to not be resumed during
> normal IRQ resuming, but earlier during the syscore_resume() call.
> 
> There are 2 problems with this:
> 
> 1. When using S3 suspend syscore_resume() runs before any device
> suspend handlers, so any state restoring which the GPIO controller's
> resume handler is doing has not been done yet. While esp. after
> S3 suspend the restoring may be important (s2idle suspend should
> not touch the GPIO registers contents).
> 
> 2. When using S2idle suspend syscore_resume() *never* runs, and
> IRQs marked with IRQF_EARLY_RESUME are skipped during the normal
> IRQ resume phase, so these IRQs will never be resumed.
> 
> Also IRQF_EARLY_RESUME is used almost no where:

Yes, I also noticed this.

> [hans@x1 linux]$ ack -l IRQF_EARLY_RESUME drivers
> drivers/xen/events/events_base.c
> drivers/rtc/rtc-sc27xx.c
> drivers/mfd/twl4030-irq.c
> 
> Which is probably why we have not yet hit the s2idle issue with it.
> 
> So this all in all seems like a bad idea, and we need to better root
> cause the issue with these Elan touchpads and fix the actual issue.

Thanks! That is useful to know.

> > So, just heads up.
> > 
> > On Fri, Apr 24, 2020 at 05:12:01PM +0800, caizhaopeng@uniontech.com wrote:
> >> From: Caicai <caizhaopeng@uniontech.com>
> >>
> >> I had tested two Notebook machines, the Intel i5(or amd ryzen)
> >> with elan touchpad, and there's a probability that the touchpad
> >> won't work after going to the S3/S4 to wake up, that it would
> >> appear no more than 15 times. I found that there's no interrupt
> >> to check for /proc/interrupt. It was found that the gpio
> >> interrupt of i2c was also not on top. By adding the gpio
> >> interrupt flags with IRQF_EARLY_RESUME, now the touchpad tested
> >> 200 + times works well.

-- 
With Best Regards,
Andy Shevchenko


