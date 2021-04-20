Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53483655EC
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Apr 2021 12:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhDTKKz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Apr 2021 06:10:55 -0400
Received: from mga04.intel.com ([192.55.52.120]:24035 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231473AbhDTKKz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Apr 2021 06:10:55 -0400
IronPort-SDR: 3Bl+dZ9KPOLTXM6zF9x+8yDN/wRw6UjCLP6a5INHJn7YBTfDppsUcNqGMHk9pdklsgPGKa1AQU
 1VLgex0msjrQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="193357362"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="193357362"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 03:10:23 -0700
IronPort-SDR: brXzidotN5p9Cuw5GT/+6EGUxreE8R6aVzKz5tPw0OOL1/Uu053sGaMkKhd/c0cyuRb/6YQMJo
 bYF6QVa7KQqw==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="400949744"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 03:10:22 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lYnKm-005i9d-0h; Tue, 20 Apr 2021 13:10:20 +0300
Date:   Tue, 20 Apr 2021 13:10:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] pinctrl: core: Show pin numbers for the
 controllers with base = 0
Message-ID: <YH6ojEvp6m3g2Ihx@smile.fi.intel.com>
References: <20210415130356.15885-1-andriy.shevchenko@linux.intel.com>
 <20210420073218.GA2538877@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420073218.GA2538877@x1>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 20, 2021 at 12:32:18AM -0700, Drew Fustini wrote:
> On Thu, Apr 15, 2021 at 04:03:56PM +0300, Andy Shevchenko wrote:
> > The commit f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
> > enabled GPIO pin number and label in debugfs for pin controller. However,
> > it limited that feature to the chips where base is positive number. This,
> > in particular, excluded chips where base is 0 for the historical or backward
> > compatibility reasons. Refactor the code to include the latter as well.

...

> > -		chip = gpio_to_chip(gpio_num);
> > -		if (chip && chip->gpiodev && chip->gpiodev->base)
> > -			seq_printf(s, "%u:%s ", gpio_num -
> > -				chip->gpiodev->base, chip->label);
> > +		if (gpio_num >= 0)
> > +			chip = gpio_to_chip(gpio_num);
> > +		else
> > +			chip = NULL;
> > +		if (chip)
> > +			seq_printf(s, "%u:%s ", gpio_num - chip->gpiodev->base, chip->label);
> >  		else
> >  			seq_puts(s, "0:? ");

> Thank you, this makes sense to me. I had failed to consider what would
> happen when chip->gpiodev->base == 0.

If gpiodev->base == 0 it can happen only when
1) either base is 0 by the driver request
2) or it's a GPIO device which fits the (last) free slot in the number space

It can't be negative at all. So, it means whatever value is there it is always
valid.

> I have tested on the BeagleBone
> (AM3358) and the output works as expected.

Cool!

> /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# more pins
> registered pins: 142
> pin 0 (PIN0) 0:gpio-0-31 44e10800 00000027 pinctrl-single
> pin 1 (PIN1) 1:gpio-0-31 44e10804 00000027 pinctrl-single
> pin 2 (PIN2) 2:gpio-0-31 44e10808 00000027 pinctrl-single
> pin 3 (PIN3) 3:gpio-0-31 44e1080c 00000027 pinctrl-single
> pin 4 (PIN4) 4:gpio-0-31 44e10810 00000027 pinctrl-single
> pin 5 (PIN5) 5:gpio-0-31 44e10814 00000027 pinctrl-single
> pin 6 (PIN6) 6:gpio-0-31 44e10818 00000027 pinctrl-single
> pin 7 (PIN7) 7:gpio-0-31 44e1081c 00000027 pinctrl-single
> pin 8 (PIN8) 22:gpio-96-127 44e10820 00000027 pinctrl-single
> pin 9 (PIN9) 23:gpio-96-127 44e10824 00000037 pinctrl-single
> pin 10 (PIN10) 26:gpio-96-127 44e10828 00000037 pinctrl-single
> pin 11 (PIN11) 27:gpio-96-127 44e1082c 00000037 pinctrl-single
> pin 12 (PIN12) 12:gpio-0-31 44e10830 00000037 pinctrl-single
> pin 13 (PIN13) 13:gpio-0-31 44e10834 00000037 pinctrl-single
> pin 14 (PIN14) 14:gpio-0-31 44e10838 00000037 pinctrl-single
> pin 15 (PIN15) 15:gpio-0-31 44e1083c 00000037 pinctrl-single
> pin 16 (PIN16) 16:gpio-0-31 44e10840 00000027 pinctrl-single
> <snip>
> 
> Tested-by: Drew Fustini <drew@beagleboard.org>
> Reviewed-by: Drew Fustini <drew@beagleboard.org>

Thank you!

Linus, can it be applied now?

-- 
With Best Regards,
Andy Shevchenko


