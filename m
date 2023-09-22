Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B387AB34D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Sep 2023 16:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbjIVOOc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Sep 2023 10:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234186AbjIVOO1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2023 10:14:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB3FCD8
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 07:14:16 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360216619"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="360216619"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750859290"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="750859290"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 07:14:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andy@kernel.org>)
        id 1qjgv4-0000000HCii-3bDE;
        Fri, 22 Sep 2023 17:14:10 +0300
Date:   Fri, 22 Sep 2023 17:14:10 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <ZQ2hMkRENs97zOr+@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-4-kabel@kernel.org>
 <ZQmbd211FzPjA97r@smile.fi.intel.com>
 <20230921204243.19c48136@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921204243.19c48136@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 21, 2023 at 08:42:43PM +0200, Marek Behún wrote:
> On Tue, 19 Sep 2023 16:00:39 +0300
> Andy Shevchenko <andy@kernel.org> wrote:

...

> > > +	mutex_lock(&mcu->lock);
> > > +
> > > +	if (ctl_mask)
> > > +		err = omnia_ctl_cmd_unlocked(mcu, CMD_GENERAL_CONTROL, ctl,
> > > +					     ctl_mask);  
> > 
> > > +	if (!err && ext_ctl_mask)
> > > +		err = omnia_ctl_cmd_unlocked(mcu, CMD_EXT_CONTROL, ext_ctl,
> > > +					     ext_ctl_mask);  
> > 
> > Can it be
> > 
> > 	if (err)
> > 		goto out_unlock;
> > 
> > 	if (_mask)
> > 		...
> > 
> > ?
> 
> Hi Andy,
> 
> so I am refactoring this to use guard(mutex), but now I have this:
> 
> 	guard(mutex, &mcu->lock);
> 
> 	if (ctl_mask) {
> 		err = ...;
> 		if (err)
> 			goto out_err;
> 	}
> 
> 	if (ext_ctl_mask) {
> 		err = ...;
> 		if (err)
> 			goto out_err;
> 	}
> 
> 	return;
> out_err:
> 	dev_err(dev, "Cannot set GPIOs: %d\n", err);
> 
> which clearly is not any better... or at least the original

...which rather means that the design of above is not so good, i.e.
why do you need the same message in the different situations?

>   if (!err && ext_ctl_mask)
> is better IMO.

I disagree.

> Compare with:
> 
> 	guard(mutex, &mcu->lock);
> 
> 	if (ctl_mask)
> 		err = ...;
> 
> 	if (!err && ext_ctl_mask)
> 		err = ...;
> 
> 	if (err)
> 		dev_err(dev, "Cannot set GPIOs: %d\n", err);
> 
> 
> Do you have a better suggestion?

Use different messages (if even needed) for different situations.

With cleanup.h in place you shouldn't supposed to have goto:s
(in simple cases like yours).

-- 
With Best Regards,
Andy Shevchenko


