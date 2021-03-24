Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E75B347921
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 13:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234131AbhCXM6g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 08:58:36 -0400
Received: from mga04.intel.com ([192.55.52.120]:26158 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234152AbhCXM6L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Mar 2021 08:58:11 -0400
IronPort-SDR: oxAAXS7EedakGyHa0eMzdOFQo7aOiKQhxNbLeUc75aoa8W6NsrT8iM6NmQWCF40nZMXHDD1Vsp
 ffKhQSz8jr4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="188393566"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="188393566"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 05:58:11 -0700
IronPort-SDR: PmJQBp3JonAqGpUiW1irNX+pcSR62Rcn/S2FPW030FJzXa/AdtmMqNrN1wdrIxFlGlMP8ZfieG
 Z6nhLd7LWhog==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; 
   d="scan'208";a="442213365"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 05:58:09 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lP35L-00FgFX-56; Wed, 24 Mar 2021 14:58:07 +0200
Date:   Wed, 24 Mar 2021 14:58:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Roger Pau Monne <roger.pau@citrix.com>
Cc:     linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH RESEND] intel/pinctrl: check capability offset is between
 MMIO region
Message-ID: <YFs3XwOBRGAFyASY@smile.fi.intel.com>
References: <20210324123118.58865-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210324123118.58865-1-roger.pau@citrix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 01:31:18PM +0100, Roger Pau Monne wrote:
> When parsing the capability list make sure the offset is between the
> MMIO region mapped in 'regs', or else the kernel hits a page fault.
> 
> This fault has been seen when running as a Xen PVH dom0, which doesn't
> have the MMIO regions mapped into the domain physical memory map,
> despite having the device reported in the ACPI DSDT table. This
> results in reporting a capability offset of 0xffff (because the kernel
> is accessing unpopulated memory), and such offset is outside of the
> mapped region.
> 
> Adding the check is harmless, and prevents buggy or broken systems
> from crashing the kernel if the MMIO region is not properly reported.

Thanks for the report.

Looking into the code I would like rather see the explicit comparison to 0xffff
or ~0 against entire register b/c it's (one of) standard way of devices to tell
that something is not supported.

Moreover, it seems you are bailing out and basically denying driver to load.
This does look that capability is simply the first register that blows the setup.
I think you have to fix something into Xen to avoid loading these drivers or
check with something like pci_device_is_present() approach.

> Fixes: 91d898e51e60 ('pinctrl: intel: Convert capability list to features')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> ---
> Resend because I've missed adding the maintainers, sorry for the spam.

I have a script to make it easier: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko


