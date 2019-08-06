Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBB4A830EE
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 13:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfHFLr2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 07:47:28 -0400
Received: from mga11.intel.com ([192.55.52.93]:34018 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726076AbfHFLr1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Aug 2019 07:47:27 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Aug 2019 04:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; 
   d="scan'208";a="192645121"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 06 Aug 2019 04:47:25 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 06 Aug 2019 14:47:24 +0300
Date:   Tue, 6 Aug 2019 14:47:24 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Allow to request locked pins
Message-ID: <20190806114724.GU2548@lahna.fi.intel.com>
References: <20190726200830.52728-1-andriy.shevchenko@linux.intel.com>
 <20190806110126.GR2548@lahna.fi.intel.com>
 <20190806114517.GT23480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806114517.GT23480@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 06, 2019 at 02:45:17PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 06, 2019 at 02:01:26PM +0300, Mika Westerberg wrote:
> > On Fri, Jul 26, 2019 at 11:08:30PM +0300, Andy Shevchenko wrote:
> > > Some firmwares would like to protect pins from being modified by OS
> > > and at the same time provide them to OS as a resource. So, the driver
> > > in such circumstances may request pin and may not change its state.
> > 
> > This is definitely good idea.
> 
> Thanks for review, my answers below.
> 
> > >  	 * the pad is considered unlocked. Any other case means that it is
> > >  	 * either fully or partially locked and we don't touch it.
> > 
> > I think you should update the above comment as well.
> 
> Will do for v2.
> 
> > >  	raw_spin_lock_irqsave(&pctrl->lock, flags);
> > >  
> > > -	if (!intel_pad_usable(pctrl, pin)) {
> > > +	if (!intel_pad_owned_by_host(pctrl, pin)) {
> > >  		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > >  		return -EBUSY;
> > >  	}
> > >  
> > > +	if (!intel_pad_is_unlocked(pctrl, pin)) {
> > > +		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> > > +		return 0;
> > 
> > Hmm, if I'm reading this right it still does not allow requesting locked
> > pins. What I'm missing here?
> 
> We do not return an error code here, so pin is left requested but pad
> configuration register untouched.

Indeed, now it is clear. Thanks for explaining :)
