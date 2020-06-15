Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91BC31F95EF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 14:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgFOMCF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 08:02:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:52451 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729843AbgFOMCE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 08:02:04 -0400
IronPort-SDR: KOl7f9kaJvzIPsj0GBj0lXeNyuKROhlriEDs43xUFyynia90Z1rBg+nSOSHVxY7ORBJ7GKdOna
 9XvmxtMLvM0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 05:01:46 -0700
IronPort-SDR: 5klZWDE+G/MmrDaLF3q2QPIQL8M1F04bMv9ZzSKhT7dew2/m15+QhhR2JSLW8l+FJUy6Z2iKk+
 vRALCTo0L24g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="382524450"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jun 2020 05:01:45 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jknoC-00DZ3r-NC; Mon, 15 Jun 2020 15:01:48 +0300
Date:   Mon, 15 Jun 2020 15:01:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 08/13] pinctrl: intel: Introduce
 for_each_requested_gpio() macro
Message-ID: <20200615120148.GA2428291@smile.fi.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
 <20200612145006.9145-8-andriy.shevchenko@linux.intel.com>
 <20200615115927.GG247495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615115927.GG247495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 02:59:27PM +0300, Mika Westerberg wrote:
> On Fri, Jun 12, 2020 at 05:50:01PM +0300, Andy Shevchenko wrote:
> > Introduce for_each_requested_gpio() macro which helps to iterate
> > over requested GPIO in a range.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/pinctrl/intel/pinctrl-intel.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
> > index 4e17308d33e9..c1f312bc28eb 100644
> > --- a/drivers/pinctrl/intel/pinctrl-intel.h
> > +++ b/drivers/pinctrl/intel/pinctrl-intel.h
> > @@ -249,4 +249,8 @@ const struct dev_pm_ops _name = {					\
> >  				      intel_pinctrl_resume_noirq)	\
> >  }
> >  
> 
> kernel-doc would be good to have here.

Okay, actually I considered to have this in the gpio/driver.h or so.

> > +#define for_each_requested_gpio(chip, i, base, size)			\
> > +	for (i = 0; i < size; i++)					\
> > +		if (!gpiochip_is_requested(chip, base + i)) {} else
> > +
> >  #endif /* PINCTRL_INTEL_H */

-- 
With Best Regards,
Andy Shevchenko


