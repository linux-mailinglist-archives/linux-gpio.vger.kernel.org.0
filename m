Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCD163FB95
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Dec 2022 00:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiLAXFn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Dec 2022 18:05:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiLAXFl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Dec 2022 18:05:41 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98D6BD0ED
        for <linux-gpio@vger.kernel.org>; Thu,  1 Dec 2022 15:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669935940; x=1701471940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pKqMFYKm347d3DLEnaKOE/ZvW6OAhM+mRrzFRusI04Y=;
  b=Fuv6cHZyNFI5Wy4wuLnlphNax6+U6f0SKR1ZddNJEhF6mSMhki/7LR0o
   hwmtbzZZsTD/iEqTaskQa8d8XILyLXN7SYZwG2EF7bXeR7iZ+1wKw8aVt
   ecUx8AMxIQVNs5KbFk6aSzJAuJyNle1VM+wkOnPfM9aGCoa+mTHGJYBYP
   1rSMR7KdXI8O/tgTsp8Id8tWniJ8m79w78KC9CxdbDRJBoBVU527hRfWF
   AG6bhLje7UxeVTXlRk3Jfz7SK9dNm38sRPNFSDF0I2smXas/HM3lBw4uE
   ar9zzHGMzAU9jmwNqB/eZMf/vGoAGeEM8RKwNOeqonMrmdiUHV9CJRd9U
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="314522909"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="314522909"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2022 15:05:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="622478883"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="622478883"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 01 Dec 2022 15:05:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p0sbz-003752-2E;
        Fri, 02 Dec 2022 01:04:59 +0200
Date:   Fri, 2 Dec 2022 01:04:59 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org, fugang.duan@linaro.org
Subject: Re: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and
 config resources
Message-ID: <Y4kzG3K1LlC5ZcQi@smile.fi.intel.com>
References: <20221130164027.682898-1-niyas.sait@linaro.org>
 <20221130164027.682898-2-niyas.sait@linaro.org>
 <Y4fE6CPLHKPdjt9y@smile.fi.intel.com>
 <a23d0da6-6f80-a7d5-a0fb-a10e1a408129@linaro.org>
 <Y4fnoOKngSLW7dfb@smile.fi.intel.com>
 <a033178f-89f8-1843-ee02-321da8c2ca90@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a033178f-89f8-1843-ee02-321da8c2ca90@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 01, 2022 at 09:27:07AM +0000, Niyas Sait wrote:
> >>>> +++ b/Documentation/driver-api/pin-control-acpi.rst
> >>>
> >>> We have Documentation/firmware-guide/acpi/, but I'm not sure
> >>> which one suits better for this.
> >>
> >> I started with firmware-guide but then moved to driver-api as I wanted to
> >> cover driver related bits as well. Let me know if it is better at
> >> firmware-guide.
> >
> > My point is that I don't know. If it's more about ACPI tables and
> properties
> > there, it's related to firmware-guide, if it's about Linux kernel pin
> control
> > subsystem (programming, etc) it's better to have it under its own
> documentation
> > subfolder.
> 
> In that case, we probably should also move existing
> Documentation/driver-api/pin-control.rst to the new subfolder ?

Maybe, I don't know. All depends on the (final) contents of the documentation
you would like to provide.

...

> > > > > +Pin control devices can add callbacks for following pinctrl_ops to handle ACPI
> > > > > +pin resources.
> > > > 
> > > > Why? What use case requires this?
> > > > ACPI specification is more stricter in this than DT if I understand correctly
> > > > the state of affairs.  So, can't we parse the tables in the same way for all?
> > > > 
> > > > ...
> > > > 
> > > > > +		case PINCTRL_ACPI_PIN_FUNCTION:
> > > > 
> > > > > +		case PINCTRL_ACPI_PIN_CONFIG:
> > > > 
> > > > These are definitely what we do not want to see in the individual drivers.
> > > > (I understand that it might be that some OEMs will screw up and we would
> > > >    need quirks, but not now)
> > > 
> > > Hm. Please correct me if I am wrong here. My understanding is that we need
> > > to do few mapping which only pin controller drivers can do such as ACPI
> > > function number to internal functional name or selector.
> > 
> > Not sure I understand the use case here. The PinFunction() selects the mode for
> > the pins in the list. But naming is hardware specific, indeed. And it seems
> > there is no name field for the PinFunction().
> > 
> > > I could define
> > > bindings to do those specific mappings rather than providing the current
> > > general mapping interface. Would that be better ?
> > 
> > But that mapping can be provided by the driver at the initialization stage or
> > generated automatically.
> > 
> > For the first we already have pin control APIs. For the second one I don't
> > understand why driver should be involved.
> > 
> Yes ACPI PinFunction() only contains a function number and it is hardware
> specific.
> 
> AFAIA,the only way that would work without extra mapping is if drivers could
> populate the pinctrl function tree with the index matching the function
> number from ACPI table. I wasn't sure if that would work in all cases. We
> can start with that if that would be good enough for now. Let me know if
> there are other existing APIs that could help.

That's why third (?) time I'm asking you to provide a design level
documentation of your approach to understand it better.

The pin control has provider-consumer idea behind. When a *consumer* device
is being probed, it tries to configure its pins based on the data collected
in the pin control device that *provides* the resources. At this point of
time the pin control subsystem parses tables (currently DT and board files)
for that. For the pin control device itself, the registration of it also
parses tables but for the *provider*.

Now, the pin control device driver (*provider*) may or may not have
(a subset of) the pin functions and pin groups hard coded in the driver.
This can be used by the pin control subsystem as well as data that comes
from the tables. The data from the tables, nevertheless, is not really
needs names of the functions, because it's not what is programmed into
HW registers. That's why when driver doesn't have that information, it's
fine to generate it.

Also note, that in ACPI all Pin*() descriptors are optional and we need
to cover all such cases, I already pointed out to my preliminary research,
which I have done 5 years ago, where I tried to understand how it should
be covered for the most used cases.

I think I stopped with my solution in particular due to the problems with
the power management interaction with pin control, i.e. string-based odd
states (4 of which are hard coded in the pin control core code).

-- 
With Best Regards,
Andy Shevchenko


