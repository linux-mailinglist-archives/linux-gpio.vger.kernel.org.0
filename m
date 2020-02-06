Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABD06154E9C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2020 23:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgBFWHd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Feb 2020 17:07:33 -0500
Received: from mga14.intel.com ([192.55.52.115]:64123 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727802AbgBFWHd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Feb 2020 17:07:33 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Feb 2020 14:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,411,1574150400"; 
   d="scan'208";a="279800666"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2020 14:07:31 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1izpJ6-0005n9-Qm; Fri, 07 Feb 2020 00:07:32 +0200
Date:   Fri, 7 Feb 2020 00:07:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] gpio: Avoid kernel.h inclusion where it's possible
Message-ID: <20200206220732.GF10400@smile.fi.intel.com>
References: <20200205134336.20197-1-andriy.shevchenko@linux.intel.com>
 <20200206214729.GA30344@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206214729.GA30344@bogus>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 06, 2020 at 02:47:29PM -0700, Rob Herring wrote:
> On Wed, Feb 05, 2020 at 03:43:36PM +0200, Andy Shevchenko wrote:
> > Inclusion of kernel.h increases the mess with the header dependencies.
> > Avoid kernel.h inclusion where it's possible.

> > Besides that, clean up a bit other inclusions inside GPIO subsystem headers.
> > It includes:
> >  - removal pin control bits (forward declaration and header) from linux/gpio.h
> >  - removal of.h from asm-generic/gpio.h
> >  - use of explicit headers in gpio/consumer.h
> >  - add FIXME note with regard to gpio.h inclusion in of_gpio,h

...

> >  #else	/* !CONFIG_GPIOLIB */
> >  
> > +#include <linux/kernel.h>
> > +
> 
> I don't really think moving the includes inside #ifdef's is an 
> improvment.

I also not a big fun, but for now it removes in most cases when
CONFIG_GPIOLIB=y. And this is already an improvement. Next step is to replace
it with newly created (when it will be created) header might_sleep.h.

> But I'll leave it to Linus.

-- 
With Best Regards,
Andy Shevchenko


