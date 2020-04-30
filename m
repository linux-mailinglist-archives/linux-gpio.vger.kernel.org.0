Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28A51C02B8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2020 18:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgD3QjC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Apr 2020 12:39:02 -0400
Received: from mga12.intel.com ([192.55.52.136]:30305 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgD3QjC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Apr 2020 12:39:02 -0400
IronPort-SDR: s1/X7CvdGxPyXDk8DbROCbtkFZQsR7tP9i+JAxhlmxfOtjuTX36Rqu8Iau7ay4ufZ+oaGtZa18
 yguDMghOXyXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 09:38:59 -0700
IronPort-SDR: ME5Ydnoy+OAr2lFUJblXA0A6ioZNOJkRmsQr7GxyMwPdnz/fSx/zy5+Unt5y3JubqY9W4wfgY3
 OHFKiMXFCseg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; 
   d="scan'208";a="261836945"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 30 Apr 2020 09:38:52 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jUCD9-003x70-2a; Thu, 30 Apr 2020 19:38:55 +0300
Date:   Thu, 30 Apr 2020 19:38:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     akpm@linux-foundation.org, vilhelm.gray@gmail.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <20200430163855.GU185537@smile.fi.intel.com>
References: <cover.1588112714.git.syednwaris@gmail.com>
 <80745504d15c87aa1da0d4be3c16d1279f48615b.1588112716.git.syednwaris@gmail.com>
 <20200429102114.GF185537@smile.fi.intel.com>
 <20200430161514.GA7107@syed>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430161514.GA7107@syed>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 30, 2020 at 09:45:14PM +0530, Syed Nayyar Waris wrote:
> On Wed, Apr 29, 2020 at 01:21:14PM +0300, Andy Shevchenko wrote:
> > On Wed, Apr 29, 2020 at 04:39:47AM +0530, Syed Nayyar Waris wrote:

...

> > > +	const unsigned long state_size = BITS_PER_TYPE(*state);
> > 
> > This '*state' is unneeded complication, use BITS_PER_U32.
> > 
> > > +#define TOTAL_BITS BITS_PER_TYPE(chip->gpio_state)
> > 
> > This macro makes code uglier, besides the fact of absence of #undef.
> > And also see above.
> 
> Thank you for your review comments. Just want to clarify, you want
>  a new macro to be created - 'BITS_PER_U32' ?

It's already there (read bits.h).

> Also, don't you think that with BITS_PER_TYPE(), in case later the type
> of 'state' changes, it will be reflected in this code without any code
> change?

If it changes the bits per type will be least issues there. The rationale
behind is to have code readable. In proposed change it is not.

> Let me know if I have misunderstood something.
> 
> > 
> > > +	DECLARE_BITMAP(old, TOTAL_BITS);
> > > +	DECLARE_BITMAP(new, TOTAL_BITS);
> > > +	DECLARE_BITMAP(changed, TOTAL_BITS);

-- 
With Best Regards,
Andy Shevchenko


