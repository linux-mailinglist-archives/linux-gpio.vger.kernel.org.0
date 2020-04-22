Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D621B42E2
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2020 13:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgDVLNq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Apr 2020 07:13:46 -0400
Received: from mga03.intel.com ([134.134.136.65]:25200 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726488AbgDVLNp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Apr 2020 07:13:45 -0400
IronPort-SDR: EqHTgZMgA3iUQiUcYA71iBiNdKMvVVXNgkQjV2SEBBImuJ/Uhgr/zIDZSZMmRAPVbW2mveuWa1
 12aHFdafdbCA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 04:13:44 -0700
IronPort-SDR: 6+3x3eWqCtKIwrUGy7T/KCqdLoadP4m0mqfu43m3PDEP5XFsDVNL+i1OA6mnyCAiEhZ9wC0XK9
 sB1SXHg57HGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; 
   d="scan'208";a="300892885"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2020 04:13:43 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jRDK6-002QjR-Q3; Wed, 22 Apr 2020 14:13:46 +0300
Date:   Wed, 22 Apr 2020 14:13:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/2] pinctrl: intel: Move npins closer to pin_base in
 struct intel_community
Message-ID: <20200422111346.GA185537@smile.fi.intel.com>
References: <20200421190049.44888-1-andriy.shevchenko@linux.intel.com>
 <20200421190049.44888-2-andriy.shevchenko@linux.intel.com>
 <20200422085056.GR2586@lahna.fi.intel.com>
 <20200422094526.GY185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422094526.GY185537@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 22, 2020 at 12:45:26PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 22, 2020 at 11:50:56AM +0300, Mika Westerberg wrote:
> > On Tue, Apr 21, 2020 at 10:00:49PM +0300, Andy Shevchenko wrote:
> > > It's common across the drivers to use the (pin_base, npins) pair to describe
> > > community characteristics. Thus, move them in the struct intel_community
> > > to be closer to each other.
> > > 
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  drivers/pinctrl/intel/pinctrl-intel.h | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
> > > index 058bf2b6d9f0e..bd653f2a07382 100644
> > > --- a/drivers/pinctrl/intel/pinctrl-intel.h
> > > +++ b/drivers/pinctrl/intel/pinctrl-intel.h
> > > @@ -94,12 +94,12 @@ enum {
> > >   * @ie_offset: Register offset of GPI_IE from @regs.
> > >   * @features: Additional features supported by the hardware
> > >   * @pin_base: Starting pin of pins in this community
> > > + * @npins: Number of pins in this community
> > >   * @gpp_size: Maximum number of pads in each group, such as GPI_IS, GPI_IE,
> > >   *            PADCFGLOCK, HOSTSW_OWN. Used when @gpps is %NULL.
> > >   * @gpp_num_padown_regs: Number of pad registers each pad group consumes at
> > >   *			 minimum. Use %0 if the number of registers can be
> > >   *			 determined by the size of the group.
> > > - * @npins: Number of pins in this community
> > >   * @gpps: Pad groups if the controller has variable size pad groups
> > >   * @ngpps: Number of pad groups in this community
> > >   * @pad_map: Optional non-linear mapping of the pads
> > > @@ -121,12 +121,13 @@ struct intel_community {
> > >  	unsigned int ie_offset;
> > >  	unsigned int features;
> > >  	unsigned int pin_base;
> > > +	size_t npins;
> > >  	unsigned int gpp_size;
> > >  	unsigned int gpp_num_padown_regs;
> > > -	size_t npins;
> > >  	const struct intel_padgroup *gpps;
> > >  	size_t ngpps;
> > >  	const unsigned int *pad_map;
> > > +
> > 
> > Unrelated whitespace change?
> 
> Not so. I can add justification to commit message.
> 
> > In any case,
> > 
> > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Thanks.


Both pushed to my review and testing queue, thanks!

Second one with slightly updated commit message to reflect blank line change.

-- 
With Best Regards,
Andy Shevchenko


