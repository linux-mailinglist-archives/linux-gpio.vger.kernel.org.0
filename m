Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0022AF712
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 18:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgKKRAy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 12:00:54 -0500
Received: from mga04.intel.com ([192.55.52.120]:24782 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbgKKRAx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 12:00:53 -0500
IronPort-SDR: 6PEtqLXiIkV+8JbUxF3UCMSBRGnLcL8WU7lE+GjCP6mDjbRBHQMHVTfUApjZBQlt32VwOBTGwV
 j2GuYCxsdcqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="167593070"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="167593070"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 09:00:47 -0800
IronPort-SDR: 5yJf48ZVqs3qBTNtdzZevmzfGyr+1cyo2NqE3gNaGqwywBBQqeAYI6/QRIlIQOq0zCr6s+Hz71
 xoLgb7IGYORA==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="328167418"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 09:00:44 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kctVB-005xcz-MO; Wed, 11 Nov 2020 19:01:45 +0200
Date:   Wed, 11 Nov 2020 19:01:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 16/17] gpiolib: acpi: Use BIT() macro to increase
 readability
Message-ID: <20201111170145.GO4077@smile.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-17-andriy.shevchenko@linux.intel.com>
 <20201111155717.GL2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111155717.GL2495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 05:57:17PM +0200, Mika Westerberg wrote:
> On Mon, Nov 09, 2020 at 10:53:31PM +0200, Andy Shevchenko wrote:
> > We may use BIT() macro to increase readability in
> > acpi_gpio_adr_space_handler().
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/gpio/gpiolib-acpi.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> > index 31008b0aef77..b9c3140cbd6d 100644
> > --- a/drivers/gpio/gpiolib-acpi.c
> > +++ b/drivers/gpio/gpiolib-acpi.c
> > @@ -1097,8 +1097,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
> >  		mutex_unlock(&achip->conn_lock);
> >  
> >  		if (function == ACPI_WRITE)
> > -			gpiod_set_raw_value_cansleep(desc,
> > -						     !!((1 << i) & *value));
> > +			gpiod_set_raw_value_cansleep(desc, !!(*value & BIT(i)));
> 
> Nit: Here I would use a helper variable to make it (much) more readable.
> 
> Anyway,
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thank you for review of almost all patches in the series!

I will try to address your comments against temporary variable in other
patches, but my motivation is quite similar to yours here.


-- 
With Best Regards,
Andy Shevchenko


