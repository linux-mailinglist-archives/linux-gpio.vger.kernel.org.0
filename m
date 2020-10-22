Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902FF295894
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 08:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440852AbgJVGvr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 02:51:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:41133 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409800AbgJVGvr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Oct 2020 02:51:47 -0400
IronPort-SDR: rCNSIOieEwkjkeoSnm6MtMbraraVqW3HrW7IHnC9S948BXqkrU0Tz+NFwh84Utjty6VIwd+qq9
 KoOmteAeTDMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="155268543"
X-IronPort-AV: E=Sophos;i="5.77,403,1596524400"; 
   d="scan'208";a="155268543"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 23:51:46 -0700
IronPort-SDR: q2ttoimC2NBnRjqwg1117ZZLJtHDgl8Ua1SYtbc/JZDs0tDn8IRxU1cgMBFLfwapzFsqsQs7jJ
 zdzujeksZ+Eg==
X-IronPort-AV: E=Sophos;i="5.77,403,1596524400"; 
   d="scan'208";a="533830745"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 23:51:44 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 22 Oct 2020 09:51:41 +0300
Date:   Thu, 22 Oct 2020 09:51:41 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Jamie McClymont <jamie@kwiius.com>
Subject: Re: [PATCH v1 1/3] gpiolib: acpi: Respect bias settings for
 GpioInt() resource
Message-ID: <20201022065141.GH2495@lahna.fi.intel.com>
References: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
 <20201021095854.GV2495@lahna.fi.intel.com>
 <20201021163844.GX4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021163844.GX4077@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2020 at 07:38:44PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2020 at 12:58:54PM +0300, Mika Westerberg wrote:
> > On Wed, Oct 14, 2020 at 04:31:52PM +0300, Andy Shevchenko wrote:
> > > In some cases the GpioInt() resource is coming with bias settings
> > > which may affect system functioning. Respect bias settings for
> > > GpioInt() resource by calling acpi_gpio_update_gpiod_*flags() API
> > > in acpi_dev_gpio_irq_get().
> > > 
> > > While at it, refactor to configure flags first and, only when succeeded,
> > > map the IRQ descriptor.
> 
> ...
> 
> > > -			irq = gpiod_to_irq(desc);
> > > -			if (irq < 0)
> > > -				return irq;
> > > +			acpi_gpio_update_gpiod_flags(&dflags, &info);
> > > +			acpi_gpio_update_gpiod_lookup_flags(&lflags, &info);
> > >  
> > >  			snprintf(label, sizeof(label), "GpioInt() %d", index);
> > > -			ret = gpiod_configure_flags(desc, label, lflags, info.flags);
> > > +			ret = gpiod_configure_flags(desc, label, lflags, dflags);
> > >  			if (ret < 0)
> > >  				return ret;
> > >  
> > > +			irq = gpiod_to_irq(desc);
> > > +			if (irq < 0)
> > > +				return irq;
> > 
> > Should the above be undone if the conversion here fails?
> 
> But wouldn't it be not good if we changed direction, for example, and then
> change it back? (IRQ requires input, which is safer, right?)
> 
> This makes me think what gpiod_to_irq() may do for physical state of the pin.
> On the brief search it seems there is no side effect on the pin with that
> function, so, perhaps the original order has that in mind to not shuffle with
> line if mapping can't be established. But if setting flags fail, we may got
> into the state which is not equal to the initial one, right?
> 
> So, in either case I see no good way to roll back the physical pin state
> changes. But I can return ordering of the calls in next version.
> 
> What do you think?

If there is no good way rolling back to the previous state then I think
this ordering is as good as the original, so up to you :-)
