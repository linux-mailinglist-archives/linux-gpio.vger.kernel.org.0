Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62941F1BAF
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 17:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732276AbfKFQwP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 11:52:15 -0500
Received: from mga05.intel.com ([192.55.52.43]:20184 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727824AbfKFQwP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 11:52:15 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 08:52:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; 
   d="scan'208";a="377108550"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 06 Nov 2019 08:52:12 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iSOXT-0006Hk-Qd; Wed, 06 Nov 2019 18:52:11 +0200
Date:   Wed, 6 Nov 2019 18:52:11 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 4/7] gpio: merrifield: Add GPIO <-> pin mapping ranges
 via callback
Message-ID: <20191106165211.GP32742@smile.fi.intel.com>
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
 <20191105203557.78562-5-andriy.shevchenko@linux.intel.com>
 <20191106135436.GR2552@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106135436.GR2552@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 06, 2019 at 03:54:36PM +0200, Mika Westerberg wrote:
> On Tue, Nov 05, 2019 at 10:35:54PM +0200, Andy Shevchenko wrote:
> > When IRQ chip is instantiated via GPIO library flow, the few functions,
> > in particular the ACPI event registration mechanism, on some of ACPI based
> > platforms expect that the pin ranges are initialized to that point.
> > 
> > Add GPIO <-> pin mapping ranges via callback in the GPIO library flow.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thanks.

> > +		retval = gpiochip_add_pin_range(&priv->chip,
> > +						pinctrl_dev_name,
> > +						range->gpio_base,
> > +						range->pin_base,
> > +						range->npins);
> 
> IMHO the below looks slightly better:
> 

> 		ret = gpiochip_add_pin_range(&priv->chip, pinctrl_dev_name,

I did this one...

> 					     range->gpio_base, range->pin_base,

...but this, since over going thru 80 limit.

> 					     range->npins);

-- 
With Best Regards,
Andy Shevchenko


