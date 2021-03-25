Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40CB2349187
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 13:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhCYMHC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 08:07:02 -0400
Received: from mga03.intel.com ([134.134.136.65]:63255 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230041AbhCYMGw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Mar 2021 08:06:52 -0400
IronPort-SDR: E74aiGxIJlmpsHASX1O/8rwYe9rDi9BsCYr8cb7176MkQRMyu7dxVFl9IRN8DpcqndUlP1r63q
 Pzc30g0ZOV9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="190941883"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="190941883"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 05:06:49 -0700
IronPort-SDR: nXQRT8F2j/iOtbKgmkvi3bw9pPw6+AvGS9dShY8ox4/rl8Xhc1dwyVW2A5twvUdrvugohHK+tI
 GYJ6k1bpX1lw==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="436437388"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 05:06:46 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lPOl9-00G2C7-Nk; Thu, 25 Mar 2021 14:06:43 +0200
Date:   Thu, 25 Mar 2021 14:06:43 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc:     linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH RESEND] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFx80wYt/KcHanC7@smile.fi.intel.com>
References: <20210324123118.58865-1-roger.pau@citrix.com>
 <YFs3XwOBRGAFyASY@smile.fi.intel.com>
 <YFtEw7qHQKE/4p8t@Air-de-Roger>
 <YFtLNLTrR9wTO41W@smile.fi.intel.com>
 <YFtXNw8ZKkp82EIH@Air-de-Roger>
 <YFtvaBmnu0GF/7il@smile.fi.intel.com>
 <YFxN9hlt0FbOVqML@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFxN9hlt0FbOVqML@Air-de-Roger>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 25, 2021 at 09:46:46AM +0100, Roger Pau Monné wrote:
> On Wed, Mar 24, 2021 at 06:57:12PM +0200, Andy Shevchenko wrote:
> > On Wed, Mar 24, 2021 at 04:13:59PM +0100, Roger Pau Monné wrote:
> > > On Wed, Mar 24, 2021 at 04:22:44PM +0200, Andy Shevchenko wrote:
> > > > On Wed, Mar 24, 2021 at 02:55:15PM +0100, Roger Pau Monné wrote:
> > > > > On Wed, Mar 24, 2021 at 02:58:07PM +0200, Andy Shevchenko wrote:

...

> > > > Unfortunately it does not expose PCI configuration space.
> > > 
> > > Are those regions supposed to be marked as reserved in the memory map,
> > > or that's left to the discretion of the hardware vendor?
> > 
> > I didn't get. The OS doesn't see them and an internal backbone simply drops any
> > IO access to that region.
> 
> I'm not sure I understand the above reply. My question was whether the
> MMIO regions used by the pinctrl device (as fetched from the ACPI DSDT
> table) are supposed belong to regions marked as RESERVED in the
> firmware memory map (ie: either the e820 or the EFI one).

I don't actually know. I guess it should be done in order to have ACPI device
a possibility to claim the resource.

> > > > > Doing something like pci_device_is_present would require a register
> > > > > that we know will never return ~0 unless the device is not present. As
> > > > > said above, maybe we could use REVID to that end?
> > > > 
> > > > Yes, that's good, see above.
> > > > 
> > > > WRT capabilities, if we crash we will see the report immediately on the
> > > > hardware which has such an issue. (It's quite unlikely we will ever have one,
> > > > that's why I consider it's not critical)
> > > 
> > > I would rather prefer to not crash, because I think the kernel should
> > > only resort to crashing when there's no alternative, and here it's
> > > perfectly fine to just print an error message and don't load the
> > > driver.
> > 
> > Are we speaking about real hardware that has an issue? I eagerly want to know
> > what is that beast.
> 
> OK, I'm not going to resend this anymore. I'm happy with just getting
> the first patch in.
> 
> I think you trust the hardware more that I would do, and I also think
> the check added here is very minimal an unintrusive and serves as a
> way to sanitize the data fetched from the hardware in order to prevent
> a kernel page fault if such data turns out to be wrong.
> 
> Taking a reactive approach of requiring a broken piece of hardware to
> exist in order to sanitize a fetched value seems too risky. I could
> add a WARN_ON or similar if you want some kind of splat that's very
> noticeable when this goes wrong but that doesn't end up in a fatal
> kernel page fault.

You found the issue anyway as long as you had a crash, so current code already
proved that it does it work perfectly.

Since I know what hardware this driver is for, I can assure you, that it will
be quite unlikely to have wrong data in the capability register. The data sheet
is crystal clear about the register's contents: on real hardware it must be
present and be set to a sane value.

-- 
With Best Regards,
Andy Shevchenko


