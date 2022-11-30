Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2FE63E587
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 00:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiK3Xdr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 18:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbiK3Xd3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 18:33:29 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5139A102F
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 15:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669851045; x=1701387045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5diGDvt4vTGuD5Ep2MMzrroIapuCiqihj/c+qH4yXys=;
  b=kpP8e6ClWPmzWhgrPNu1VK45juBKw9f+dgp1SQxKfmw9EK3QgMkZVuB7
   ByR9ERCc+tSps/xShemlvsVPvj1KYgBq+7P/b2otoOMTEHRZ7fftmZfxe
   VPe6l8r4Opd/fN8myGL3puDmlqTM2cJxXmsyrVjTyHjqcCEPPixleH9Y6
   4gDn97fwyvnnl3C2nsYCS713Za1RzRdK5TmCaVj6bCrLErEvLn4GHbQHD
   dcUSDWTXYSQlEQRyWMdDTonPYAYF0Qjc8LW+4imT/T7veydC5FepB0gxj
   RLpt0vd7rfPAdeus2OqFntO2npZWcyoZO/Y97PZp8fCtwXe3E+xoBJsAS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="303139484"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="303139484"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 15:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="973294535"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="973294535"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2022 15:30:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p0WXI-002Xxh-1W;
        Thu, 01 Dec 2022 01:30:40 +0200
Date:   Thu, 1 Dec 2022 01:30:40 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org, fugang.duan@linaro.org
Subject: Re: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and
 config resources
Message-ID: <Y4fnoOKngSLW7dfb@smile.fi.intel.com>
References: <20221130164027.682898-1-niyas.sait@linaro.org>
 <20221130164027.682898-2-niyas.sait@linaro.org>
 <Y4fE6CPLHKPdjt9y@smile.fi.intel.com>
 <a23d0da6-6f80-a7d5-a0fb-a10e1a408129@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a23d0da6-6f80-a7d5-a0fb-a10e1a408129@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 09:33:40PM +0000, Niyas Sait wrote:

...

> >> +++ b/Documentation/driver-api/pin-control-acpi.rst
> >
> > We have Documentation/firmware-guide/acpi/, but I'm not sure
> > which one suits better for this.
> 
> I started with firmware-guide but then moved to driver-api as I wanted to
> cover driver related bits as well. Let me know if it is better at
> firmware-guide.

My point is that I don't know. If it's more about ACPI tables and properties
there, it's related to firmware-guide, if it's about Linux kernel pin control
subsystem (programming, etc) it's better to have it under its own documentation
subfolder.

...

> > > +			Name (RBUF, ResourceTemplate()
> > > +			{
> > > +				Memory32Fixed(ReadWrite, 0x4F800000, 0x20)
> > > +				Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) {0x55}
> > > +				PinFunction(Exclusive, PullDefault, 0x5, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
> > > +				// Configure 10k Pull up for I2C SDA/SCL pins
> > > +				PinConfig(Exclusive, 0x01, 10000, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
> > > +			})
> > > +			Return(RBUF)
> > 
> > In all examples the 2, 3 is used as a pin list for all kind of resources,
> > it's so confusing. Also take into account the difference between GPIO and
> > pin number spaces as I told before. Examples should cover that.
> > 
> > Also try to compile all ASL with latest ACPICA tools and fix warnings / errors.
> > 
> 
> I can try but I will have to repeat the same pin number few times to
> describe the pin function and config for different devices to demonstrate
> the pin muxing part.

Yes, I understand that. But it's better to show the difference in the pin list
where it may appear and otherwise point out that this all against the same pair
(or a single, or more) of pins and will be applied sequentially.

...

> > > +Pin control devices can add callbacks for following pinctrl_ops to handle ACPI
> > > +pin resources.
> > 
> > Why? What use case requires this?
> > ACPI specification is more stricter in this than DT if I understand correctly
> > the state of affairs.  So, can't we parse the tables in the same way for all?
> > 
> > ...
> > 
> > > +		case PINCTRL_ACPI_PIN_FUNCTION:
> > 
> > > +		case PINCTRL_ACPI_PIN_CONFIG:
> > 
> > These are definitely what we do not want to see in the individual drivers.
> > (I understand that it might be that some OEMs will screw up and we would
> >   need quirks, but not now)
> 
> Hm. Please correct me if I am wrong here. My understanding is that we need
> to do few mapping which only pin controller drivers can do such as ACPI
> function number to internal functional name or selector.

Not sure I understand the use case here. The PinFunction() selects the mode for
the pins in the list. But naming is hardware specific, indeed. And it seems
there is no name field for the PinFunction().

> I could define
> bindings to do those specific mappings rather than providing the current
> general mapping interface. Would that be better ?

But that mapping can be provided by the driver at the initialization stage or
generated automatically.

For the first we already have pin control APIs. For the second one I don't
understand why driver should be involved.

...

> > > +	status = acpi_get_handle(NULL, pinctrl_acpi, &handle);
> > > +	if (ACPI_FAILURE(status))
> > > +		return NULL;
> > > +
> > > +	adev = acpi_get_acpi_dev(handle);
> > > +	if (!adev)
> > > +		return NULL;
> > > +
> > > +	dev_name = acpi_dev_name(adev);
> > > +	if (!dev_name)

Resource leak is here (imbalanced reference counting).

> > > +		return NULL;
> > > +
> > > +	return get_pinctrl_dev_from_devname(dev_name);
> > 
> > Are they all resource leakage-free?
> 
> I hope so. Do you see something odd ?

I recommend to read documentation on the above APIs.

-- 
With Best Regards,
Andy Shevchenko


