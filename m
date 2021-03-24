Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E5B347A9C
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 15:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236200AbhCXOXK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 10:23:10 -0400
Received: from mga18.intel.com ([134.134.136.126]:60473 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236180AbhCXOWt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Mar 2021 10:22:49 -0400
IronPort-SDR: OH1ARNGAGYmbAWQxwoGX2xQgNKbFgSEn2iulsJC4eACZcuaV970A/XXW/HwlnsKA0AxFbx8Lf/
 wtYjWPTgXGpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="178269164"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="178269164"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 07:22:49 -0700
IronPort-SDR: VwrKILIj/QZQwCX9DSJSCDYw53ud/1y/6178HuzK5RgnLGH3tp2RGzmj30o19mEzRgutOVgMQp
 I1vu/hV9te2A==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="391317293"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 07:22:47 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lP4PE-00FiD8-Q7; Wed, 24 Mar 2021 16:22:44 +0200
Date:   Wed, 24 Mar 2021 16:22:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc:     linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH RESEND] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFtLNLTrR9wTO41W@smile.fi.intel.com>
References: <20210324123118.58865-1-roger.pau@citrix.com>
 <YFs3XwOBRGAFyASY@smile.fi.intel.com>
 <YFtEw7qHQKE/4p8t@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFtEw7qHQKE/4p8t@Air-de-Roger>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 02:55:15PM +0100, Roger Pau Monné wrote:
> On Wed, Mar 24, 2021 at 02:58:07PM +0200, Andy Shevchenko wrote:
> > On Wed, Mar 24, 2021 at 01:31:18PM +0100, Roger Pau Monne wrote:

...

> What could be done is check whether reading REVID returns ~0 and exit
> at that point, if ~0 will never be a valid value returned by that
> register. I think that should be a separate patch however.

Sounds good to me.

> > Moreover, it seems you are bailing out and basically denying driver to load.
> > This does look that capability is simply the first register that blows the setup.
> > I think you have to fix something into Xen to avoid loading these drivers or
> > check with something like pci_device_is_present() approach.
> 
> Is there a backing PCI device BAR for those MMIO regions that the
> pinctrl driver is trying to access? AFAICT those regions are only
> reported in the ACPI DSDT table on the _CRS method of the object (at
> least on my system).

Unfortunately it does not expose PCI configuration space.

> Doing something like pci_device_is_present would require a register
> that we know will never return ~0 unless the device is not present. As
> said above, maybe we could use REVID to that end?

Yes, that's good, see above.

WRT capabilities, if we crash we will see the report immediately on the
hardware which has such an issue. (It's quite unlikely we will ever have one,
that's why I consider it's not critical)

-- 
With Best Regards,
Andy Shevchenko


