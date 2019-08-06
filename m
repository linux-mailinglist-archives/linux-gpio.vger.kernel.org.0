Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2077B830EA
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 13:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfHFLpV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 07:45:21 -0400
Received: from mga14.intel.com ([192.55.52.115]:58542 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726036AbfHFLpV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Aug 2019 07:45:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Aug 2019 04:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; 
   d="scan'208";a="164958681"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga007.jf.intel.com with ESMTP; 06 Aug 2019 04:45:19 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1huxu1-0007PG-Nh; Tue, 06 Aug 2019 14:45:17 +0300
Date:   Tue, 6 Aug 2019 14:45:17 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Allow to request locked pins
Message-ID: <20190806114517.GT23480@smile.fi.intel.com>
References: <20190726200830.52728-1-andriy.shevchenko@linux.intel.com>
 <20190806110126.GR2548@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806110126.GR2548@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 06, 2019 at 02:01:26PM +0300, Mika Westerberg wrote:
> On Fri, Jul 26, 2019 at 11:08:30PM +0300, Andy Shevchenko wrote:
> > Some firmwares would like to protect pins from being modified by OS
> > and at the same time provide them to OS as a resource. So, the driver
> > in such circumstances may request pin and may not change its state.
> 
> This is definitely good idea.

Thanks for review, my answers below.

> >  	 * the pad is considered unlocked. Any other case means that it is
> >  	 * either fully or partially locked and we don't touch it.
> 
> I think you should update the above comment as well.

Will do for v2.

> >  	raw_spin_lock_irqsave(&pctrl->lock, flags);
> >  
> > -	if (!intel_pad_usable(pctrl, pin)) {
> > +	if (!intel_pad_owned_by_host(pctrl, pin)) {
> >  		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> >  		return -EBUSY;
> >  	}
> >  
> > +	if (!intel_pad_is_unlocked(pctrl, pin)) {
> > +		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > +		return 0;
> 
> Hmm, if I'm reading this right it still does not allow requesting locked
> pins. What I'm missing here?

We do not return an error code here, so pin is left requested but pad
configuration register untouched.

> > +	}
> > +
> >  	padcfg0 = intel_get_padcfg(pctrl, pin, PADCFG0);
> >  	intel_gpio_set_gpio_mode(padcfg0);

-- 
With Best Regards,
Andy Shevchenko


