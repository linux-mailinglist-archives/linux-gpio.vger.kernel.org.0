Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A78DD19AC2C
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2020 14:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732507AbgDAM44 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Apr 2020 08:56:56 -0400
Received: from mga03.intel.com ([134.134.136.65]:39845 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732480AbgDAM44 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Apr 2020 08:56:56 -0400
IronPort-SDR: bfcSHU1vzQ7xhbMHT6AfCqfTIQGrxwTVsrME2Uf9v5OCBjPhORgwuqK+KEA+7eozlDRqn9s0EG
 laBrOlmpCvmQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 05:56:56 -0700
IronPort-SDR: ftxhQkBZmSjT2LIv6efimltAkcOVUDhph/uMdJ6XzGDBiUepUtIOEiR8oh8UT29hfmOcBexmDF
 nXmLqI9SRBaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,331,1580803200"; 
   d="scan'208";a="395968497"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 01 Apr 2020 05:56:55 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jJcvR-00Eu9A-QF; Wed, 01 Apr 2020 15:56:57 +0300
Date:   Wed, 1 Apr 2020 15:56:57 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/4] pinctrl: intel: Introduce common flags for GPIO
 mapping scheme
Message-ID: <20200401125657.GT1922688@smile.fi.intel.com>
References: <20200331152547.34044-1-andriy.shevchenko@linux.intel.com>
 <20200401095142.GS2564@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401095142.GS2564@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 01, 2020 at 12:51:42PM +0300, Mika Westerberg wrote:
> On Tue, Mar 31, 2020 at 06:25:44PM +0300, Andy Shevchenko wrote:
> > Few drivers are using the same flag to tell Intel pin control core
> > how to interpret GPIO base.
> > 
> > Provide a generic flags so all drivers can use.

...

> > - * @gpio_base: Starting GPIO base of this group (%0 if matches with @base,
> > - *	       and %-1 if no GPIO mapping should be created)
> > + * @gpio_base: Starting GPIO base of this group

> > @@ -64,6 +63,8 @@ struct intel_padgroup {
> >  	unsigned int reg_num;
> >  	unsigned int base;
> >  	unsigned int size;
> > +#define INTEL_GPIO_BASE_MATCH	0	/* matches with @base */
> > +#define INTEL_GPIO_BASE_NOMAP	(-1)	/* no GPIO mapping should be created */
> 
> Maybe use enum and add kernel-doc there?
> 
> >  	int gpio_base;

Will do it in v2, thanks!

-- 
With Best Regards,
Andy Shevchenko


