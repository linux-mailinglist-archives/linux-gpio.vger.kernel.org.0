Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DEA2950E4
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 18:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502997AbgJUQho (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 12:37:44 -0400
Received: from mga03.intel.com ([134.134.136.65]:28541 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502960AbgJUQhn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 12:37:43 -0400
IronPort-SDR: CsSMGak4quBiSjkVjMYeUwezRlY8DolMxAgWWONSSijh8jP0RsKcAuGD5agBz1bIbv0JnIt5Jf
 u+xH4n++NNIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="167488551"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="167488551"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 09:37:43 -0700
IronPort-SDR: XNuNeUqJr9VgPNBtbevfZ8JNU7Ac7plkE9kLWnXyjpsLHjotrZ6o22WThwhbIzRXsfB4rfWEK8
 gTuIm9prKm/g==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="523950676"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 09:37:41 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kVH8O-00COnf-Cy; Wed, 21 Oct 2020 19:38:44 +0300
Date:   Wed, 21 Oct 2020 19:38:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Jamie McClymont <jamie@kwiius.com>
Subject: Re: [PATCH v1 1/3] gpiolib: acpi: Respect bias settings for
 GpioInt() resource
Message-ID: <20201021163844.GX4077@smile.fi.intel.com>
References: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
 <20201021095854.GV2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021095854.GV2495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2020 at 12:58:54PM +0300, Mika Westerberg wrote:
> On Wed, Oct 14, 2020 at 04:31:52PM +0300, Andy Shevchenko wrote:
> > In some cases the GpioInt() resource is coming with bias settings
> > which may affect system functioning. Respect bias settings for
> > GpioInt() resource by calling acpi_gpio_update_gpiod_*flags() API
> > in acpi_dev_gpio_irq_get().
> > 
> > While at it, refactor to configure flags first and, only when succeeded,
> > map the IRQ descriptor.

...

> > -			irq = gpiod_to_irq(desc);
> > -			if (irq < 0)
> > -				return irq;
> > +			acpi_gpio_update_gpiod_flags(&dflags, &info);
> > +			acpi_gpio_update_gpiod_lookup_flags(&lflags, &info);
> >  
> >  			snprintf(label, sizeof(label), "GpioInt() %d", index);
> > -			ret = gpiod_configure_flags(desc, label, lflags, info.flags);
> > +			ret = gpiod_configure_flags(desc, label, lflags, dflags);
> >  			if (ret < 0)
> >  				return ret;
> >  
> > +			irq = gpiod_to_irq(desc);
> > +			if (irq < 0)
> > +				return irq;
> 
> Should the above be undone if the conversion here fails?

But wouldn't it be not good if we changed direction, for example, and then
change it back? (IRQ requires input, which is safer, right?)

This makes me think what gpiod_to_irq() may do for physical state of the pin.
On the brief search it seems there is no side effect on the pin with that
function, so, perhaps the original order has that in mind to not shuffle with
line if mapping can't be established. But if setting flags fail, we may got
into the state which is not equal to the initial one, right?

So, in either case I see no good way to roll back the physical pin state
changes. But I can return ordering of the calls in next version.

What do you think?

> In any case looks good so,
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


