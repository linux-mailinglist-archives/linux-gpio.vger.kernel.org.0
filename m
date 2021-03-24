Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D117B347E6A
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 18:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236994AbhCXRBg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 13:01:36 -0400
Received: from mga04.intel.com ([192.55.52.120]:48825 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236407AbhCXRBY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Mar 2021 13:01:24 -0400
IronPort-SDR: cnxSzm8xA0cKOqhu8CKXcsBQ15dseYZ7DSI1AskhBOCX+wB8jYVthyFlMm7MKOVV0gkX/YG7N8
 3V9RzDNmclMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="188449283"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="188449283"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 10:01:23 -0700
IronPort-SDR: XQJvaVJDJLanABcFoLCrP6nuFfR3RkzdfB4eAQ2LOIAMNxO8Su8pduY5YDmdjv1hRKJXndE44j
 dJugPKiNHHjA==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="442320806"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 10:01:21 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lP6sg-00FkPI-Q7; Wed, 24 Mar 2021 19:01:18 +0200
Date:   Wed, 24 Mar 2021 19:01:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Roger Pau Monne <roger.pau@citrix.com>
Cc:     linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] intel/pinctrl: check REVID register value for
 device presence
Message-ID: <YFtwXj1Q+PRO0asv@smile.fi.intel.com>
References: <20210324154312.61878-1-roger.pau@citrix.com>
 <20210324154312.61878-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324154312.61878-2-roger.pau@citrix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 24, 2021 at 04:43:11PM +0100, Roger Pau Monne wrote:

Thanks for a fix! My comments below.

> Use the value read from the REVID register in order to check for the
> presence of the device. A read of all ones is treated as if the device
> is not present, and hence probing is ended.
> 
> This fixes an issue when running as a Xen PVH dom0, where the ACPI
> DSDT table is provided unmodified to dom0 and hence contains the
> pinctrl devices, but the MMIO region(s) containing the device
> registers might not be mapped in the guest physical memory map if such
> region(s) are not exposed on a PCI device BAR or marked as reserved in
> the host memory map.

Any particular point that we can use in the Fixes tag?

...

> Suggested-by: Andy Shevchenko <andy@kernel.org>

Hmm... was it that address I have used? In any case I think my @linux.intel.com
is better.

...

>  		/* Determine community features based on the revision */
>  		value = readl(regs + REVID);
> +		if (value == ~0u)
> +			return -ENODATA;

I think -ENODEV is more appropriate here.
Also comment above should be adjusted to explain this check.

-- 
With Best Regards,
Andy Shevchenko


